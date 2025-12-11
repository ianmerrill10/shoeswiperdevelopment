import { useState, useEffect, useCallback } from 'react';
import { DEMO_MODE } from '../lib/config';

/**
 * Email subscription and preference management hook.
 * Captures user emails for marketing, price alerts, and newsletters.
 * 
 * In DEMO_MODE, emails are stored in localStorage.
 * In production, emails are stored in Supabase email_subscriptions table.
 * 
 * @returns Object containing email state and capture methods
 * @example
 * const { email, captureEmail, updatePreferences } = useEmailCapture();
 * 
 * // Capture email for price alert
 * const result = await captureEmail(
 *   'user@example.com',
 *   'price_alert',
 *   { id: shoe.id, name: shoe.name },
 *   { priceAlerts: true }
 * );
 */

const EMAIL_CAPTURE_KEY = 'shoeswiper_email_capture';
const EMAIL_LIST_KEY = 'shoeswiper_email_list';

export interface CapturedEmail {
  email: string;
  source: 'price_alert' | 'newsletter' | 'exit_intent' | 'referral';
  shoeId?: string;
  shoeName?: string;
  createdAt: string;
  preferences: {
    priceAlerts: boolean;
    newReleases: boolean;
    weeklyDigest: boolean;
    promotions: boolean;
  };
}

export interface EmailCaptureState {
  email: string | null;
  isSubscribed: boolean;
  preferences: CapturedEmail['preferences'];
}

const DEFAULT_PREFERENCES: CapturedEmail['preferences'] = {
  priceAlerts: true,
  newReleases: true,
  weeklyDigest: false,
  promotions: false,
};

export const useEmailCapture = () => {
  const [state, setState] = useState<EmailCaptureState>({
    email: null,
    isSubscribed: false,
    preferences: DEFAULT_PREFERENCES,
  });
  const [loading, setLoading] = useState(true);

  // Load saved email on mount
  useEffect(() => {
    loadSavedEmail();
  }, []);

  const loadSavedEmail = async () => {
    try {
      if (DEMO_MODE) {
        const stored = localStorage.getItem(EMAIL_CAPTURE_KEY);
        if (stored) {
          const data = JSON.parse(stored);
          setState({
            email: data.email,
            isSubscribed: true,
            preferences: data.preferences || DEFAULT_PREFERENCES,
          });
        }
      } else {
        const { supabase } = await import('../lib/supabaseClient');
        const { data: { user } } = await supabase.auth.getUser();

        if (user?.email) {
          // Check if user has email preferences saved
          const { data } = await supabase
            .from('email_subscriptions')
            .select('*')
            .eq('email', user.email)
            .single();

          if (data) {
            setState({
              email: data.email,
              isSubscribed: data.is_subscribed,
              preferences: data.preferences || DEFAULT_PREFERENCES,
            });
          } else {
            setState({
              email: user.email,
              isSubscribed: false,
              preferences: DEFAULT_PREFERENCES,
            });
          }
        }
      }
    } catch (err) {
      console.error('[EmailCapture] Error loading saved email:', err);
    } finally {
      setLoading(false);
    }
  };

  // Use strict email validation from validators
  const validateEmail = (email: string): { valid: boolean; error?: string } => {
    const trimmed = email.trim().toLowerCase();

    // Basic format check
    const emailRegex = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/i;
    if (!emailRegex.test(trimmed)) {
      return { valid: false, error: 'Invalid email format' };
    }

    const [localPart, domain] = trimmed.split('@');
    const domainParts = domain.split('.');
    const tld = domainParts[domainParts.length - 1];

    // Valid TLDs
    const validTlds = ['com', 'org', 'net', 'edu', 'gov', 'io', 'co', 'us', 'uk', 'ca', 'de', 'fr', 'es', 'it', 'au', 'jp', 'in', 'info', 'biz', 'tech', 'dev', 'app', 'me', 'xyz', 'ai'];
    if (!validTlds.includes(tld)) {
      return { valid: false, error: 'Invalid email domain' };
    }

    // Block disposable emails
    const disposable = ['tempmail.com', 'throwaway.com', 'guerrillamail.com', 'mailinator.com', '10minutemail.com', 'yopmail.com', 'maildrop.cc'];
    if (disposable.some(d => domain.includes(d))) {
      return { valid: false, error: 'Disposable email addresses are not allowed' };
    }

    // Block profanity
    const blocked = ['fuck', 'shit', 'ass', 'bitch', 'cunt', 'dick', 'fag', 'nigger', 'retard'];
    for (const word of blocked) {
      if (trimmed.includes(word)) {
        return { valid: false, error: 'Please use a valid email address' };
      }
    }

    // Block obviously fake patterns
    if (/^(test|fake|no|none|asdf|qwerty|1234|aaa|xxx)@/i.test(trimmed)) {
      return { valid: false, error: 'Please enter a real email address' };
    }

    // Check local part length
    if (localPart.length < 2 || domainParts[0].length < 2) {
      return { valid: false, error: 'Invalid email address' };
    }

    return { valid: true };
  };

  // Validate email format - returns boolean for backward compatibility
  const isValidEmail = (email: string): boolean => {
    return validateEmail(email).valid;
  };

  // Capture email for a specific purpose
  const captureEmail = useCallback(async (
    email: string,
    source: CapturedEmail['source'],
    shoeData?: { id: string; name: string },
    preferences?: Partial<CapturedEmail['preferences']>
  ): Promise<{ success: boolean; error?: string }> => {
    const validation = validateEmail(email);
    if (!validation.valid) {
      return { success: false, error: validation.error || 'Please enter a valid email address' };
    }

    try {
      const capturedEmail: CapturedEmail = {
        email: email.toLowerCase().trim(),
        source,
        shoeId: shoeData?.id,
        shoeName: shoeData?.name,
        createdAt: new Date().toISOString(),
        preferences: { ...DEFAULT_PREFERENCES, ...preferences },
      };

      if (DEMO_MODE) {
        // Save to localStorage
        localStorage.setItem(EMAIL_CAPTURE_KEY, JSON.stringify({
          email: capturedEmail.email,
          preferences: capturedEmail.preferences,
        }));

        // Also add to email list for admin view
        const existingList = JSON.parse(localStorage.getItem(EMAIL_LIST_KEY) || '[]');
        const updatedList = [
          capturedEmail,
          ...existingList.filter((e: CapturedEmail) => e.email !== capturedEmail.email),
        ];
        localStorage.setItem(EMAIL_LIST_KEY, JSON.stringify(updatedList));

        setState({
          email: capturedEmail.email,
          isSubscribed: true,
          preferences: capturedEmail.preferences,
        });

        if (import.meta.env.DEV) console.warn(`[Demo] Email captured: ${email} for ${source}`);
        return { success: true };
      } else {
        const { supabase } = await import('../lib/supabaseClient');

        // Upsert email subscription
        const { error } = await supabase
          .from('email_subscriptions')
          .upsert({
            email: capturedEmail.email,
            source: capturedEmail.source,
            shoe_id: capturedEmail.shoeId,
            shoe_name: capturedEmail.shoeName,
            preferences: capturedEmail.preferences,
            is_subscribed: true,
            created_at: capturedEmail.createdAt,
            updated_at: new Date().toISOString(),
          }, {
            onConflict: 'email',
          });

        if (error) throw error;

        setState({
          email: capturedEmail.email,
          isSubscribed: true,
          preferences: capturedEmail.preferences,
        });

        return { success: true };
      }
    } catch (err) {
      console.error('[EmailCapture] Error capturing email:', err);
      return { success: false, error: 'Failed to save email. Please try again.' };
    }
  }, []);

  // Update email preferences
  const updatePreferences = useCallback(async (
    newPreferences: Partial<CapturedEmail['preferences']>
  ): Promise<boolean> => {
    if (!state.email) return false;

    try {
      const updatedPreferences = { ...state.preferences, ...newPreferences };

      if (DEMO_MODE) {
        localStorage.setItem(EMAIL_CAPTURE_KEY, JSON.stringify({
          email: state.email,
          preferences: updatedPreferences,
        }));
      } else {
        const { supabase } = await import('../lib/supabaseClient');
        await supabase
          .from('email_subscriptions')
          .update({
            preferences: updatedPreferences,
            updated_at: new Date().toISOString(),
          })
          .eq('email', state.email);
      }

      setState(prev => ({ ...prev, preferences: updatedPreferences }));
      return true;
    } catch (err) {
      console.error('[EmailCapture] Error updating preferences:', err);
      return false;
    }
  }, [state.email, state.preferences]);

  // Unsubscribe from emails
  const unsubscribe = useCallback(async (): Promise<boolean> => {
    if (!state.email) return false;

    try {
      if (DEMO_MODE) {
        localStorage.removeItem(EMAIL_CAPTURE_KEY);
      } else {
        const { supabase } = await import('../lib/supabaseClient');
        await supabase
          .from('email_subscriptions')
          .update({
            is_subscribed: false,
            updated_at: new Date().toISOString(),
          })
          .eq('email', state.email);
      }

      setState({
        email: null,
        isSubscribed: false,
        preferences: DEFAULT_PREFERENCES,
      });
      return true;
    } catch (err) {
      console.error('[EmailCapture] Error unsubscribing:', err);
      return false;
    }
  }, [state.email]);

  // Get all captured emails (for admin)
  const getAllEmails = useCallback(async (): Promise<CapturedEmail[]> => {
    try {
      if (DEMO_MODE) {
        const stored = localStorage.getItem(EMAIL_LIST_KEY);
        return stored ? JSON.parse(stored) : [];
      } else {
        const { supabase } = await import('../lib/supabaseClient');
        const { data } = await supabase
          .from('email_subscriptions')
          .select('*')
          .eq('is_subscribed', true)
          .order('created_at', { ascending: false });

        return (data || []).map((e: {
          email: string;
          source: string;
          shoe_id?: string;
          shoe_name?: string;
          created_at: string;
          preferences: CapturedEmail['preferences'];
        }) => ({
          email: e.email,
          source: e.source as CapturedEmail['source'],
          shoeId: e.shoe_id,
          shoeName: e.shoe_name,
          createdAt: e.created_at,
          preferences: e.preferences,
        }));
      }
    } catch (err) {
      console.error('[EmailCapture] Error getting emails:', err);
      return [];
    }
  }, []);

  return {
    email: state.email,
    isSubscribed: state.isSubscribed,
    preferences: state.preferences,
    loading,
    isValidEmail,
    captureEmail,
    updatePreferences,
    unsubscribe,
    getAllEmails,
  };
};
