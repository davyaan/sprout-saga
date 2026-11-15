# 2. The Saga is a merged view over separately stored entries

Date: 2026-10-03 · Status: Accepted · Context: #14

## Context

The character's timeline (the **Saga**) should show Memories, Milestone unlocks, Measurements, Badges, profile changes and the Sprout event in one scrollable, filterable feed. We considered making everything a Memory, so that the change log and unlocks would be stored as Memories with tags.

## Decision

- Each kind keeps its **own storage and rules**: Memories are freeform and editable; Measurements are immutable (soft-delete and re-create); the profile change log is append-only; Milestones and Badges follow #12 and #16.
- The Saga is a **read-side view** that merges these chronologically. Each entry has a **kind**, and filters show or hide kinds. Profile changes are hidden by default.
- Free-form **tags** exist on Memories only, for search and filtering within Memories. System kinds aren't tags.

## Consequences

- Domain rules (e.g. backfilled entries never notify, measurements never edited) stay enforceable per kind instead of hiding behind a generic "memory" record.
- New kinds (e.g. caregiver actions from #7) can join the Saga without schema changes to existing kinds.
- The Saga query has to fan out over several tables and merge them. That's acceptable at family scale and can be paged by date.
