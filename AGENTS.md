# AGENTS.md

This repository is the canonical **agent-os** kernel. It is not a product.

## Canonical reading order

1. `WORKING_STATE.md` — every session, if present.
2. `pack/docs/agent-os/KERNEL.md` — protocol.
3. `README.md` — import contract.
4. `pack/` — what `scripts/import.sh` copies. Edit here.

## Every session

- Change the pack so the next import is better. Do not add ceremony.
- Keep rules under ~50 lines. Put procedure in skills.
- Keep `SKILL.md` files under 500 lines. Prefer far less.
- Do not run git mutations — propose; the human executes.

## Ask before

Adding a skill or an always-on rule. New always-on context is expensive.
