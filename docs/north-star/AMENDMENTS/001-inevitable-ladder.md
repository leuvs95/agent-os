# Amendment 001 — inevitable-ladder

**Status:** accepted
**Type:** ladder
**From:** constitution v1.0 / ladder v1.0
**To:** constitution v1.0 / ladder v1.1
**Date:** 2026-08-20
**Evidence:** Constitution purpose already says “inevitable.” Ladder v1.0 v1 slice (rows 1–3) ships capability (stranger *can* refuse). Post-v1 rows 4–5 retire ceremony and dogfood, not “the check is optional.” After import, running the checker is still prose. That is invariant 1 again: discipline that lives only in prose is optional. Gate `0.6.0-mechanical-refuse` already deferred hooks/CI as adapters and forbade teaching the MMU that detached HEAD is a unit branch.

## Why

Align the ladder with the purpose word **inevitable** without expanding v1 or adding mechanism before rows 1–3 exist in a product.

v1 stays 1–3 (Status grammar, identity, import-the-check). Naming later units is not opening them.

## What changes

Ladder only. North Star “Not this release” list becomes named later rows.

| Id | Risk this unit retires | Contract it exposes | Depends on | Out of scope |
|---|---|---|---|---|
| 1 | (unchanged) | (unchanged) | — | Import of the checker binary; hooks |
| 2 | (unchanged) | (unchanged) | 1 | Marketing; new features |
| 3 | (unchanged) | (unchanged) | 1, 2 | `install-hooks.sh`; GitHub workflow; `--staged` hook; detached HEAD |
| 4 | Imported check is optional — README asked; nothing ran | `scripts/install-hooks.sh` installs a pre-commit that runs `scripts/agent-os-check.sh --staged`. Staged fixture set frozen in this unit’s gate (one `stub-src` story is not enough). Bypass (`--no-verify`) is not PASS. | 3 | GitHub workflow; required check; detached HEAD; new MMU policy |
| 5 | Local hook is not the remote — `--no-verify`, GUI commit, merge button | `.github/workflows/agent-os-check.yml` runs the same checker on the commit range. Merge commits still fail. Rebase (not merge) is the contributor contract. Detached HEAD is not taught as a unit branch; the job puts the checkout on `unit/<id>-<slug>` or equivalent the checker already understands. | 4 | New MMU epoch rules; quality gates (tests, lint); pack dogfood |
| 6 | Ceremony (P0–P5 vs six lenses; unit-blog as kernel) dilutes the kernel | Collapse dual numbering; unit-blog remains optional essay. | 3 | New enforcement |
| 7 | This repo never runs its own MMU (pack exemption) | Product-shaped check can run here without weakening Pass if / Fail if. | 3, 5 | Weakening the MMU to make dogfood green |

v1 remains rows **1–3** only. Do not open 4–7 until the previous v1 row is accepted (4 after 3, 5 after 4).

**Renumber (explicit, not silent):** old not-v1 `4` ceremony → `6`. Old not-v1 `5` dogfood → `7`.

## What stays

- Constitution v1.0 (purpose, non-goals, six invariants, substrates).
- v1 work: unit-unlock still starts at row 1. No hooks in unit 3.
- MMU stories frozen in `0.6.0-mechanical-refuse`. Adapters must not silently weaken them.
- Non-goals: not a quality-of-work judge; not a hub library; not Spec Kit.
- Off-ladder on purpose (reconsider-when, not units): second agent surface, OPA rewrite, agent-eval harness, secret scanning, incident bypass on `main`, reconstruct-as-quiz, telemetry.

## Failure injection (six lenses)

- **Purpose:** still “A lean, inevitable kernel for disciplined AI-native engineering.” Naming units 4–5 fulfills *inevitable* without changing the sentence. Would be the wrong business if we became a CI product or a quality judge — contracts forbid new MMU policy and tests/lint. Sentence unchanged ⇒ not constitution 2.0.
- **Complexity:** shallower would be “put hooks in unit 3.” That mixes distribution with invocation and grows v1. Unbounded platform would be hook frameworks, GitHub Apps, policy languages. Contract: one install script, one workflow, same checker.
- **Unknowns:** name **invocation adapter** (hooks) vs **distribution adapter** (import) vs **remote adapter** (CI). GitHub was already a seat, not a v1 gate. No new constitution substrate.
- **Belief:** we would believe it is inevitable because the README documents the stranger command (that is the unit 3 lie). Mitigate: unit 4 exists. We would believe the hook is enough (`--no-verify`, merge button). Mitigate: unit 5. We would believe CI green means the MMU learned detached HEAD. Mitigate: job must not change epoch rules; gate 0.6.0 follow-on already forbids that.
- **Judgment:** agents may write hook/workflow files on an unlocked unit branch. Humans accept GitHub required-check and still own git mutations. Agents may not manufacture “required” on the remote or treat `--no-verify` as PASS.
- **Operate:** hook dies if unit 3 import never gains a later copy of `install-hooks.sh` — unit 4’s contract must say how a product that already imported 1–3 receives the hook (document; do not clobber law). CI dies if the workflow exists but is not required — owner owns that click. Merge button creates merge commits the MMU already refuses — good, unless people disable the check; unit 5 README states rebase-only. Pack exemption still no-ops this repo until 7.
- **Ladder:** none of 1–3 invalidated. Added 4 (hooks) and 5 (CI). Split nothing. Renumbered old 4→6, old 5→7. Catalog: operate row “import does not copy the checker” still points at unit 3; add (on unlock of 4) “imported check is optional.”

## Independent gate / eval

Not operational (no scheduler, retention, or uniqueness change). Sequence and naming only. Owner waiver.

Probe that would apply *when unit 4 opens* (do not write that gate now): staged fixture matrix beyond `stub-src`, hook path, `--no-verify` is still fail-closed in prose. Unit 5 gate: workflow invokes the same binary; a merge commit in range still exits 1; detached HEAD does not become a unit id.

## Decision

accepted — owner, 2026-08-20, purpose injection held; v1 stays 1–3; name invocation as later rows. `LADDER.md` is v1.1. Constitution unchanged.
