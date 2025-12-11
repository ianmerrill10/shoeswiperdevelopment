import React, { useEffect, useState, useCallback } from 'react';
import { FaTimes, FaEnvelope, FaGift, FaBolt } from 'react-icons/fa';
import { useEmailCapture } from '../hooks/useEmailCapture';
import { AppStorage, StorageKeys } from '../lib/secureStorage';
import { isValidEmail } from '../lib/validators';

interface ExitIntentPopupProps {
    /** Delay in ms before popup can show after page load */
    showDelay?: number;
    /** Only show once per session */
    showOncePerSession?: boolean;
}

/**
 * Exit Intent Popup - Shows when user moves mouse toward browser close/back
 * Captures email with discount incentive for cart abandonment prevention
 */
const ExitIntentPopup: React.FC<ExitIntentPopupProps> = ({
    showDelay = 3000,
    showOncePerSession = true,
}) => {
    const [isVisible, setIsVisible] = useState(false);
    const [canShow, setCanShow] = useState(false);
    const [email, setEmail] = useState('');
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [isSuccess, setIsSuccess] = useState(false);
    const [error, setError] = useState<string | null>(null);
    const { captureEmail } = useEmailCapture();

    // Delay before popup can show
    useEffect(() => {
        const timer = setTimeout(() => {
            // Check if already shown this session
            const alreadyShown = AppStorage.getItem<boolean>(StorageKeys.APP.EXIT_INTENT_SHOWN, false);
            if (!alreadyShown || !showOncePerSession) {
                setCanShow(true);
            }
        }, showDelay);

        return () => clearTimeout(timer);
    }, [showDelay, showOncePerSession]);

    // Exit intent detection
    useEffect(() => {
        if (!canShow) return;

        const handleMouseLeave = (e: MouseEvent) => {
            // Only trigger when mouse moves toward top of screen (closing/navigating away)
            if (e.clientY <= 5 && e.movementY < 0) {
                setIsVisible(true);
                AppStorage.setItem(StorageKeys.APP.EXIT_INTENT_SHOWN, true);
            }
        };

        // Mobile: detect back button or app switching (visibility change)
        const handleVisibilityChange = () => {
            if (document.visibilityState === 'hidden' && canShow) {
                // Store that we tried to show (for next session)
                AppStorage.setItem(StorageKeys.APP.EXIT_INTENT_SHOWN, true);
            }
        };

        document.addEventListener('mouseleave', handleMouseLeave);
        document.addEventListener('visibilitychange', handleVisibilityChange);

        return () => {
            document.removeEventListener('mouseleave', handleMouseLeave);
            document.removeEventListener('visibilitychange', handleVisibilityChange);
        };
    }, [canShow]);

    const handleClose = useCallback(() => {
        setIsVisible(false);
    }, []);

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        setError(null);

        // Strict email validation
        const validation = isValidEmail(email);
        if (!validation.valid) {
            setError(validation.error || 'Please enter a valid email address');
            return;
        }

        setIsSubmitting(true);

        try {
            await captureEmail(email, 'exit_intent', undefined, {
                priceAlerts: true,
                newReleases: true,
                weeklyDigest: false,
                promotions: true,
            });
            setIsSuccess(true);
            // Auto close after success
            setTimeout(() => {
                setIsVisible(false);
            }, 3000);
        } catch (err) {
            setError(err instanceof Error ? err.message : 'Failed to subscribe');
        } finally {
            setIsSubmitting(false);
        }
    };

    // Handle escape key
    useEffect(() => {
        const handleKeyDown = (e: KeyboardEvent) => {
            if (e.key === 'Escape' && isVisible) {
                handleClose();
            }
        };
        window.addEventListener('keydown', handleKeyDown);
        return () => window.removeEventListener('keydown', handleKeyDown);
    }, [isVisible, handleClose]);

    if (!isVisible) return null;

    return (
        <div
            className="fixed inset-0 z-[100] flex items-center justify-center p-4"
            role="dialog"
            aria-modal="true"
            aria-labelledby="exit-intent-title"
        >
            {/* Backdrop */}
            <div
                className="absolute inset-0 bg-black/70 backdrop-blur-sm"
                onClick={handleClose}
                aria-hidden="true"
            />

            {/* Modal */}
            <div className="relative bg-gradient-to-br from-zinc-900 to-zinc-800 rounded-2xl p-6 max-w-md w-full shadow-2xl border border-zinc-700 animate-scale-up">
                {/* Close Button */}
                <button
                    onClick={handleClose}
                    aria-label="Close popup"
                    className="absolute top-4 right-4 w-8 h-8 flex items-center justify-center rounded-full bg-zinc-800 hover:bg-zinc-700 transition-colors"
                >
                    <FaTimes className="text-zinc-400" />
                </button>

                {isSuccess ? (
                    // Success State
                    <div className="text-center py-8">
                        <div className="w-16 h-16 bg-green-500/20 rounded-full flex items-center justify-center mx-auto mb-4">
                            <FaGift className="text-3xl text-green-500" />
                        </div>
                        <h3 className="text-xl font-bold text-white mb-2">You're In! 🎉</h3>
                        <p className="text-zinc-400 mb-4">
                            Check your inbox for an exclusive 10% off code!
                        </p>
                        <p className="text-sm text-zinc-500">
                            Closing in a moment...
                        </p>
                    </div>
                ) : (
                    // Form State
                    <>
                        {/* Header */}
                        <div className="text-center mb-6">
                            <div className="w-14 h-14 bg-orange-500/20 rounded-full flex items-center justify-center mx-auto mb-4">
                                <FaBolt className="text-2xl text-orange-500" />
                            </div>
                            <h2 id="exit-intent-title" className="text-2xl font-black text-white mb-2">
                                Wait! Don't Miss Out 👟
                            </h2>
                            <p className="text-zinc-400">
                                Get <span className="text-orange-400 font-bold">10% OFF</span> your first purchase + exclusive drops
                            </p>
                        </div>

                        {/* Form */}
                        <form onSubmit={handleSubmit} className="space-y-4">
                            <div className="relative">
                                <FaEnvelope className="absolute left-4 top-1/2 -translate-y-1/2 text-zinc-500" />
                                <input
                                    type="email"
                                    value={email}
                                    onChange={(e) => setEmail(e.target.value)}
                                    placeholder="Enter your email"
                                    required
                                    disabled={isSubmitting}
                                    className="w-full bg-zinc-800 border border-zinc-700 rounded-xl py-4 pl-12 pr-4 text-white placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent transition-all disabled:opacity-50"
                                    aria-label="Email address"
                                />
                            </div>

                            {error && (
                                <p className="text-red-400 text-sm text-center" role="alert">
                                    {error}
                                </p>
                            )}

                            <button
                                type="submit"
                                disabled={isSubmitting}
                                className="w-full bg-gradient-to-r from-orange-500 to-red-500 text-white font-bold py-4 rounded-xl hover:from-orange-600 hover:to-red-600 transition-all active:scale-[0.98] disabled:opacity-50 disabled:cursor-not-allowed"
                            >
                                {isSubmitting ? (
                                    <span className="flex items-center justify-center gap-2">
                                        <div className="w-5 h-5 border-2 border-white/30 border-t-white rounded-full animate-spin" />
                                        Subscribing...
                                    </span>
                                ) : (
                                    'GET MY 10% OFF'
                                )}
                            </button>

                            <p className="text-xs text-zinc-500 text-center">
                                We respect your privacy. Unsubscribe anytime.
                            </p>
                        </form>

                        {/* Trust Badges */}
                        <div className="flex items-center justify-center gap-4 mt-6 pt-4 border-t border-zinc-700">
                            <span className="text-xs text-zinc-500">🔒 Secure</span>
                            <span className="text-xs text-zinc-500">📧 No Spam</span>
                            <span className="text-xs text-zinc-500">🎁 Exclusive Deals</span>
                        </div>
                    </>
                )}
            </div>

            <style>{`
        @keyframes scale-up {
          from {
            transform: scale(0.9);
            opacity: 0;
          }
          to {
            transform: scale(1);
            opacity: 1;
          }
        }
        .animate-scale-up {
          animation: scale-up 0.3s ease-out forwards;
        }
      `}</style>
        </div>
    );
};

export default ExitIntentPopup;
