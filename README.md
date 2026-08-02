# Sprout Saga

*(working title — subject to change)*

A mobile app for iOS and Android that tracks a baby's growth — from pregnancy through the newborn stage — as an RPG-style character progress tree. Instead of a plain baby log, milestones unlock like skill trees, growth stats read like a character sheet, and caregivers earn their own badges for the (many) unglamorous jobs of early parenthood.

## Concept

- **The baby has a character sheet.** Growth stats (weight, height, etc.) and developmental milestones (motor, cognitive, social, language) are loosely inspired by real developmental stages and presented as unlockable skill trees. This is flavor, not medical guidance — the app does not follow WHO/CDC data strictly and shouldn't be used to judge developmental delays.
- **Caregivers have their own progress too.** Each parent/caregiver tracks their own actions (diaper changes, night feeds, etc.) and earns personal badges at milestones (e.g. "Diaper Master" at 100 changes). Badges are personal — there's no leaderboard or competition between caregivers, just a shared sense of "look what we did."
- **It's a family affair.** A household can include multiple caregivers (parents, co-parents, grandparents, etc.) with shared, synced access to a child's profile — and multiple children (twins, siblings) from day one.
- **Manual logging only for MVP.** No smart-device or health-app integrations at launch; that's a possible future layer, not a blocker.

## Scope

- Tracking starts at **pregnancy** and continues through the newborn/infant stage.
- **Free, personal project** — no monetization planned.
- Visual style: **cute pixel-art / retro game** aesthetic.
- Notifications: reminders to log activity, plus celebratory alerts when a badge or milestone unlocks.

## Stack

- **Frontend:** Flutter (single codebase for iOS + Android)
- **Backend:** [Convex](https://www.convex.dev/) (TypeScript) — handles the database, realtime sync between caregivers, serverless functions, and scheduled jobs (used to drive reminder/badge notifications)
  - No separate server layer. Convex's function runtime is a V8-isolate environment similar to Cloudflare Workers (not literally Deno, though npm packages compatible with Deno/browser environments generally work); a Node.js runtime is available per-action via `"use node"` for anything needing Node-specific APIs.

## Status

Early planning. Solo build, aiming for a working MVP within roughly 1–3 months.

## MVP scope (first cut)

- Family account with multi-caregiver invite/access
- Child profile creation (supports multiple children per family)
- Baby character sheet: growth stat entry (weight/height/etc.) + a first pass at milestone skill trees
- Caregiver action logging (starting with diaper changes and feeds) with a first badge set
- Push notifications: logging reminders + badge/milestone unlock alerts
- Pixel-art badge/milestone visuals (initial art pass, can start minimal and expand)
