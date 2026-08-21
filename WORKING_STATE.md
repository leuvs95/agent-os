# Working state

**Resume here.** Not a substrate. Not the constitution.

## Did

Owner marked `docs/agent-os/gates/2.md` PASS. Reconstruct: pass. Unit 2 on
`unit/2-identity`: stamp `0.6.1`; CHANGELOG/README name
`scripts/agent-os-check.sh`; import does not copy the checker.

## Next

Linear history onto `main` (fast-forward, no merge commit). Then retire
`unit/2-identity`. Then `/unit-unlock` on row 3 — not on `main`.

## Learning gate

Reconstruct: **pass**. Boundary: 0.6.1 says the MMU exists in the kernel; it
does not claim the importer receives it. Afraid to change: `VERSION` +
matching CHANGELOG heading + `import.sh` VERSION stamp. Do not copy the
checker; do not touch `status_of()` or the frozen 30.

## Do not

- Merge to `main` with a merge commit
- Copy `pack/scripts/agent-os-check.sh` in `scripts/import.sh`
- Touch `status_of()` or `scripts/check-fixtures/`
- Open unit 3 before unit 2 is on `main`

## Pointers

- Gate: `docs/agent-os/gates/2.md` (PASS)
- Catalog: `docs/agent-os/CATALOG.md`
- Unit 1: `docs/agent-os/gates/1.md`
