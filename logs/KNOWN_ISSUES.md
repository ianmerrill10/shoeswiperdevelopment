# Known Issues & Problems

This file tracks ongoing issues, bugs, and problems that need attention. AI agents and developers should check this before starting work.

---

## Active Issues

### Medium Priority

1. **AWS Amplify Connection Pending**
   - Status: In progress
   - Description: GitHub repo created, need to connect AWS Amplify for CI/CD
   - Next steps: Connect Amplify to GitHub repo in AWS Console

2. **PWA Icons Missing**
   - Status: Not started
   - Description: manifest.json references icon-192.png and icon-512.png but files don't exist
   - File: `public/manifest.json`

### Low Priority

4. **ESLint Button Type Hints**
   - Status: Minor
   - Description: Buttons missing type="button" attribute
   - Files: Multiple in FeedPage.tsx
   - Note: Hints only, not errors

---

## Resolved Issues

### 2024-12-11

1. ~~Infinite loading loop~~ - Fixed by passing page parameter to loadShoes
2. ~~Broken images (Unsplash)~~ - Replaced with brand CDN URLs
3. ~~Like/Save button conflict~~ - Changed bookmark to open details panel
4. ~~UI overlapping shoe image~~ - Redesigned to split layout
5. ~~Music not playing~~ - Added Spotify embed player with 30-sec previews
6. ~~GitHub push~~ - Pushed to https://github.com/ianmerrill10/shoeswiperdevelopment

---

## How to Update This Log

When encountering issues:
1. Add to "Active Issues" with priority level
2. Include status, description, file paths, and potential solutions

When resolving issues:
1. Move to "Resolved Issues" with date
2. Add brief note on how it was fixed
