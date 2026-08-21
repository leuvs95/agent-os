# Working state

**Resume here.** Not a substrate. Not the constitution.

## Did

Owner accepted amendment 001 (ladder v1.1). Owner marked
`docs/agent-os/gates/1.md` PASS. Reconstruct: pass. Unit 1 on
`unit/1-status-grammar`: pack stubs `Status: stub`; lock and KERNEL use
`Status: stub` | `Status: accepted`. Frozen 30 stories unchanged.

## Next

Linear history onto `main` (fast-forward, no merge commit). Then retire
`unit/1-status-grammar`. Then `/unit-unlock` on row 2 — not on `main`.

## Learning gate

Reconstruct: **pass**. Snag: first flow put MMU refuse on the import path;
recovered without opening a file — checker not on product disk (unit 3),
invocation later (unit 4). Afraid to change: `status_of()` and the frozen 30.

## Do not

- Merge to `main` with a merge commit (MMU cannot score it)
- Open units 2–7 before unit 1 is on `main`
- Weaken `status-unknown` / `bootstrap-add-malformed`
- Copy the checker, add hooks, bump VERSION

## Pointers

- Amendment: `docs/north-star/AMENDMENTS/001-inevitable-ladder.md`
- Catalog: `docs/agent-os/CATALOG.md`
- Gate: `docs/agent-os/gates/1.md` (PASS)
- MMU (unchanged): `docs/agent-os/gates/0.6.0-mechanical-refuse.md`
