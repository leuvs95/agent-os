# Working state

## Now

**Unit:** 0.6.0-mechanical-refuse
**Branch:** `unit/0.6.0-mechanical-refuse`
**Learning gate:** matrix green; owner confirms gate Result
**Next:** Review checker. Then adapters (hooks, import, CI) if this unit includes them — or stop here.

**Gate file:** `docs/agent-os/gates/0.6.0-mechanical-refuse.md`
**Checker:** `pack/scripts/agent-os-check.sh`
**Fixtures:** `scripts/check-fixtures/run.sh` (30/30 matched, implementer-run)

## Session

**What we did:** Split the tree into eight commits. Seeded 0.5.0 on `main`. Froze the probe before the MMU (`962feba` has stories, no checker). Re-ran the stranger command after `run.sh` landed.
**What changed:** KERNEL contract sentence, gate Result, `pack/scripts/agent-os-check.sh`, `scripts/check-fixtures/run.sh`, this file
**Blocked:** none for the matrix. Human owns git. Owner still confirms Result.
