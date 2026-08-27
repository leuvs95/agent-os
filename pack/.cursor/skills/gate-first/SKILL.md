---
name: gate-first
description: >-
  Writes an independent verification probe before implementation. Use for
  /gate-first, new units after the failure catalog, or when an agent is about
  to claim PASS. The implementing agent must not author pass criteria after
  writing the code.
disable-model-invocation: false
---

# Gate first (P1)

## Rule

The gate file is created **before** implementation. Pass criteria do not
change to match the code.

## Procedure

1. Copy `docs/agent-os/templates/GATE.md` to `docs/agent-os/gates/<unit-slug>.md`
   when the risk is **builder-retired** (a ladder row).
2. For a **gate-retired** catalog risk, copy to
   `docs/agent-os/gates/catalog-<slug>.md` instead — a catalog probe with
   **no unit**. Do not mint a ladder row to hold the probe. Do not build
   production machinery merely to prove the lie is false.
3. Fill **Probe** with the exact SQL, HTTP, or command. One fail line a stranger could run.
4. **Pass if** / **Fail if** in observable terms (row count, status code, unique violation, job present, size bound).
5. Link catalog rows this gate protects.
6. Point `WORKING_STATE.md` at this file.

## What is not a gate

- “tests I will add”
- a verification markdown stamp
- a summary that the happy path should work
- a check the implementer invented after the code existed (unless the owner waives in the file)

## After code exists

Run the **unchanged** probe. Fill **Result**. Prefer the owner or a second
agent to run it. If you run it, you still cannot edit Pass if.
