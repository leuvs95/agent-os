# Working state

## Now

**Unit:** (none) — 0.6.0-mechanical-refuse merged to `main` (`80db07e`, PR #1)
**Branch:** `main` — do not implement here. Next unit gets `unit/<X>-<slug>`.
**Learning gate:** locked until the adapter unit is specced and unlocked
**Reconstruct:** 0.6.0 pass (2026-08-20). No snag files.
**Next:** Spec the adapter unit, starting with Import (how a product repo receives the checker, version/update, `--force` / existing-checker). Freeze that contract, write the gate, then implement. No `install-hooks.sh` or GitHub workflow until that unit says so.

**Gate file (closed):** `docs/agent-os/gates/0.6.0-mechanical-refuse.md`
**Checker:** `pack/scripts/agent-os-check.sh`
**Fixtures:** `scripts/check-fixtures/run.sh` (30/30; owner accepted)
**VERSION:** still `0.5.0` until you ship a kernel release

## Follow-on (adapter unit; do not weaken the MMU)

1. Detached HEAD / branch identity — adapter contract, not checker.
2. `--staged` needs more fixtures before a pre-commit hook.
3. INVALID-parent recovery stays fail-closed unless MMU contract changes later.
4. Import does not distribute `scripts/agent-os-check.sh`; solve that before hook/CI claims.

## Session

**What we did:** Merged PR #1. Deleted `unit/0.6.0-mechanical-refuse`. Synced `main`.
**What changed:** this file only (resume pointer).
**Blocked:** none. Human owns git. Do not start adapter code on `main`.
