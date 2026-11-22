# 4. Custom Roles, Scope and Circles control access

Date: 2026-11-22 · Status: Accepted · Context: #13

## Context

#14 settled that Rights come from Roles, not relationship labels, and that Guardians alone edit profiles. Families also want finer control: limit what a nanny sees, keep a pregnancy private before announcing it, share some Memories with close family only, and restrict a member to one Child in a blended family. The app starts self-hosted for one Family and may become a SaaS later.

Alternatives considered:
- Predefined Roles only (Guardian, Caregiver, Viewer). Simple, but too coarse for the cases above.
- A Role per character (people × characters grid). Flexible, but every new Child means reassigning everyone.
- Using Roles as Memory audiences. Roles group by what you may _do_, not by closeness, so Families would create fake Roles just to share.

## Decision

- **Rights** are a fixed catalogue in code: one `.view` per kind (`child`, `profile`, `pregnancy`, `memory`, `measurement`, `unlock`, `action`, `badge`, `history`), one `.add` per writable kind, plus `entries.moderate` and `members.invite`. `add` requires `view`; Child Rights require `child.view`. A new kind adds its own pair; its migration may grant a default to existing Roles.
- **Roles** are custom, per Family, edited by Guardians and effective immediately. **Guardian** is built in, non-editable, and the only holder of `profile.edit`, `members.manage`, `roles.manage`, `circles.manage`, `pregnancy.end`, `family.delete`.
- A **Membership** has one Role plus a **Scope** (all characters, or a list; Pregnancy + sprouted Children count as one lineage).
- **Circles** are Guardian-managed groups used as Memory audiences. A Memory is visible with `memory.view` + Scope + (audience is Everyone, or a Circle you're in, or you're the author, or you're a Guardian).
- **No escalation:** non-Guardians can only invite into a subset of their own Rights, Scope and Circles. A Family always has at least one Guardian, enforced in one backend invariant; any Guardian may promote/demote others (logged, notified).

## Consequences

- Every read and write goes through one authorization helper that combines Role, Scope and (for Memories) audience. Nothing is cached client-side.
- Queries that merge the Saga (ADR-0002) must filter each kind by its own view Right.
- Notifications must respect the same check: never push about something the recipient can't see.
- Audiences could later extend to other kinds without changing their storage.
