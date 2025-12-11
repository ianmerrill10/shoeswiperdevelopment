/**
 * Amazon Product Advertising API Edge Function
 * Supabase Edge Function for secure PA-API calls
 * 
 * Deploy with: supabase functions deploy amazon-prices
 * 
 * Required secrets (set via Supabase Dashboard):
 * - AMAZON_ACCESS_KEY
 * - AMAZON_SECRET_KEY
 * - AMAZON_PARTNER_TAG (shoeswiper-20)
 */

import { serve } from 'https://deno.land/std@0.168.0/http/server.ts';

const AMAZON_ACCESS_KEY = Deno.env.get('AMAZON_ACCESS_KEY') || '';
const AMAZON_SECRET_KEY = Deno.env.get('AMAZON_SECRET_KEY') || '';
const AMAZON_PARTNER_TAG = Deno.env.get('AMAZON_PARTNER_TAG') || 'shoeswiper-20';
const AMAZON_HOST = 'webservices.amazon.com';
const AMAZON_REGION = 'us-east-1';

// CORS headers
const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

interface PriceRequest {
    asins: string[];
}

interface PriceResult {
    asin: string;
    price: number | null;
    currency: string;
    availability: 'in_stock' | 'low_stock' | 'out_of_stock' | 'unknown';
    title?: string;
    lastUpdated: string;
}

// Simple HMAC-SHA256 signing (for PA-API v5)
async function sign(key: Uint8Array, msg: string): Promise<Uint8Array> {
    const encoder = new TextEncoder();
    const cryptoKey = await crypto.subtle.importKey(
        'raw',
        key,
        { name: 'HMAC', hash: 'SHA-256' },
        false,
        ['sign']
    );
    const signature = await crypto.subtle.sign('HMAC', cryptoKey, encoder.encode(msg));
    return new Uint8Array(signature);
}

async function getSignatureKey(
    key: string,
    dateStamp: string,
    regionName: string,
    serviceName: string
): Promise<Uint8Array> {
    const encoder = new TextEncoder();
    const kDate = await sign(encoder.encode('AWS4' + key), dateStamp);
    const kRegion = await sign(kDate, regionName);
    const kService = await sign(kRegion, serviceName);
    const kSigning = await sign(kService, 'aws4_request');
    return kSigning;
}

function toHex(bytes: Uint8Array): string {
    return Array.from(bytes)
        .map((b) => b.toString(16).padStart(2, '0'))
        .join('');
}

async function sha256(message: string): Promise<string> {
    const encoder = new TextEncoder();
    const data = encoder.encode(message);
    const hashBuffer = await crypto.subtle.digest('SHA-256', data);
    return toHex(new Uint8Array(hashBuffer));
}

serve(async (req: Request) => {
    // Handle CORS preflight
    if (req.method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders });
    }

    // Validate API credentials
    if (!AMAZON_ACCESS_KEY || !AMAZON_SECRET_KEY) {
        return new Response(
            JSON.stringify({
                error: 'Amazon PA-API not configured',
                message: 'Set AMAZON_ACCESS_KEY and AMAZON_SECRET_KEY secrets',
            }),
            {
                status: 503,
                headers: { ...corsHeaders, 'Content-Type': 'application/json' },
            }
        );
    }

    try {
        const { asins }: PriceRequest = await req.json();

        if (!asins || !Array.isArray(asins) || asins.length === 0) {
            return new Response(
                JSON.stringify({ error: 'Invalid request', message: 'Provide array of ASINs' }),
                {
                    status: 400,
                    headers: { ...corsHeaders, 'Content-Type': 'application/json' },
                }
            );
        }

        // Limit to 10 ASINs per request (PA-API limit)
        const limitedAsins = asins.slice(0, 10);

        // Build PA-API v5 GetItems request
        const now = new Date();
        const amzDate = now.toISOString().replace(/[:-]|\.\d{3}/g, '');
        const dateStamp = amzDate.slice(0, 8);

        const payload = JSON.stringify({
            ItemIds: limitedAsins,
            Resources: [
                'Offers.Listings.Price',
                'Offers.Listings.Availability.Type',
                'ItemInfo.Title',
            ],
            PartnerTag: AMAZON_PARTNER_TAG,
            PartnerType: 'Associates',
            Marketplace: 'www.amazon.com',
        });

        const payloadHash = await sha256(payload);

        // Create canonical request
        const method = 'POST';
        const canonicalUri = '/paapi5/getitems';
        const canonicalQueryString = '';
        const host = AMAZON_HOST;
        const contentType = 'application/json; charset=UTF-8';
        const xAmzTarget = 'com.amazon.paapi5.v1.ProductAdvertisingAPIv1.GetItems';

        const canonicalHeaders =
            `content-encoding:amz-1.0\n` +
            `content-type:${contentType}\n` +
            `host:${host}\n` +
            `x-amz-date:${amzDate}\n` +
            `x-amz-target:${xAmzTarget}\n`;

        const signedHeaders = 'content-encoding;content-type;host;x-amz-date;x-amz-target';

        const canonicalRequest =
            method +
            '\n' +
            canonicalUri +
            '\n' +
            canonicalQueryString +
            '\n' +
            canonicalHeaders +
            '\n' +
            signedHeaders +
            '\n' +
            payloadHash;

        // Create string to sign
        const algorithm = 'AWS4-HMAC-SHA256';
        const credentialScope = `${dateStamp}/${AMAZON_REGION}/ProductAdvertisingAPI/aws4_request`;
        const stringToSign =
            algorithm +
            '\n' +
            amzDate +
            '\n' +
            credentialScope +
            '\n' +
            (await sha256(canonicalRequest));

        // Calculate signature
        const signingKey = await getSignatureKey(
            AMAZON_SECRET_KEY,
            dateStamp,
            AMAZON_REGION,
            'ProductAdvertisingAPI'
        );
        const signature = toHex(await sign(signingKey, stringToSign));

        // Create authorization header
        const authorizationHeader =
            algorithm +
            ' Credential=' +
            AMAZON_ACCESS_KEY +
            '/' +
            credentialScope +
            ', SignedHeaders=' +
            signedHeaders +
            ', Signature=' +
            signature;

        // Make PA-API request
        const response = await fetch(`https://${host}${canonicalUri}`, {
            method: 'POST',
            headers: {
                'Content-Type': contentType,
                'Content-Encoding': 'amz-1.0',
                'X-Amz-Date': amzDate,
                'X-Amz-Target': xAmzTarget,
                Authorization: authorizationHeader,
            },
            body: payload,
        });

        if (!response.ok) {
            const errorText = await response.text();
            console.error('PA-API Error:', errorText);
            return new Response(
                JSON.stringify({
                    error: 'Amazon API error',
                    status: response.status,
                    message: errorText,
                }),
                {
                    status: response.status,
                    headers: { ...corsHeaders, 'Content-Type': 'application/json' },
                }
            );
        }

        const data = await response.json();

        // Parse response into simplified format
        const results: PriceResult[] = limitedAsins.map((asin) => {
            const item = data.ItemsResult?.Items?.find((i: { ASIN: string }) => i.ASIN === asin);

            if (!item) {
                return {
                    asin,
                    price: null,
                    currency: 'USD',
                    availability: 'unknown' as const,
                    lastUpdated: new Date().toISOString(),
                };
            }

            const offer = item.Offers?.Listings?.[0];
            const price = offer?.Price?.Amount || null;
            const currency = offer?.Price?.Currency || 'USD';
            const availabilityType = offer?.Availability?.Type || 'Unknown';

            let availability: PriceResult['availability'] = 'unknown';
            if (availabilityType === 'Now') availability = 'in_stock';
            else if (availabilityType === 'Low Stock') availability = 'low_stock';
            else if (availabilityType === 'Out of Stock') availability = 'out_of_stock';

            return {
                asin,
                price,
                currency,
                availability,
                title: item.ItemInfo?.Title?.DisplayValue,
                lastUpdated: new Date().toISOString(),
            };
        });

        return new Response(JSON.stringify({ prices: results }), {
            headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        });
    } catch (error) {
        console.error('Edge function error:', error);
        return new Response(
            JSON.stringify({
                error: 'Internal error',
                message: error instanceof Error ? error.message : 'Unknown error',
            }),
            {
                status: 500,
                headers: { ...corsHeaders, 'Content-Type': 'application/json' },
            }
        );
    }
});
