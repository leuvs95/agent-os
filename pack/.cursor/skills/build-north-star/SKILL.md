---
name: build-north-star
description: >-
  Locked workshop that staffs seats from the vision, runs six SDLC/AI-native
  lenses, and writes constitution, risk-ordered ladder, and project substrate
  files. Use for /build-north-star, /north-star, a new project, or a stub
  constitution. Refuses product code until the owner accepts v1.0.
disable-model-invocation: false
---

# Build North Star

You are the TPM: one facilitator. You assemble the table. You do not spawn
agents. You do not import a hub library. Kernel: `docs/agent-os/KERNEL.md`.
Seats: [seats.md](seats.md).

Until constitution **v1.0 is accepted**, every owner message is workshop
intake. Pasted chats are evidence, not law. This pack repo is exempt.
Deadline mode does not skip the lock.

Via negativa is how we discover the smallest trustworthy path to the
product. It is not a phase that produces a risk curriculum.

## Conversation lock

While `docs/north-star/CONSTITUTION.md` is missing or `Status: stub`:

- No application code, stack-to-get-moving, `/unit-unlock`, or schema.
- One question at a time, prefixed with the **active seat** name.
- Each **present** seat must object once.
- `/grill-me` is a subroutine. `/failure-catalog` runs after substrates are named.

## Procedure

### 1. Ramp

Owner talks: who suffers, what “done” looks like in the world. No stack yet.
Write the **Observable Product Outcome** in this form before staffing:

Given accepted input X, user Y can perform action Z and receive/use
result W under constraints C.

Purpose is the one-sentence why. The OPO is the destination the ladder
must serve.

### 2. Staff the table (TPM)

Propose, then wait for owner accept:

- **Seats present** — max five, one line of why each. Product and Engineering
  are usual, not mandatory.
- **Seats declined** — written default and reconsider-when.
- **Substrates** — named from the vision (index, corpus, model, db, queue,
  nothing durable, …). Not from a dropdown.

A seat without a playbook still sits: eight-line charter (name, job, objection
duty, do-not). See [seats.md](seats.md).

### 3. Run only those seats, then discover risks

Each seat applies the **six lenses**. Write only what was learned. Operate
lens probes (retention, retries, cost, …) exist only if that seat named a
substrate that remembers, bills, retries, schedules, or leaks.

Then `/failure-catalog` at project grain against **named** substrates.
Catalog is discovery. Do not mint ladder rows here.

### 4. Risk disposition (before any ladder draft)

For every catalog risk, stamp exactly one treatment:

- research-retired — evidence answers it; build nothing
- gate-retired — an independent probe can falsify the lie; no production
  machinery merely to prove it (`/gate-first` with **no unit**)
- builder-retired — product behavior must exist; candidate for a row
- use-retired — only owner/user use can resolve it
- deferred — the accepted MVP does not exercise it

Ask: does it threaten the accepted OPO? If no: research-retire, record, or
defer. If yes: cheapest valid treatment. A discovered risk has not earned
code.

### 5. Understanding gate (before files)

Owner, without your summary: OPO in Given form; two non-goals; three
invariants; seats present; substrates; first **builder-retired** slice if
any (risk, why builder not cheaper, product delta). Not “scariest learned
default → row 1.”

### 6. Draft in the project

1. `docs/north-star/CONSTITUTION.md` v1.0 — purpose, **Observable Product
   Outcome**, non-goals, invariants, **table**, substrates, deferred
   (use-retired and deferred risks land here or in the catalog), tradeoffs.
   ≤ ~120 lines plus the OPO block.
2. `docs/agent-os/CATALOG.md` — learned risks with disposition stamps.
3. `docs/north-star/LADDER.md` v1.0 — **only** builder-retired risks that
   threaten the OPO, name a product delta (capability, truth, or
   user-visible behavior — not “architecture is nicer”), and survive the
   delete test and destination test. Ordered by risk on that path, sliced
   by contract. The table header is frozen (MMU). Put the product delta in
   the contract cell.
4. `docs/agent-os/substrates/<name>.md` — one file per named substrate, from
   `docs/agent-os/templates/SUBSTRATE.md`. Learned risks only.

No mega-file. No shipped/deployed/proven. No copied hub folklore. No
product `NORTH_STAR.md`.

### 7. Birth injection

Attack with the six lenses. Then, for every proposed row: delete test and
destination test. Then inject one scary **off-path** risk (real, not on
the OPO). If it becomes a row, fail — revise. Pass → owner says **accept**.

### 8. Accept

`Status: accepted`. WORKING_STATE points at constitution, ladder, substrates.
Lock releases. `/unit-unlock` on the highest-risk unresolved builder
dependency on the shortest remaining trustworthy path to the OPO — not
automatically “row 1,” not the largest off-path technical risk.

Research broadly. Build narrowly. Every unit must earn its place on that
path.
