# ShoeSwiper

> 👟 TikTok-style sneaker discovery marketplace with AI outfit matching and NFT authenticity

[![Deploy](https://vercel.com/button)](https://vercel.com/new)

## Features

- 🔥 **Swipe Feed** - TikTok-style vertical sneaker discovery
- 💰 **Amazon Affiliate** - Monetized product links (tag: `shoeswiper-20`)
- 🔔 **Price Alerts** - Get notified when sneakers drop in price
- 🤖 **AI Outfit Match** - Upload your fit, get sneaker recommendations
- 💎 **NFT Marketplace** - Mint proof-of-ownership for your collection
- 🎵 **Music Integration** - Spotify/Apple Music tracks per sneaker
- 📱 **PWA Ready** - Installable with offline support

## Tech Stack

| Layer | Technology |
|-------|------------|
| Frontend | React 18, TypeScript, Tailwind CSS |
| State | Zustand, TanStack Query |
| Backend | Supabase (Auth, Database, Edge Functions) |
| Hosting | Vercel (recommended) |
| Payments | Amazon Associates |

## Quick Start

```bash
# Clone and install
git clone https://github.com/dadsellsgadgets/shoeswiper.git
cd shoeswiper/shoeswiper_canonical
npm install

# Development (Demo Mode)
npm run dev
```

## Production Deployment

ShoeSwiper is a Vite + React SPA using React Router. Production hosting must serve static assets from `dist/` and rewrite all non-file routes to `index.html`.
Vercel is the recommended deploy target; this repo includes a `vercel.json` SPA routing config.

### 1. Supabase Setup

```bash
# Install Supabase CLI
npm install -g supabase

# Login and link project
supabase login
supabase link --project-ref YOUR_PROJECT_ID

# Run schema
supabase db push

# Deploy edge functions
supabase functions deploy amazon-prices
supabase functions deploy email-capture
supabase functions deploy check-price-alerts

# Set secrets
supabase secrets set AMAZON_ACCESS_KEY=xxx
supabase secrets set AMAZON_SECRET_KEY=xxx
supabase secrets set RESEND_API_KEY=xxx
```

### 2. Environment Variables

Copy `.env.example` to `.env` and configure (frontend-safe variables only):

```env
VITE_SUPABASE_URL=https://xxx.supabase.co
VITE_SUPABASE_ANON_KEY=xxx
VITE_DEMO_MODE=false
VITE_SHOW_PRICES=true
```

### 3. Seed Database

```bash
# Optional: seed a baseline sneaker catalog
# Use Supabase SQL editor to run the provided seed SQL.
```

### 4. Deploy to Vercel

```bash
vercel --prod
```

Or set in the Vercel UI:

- **Framework Preset**: Vite
- **Build Command**: `npm run build`
- **Output Directory**: `dist`
- **Install Command**: `npm ci` (recommended)
- **Node.js**: 20+

## Project Structure

```text
shoeswiper_canonical/
├── src/
│   ├── components/     # React components
│   ├── hooks/          # Custom React hooks
│   ├── lib/            # Utilities & configs
│   ├── pages/          # Page components
│   └── scripts/        # Build scripts
├── public/
│   ├── sw.js           # Service worker
│   └── offline.html    # Offline page
├── supabase/
│   ├── schema.sql      # Database schema
│   └── functions/      # Edge functions
└── seed_data.sql       # 105 real sneakers
```

## Key Files

| File | Purpose |
|------|---------|
| `src/lib/config.ts` | App configuration & feature flags |
| `src/lib/realSneakerSeedData.ts` | 105 real sneakers with Amazon ASINs |
| `supabase/schema.sql` | Complete database schema with RLS |
| `.env.example` | Environment variable template |

## Deploy docs

See [DEPLOYMENT.md](DEPLOYMENT.md) for a short, concrete checklist.

## Admin Access

Admin email is configured in `src/lib/config.ts`:

```typescript
export const ADMIN_EMAIL = 'dadsellsgadgets@gmail.com';
export const ALLOWED_EMAILS = ['ianmerrill10@gmail.com', ADMIN_EMAIL];
```

## Revenue Streams

1. **Amazon Affiliate** - Commission on sneaker purchases
2. **Price Alerts** - Premium tiers planned
3. **NFT Marketplace** - Minting fees
4. **Sponsored Content** - Brand partnerships

## API Reference

### Edge Functions

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/functions/v1/amazon-prices` | POST | Fetch live Amazon prices |
| `/functions/v1/email-capture` | POST | Store email subscriptions |
| `/functions/v1/check-price-alerts` | GET | Cron job for price checks |

## License

MIT © dadsellsgadgets
