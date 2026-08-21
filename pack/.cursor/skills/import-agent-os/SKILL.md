---
name: import-agent-os
description: >-
  Imports canonical agent-os kernel into a project. Use when starting a new
  repository, when the owner asks to install agent-os, or when KERNEL.md is
  missing.
disable-model-invocation: false
---

# Import agent-os

Canonical clone is typically `~/Projects/agent-os`.

```bash
./scripts/import.sh /absolute/path/to/the-project
```

Import copies `scripts/agent-os-check.sh`. `--force` refreshes rules,
skills, and that checker. Without `--force`, an existing dest checker is
kept. Never overwrites `WORKING_STATE.md`, `AGENTS.md`, `CATALOG.md`,
written constitution/ladder, gates, or generated substrates.

Does **not** copy a substrate library. `/build-north-star` writes substrates
in the project.

Then: open the project, read `docs/agent-os/KERNEL.md`, run `/build-north-star`.
