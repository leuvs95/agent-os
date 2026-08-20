---
name: encode-catch
description: >-
  Turns a dual-AI disagreement or human catch into a durable artifact so
  babysitting does not repeat. Use for /encode-catch, when two models
  conflict, when the owner is bridging AIs, or after a production miss that
  was “obvious in hindsight.”
disable-model-invocation: false
---

# Encode catch (P3)

Babysitting that is not encoded will be paid again.

## Classify the catch

| Kind | Durable artifact |
|---|---|
| Fact about a vendor/platform | Contract or catalog row |
| Regression | Test (and keep the gate honest) |
| Process miss | Risk log row or rule |
| Project-only | Comment in `CATALOG.md` |

## Procedure

1. State the disagreement in one sentence (model A vs model B vs production).
2. Inspect; do not vote. Evidence wins.
3. Write **exactly one** artifact (test, contract, or `CATALOG.md` risk row).
4. Tell the owner: this item is no longer a bridge topic.

## Do not

- Leave the truth only in chat
- Write a new principles document
- Re-explain the same vendor mapping next unit
