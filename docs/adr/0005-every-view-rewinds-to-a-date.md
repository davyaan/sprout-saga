# 5. Every character view can Rewind to a past date

Date: 2026-11-22 · Status: Accepted · Context: #15

## Context

The character sheet is a keepsake as much as a tracker: families want to see the character "as they were at 9 months", not just today's numbers. Once the idea came up for Measurements, it generalised: the Character sheet, the Skill tree and the Saga should all be viewable as of one past date, and moving between them should keep that date.

Alternatives considered:
- History per view only (a curve for each Measurement kind, a scrollable Saga): this is simpler, but you can't see the whole character at one moment.
- Storing periodic snapshots of the character: this duplicates data and goes stale whenever something is backdated or soft-deleted.

## Decision

- **Rewind** is one shared cursor, the **Rewind date**, read by every character view. Each view derives its state as of that date from the dated records. Nothing is snapshotted.
- The Character sheet shows profile fields from the Change log and, for each kind, the latest Measurement on or before the date. The Skill tree shows Unlocks dated on or before the date; undated Unlocks count from their Milestone's `typicalBy` age. The Saga scrolls to the date.
- Before Sprout, the Character sheet shows the Pregnancy and the Skill tree is not yet sprouted. The range runs from the first Prologue entry (or birth, for a Child created directly) to today.
- Soft-deleted entries never appear. Profile fields show the value recorded at the time, even if it was corrected later.

## Consequences

- Every character data kind, now and in the future (Badges, logged actions), must carry a date and be reconstructible as of a past date. A kind that can't do this needs its own decision before it joins the character views.
- The Change log must keep every old value and record each field's initial value. It can never be compacted or overwritten.
- The look of the scrubber is a prototype question, not part of this decision.
