# Sprout Saga — Domain Context

Ubiquitous language for Sprout Saga. Use these terms in code, issues, and UI copy; avoid the listed synonyms.

## People & access

- **Family** — the household that shares access to one or more Pregnancies/Children. Has a name (e.g. "The Pasquiers").
- **Caregiver** — a person who is a member of a Family. Carries a free-text **relationship label** ("Dad", "Grandma", "Nanny") that is display-only and grants nothing.
- **Right** — a single permission (e.g. "edit profile"). Caregivers hold Rights through **Roles**, never through their relationship label.
- **Role** — a named bundle of Rights assigned to Caregivers. Predefined roles are expected first; whether Families can define custom roles is decided in #13.
- **Guardian** — the all-Rights Role (the Family's admin). The Family's creator is a Guardian; a Family may have several (e.g. both parents) and must always have at least one. Only Guardians edit Pregnancy/Child profiles.
  - _Avoid_: owner, admin, parent (as a permission concept).

## The character

- **Pregnancy** — the pre-birth entity, always used even for a single baby. Holds the due date, the expected baby count, and per-baby optional nickname and sex. Has no Milestones and no Measurements.
- **Sprout** — the birth event: a Pregnancy _sprouts_ into one or more Children. Count is prefilled from the expected count and adjustable without comment.
  - _Avoid_: hatch, birth (as an entity/event name in code).
- **Child** — a born character. Either sprouted from a Pregnancy (and linked to it) or created directly by a Family joining after birth.
- **Corrected age** — a Child's age minus the weeks they were born early (from gestational age at birth). Drives Milestone pacing and Catch-up for preterm Children.
- **Character sheet** — the Child's profile view: profile fields, Measurements, skill tree.

## Timeline & history

- **Saga** — the chronological timeline of a character, merging entries of several **kinds**: Memory, Milestone unlock, Measurement, Badge, profile change, Sprout. A _view_ over separately stored data, filterable by kind; profile changes hidden by default.
- **Prologue** — the part of the Saga before Sprout. A keepsake to show the child later: week counter, weekly size comparison, Memories.
- **Memory** — a freeform, caregiver-created entry (date, title, note, free-form tags). Unlocks nothing, triggers no Badge. Prologue Memories belong to the Pregnancy and are shared by all its Children; later Memories belong to one or more Children.
- **Milestone** — an authored node of the skill tree (#12). Exists only from Sprout onwards.
  - _Avoid_: using "milestone" for user-created entries — those are Memories.
- **Measurement** — a dated growth data point (weight, length, …). Immutable: corrected by soft-delete and re-create, never edited.
- **Change log** — append-only record of profile edits (field, old → new, by whom, when).

## Onboarding

- **Catch-up quest** — an optional, resumable flow available on any Child at any time, computed from the gap between what's recorded and the Child's (corrected) age. Chapters: Milestones (Done / Not yet / Don't remember), Measurements, Memories. Onboarding a late-joining Child is simply the first Catch-up.
- **Backfilled** — an entry created through a Catch-up quest. Backfilled entries never trigger notifications or Badges. A "Don't remember" Milestone is unlocked and undated.
- **Upgrade quest** — an in-app prompt to fill a newly required profile field on existing profiles.
