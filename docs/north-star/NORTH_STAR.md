# North Star

Status: accepted
**Constitution:** docs/north-star/CONSTITUTION.md
**Ladder:** docs/north-star/LADDER.md

This product’s destination and current-release plan. Changing this does **not** change what Agent OS believes — only what this instance is shipping now.

## This product

Turn the skill kit into an **inevitable check**: after import, a stranger can refuse an illegal git transition without reading the kernel.

## V1 destination

Ship ladder units **1–3** (see `LADDER.md`). That is the current release, not eternal law.

1. One Status grammar the MMU and lock skills both parse.
2. VERSION / CHANGELOG / README name the MMU and match what import ships.
3. Import copies `scripts/agent-os-check.sh`. README states the one stranger command.

## Not this release

Named later rows (ladder v1.1). Do not open until Depends-on is accepted.
Hub substrate library stays rejected (not a unit).

- **4** — local default-on (`install-hooks.sh`, `--staged`)
- **5** — remote default-on (workflow, rebase not merge, detached HEAD is not a unit branch)
- **6** — ceremony (P0–P5 vs lenses; unit-blog not kernel)
- **7** — dogfood this repo without weakening the MMU

## Current agent-protocol implementation

The constitution requires an **agent protocol**. This instance binds it to **Cursor**:

| Protocol piece | Cursor instance |
|---|---|
| Skills / commands | `.cursor/skills/` (pack), imported as `.cursor/skills/` |
| Kernel prose | `pack/docs/agent-os/KERNEL.md` → product `docs/agent-os/KERNEL.md` |
| Check invocation | `scripts/agent-os-check.sh` |
| Lock until accept | `/build-north-star`, `/amend-north-star` |

A different agent surface would be a North Star change, not a constitutional amendment — unless the kernel stopped requiring an importable agent protocol at all.

## This repo (seats)

| Seat | Who |
|---|---|
| Owner / accept | Leo |
| Facilitator | Cursor Grok 4.6 |
| Kernel + MMU | this repo |
| Import consumers | product repos |
| GitHub | remote after push; v1 not a gate; unit 5 later |

## Instance substrates

| Named substrate (constitution) | This instance |
|---|---|
| Git history | this git repo |
| Agent protocol | Cursor skills + KERNEL + check (table above) |
| MMU | `pack/scripts/agent-os-check.sh` → product `scripts/agent-os-check.sh` |

## Tradeoffs (this release)

| Chose | Over | Why |
|---|---|---|
| Pack exemption (KERNEL in pack/) | Dogfood the MMU on this repo in v1 | Exemption is shape assertion, not product escape |
| `--force` refreshes an existing checker; bare import keeps it | Always clobber, or a package manager | Catalog default; same `copy_file` as KERNEL |
| Status grammar unified in unit 1 | Leave two dialects | Learned; do not reopen |

## How to resume

`WORKING_STATE.md`. Constitution v1.0 accepted. Ladder v1.1 (amendment 001).
