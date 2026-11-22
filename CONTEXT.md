# Sprout Saga — Domain Context

Ubiquitous language for Sprout Saga. Use these terms in code, issues, and UI copy; avoid the listed synonyms.

## People & access

- **Family** — the household that shares access to one or more Pregnancies/Children. Has a name (e.g. "The Pasquiers"). An account can belong to several Families; nothing crosses between them.
- **Caregiver** — a person who is a member of a Family. Carries a free-text **relationship label** ("Dad", "Grandma", "Nanny") that is display-only and grants nothing.
- **Membership** — one account's place in one Family: relationship label, Role, Scope, Circles. All Rights are per Membership.
- **Right** — a single permission from a fixed catalogue in code (e.g. `memory.view`, `memory.add`). Caregivers hold Rights through **Roles**, never through their relationship label. Every `*.add` requires its `*.view`; every Child Right requires `child.view`. Editing your own entries is not a Right: it follows from holding the matching `*.add`.
- **Role** — a named bundle of Rights, defined per Family by Guardians (custom Roles). A starter **Caregiver** Role ships pre-made and is fully editable. Each Membership has exactly one Role.
- **Guardian** — the built-in, non-editable all-Rights Role (the Family's admin). Only Guardians hold the reserved Rights (`profile.edit`, `members.manage`, `roles.manage`, `circles.manage`, `pregnancy.end`, `family.delete`), and only Guardians grant Guardian. The Family's creator is a Guardian; a Family may have several and must always have at least one.
  - _Avoid_: owner, admin, parent (as a permission concept).
- **Scope** — which characters a Membership's Rights apply to: _all characters_ (default, includes future ones) or a chosen list. A Pregnancy and the Children it sprouts into are one lineage. Guardians are always all-characters.
- **Circle** — a named, Guardian-managed group of members used as a Memory's **audience** (Everyone, or one or more Circles). Independent of Roles: Roles say _what_ you can do, Circles say _what you're close enough to see_.
  - _Avoid_: group (confused with Role), album, collection.
- **Invite** — a single-use link + short code (7-day expiry, revocable) pre-filled with label, Role, Scope and Circles; explicitly accepted by the invitee. A non-Guardian inviter can grant only a subset of their own Rights, Scope and Circles.
- **Former member** — a Membership that left or was removed: attribution frozen, no Rights. Their entries stay with the Family.

## The character

- **Pregnancy** — the pre-birth entity, always used even for a single baby. Holds the due date, the expected baby count, and per-baby optional nickname and sex. Has no Milestones and no Measurements.
- **Sprout** — the birth event: a Pregnancy _sprouts_ into one or more Children. Count is prefilled from the expected count and adjustable without comment.
  - _Avoid_: hatch, birth (as an entity/event name in code).
- **Child** — a born character. Either sprouted from a Pregnancy (and linked to it) or created directly by a Family joining after birth.
- **Corrected age** — a Child's age minus the weeks they were born early (from gestational age at birth). Drives Milestone pacing and Catch-up for preterm Children.
- **Character sheet** — the Child's profile view: profile fields, Measurements, skill tree.

## Skill tree

- **Skill tree** — a Child's full set of Milestones, organized by Branch and Era. Prerequisites are soft: any Milestone can be unlocked at any time (ADR-0003).
- **Branch** — one of five fixed lanes for life: Movement, Mind, Heart, Voice, Craft (code keys `movement`, `cognitive`, `social`, `language`, `selfcare`).
  - _Avoid_: domain, category, stat (stats belong to growth tracking, #5).
- **Era** — an age band of the tree: Baby (0–1), Toddler (1–3), Little one (3–6); later School and Teen. Display names are placeholders.
  - _Avoid_: level, stage, tier.
- **Unlock** — the record that a Child reached a Milestone: date + precision (`day`/`month`/`year`/`unknown`), by whom, backfilled flag, optional note. Noun and verb. One per Child per Milestone.
  - _Avoid_: complete, achieve, check off.
- **Next up** — a Milestone whose `emergesAt` age has passed and isn't unlocked. A display state, never stored.
- **Catch-up dismissal** — a stored "Not yet" answer from a Catch-up quest; expires after 3 months of corrected age.
- **Retired** — a Milestone removed from the catalog but kept for existing Unlocks.
- _Avoid_ **locked**, **late**, **behind** in UI copy and code: nothing is locked and nothing is late.

## Timeline & history

- **Saga** — the chronological timeline of a character, merging entries of several **kinds**: Memory, Milestone unlock, Measurement, Badge, profile change, Sprout. A _view_ over separately stored data, filterable by kind; profile changes hidden by default.
- **Prologue** — the part of the Saga before Sprout. A keepsake to show the child later: week counter, weekly size comparison, Memories.
- **Memory** — a freeform, caregiver-created entry (date, title, note, free-form tags). Unlocks nothing, triggers no Badge. Prologue Memories belong to the Pregnancy and are shared by all its Children; later Memories belong to one or more Children.
- **Milestone** — an authored node of the Skill tree (spec in #6). Exists only from Sprout onwards.
  - _Avoid_: using "milestone" for user-created entries — those are Memories; "achievement" — that's Badges.
- **Measurement** — a dated growth data point (weight, length, …). Immutable: corrected by soft-delete and re-create, never edited.
- **Change log** — append-only record of profile edits (field, old → new, by whom, when).

## Onboarding

- **Catch-up quest** — an optional, resumable flow available on any Child at any time, computed from the gap between what's recorded and the Child's (corrected) age. Chapters: Milestones (Done / Not yet / Don't remember), Measurements, Memories. Onboarding a late-joining Child is simply the first Catch-up.
- **Backfilled** — an entry created through a Catch-up quest. Backfilled entries never trigger notifications or Badges. A "Don't remember" Milestone is unlocked and undated.
- **Upgrade quest** — an in-app prompt to fill a newly required profile field on existing profiles.
