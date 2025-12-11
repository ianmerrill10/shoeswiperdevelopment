/**
 * Newsletter/Email Service Edge Function
 * Supabase Edge Function for email capture and newsletter signups
 * 
 * Deploy with: supabase functions deploy email-capture
 * 
 * Optional secrets for email providers:
 * - RESEND_API_KEY (for Resend)
 * - SENDGRID_API_KEY (for SendGrid)
 */

import { serve } from 'https://deno.land/std@0.168.0/http/server.ts';
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

const SUPABASE_URL = Deno.env.get('SUPABASE_URL') || '';
const SUPABASE_SERVICE_KEY = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') || '';
const RESEND_API_KEY = Deno.env.get('RESEND_API_KEY') || '';

const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

interface EmailCaptureRequest {
    email: string;
    source: 'price_alert' | 'newsletter' | 'exit_intent' | 'referral';
    shoeId?: string;
    shoeName?: string;
    preferences?: {
        priceAlerts?: boolean;
        newReleases?: boolean;
        weeklyDigest?: boolean;
        promotions?: boolean;
    };
}

serve(async (req: Request) => {
    if (req.method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders });
    }

    try {
        const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY);
        const data: EmailCaptureRequest = await req.json();

        // Validate email
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!data.email || !emailRegex.test(data.email)) {
            return new Response(
                JSON.stringify({ error: 'Invalid email address' }),
                { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        const email = data.email.toLowerCase().trim();

        // Store in database
        const { error: dbError } = await supabase
            .from('email_subscriptions')
            .upsert({
                email,
                source: data.source,
                shoe_id: data.shoeId,
                shoe_name: data.shoeName,
                preferences: data.preferences || {
                    priceAlerts: true,
                    newReleases: true,
                    weeklyDigest: false,
                    promotions: false,
                },
                is_subscribed: true,
                updated_at: new Date().toISOString(),
            }, {
                onConflict: 'email',
            });

        if (dbError) {
            console.error('Database error:', dbError);
            return new Response(
                JSON.stringify({ error: 'Failed to save subscription' }),
                { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        // Send welcome email if Resend is configured
        if (RESEND_API_KEY) {
            try {
                await fetch('https://api.resend.com/emails', {
                    method: 'POST',
                    headers: {
                        'Authorization': `Bearer ${RESEND_API_KEY}`,
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        from: 'ShoeSwiper <hello@shoeswiper.com>',
                        to: email,
                        subject: getSubjectForSource(data.source),
                        html: getEmailHtml(data.source, data.shoeName),
                    }),
                });
            } catch (emailError) {
                console.error('Email send error:', emailError);
                // Don't fail the request if email fails
            }
        }

        return new Response(
            JSON.stringify({
                success: true,
                message: 'Subscription saved successfully',
            }),
            { headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    } catch (error) {
        console.error('Edge function error:', error);
        return new Response(
            JSON.stringify({
                error: 'Internal error',
                message: error instanceof Error ? error.message : 'Unknown error',
            }),
            { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    }
});

function getSubjectForSource(source: string): string {
    switch (source) {
        case 'price_alert':
            return '🔔 Price Alert Activated! | ShoeSwiper';
        case 'exit_intent':
            return '👟 Welcome to ShoeSwiper! Here\'s 10% Off';
        case 'newsletter':
            return '📬 You\'re In! Welcome to ShoeSwiper';
        case 'referral':
            return '🎁 Thanks for Joining via Referral!';
        default:
            return 'Welcome to ShoeSwiper!';
    }
}

function getEmailHtml(source: string, shoeName?: string): string {
    const baseStyle = `
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
    max-width: 600px;
    margin: 0 auto;
    padding: 40px 20px;
    background: linear-gradient(135deg, #18181b 0%, #27272a 100%);
    color: #ffffff;
  `;

    const buttonStyle = `
    display: inline-block;
    background: linear-gradient(to right, #f97316, #ef4444);
    color: white;
    text-decoration: none;
    padding: 16px 32px;
    border-radius: 12px;
    font-weight: 600;
    margin-top: 24px;
  `;

    if (source === 'price_alert' && shoeName) {
        return `
      <div style="${baseStyle}">
        <h1 style="color: #f97316; margin-bottom: 16px;">🔔 Price Alert Set!</h1>
        <p>You'll be notified when <strong>${shoeName}</strong> drops in price.</p>
        <p>We check prices multiple times per day, so you won't miss a deal.</p>
        <a href="https://shoeswiper.com" style="${buttonStyle}">Browse More Sneakers</a>
      </div>
    `;
    }

    if (source === 'exit_intent') {
        return `
      <div style="${baseStyle}">
        <h1 style="color: #f97316; margin-bottom: 16px;">👟 Wait! Here's 10% Off</h1>
        <p>Thanks for joining ShoeSwiper! As a welcome gift, enjoy exclusive deals and early access to drops.</p>
        <p style="font-size: 24px; font-weight: bold; color: #f97316; margin: 24px 0;">WELCOME10</p>
        <p>Use this code on your next sneaker purchase!</p>
        <a href="https://shoeswiper.com" style="${buttonStyle}">Start Swiping</a>
      </div>
    `;
    }

    return `
    <div style="${baseStyle}">
      <h1 style="color: #f97316; margin-bottom: 16px;">Welcome to ShoeSwiper! 👟</h1>
      <p>You're now part of the hottest sneaker discovery platform. Expect:</p>
      <ul style="line-height: 2;">
        <li>🔥 Early access to new drops</li>
        <li>💰 Price drop alerts</li>
        <li>✨ Curated sneaker recommendations</li>
        <li>🎁 Exclusive member deals</li>
      </ul>
      <a href="https://shoeswiper.com" style="${buttonStyle}">Discover Sneakers</a>
    </div>
  `;
}
