# AGENTS.md

Imported **agent-os**. Inspect repository files before acting.

## Reading order

1. `WORKING_STATE.md` — every session. Resume from **Next**.
2. `docs/agent-os/KERNEL.md` — protocol.
3. `docs/north-star/CONSTITUTION.md` — purpose, table, substrates. Stub → `/build-north-star` lock.
4. `docs/north-star/LADDER.md` — current unit must be a row (risk retired).
5. `docs/agent-os/CATALOG.md` — learned risks for this project.

Runtime: `.cursor/rules/agent-os-*.mdc`. Skills: `/build-north-star` and friends.

## Every session

1. Read `WORKING_STATE.md`.
2. Work on `unit/<X>-<slug>`, never `main`.
3. No implementation until the unit is on the ladder, Unit Spec approved, unlocked, learned risks written, and `docs/agent-os/gates/<unit>.md` exists. Off-ladder or invariant conflict → `/amend-north-star`.
4. Verify with that gate. Do not invent commands. Do not claim PASS without running it.
5. Update `WORKING_STATE.md` at close. Reconstruct on unit close.
6. Do not run git mutations — propose; the human executes.

## Ask before

Dependencies, unnamed substrates, secrets, new patterns, files outside the
unit, infrastructure, or merging to `main`.
