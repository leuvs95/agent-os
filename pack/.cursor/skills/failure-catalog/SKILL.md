---
name: failure-catalog
description: >-
  Applies six kernel lenses to named substrates and writes only learned
  risks. Use for /failure-catalog, /build-north-star after staffing, new
  named substrates, or a spec silent on how we would believe a lie.
disable-model-invocation: false
---

# Failure catalog (P0)

Kernel: always **ask** the six lenses. Do **not** always write a row.
Catalog = what seats learned + one-liners for lenses that found nothing.

Do not overlay, import, or consult a hub substrate library.

## 1. Name substrates

From the constitution table, or name them now from the vision. A substrate
is anything that remembers, bills, retries, schedules, or whose failure the
domain will misread. “Nothing durable” is a written default.

Inspect `docs/agent-os/CATALOG.md` and `docs/agent-os/substrates/`. Do not quiz
answered facts.

## 2. Ask every lens

Purpose · Complexity · Unknowns · Belief · Judgment · Operate.

Operate probes (growth, staleness, identity, authority, cost, vendor empties,
unattended jobs, leaks, concurrency) only if a named substrate makes them
real. They are not mandatory slots.

## 3. Write learned-only

For each **risk actually found**, append `docs/agent-os/CATALOG.md`:

```text
Risk:
Lens: purpose | complexity | unknowns | belief | judgment | operate
Default if we stop talking:
Independent gate / eval:
Seat that found it:
Reconsider when:
```

If a lens found nothing: one line under **Lenses asked** —
`Operate: asked; no unattended work; reconsider when we add a job.`

If a named substrate has no file yet, create `docs/agent-os/substrates/<name>.md`
from the substrate template and put the learned operate/belief rows there too.

Cite sources you opened. Point `/gate-first` at each risk that needs a probe.

## Stop

Owner can say substrates, seats, and the scariest learned default out loud.
Return to `/build-north-star` or `/unit-unlock`.
