# 1. A Pregnancy is its own entity that sprouts into Children

Date: 2026-10-03 · Status: Accepted · Context: #14

## Context

Families can join at any point: mid-pregnancy, at birth, or with a child who is already a toddler. Multiples (twins, triplets) must be supported from the start, and the pre-birth period is meant to be a keepsake chapter (the Prologue) of each child's Saga.

Alternatives considered:
- A single Child profile with an "expected" state that flips to "born". This doesn't model multiples: one expected profile would have to split.
- A Pregnancy entity only for multiples, with singletons using an expected Child. That means two code paths and a confusing special case.

## Decision

- Every pregnancy, singleton or not, is a **Pregnancy** entity: due date, expected baby count (editable until birth), per-baby optional nickname and sex.
- At birth, a Pregnancy **sprouts** into N **Children**. N is prefilled from the expected count and adjustable without asking why (to handle loss tactfully). Each Child links back to its Pregnancy, and the Pregnancy keeps the original expected count privately.
- Prologue Memories belong to the Pregnancy and appear in every sprouted Child's Saga as shared history. They are linked, not copied.
- Families that join after birth create a Child directly, with no Pregnancy.
- A full pregnancy loss is handled by a discreet "end pregnancy" action: it archives the Pregnancy, silences all its notifications, and lets the Family keep it as a memorial or hide it.

## Consequences

- One uniform creation path for pre-birth, and one uniform Child model whether it sprouted or was created directly.
- Child queries that render the Saga must also pull the linked Pregnancy's Prologue entries.
- No skill-tree Milestones or Measurements exist on a Pregnancy, which keeps #12 and #15 starting at Sprout.
