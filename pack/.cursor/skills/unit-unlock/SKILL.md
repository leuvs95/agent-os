---
name: unit-unlock
description: >-
  Readiness gate before implementation. Runs P0 failure catalog and P1
  gate-first, then teaches until the owner can decide. Use at new units,
  locked learning gates, /unit-unlock, /unlock-unit, or when the owner asks
  to unlock work through understanding.
disable-model-invocation: false
---

# Unit unlock

Transfer judgment. Productive struggle is intentional. Unlock means informed
decisions, not memorized names.

## Mandatory before unlock (cannot skip)

0. If `CONSTITUTION.md` is a stub, stop — `/build-north-star` lock.
   Otherwise the unit is a row on `docs/north-star/LADDER.md` and does not
   violate `CONSTITUTION.md`. If not, `/amend-north-star`. Cite the
   invariants this unit protects.
   The catalog risk for this row must be **builder-retired**, threaten the
   observable product outcome, name a product delta, and have delete-test
   and destination-test answers. If it has not earned builder-retired
   status, refuse — do not unlock. Research, gate, use, and deferral are
   valid outcomes; they are not this unit.
1. Name **substrates** this unit touches from the constitution table.
   Unknown name → `/amend-north-star`. (“None durable” is a written default.)
2. Run **`/failure-catalog`** — six lenses, learned-only rows in
   `docs/agent-os/CATALOG.md`.
3. Run **`/gate-first`**. `docs/agent-os/gates/<unit>.md` exists.
4. If this unit is the first to write a named substrate, `/substrate-sprint`
   or record why not.

Deadline mode may defer teaching. It may not defer ladder membership, learned risk log, or the gate file.

## Teach (adaptive)

Problem → Intuition → First principles → Challenge/defend → Unit Spec.

Skip stages already demonstrated. Do not quiz evidence gaps — inspect.
Help ladder on “I don’t know.” One credible counterargument before lock.

Unit Spec = the eight questions in `agent-os-workflow.mdc`.

## Unlock when they can state

- capability and boundary, and which constitution invariants this unit protects
- catalog learned defaults they accepted
- the independent gate and what FAIL looks like
- tradeoff vs the challenge
- own vs delegate

## Persist

Learning gate fields + catalog/gate pointers in `WORKING_STATE.md`.
Await go-ahead before implementation.

## After build (do not do during unlock)

Implementation map → targeted MUST OWN files only → `/reconstruct` at close.
