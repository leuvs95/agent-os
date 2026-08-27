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

Unit 2 grain (identity, 2026-08-20 unlock):

- Purpose: asked; wrong product is labeling 1.0 because the constitution is accepted, or a marketing changelog that never names the MMU.
- Complexity: asked; extra version files under pack/; reconsider when import needs a second stamp.
- Unknowns: asked; import already stamps `docs/agent-os/VERSION` from the kernel `VERSION` file.
- Belief: asked; VERSION 0.5.0 / CHANGELOG 0.5.0 / README silent on the checker after the MMU shipped.
- Judgment: asked; the owner accepts the version number; the agent does not invent 1.0.
- Operate: asked; VERSION is a stamp import copies, not a job. Reconsider when unit 3 copies the checker — the stamp must still match.

Unit 3 grain (import-the-check, 2026-08-20 unlock):

- Purpose: asked; wrong product is installing hooks here, or always clobbering a product checker.
- Complexity: asked; import as a package manager; reconsider when a second artifact needs the same `--force` policy.
- Unknowns: asked; `--force` vs keep-existing for `scripts/agent-os-check.sh`.
- Belief: asked; README names the path so the file must already be there.
- Judgment: asked; `--force` overwrite of an existing checker is the owner’s call.
- Operate: asked; without `--force`, a product keeps a stale checker after kernel updates. Reconsider at unit 4 (hooks), not by weakening the MMU.

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
Independent gate / eval: `docs/agent-os/gates/2.md` — VERSION is not `0.5.0`; CHANGELOG heading matches VERSION; README and that CHANGELOG section name the MMU
Seat: product
Reconsider when: never — v1 unit 2

Risk: Stamp `1.0.0` because this repo’s constitution is accepted.
Lens: purpose
Default if we stop talking: importers think they received a finished v1 kernel (rows 1–3)
Independent gate / eval: `docs/agent-os/gates/2.md` — VERSION is not `1.0.0`
Seat: product
Reconsider when: after ladder rows 1–3 are on `main` and the owner names a 1.0 stamp

Risk: Import does not copy the checker; product never mechanically refuses.
Lens: operate
Default if we stop talking: prompts document, nothing enforces
Independent gate / eval: `docs/agent-os/gates/3.md` — after import, `scripts/agent-os-check.sh` exists and matches pack; README states `--range`; `--force` refreshes, bare import keeps an existing file
Seat: platform
Reconsider when: unit 3 closed; hooks are unit 4

Risk: Pack exemption no-ops the checker on this repo.
Lens: judgment
Default if we stop talking: we cannot feel the lock we sell
Independent gate / eval: none in v1 (deferred unit 7; frozen by 002)
Seat: engineering
Reconsider when: product-shaped check can run without weakening MMU

Risk: Opening kernel rows 4–7 before a product uses the pack makes the detour the project.
Lens: purpose
Default if we stop talking: TaxiLabs waits on hooks/CI/dogfood; Agent OS stays the product
Independent gate / eval: `docs/north-star/AMENDMENTS/002-freeze-until-product.md` — no `unit/4-*` (or 5–7) until thaw
Seat: owner
Reconsider when: a product skip of `--range` / invocation costs something, or a second importer demonstrates that skip. Amendment 003 is not this thaw.

Amendment 003 grain (path-not-curriculum, 2026-08-27):

- Purpose: asked; wrong product is a PM methodology, UI-as-product, or thawing 4–7 because 003 opened.
- Complexity: asked; seventh lens / disposition skill / P6 / MMU taste-judge is unbounded.
- Unknowns: asked; named observable product outcome and risk disposition.
- Belief: asked; KERNEL paragraph without Lot Clerk both-sides gate is the lie.
- Judgment: asked; owner accepts OPO; agent does not relitigate TaxiLabs R7/R8.
- Operate: asked; not operational; reconsider if disposition becomes a scheduled job.

Risk: Following the kernel in good faith converts discovered technical risks into ladder rows; destination pressure is optional folklore.
Lens: purpose
Default if we stop talking: the owner keeps saying stop plumbing; via negativa stays a risk curriculum
Independent gate / eval: unit 8 — Lot Clerk gold + anti-fixtures at `/gate-first` after reconstruct (not this amendment)
Seat: owner
Reconsider when: never for the law; thaw of 4–7 is a different risk (002)

Risk: Treating amendment 003 as the 002 thaw because 002 said “003+.”
Lens: belief
Default if we stop talking: hooks/CI/ceremony/dogfood open without an invocation skip
Independent gate / eval: `docs/north-star/AMENDMENTS/003-path-not-curriculum.md` — row 8 added; 4–7 still frozen; thaw is 004+
Seat: kernel
Reconsider when: 004 names an invocation skip and which frozen row that cost requires

Risk: Disposition theater — every catalog risk stamped deferred, or zero builder rows, so the kernel builds nothing.
Lens: belief
Default if we stop talking: we overcorrect into “don’t build”; required product truths never become real
Independent gate / eval: Lot Clerk anti-fixture — zero builder rows FAIL; unknown-expiry / lot-identity builder rows must remain
Seat: product
Reconsider when: unit 8 gate is written; never weaken that anti-fixture

Unit 8 grain (product-path, 2026-08-27 unlock):

- Purpose: asked; wrong product is UI-as-product or a disposition methodology kit.
- Complexity: asked; adding a Product delta MMU column would unfreeze HEADER1; product delta lives on catalog / row admission.
- Unknowns: asked; catalog-level gates (no unit) unnamed until `/gate-first` says so.
- Belief: asked; gold fixtures pass while KERNEL still says only “ordered by risk retired.”
- Judgment: asked; humans accept OPO; agents draft disposition; agents may not thaw 4–7.
- Operate: asked; protocol files are not a job; reconsider when a scheduled protocol-eval harness exists.

Risk: Lot Clerk gold is green while the imported protocol still mints a row per discovered risk.
Lens: belief
Default if we stop talking: KERNEL.md is folklore; destination pressure is optional again
Independent gate / eval: `docs/agent-os/gates/8.md` — protocol checks on `pack/` plus gold/anti trees
Seat: engineering
Reconsider when: never — unit 8 contract

Risk: Adding a sixth ladder column (Product delta) silently invalidates frozen MMU header stories.
Lens: complexity
Default if we stop talking: `accepted-ladder-bad-header` goes red or we edit fixtures to match
Independent gate / eval: `pack/scripts/agent-os-check.sh` HEADER1 unchanged; imported `LADDER.md` stub keeps five columns
Seat: kernel
Reconsider when: never in this unit; MMU policy is out of scope

Risk: `/gate-first` still requires a unit id, so gate-retired risks mint builder rows “to have a place for the probe.”
Lens: belief
Default if we stop talking: cheapest valid treatment is never a gate
Independent gate / eval: `docs/agent-os/gates/8.md` protocol check — gate-first skill allows a catalog probe with no unit
Seat: engineering
Reconsider when: never — unit 8 contract
