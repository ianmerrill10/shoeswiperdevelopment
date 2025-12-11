/**
 * Sentry Error Monitoring Setup
 * Initialize in main.tsx for production error tracking
 * 
 * Usage:
 * 1. Install: npm install @sentry/react
 * 2. Import and call initSentry() before ReactDOM.render()
 * 3. Set VITE_SENTRY_DSN environment variable
 */

import * as Sentry from '@sentry/react';

export function initSentry() {
    const dsn = import.meta.env.VITE_SENTRY_DSN;

    if (!dsn) {
        // eslint-disable-next-line no-console
        if (import.meta.env.DEV) console.log('[Sentry] DSN not configured, skipping initialization');
        return;
    }

    Sentry.init({
        dsn,

        // Performance Monitoring
        integrations: [
            Sentry.browserTracingIntegration(),
            Sentry.replayIntegration({
                maskAllText: false,
                blockAllMedia: false,
            }),
        ],

        // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring
        // Adjust in production to a lower value to save quota
        tracesSampleRate: import.meta.env.PROD ? 0.1 : 1.0,

        // Session Replay
        replaysSessionSampleRate: 0.1, // Sample 10% of sessions
        replaysOnErrorSampleRate: 1.0, // Capture 100% of sessions with errors

        // Environment tagging
        environment: import.meta.env.MODE,

        // Release tracking (set during build)
        release: import.meta.env.VITE_APP_VERSION || 'development',

        // Filter out non-error events
        beforeSend(event) {
            // Don't send events in development
            if (import.meta.env.DEV) {
                // eslint-disable-next-line no-console
                console.log('[Sentry] Would send event:', event);
                return null;
            }
            return event;
        },

        // Ignore certain errors
        ignoreErrors: [
            // Browser extension errors
            'ResizeObserver loop limit exceeded',
            'ResizeObserver loop completed with undelivered notifications',
            // Network errors that users can't fix
            'Network request failed',
            'Failed to fetch',
            'Load failed',
            // User cancelled navigation
            'AbortError',
        ],
    });

    // eslint-disable-next-line no-console
    if (import.meta.env.DEV) console.log('[Sentry] Initialized for', import.meta.env.MODE);
}

/**
 * Capture a custom error with context
 */
export function captureError(error: Error, context?: Record<string, unknown>) {
    Sentry.captureException(error, {
        extra: context,
    });
}

/**
 * Set user context for error tracking
 */
export function setUser(userId: string, email?: string) {
    Sentry.setUser({
        id: userId,
        email,
    });
}

/**
 * Clear user context on logout
 */
export function clearUser() {
    Sentry.setUser(null);
}

/**
 * Add breadcrumb for debugging
 */
export function addBreadcrumb(message: string, category: string, data?: Record<string, unknown>) {
    Sentry.addBreadcrumb({
        message,
        category,
        level: 'info',
        data,
    });
}

/**
 * React Error Boundary with Sentry reporting
 */
export const SentryErrorBoundary = Sentry.ErrorBoundary;

export default {
    initSentry,
    captureError,
    setUser,
    clearUser,
    addBreadcrumb,
    SentryErrorBoundary,
};
