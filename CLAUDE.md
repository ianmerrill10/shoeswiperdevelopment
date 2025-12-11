# AI Agent Instructions for ShoeSwiper

This file contains persistent rules and context for AI agents working on this project.

---

## Project Overview

ShoeSwiper is a TikTok-style sneaker discovery app built with:
- React 18 + TypeScript
- Vite build system
- Tailwind CSS
- Supabase backend
- AWS Amplify deployment

---

## Required Actions After Every Task

### 1. Update Work Logs
After completing any task, update `logs/WORK_COMPLETED.md`:
- Add date header if new day
- Describe what was done
- Include relevant file paths

### 2. Update Known Issues
If you encounter or resolve issues, update `logs/KNOWN_ISSUES.md`:
- Add new issues with priority and description
- Move resolved issues to "Resolved Issues" section

### 3. Commit Changes
If significant changes were made:
```bash
git add .
git commit -m "Description of changes"
```

---

## Key Files to Know

| File | Purpose |
|------|---------|
| `src/pages/FeedPage.tsx` | Main TikTok-style feed |
| `src/lib/mockData.ts` | Mock sneaker data with images |
| `src/components/SwipeableCard.tsx` | Swipeable card component |
| `amplify.yml` | AWS Amplify build config |
| `logs/WORK_COMPLETED.md` | Task completion log |
| `logs/KNOWN_ISSUES.md` | Bug/issue tracker |

---

## Current Status

- **Development Server**: `npm run dev` → http://localhost:3000
- **Tests**: `npm test` → 588 passing
- **Build**: `npm run build` → Outputs to `dist/`
- **Lint**: `npm run lint` → 0 errors, 0 warnings

---

## Pending Work

1. Push to GitHub repository
2. Connect AWS Amplify for CI/CD
3. Implement actual music playback
4. Create PWA icons (192x192, 512x512)

---

## Code Conventions

- Use functional React components with hooks
- TypeScript strict mode enabled
- Tailwind for styling (avoid inline styles)
- Tests in `__tests__` folders adjacent to source files
