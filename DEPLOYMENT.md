# Deployment (minimal)

This app is a Vite + React single-page app (SPA) using React Router.

## Deploy target: Vercel (recommended)

### Prereqs

- Node.js 20+
- A Supabase project (only required when `VITE_DEMO_MODE=false`)

### 1) Configure env vars

Create `.env` locally from `.env.example`.

Vercel env vars (Project Settings → Environment Variables):

- `VITE_DEMO_MODE`:
  - `true` for demo-only deploys (no Supabase required)
  - `false` for production (requires Supabase vars)
- `VITE_SUPABASE_URL` (required when `VITE_DEMO_MODE=false`)
- `VITE_SUPABASE_ANON_KEY` (required when `VITE_DEMO_MODE=false`)
- Optional:
  - `VITE_SENTRY_DSN`
  - `VITE_VAPID_PUBLIC_KEY`

Important: do not place secrets in Vercel env with a `VITE_` prefix; Vite embeds those values into the client bundle.

### 2) SPA routing

Because this app uses `BrowserRouter`, all non-file routes must be rewritten to `/index.html`.

- Vercel: handled by `vercel.json` in this repo.

### 3) Build settings

In Vercel:

- Framework Preset: Vite
- Install Command: `npm ci`
- Build Command: `npm run build`
- Output Directory: `dist`

### 4) Supabase (optional / production)

If you are using production mode, you typically need:

- Database schema applied (see `supabase/`)
- Edge functions deployed (if you use live Amazon price fetch, social syndication, or AI features)

Store server-side secrets (Amazon PA-API keys, API keys for email/AI providers, VAPID private key, etc.) using Supabase secrets, not Vercel `VITE_*` env vars.

## Alternative targets (notes)

- Netlify: add a redirect rule to serve `index.html` for all routes.
- S3/CloudFront: configure error document / rewrite behavior so deep links resolve to `index.html`.
