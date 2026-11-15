# 3. The Skill tree has soft prerequisites and no "late" state

Date: 2026-11-15 · Status: Accepted · Context: #12

## Context

The Skill tree borrows its look from RPGs, where nodes are gated by their parents. Real development doesn't follow a strict order (some babies skip crawling, some talk before babbling much), and parents often log late or out of order. The app is flavor, not clinical guidance, and must not become a source of worry about delays.

Alternatives considered:
- Hard prerequisites (a node stays locked until its parents are unlocked): this forces fake or reordered logging.
- No edges at all (age-banded lists): this loses the skill-tree look, which is the hook of the app.
- Flagging Milestones as overdue once their typical age passes: this turns the tree into a delay checker.

## Decision

- Edges between Milestones are **soft**. They drive layout and "next up" suggestions, but any Milestone can be unlocked at any time. Unlocking a node never fills in or flags its parents.
- Each Milestone carries two ages in months of corrected age: **`emergesAt`** (drives "next up" and ordering) and **`typicalBy`** (CDC 75% mark; drives what the Catch-up quest proposes).
- There is **no late state**: passing `typicalBy` without an Unlock changes nothing. No colour, notification, or "behind" wording, and no comparison between siblings.

## Consequences

- No padlock state exists in data or UI; display states are only unlocked, next up, and upcoming.
- Content authors can add edges freely without worrying about blocking anyone.
- If a future feature wants developmental screening, it needs a new decision, not a tweak to this one.
