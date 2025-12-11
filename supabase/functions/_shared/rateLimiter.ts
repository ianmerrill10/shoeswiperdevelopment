/**
 * Rate Limiting Utility for Supabase Edge Functions
 * Uses in-memory store with configurable limits per IP/user
 * 
 * Import in your edge function:
 * import { createRateLimiter, checkRateLimit } from '../_shared/rateLimiter.ts';
 */

// Simple in-memory rate limit store (resets on function cold start)
const rateLimitStore = new Map<string, { count: number; resetAt: number }>();

export interface RateLimitConfig {
    windowMs: number;      // Time window in milliseconds
    maxRequests: number;   // Max requests per window
    keyPrefix?: string;    // Optional prefix for keys
}

export interface RateLimitResult {
    allowed: boolean;
    remaining: number;
    resetAt: number;
    retryAfter?: number;   // Seconds until reset (if blocked)
}

/**
 * Default rate limit configurations
 */
export const RATE_LIMITS = {
    // Standard API calls
    standard: { windowMs: 60 * 1000, maxRequests: 60 }, // 60/min

    // Authenticated users
    authenticated: { windowMs: 60 * 1000, maxRequests: 120 }, // 120/min

    // Email/form submissions
    submissions: { windowMs: 60 * 60 * 1000, maxRequests: 10 }, // 10/hour

    // AI/expensive operations
    expensive: { windowMs: 60 * 60 * 1000, maxRequests: 20 }, // 20/hour

    // Price checks (per shoe)
    priceCheck: { windowMs: 5 * 60 * 1000, maxRequests: 10 }, // 10/5min
};

/**
 * Get client identifier from request
 */
export function getClientId(req: Request, userId?: string): string {
    // Prefer user ID if authenticated
    if (userId) {
        return `user:${userId}`;
    }

    // Fall back to IP address
    const forwardedFor = req.headers.get('x-forwarded-for');
    const realIp = req.headers.get('x-real-ip');
    const cfIp = req.headers.get('cf-connecting-ip');

    return `ip:${cfIp || realIp || forwardedFor?.split(',')[0] || 'unknown'}`;
}

/**
 * Check rate limit for a given key
 */
export function checkRateLimit(
    key: string,
    config: RateLimitConfig
): RateLimitResult {
    const now = Date.now();
    const fullKey = config.keyPrefix ? `${config.keyPrefix}:${key}` : key;

    const entry = rateLimitStore.get(fullKey);

    // No existing entry or window expired - allow and start fresh
    if (!entry || now > entry.resetAt) {
        const resetAt = now + config.windowMs;
        rateLimitStore.set(fullKey, { count: 1, resetAt });
        return {
            allowed: true,
            remaining: config.maxRequests - 1,
            resetAt,
        };
    }

    // Entry exists and within window
    const newCount = entry.count + 1;
    const remaining = Math.max(0, config.maxRequests - newCount);

    if (newCount > config.maxRequests) {
        // Rate limited
        const retryAfter = Math.ceil((entry.resetAt - now) / 1000);
        return {
            allowed: false,
            remaining: 0,
            resetAt: entry.resetAt,
            retryAfter,
        };
    }

    // Update count
    rateLimitStore.set(fullKey, { count: newCount, resetAt: entry.resetAt });

    return {
        allowed: true,
        remaining,
        resetAt: entry.resetAt,
    };
}

/**
 * Create rate limit headers for response
 */
export function rateLimitHeaders(result: RateLimitResult): Record<string, string> {
    const headers: Record<string, string> = {
        'X-RateLimit-Remaining': String(result.remaining),
        'X-RateLimit-Reset': String(Math.ceil(result.resetAt / 1000)),
    };

    if (!result.allowed && result.retryAfter) {
        headers['Retry-After'] = String(result.retryAfter);
    }

    return headers;
}

/**
 * Helper: Apply rate limiting middleware pattern
 */
export async function withRateLimit(
    req: Request,
    config: RateLimitConfig,
    handler: () => Promise<Response>,
    userId?: string
): Promise<Response> {
    const clientId = getClientId(req, userId);
    const result = checkRateLimit(clientId, config);

    if (!result.allowed) {
        return new Response(
            JSON.stringify({
                error: 'Too many requests',
                message: `Rate limit exceeded. Try again in ${result.retryAfter} seconds.`,
                retryAfter: result.retryAfter,
            }),
            {
                status: 429,
                headers: {
                    'Content-Type': 'application/json',
                    ...rateLimitHeaders(result),
                },
            }
        );
    }

    const response = await handler();

    // Add rate limit headers to successful response
    const newHeaders = new Headers(response.headers);
    Object.entries(rateLimitHeaders(result)).forEach(([key, value]) => {
        newHeaders.set(key, value);
    });

    return new Response(response.body, {
        status: response.status,
        statusText: response.statusText,
        headers: newHeaders,
    });
}

/**
 * Cleanup old entries to prevent memory leaks
 * Call periodically or on cold start
 */
export function cleanupRateLimitStore(): number {
    const now = Date.now();
    let cleaned = 0;

    rateLimitStore.forEach((value, key) => {
        if (now > value.resetAt) {
            rateLimitStore.delete(key);
            cleaned++;
        }
    });

    return cleaned;
}

// Cleanup old entries every 5 minutes
setInterval(cleanupRateLimitStore, 5 * 60 * 1000);
