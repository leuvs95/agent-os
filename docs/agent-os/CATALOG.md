# Risk log (this repo)

Learned-only. Six lenses always asked. Rows only for risks found.

## Lenses asked

Project grain (2026-08-20 evaluation):

- Purpose: asked; wrong product would be “another prompt pack.”
- Complexity: asked; skill sprawl is real, deferred to ladder 6 (was 4).
- Unknowns: asked; adapter (how product receives checker) was unnamed in README.
- Belief: asked; two Status dialects — we would believe a lie that the lock holds.
- Judgment: asked; 0.6.0 MMU is the right shape (script enforces).
- Operate: asked; import does not distribute the checker — the lock dies in the product repo.

Unit 1 grain (Status grammar, 2026-08-20 unlock):

- Purpose: asked; wrong fix is teaching the MMU to accept `unwritten`.
- Complexity: asked; a third Status value (draft/review) is unbounded; reconsider when a demonstrated epoch requires it.
- Unknowns: asked; `**Status:**` (markdown bold) is not `^Status:` — the MMU matches exact bytes.
- Belief: asked; skills still key the lock off `unwritten/stub` after the pack file is fixed.
- Judgment: asked; unifying grammar is not manufacturing `Status: accepted`.
- Operate: asked; Status is a committed line, not a job; reconsider when Status is derived rather than written.

## Risks

Risk: Pack stub `**Status:** unwritten — …` is INVALID under the MMU (`^Status: stub` \| `accepted`).
Lens: belief
Default if we stop talking: importers commit an illegal constitution
Independent gate / eval: `docs/agent-os/gates/1.md` — pack stub line is exactly `Status: stub`; imported stub matches `bootstrap-add-stub`
Seat: engineering
Reconsider when: never — this is v1 unit 1

Risk: Lock skill keys the stub epoch off `unwritten/stub`. Fixing the file without the skill still ships two dialects.
Lens: belief
Default if we stop talking: agents write `**Status:** unwritten` into new constitutions
Independent gate / eval: `docs/agent-os/gates/1.md` — `pack/.cursor/skills/build-north-star/SKILL.md` does not contain `unwritten`
Seat: engineering
Reconsider when: never — unit 1 contract names lock skills

Risk: “Fix” the split by accepting `Status: unwritten` in `status_of()` so the pack stub passes.
Lens: purpose
Default if we stop talking: `status-unknown` and `bootstrap-add-malformed` go green by weakening the MMU; folklore becomes law
Independent gate / eval: `docs/agent-os/gates/1.md` — `scripts/check-fixtures/run.sh` still matches frozen EXPECT; do not edit those fixtures to match new code
Seat: kernel
Reconsider when: never — constitution invariant 1 and 6

Risk: Unifying Status bytes is treated as constitution accept.
Lens: judgment
Default if we stop talking: pack stub ships `Status: accepted` and the lock never runs in products
Independent gate / eval: `docs/agent-os/gates/1.md` — pack stub Status line is `Status: stub`, not `accepted`
Seat: owner
Reconsider when: never — human owns acceptance

Risk: VERSION 0.5.0 / CHANGELOG / README silent on the checker after 0.6.0 merged.
Lens: belief
Default if we stop talking: the kit and the OS tell different stories
Independent gate / eval: README names `scripts/agent-os-check.sh` and VERSION matches the shipped kernel
Seat: product
Reconsider when: never — v1 unit 2

Risk: Import does not copy the checker; product never mechanically refuses.
Lens: operate
Default if we stop talking: prompts document, nothing enforces
Independent gate / eval: after import, `scripts/agent-os-check.sh --help` or usage exists; stranger command documented
Seat: platform
Reconsider when: unit 3 closed; hooks are unit 4

Risk: Pack exemption no-ops the checker on this repo.
Lens: judgment
Default if we stop talking: we cannot feel the lock we sell
Independent gate / eval: none in v1 (deferred unit 7)
Seat: engineering
Reconsider when: product-shaped check can run without weakening MMU
