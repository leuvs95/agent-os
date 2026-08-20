---
name: amend-north-star
description: >-
  Versioned pivot of the constitution or unit ladder with mandatory failure
  injection. Use for /amend-north-star, off-ladder work, invariant conflict,
  or when the owner wants to change purpose, non-goals, or unit sequence.
disable-model-invocation: false
---

# Amend North Star

Silent drift is forbidden. Git history is not the amendment log — agents
do not read `git log` before inventing a unit.

If constitution is still a stub, this is the wrong skill. Run `/build-north-star`.

## Procedure

1. Stop implementation. Name the conflict: off-ladder, invariant, or purpose.
2. Copy `docs/north-star/templates/AMENDMENT.md` to
   `docs/north-star/AMENDMENTS/<NNN>-<slug>.md` (NNN = next integer).
3. Fill **from → to** versions. Constitution and ladder version independently
   (constitution `1.x`, ladder `1.x`). A unit-order change is a **ladder**
   bump, not a constitution bump, unless an invariant changed.
4. **Failure injection** — six kernel lenses, plus ladder invalidation. Do not skip a lens; “asked; no risk; reconsider when” is allowed.
   - Purpose, Complexity, Unknowns, Belief, Judgment, Operate (see `docs/agent-os/KERNEL.md`)
   - Ladder: units invalidated / added / split (no silent renumber)
5. Independent gate if the change is operational (scheduler, retention, uniqueness). Else name why not.
6. Owner accepts or rejects. Rejected amendments stay in the log with status rejected.
7. Only if accepted: edit CONSTITUTION.md and/or LADDER.md to match, bump the in-file version, set amendment status accepted.
8. Point WORKING_STATE at the amendment id.

## Never

- Edit constitution/ladder “while we’re here”
- Date-stamp a new North Star file and leave the old one
- Treat WORKING_STATE status as a constitution change
- Accept an amendment that fails purpose injection
