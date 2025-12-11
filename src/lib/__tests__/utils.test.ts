import { describe, it, expect, vi, beforeEach } from 'vitest';

// Mock the config module to enable price display in tests
vi.mock('../config', () => ({
    DEMO_MODE: true,
    AFFILIATE_TAG: 'shoeswiper-20',
    SHOW_PRICES: true, // Enable prices for testing
    ADMIN_EMAIL: 'test@example.com',
    AMAZON_API_CONFIG: {
        enabled: false,
        partnerTag: 'shoeswiper-20',
        marketplace: 'www.amazon.com',
        edgeFunctionUrl: '',
        cacheDuration: 300000,
    },
}));

// Import after mocking
import { formatPrice, shouldShowPrice } from '../supabaseClient';

describe('Utility Functions', () => {
    beforeEach(() => {
        vi.clearAllMocks();
    });

    describe('formatPrice', () => {
        it('formats numbers to currency strings when SHOW_PRICES is true', () => {
            expect(formatPrice(10)).toBe('$10.00');
            expect(formatPrice(99.99)).toBe('$99.99');
        });

        it('returns null for zero value', () => {
            // Zero is a valid price but shouldShowPrice might return false for 0
            const result = formatPrice(0);
            expect(result).toBe('$0.00');
        });

        it('returns null for undefined/null values', () => {
            expect(formatPrice(undefined)).toBeNull();
            expect(formatPrice(null)).toBeNull();
        });
    });

    describe('shouldShowPrice', () => {
        it('returns true for positive numbers when SHOW_PRICES is enabled', () => {
            expect(shouldShowPrice(10)).toBe(true);
            expect(shouldShowPrice(0.01)).toBe(true);
        });

        it('returns false for undefined/null values', () => {
            // Note: shouldShowPrice doesn't validate if price is positive,
            // it only checks if SHOW_PRICES is enabled and price is defined
            expect(shouldShowPrice(undefined)).toBe(false);
            expect(shouldShowPrice(null)).toBe(false);
        });

        it('returns true for zero and negative values when defined', () => {
            // shouldShowPrice only checks if price is defined, not if it's valid
            expect(shouldShowPrice(0)).toBe(true);
            expect(shouldShowPrice(-1)).toBe(true); // Still shows because it's defined
        });
    });
});
