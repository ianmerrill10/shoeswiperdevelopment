import { z } from 'zod';

// List of common disposable/temp email domains to block
const DISPOSABLE_EMAIL_DOMAINS = [
    'tempmail.com', 'throwaway.com', 'guerrillamail.com', 'mailinator.com',
    '10minutemail.com', 'trashmail.com', 'fakeinbox.com', 'tempinbox.com',
    'disposablemail.com', 'sharklasers.com', 'yopmail.com', 'maildrop.cc',
    'getnada.com', 'temp-mail.org', 'emailondeck.com', 'mohmal.com',
];

// List of blocked words (profanity filter)
const BLOCKED_WORDS = [
    'fuck', 'shit', 'ass', 'damn', 'bitch', 'bastard', 'cunt', 'dick',
    'piss', 'crap', 'cock', 'fag', 'slut', 'whore', 'nigger', 'retard',
];

// Valid TLDs (common ones)
const VALID_TLDS = [
    'com', 'org', 'net', 'edu', 'gov', 'mil', 'io', 'co', 'us', 'uk', 'ca',
    'de', 'fr', 'es', 'it', 'nl', 'au', 'jp', 'cn', 'in', 'br', 'mx', 'ru',
    'info', 'biz', 'tech', 'dev', 'app', 'me', 'tv', 'cc', 'xyz', 'online',
    'store', 'shop', 'site', 'club', 'email', 'ai', 'gg', 'fm', 'to',
];

/**
 * Validates email address with strict rules:
 * - Must be valid email format
 * - Must have valid TLD
 * - No profanity
 * - No disposable email domains
 */
export const isValidEmail = (email: string): { valid: boolean; error?: string } => {
    const trimmed = email.trim().toLowerCase();

    // Basic format check
    const emailRegex = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/i;
    if (!emailRegex.test(trimmed)) {
        return { valid: false, error: 'Invalid email format' };
    }

    // Extract parts
    const [localPart, domain] = trimmed.split('@');
    const domainParts = domain.split('.');
    const tld = domainParts[domainParts.length - 1];

    // Check TLD
    if (!VALID_TLDS.includes(tld)) {
        return { valid: false, error: 'Invalid email domain' };
    }

    // Check for disposable email domains
    if (DISPOSABLE_EMAIL_DOMAINS.some(d => domain.includes(d))) {
        return { valid: false, error: 'Disposable email addresses are not allowed' };
    }

    // Check for profanity in email
    const emailLower = trimmed.toLowerCase();
    for (const word of BLOCKED_WORDS) {
        if (emailLower.includes(word)) {
            return { valid: false, error: 'Please use a valid email address' };
        }
    }

    // Check for obviously fake patterns
    const fakePatterns = [
        /^test@test\./i,
        /^fake@/i,
        /^no@no\./i,
        /^none@/i,
        /^asdf@/i,
        /^qwerty@/i,
        /^1234@/i,
        /^a{3,}@/i,  // aaa@
        /^x{3,}@/i,  // xxx@
    ];

    if (fakePatterns.some(pattern => pattern.test(trimmed))) {
        return { valid: false, error: 'Please enter a real email address' };
    }

    // Check local part length (before @)
    if (localPart.length < 2) {
        return { valid: false, error: 'Email address is too short' };
    }

    // Check domain has at least 2 parts (e.g., gmail.com not just gmail)
    if (domainParts.length < 2 || domainParts[0].length < 2) {
        return { valid: false, error: 'Invalid email domain' };
    }

    return { valid: true };
};

// Zod refinement with strict validation
const strictEmailValidator = z.string()
    .email('Invalid email address')
    .refine((email) => {
        const result = isValidEmail(email);
        return result.valid;
    }, (email) => {
        const result = isValidEmail(email);
        return { message: result.error || 'Invalid email address' };
    });

export const userProfileSchema = z.object({
    display_name: z.string().min(2, 'Name must be at least 2 characters').max(50),
    bio: z.string().max(160, 'Bio must be less than 160 characters').optional(),
    website: z.string().url().optional().or(z.literal('')),
});

export const priceAlertSchema = z.object({
    shoe_id: z.string().uuid(),
    target_price: z.number().positive('Price must be positive'),
});

export const emailCaptureSchema = z.object({
    email: strictEmailValidator,
    source: z.enum(['price_alert', 'newsletter', 'exit_intent', 'referral']),
    shoe_id: z.string().optional(),
});

// Export for direct use
export { strictEmailValidator };
