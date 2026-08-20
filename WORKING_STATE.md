# Working state

## Now

**Unit:** 0.6.0-mechanical-refuse — closed
**Branch:** `unit/0.6.0-mechanical-refuse`
**Learning gate:** owner accepted 2026-08-19 implementer run (2026-08-20)
**Reconstruct:** pass (2026-08-20). No snag files.
**Next:** Spec the adapter unit, starting with Import (how a product repo receives the checker, version/update, `--force` / existing-checker). Freeze that unit’s contract before any implementation. Do not add `install-hooks.sh` or a GitHub workflow under 0.6.0.

**Gate file:** `docs/agent-os/gates/0.6.0-mechanical-refuse.md`
**Checker:** `pack/scripts/agent-os-check.sh`
**Fixtures:** `scripts/check-fixtures/run.sh` (30/30; owner accepted)

## Follow-on (adapter unit; do not weaken the MMU)

1. Detached HEAD / branch identity — adapter contract, not checker.
2. `--staged` needs more fixtures before a pre-commit hook.
3. INVALID-parent recovery stays fail-closed unless MMU contract changes later.
4. Import does not distribute `scripts/agent-os-check.sh`; solve that before hook/CI claims.

## Session

**What we did:** Owner accepted gate Result. Closed 0.6.0 on the MMU + matrix. Adapters out of scope. Recorded four adapter constraints as follow-on.
**What changed:** gate Result + Follow-on; this file. `VERSION` still 0.5.0.
**Blocked:** none. Human owns git. Reconstruct passed; merge to `main` is still yours.
