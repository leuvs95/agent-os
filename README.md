# agent-os

Kernel for AI-native building. Import the protocol. Do not import folklore.

```bash
./scripts/import.sh /path/to/your-project
```

Then open that project and run `/build-north-star` until constitution v1.0
is accepted. After import, the one stranger command is:

```bash
scripts/agent-os-check.sh --range <base>...<head>
```

## Kernel

See `pack/docs/agent-os/KERNEL.md` (copied to `docs/agent-os/KERNEL.md` on import).

Mechanical refuse is `scripts/agent-os-check.sh` (source: `pack/scripts/agent-os-check.sh`).
Import copies it with the same `--force` keep-or-refresh as other protocol
files, and stamps `docs/agent-os/VERSION` from this repo’s `VERSION` file.

This repo’s own law: `docs/north-star/CONSTITUTION.md` (accepted v1.1).
Destination / current release: `docs/north-star/NORTH_STAR.md`. Path:
`docs/north-star/LADDER.md`. v1 is ladder rows 1–3 (shipped). Row 8 is
destination pressure. Rows 4–7 stay frozen.

- **Lock** until constitution v1.0
- **Staff** ≤5 seats from the vision (TPM, one facilitator)
- **Six lenses** (always ask, learned-only rows)
- **Ladder** is the minimum path to the observable product outcome
- **Substrates written in the project** — no hub library

## What import copies

```text
.cursor/rules/agent-os-*.mdc
.cursor/skills/
docs/agent-os/KERNEL.md
scripts/agent-os-check.sh
docs/north-star/          stubs
docs/agent-os/            CATALOG stub, templates, empty substrates/
AGENTS.md, WORKING_STATE.md   only if missing
```

`--force` refreshes rules, skills, and `scripts/agent-os-check.sh`. Without
`--force`, an existing dest checker is kept. `--force` does not clobber a
written constitution, ladder, catalog, gates, or generated substrates.

## Loop

```text
Staff + lenses (lock) → Unlock → Learned catalog → Gate first → Build → Independent check → Reconstruct → Encode
```

## Commands

| Invoke | When |
|---|---|
| `/build-north-star` | First move. Staff the table. `/north-star` is an alias. |
| `/amend-north-star` | Pivot. Six-lens injection. |
| `/unit-unlock` | Ladder row. No code until unlocked. |
| `/failure-catalog` | Six lenses on named substrates. Learned-only. |
| `/gate-first` | Probe before code. |
| `/reconstruct` | Unit close. |
| `/encode-catch` | Dual-AI catch → one project artifact. |
| `/substrate-sprint` | First write of a named substrate. |
| `/grill-me` | Stuck branch. Not genesis. |
| `/unit-blog` | Essay only when the lesson is worth it. |

## What this repo is not

Not TaxiLabs. Not a substrate starter kit. Not a place for dated mega North
Stars. If an artifact does not enforce the kernel, it does not belong here.
