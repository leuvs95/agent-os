# Constitution

Status: accepted
Version: 1.0

Would changing this mean Agent OS fundamentally believes something different? If no, it does not belong here.

## Purpose

A lean, inevitable kernel for disciplined AI-native engineering.

Agents execute. Humans accept. The machine refuses illegal transitions.

## Non-goals

Not a Linux-class OS. Not TaxiLabs folklore. Not Spec Kit. Not a hub substrate library. Not a quality-of-work judge.

## Invariants

1. **Prompts document. The check enforces. Bypass is not PASS.** Discipline that lives only in prose is optional.

2. **Commit-by-commit, monotonic.** Only `accepted` is sticky. History does not rewrite the last accepted constitution. Merges of unit work are not a commit the MMU can score — refuse them.

3. **Ladder, not folklore.** Units are ordered by **risk retired**. Each unit exposes a **contract**. Implementation is sliced by that contract.

4. **Import the protocol, not folklore.** After `/build-north-star` accept, substrates are written in the **product repo**. No consult-only hub library.

5. **Minimum mechanism.** Do not add enforcement, ceremony, or abstraction until a demonstrated risk requires it. Lean is constitutional, not a release preference.

6. **The MMU answers one question:** Was this repository allowed to make this transition? It does not grade quality of work, product taste, or whether the agent “did a good job.”

## Ownership

The human controls **acceptance** and **changes to gate criteria**.

Agents may execute authorized protocol and git mechanics. Agents may not manufacture acceptance or silently redefine a gate.

## Substrates

What persists across sessions. Each named substrate has a **current instance** in the North Star. Instances may change without amending this file.

- **Git history** — durable memory of what shipped. The MMU reads it. History is not the MMU.
- **Agent protocol** — the durable interface agents use to follow this kernel (skills, docs, commands, check invocation). Vendor surfaces change; the requirement that an importable agent protocol exist does not.
- **MMU** — the transition validator for this repository.

---

Accepted v1.0. Amendments via `/amend-north-star`. Unit work on `unit/<Id>-<slug>`, not `main`.
