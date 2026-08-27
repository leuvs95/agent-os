# Unit ladder

Version: 1.2
Status: accepted
Constitution: docs/north-star/CONSTITUTION.md
North Star: docs/north-star/NORTH_STAR.md
Amendment: docs/north-star/AMENDMENTS/002-freeze-until-product.md

Risk order and unit contracts. Not the destination (that is the North Star)
and not the law (that is the constitution).

**Frozen (002):** do not open rows 4–7 until a product skip costs something
or a second product imports. Thaw is `/amend-north-star`, not a session whim.

Ordered by **risk retired**. Do not implement on `main`. Branch
`unit/<Id>-<slug>`. Do not start a row until its Depends-on rows are
accepted or explicitly waived in an amendment.

v1 is rows **1–3** only (shipped). v2 is rows **4–5** (named, frozen).
Rows 6–7 stay later and frozen.

| Id | Risk this unit retires | Contract it exposes | Depends on | Out of scope |
|---|---|---|---|---|
| 1 | Docs/skills and the MMU disagree on constitution Status — discipline is optional | One grammar: `Status: stub` \| `Status: accepted` in pack stub, lock skills, KERNEL, fixtures. Imported stub is a legal stub epoch. | — | Import of the checker binary; hooks |
| 2 | Identity lie — importers think they got 0.5.0 staffing-only | VERSION, CHANGELOG, README name the MMU and match what import ships | 1 | Marketing; new features |
| 3 | Product repo can import and never refuse a kernel violation | Import copies the checker to `scripts/agent-os-check.sh`; README states the one stranger command. `--force` / existing-checker contract frozen in the gate. | 1, 2 | `install-hooks.sh`; GitHub workflow; `--staged` hook; detached HEAD |
| 4 | Imported check is optional — README asked; nothing ran | `scripts/install-hooks.sh` installs a pre-commit that runs `scripts/agent-os-check.sh --staged`. Staged fixture set frozen in this unit’s gate (one `stub-src` story is not enough). Bypass (`--no-verify`) is not PASS. | 3 | GitHub workflow; required check; detached HEAD; new MMU policy |
| 5 | Local hook is not the remote — `--no-verify`, GUI commit, merge button | `.github/workflows/agent-os-check.yml` runs the same checker on the commit range. Merge commits still fail. Rebase (not merge) is the contributor contract. Detached HEAD is not taught as a unit branch; the job puts the checkout on `unit/<id>-<slug>` or equivalent the checker already understands. | 4 | New MMU epoch rules; quality gates (tests, lint); pack dogfood |
| 6 | Ceremony (P0–P5 vs six lenses; unit-blog as kernel) dilutes the kernel | Collapse dual numbering; unit-blog remains optional essay. | 3 | New enforcement |
| 7 | This repo never runs its own MMU (pack exemption) | Product-shaped check can run here without weakening Pass if / Fail if. | 3, 5 | Weakening the MMU to make dogfood green |

## Not v1 (frozen — amendment 002)

| Id | Release | Why frozen |
|---|---|---|
| 4 | v2 | Invocation is not distribution. Do not open until a product skip of `--range` costs something. |
| 5 | v2 | After the local hook exists. Still frozen with 4. |
| 6 | after v2 | Ceremony. Do not spend a kernel unit on it. |
| 7 | after product-shaped check | Do not weaken the MMU to dogfood. |
