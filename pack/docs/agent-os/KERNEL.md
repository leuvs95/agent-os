# Kernel

Protocol only. No product folklore. No hub library dumped into projects.

1. **Lock** — missing constitution or `Status: stub` ⇒ `/build-north-star`. No app code until `Status: accepted`. Those are the only legal Status values.
2. **Staff** — TPM proposes ≤5 seats and names substrates from the vision. Decline the rest in writing. One facilitator, labeled seats, not a panel of agents.
3. **Lenses** — always ask; do not always write a row:

   | Lens | Question |
   |---|---|
   | Purpose | What product could satisfy this pitch and still be the wrong business? |
   | Complexity | What would a shallow module / unbounded platform look like here? |
   | Unknowns | What must we name (seats, substrates) that we have no vocabulary for? |
   | Belief | How would we believe a lie that it works? |
   | Judgment | What may the agent execute vs what must the human own? |
   | Operate | How does this die while the happy path still “works”? (only if something remembers, bills, retries, schedules, or leaks) |

4. **Learned-only** — catalog rows and substrate files are what seats actually found, plus a one-liner when a lens found nothing (`asked; no risk; reconsider when`).
5. **Ladder** — ordered by **risk retired**, sliced by contract, never by layer.
6. **Write here** — `docs/agent-os/substrates/<named>.md` is generated in the **project**. Do not import templates.
7. **Verify** — gate before code; implementer does not grade PASS; reconstruct at close; human owns git. Mechanical refuse: `scripts/agent-os-check.sh` (prompts document; the check enforces; bypass is not PASS). Parent tree determines the epoch; the proposed/resulting tree must still be structurally valid. `accepted` is monotonic: once established in history, a later commit may neither revert it to stub nor remove the constitution. Evaluate commit-by-commit, never as one aggregate diff.
