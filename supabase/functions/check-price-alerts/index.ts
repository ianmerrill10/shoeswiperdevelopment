/**
 * Price Alert Cron Job Edge Function
 * Supabase Edge Function that runs on a schedule to check prices
 * 
 * Deploy with: supabase functions deploy check-price-alerts
 * 
 * Configure schedule in supabase/config.toml:
 * [functions.check-price-alerts]
 * schedule = "0 */4 * * * "  # Every 4 hours
    */

import { serve } from 'https://deno.land/std@0.168.0/http/server.ts';
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

const SUPABASE_URL = Deno.env.get('SUPABASE_URL') || '';
const SUPABASE_SERVICE_KEY = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') || '';
const RESEND_API_KEY = Deno.env.get('RESEND_API_KEY') || '';

interface PriceAlert {
    id: string;
    user_id: string;
    shoe_id: string;
    target_price: number;
    user: { email: string };
    shoe: { name: string; brand: string; image_url: string; amazon_url: string; price: number };
}

serve(async (req: Request) => {
    // Verify this is a scheduled invocation or authorized call
    const authHeader = req.headers.get('Authorization');
    if (!authHeader?.includes('Bearer')) {
        return new Response('Unauthorized', { status: 401 });
    }

    try {
        const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY);

        // Get active price alerts with shoe and user data
        const { data: alerts, error: alertsError } = await supabase
            .from('price_alerts')
            .select(`
        id,
        user_id,
        shoe_id,
        target_price,
        user:profiles(email),
        shoe:shoes(name, brand, image_url, amazon_url, price)
      `)
            .eq('is_active', true);

        if (alertsError) {
            console.error('Error fetching alerts:', alertsError);
            return new Response(JSON.stringify({ error: 'Failed to fetch alerts' }), { status: 500 });
        }

        if (!alerts || alerts.length === 0) {
            return new Response(JSON.stringify({ message: 'No active alerts', processed: 0 }));
        }

        let triggered = 0;
        const triggeredAlerts: string[] = [];

        for (const alert of alerts as unknown as PriceAlert[]) {
            const currentPrice = alert.shoe?.price;

            // Skip if no current price or price hasn't dropped
            if (!currentPrice || currentPrice > alert.target_price) {
                continue;
            }

            // Price dropped below target! Send notification
            const userEmail = Array.isArray(alert.user) ? alert.user[0]?.email : (alert.user as { email: string })?.email;
            const shoe = Array.isArray(alert.shoe) ? alert.shoe[0] : alert.shoe;

            if (userEmail && shoe && RESEND_API_KEY) {
                try {
                    await fetch('https://api.resend.com/emails', {
                        method: 'POST',
                        headers: {
                            'Authorization': `Bearer ${RESEND_API_KEY}`,
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify({
                            from: 'ShoeSwiper <alerts@shoeswiper.com>',
                            to: userEmail,
                            subject: `🔥 Price Drop! ${shoe.brand} ${shoe.name} is now $${currentPrice}`,
                            html: `
                <div style="font-family: -apple-system, sans-serif; max-width: 600px; margin: 0 auto; padding: 40px 20px; background: #18181b; color: white;">
                  <h1 style="color: #f97316;">🔔 Price Alert Triggered!</h1>
                  <p>Great news! The sneaker you've been watching just dropped in price.</p>
                  
                  <div style="background: #27272a; border-radius: 12px; padding: 20px; margin: 24px 0;">
                    <img src="${shoe.image_url}" alt="${shoe.name}" style="width: 200px; border-radius: 8px;" />
                    <h2 style="margin: 16px 0 8px;">${shoe.brand} ${shoe.name}</h2>
                    <p style="font-size: 24px; color: #22c55e; margin: 0;">
                      Now: <strong>$${currentPrice}</strong>
                      <span style="text-decoration: line-through; color: #71717a; margin-left: 8px;">$${alert.target_price}</span>
                    </p>
                  </div>
                  
                  <a href="${shoe.amazon_url}" style="display: inline-block; background: linear-gradient(to right, #f97316, #ef4444); color: white; text-decoration: none; padding: 16px 32px; border-radius: 12px; font-weight: 600;">
                    Buy Now on Amazon
                  </a>
                  
                  <p style="color: #71717a; margin-top: 32px; font-size: 12px;">
                    This alert has been deactivated. Create new alerts in the app.
                  </p>
                </div>
              `,
                        }),
                    });
                    triggered++;
                    triggeredAlerts.push(alert.id);
                } catch (emailError) {
                    console.error('Failed to send alert email:', emailError);
                }
            }

            // Deactivate the triggered alert
            await supabase
                .from('price_alerts')
                .update({
                    is_active: false,
                    triggered_at: new Date().toISOString(),
                })
                .eq('id', alert.id);
        }

        return new Response(
            JSON.stringify({
                message: 'Price check complete',
                totalAlerts: alerts.length,
                triggered,
                triggeredAlerts,
            }),
            { headers: { 'Content-Type': 'application/json' } }
        );
    } catch (error) {
        console.error('Cron job error:', error);
        return new Response(
            JSON.stringify({ error: 'Cron job failed', message: String(error) }),
            { status: 500 }
        );
    }
});
