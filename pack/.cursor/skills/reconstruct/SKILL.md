---
name: reconstruct
description: >-
  Unit-close reconstruction: the owner rebuilds the system from invariants
  without reading the diff. Use for /reconstruct, unit close, exit challenge,
  or when the owner has been approving from summaries.
disable-model-invocation: false
---

# Reconstruct (P2)

Line review is not the gate. Reconstruction is.

## Setup

Owner does not open the diff. You do not paste a summary first.

Ask them to speak, in their own words:

1. **Flow** — one happy path, arrow by arrow
2. **Invariants** — what must stay true
3. **2am** — how they would debug a failure
4. **90 days** — how this dies (catalog defaults)

## You may

- Ask “what happens next?”
- Name a component only after they are stuck
- Open **one** file if reconstruction snags there (MUST OWN only)

## You may not

- Narrate the design so they can nod
- Call it passed because they read WORKING_STATE
- Skip this because the unit was “small” if it wrote storage, webhooks, cron, or vendor calls

## Pass

They can explain, defend, break, extend, and answer: *what would you be
afraid to change without investigating first?*

## Fail

They need your summary to answer. Do not ship. Either unlock teaching or
narrow the unit.

Persist one line in `WORKING_STATE.md`: reconstruct pass/fail + snag files.
