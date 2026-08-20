#!/usr/bin/env bash
# Adversarial git stories for 0.6.0-mechanical-refuse. Not the MMU. Not imported.
# Each case sets EXPECT (pass|fail) and MODE (range|staged|no-base), then builds a repo in cwd.

# shellcheck disable=SC2034

CASES=(
  bootstrap-src
  bootstrap-docs
  bootstrap-add-stub
  bootstrap-add-malformed
  status-missing
  status-duplicate
  status-unknown
  status-trailing
  stub-src
  stub-docs-main
  accept-on-main
  accepted-main
  accepted-docs-unit
  accepted-ladder-missing
  accepted-ladder-empty
  accepted-ladder-empty-id
  accepted-ladder-bad-header
  same-commit-gate-code
  code-first-gate-later
  gate-then-code
  impl-deletes-gate
  id-not-on-ladder
  later-gate-edit
  merge-in-unit-range
  pack-exempt
  accepted-revert-stub
  accepted-delete-constitution
  docs-only-non-unit-branch
  slug-decoration
  no-base
)

build_case() {
  case "$1" in
    bootstrap-src) bootstrap_src ;;
    bootstrap-docs) bootstrap_docs ;;
    bootstrap-add-stub) bootstrap_add_stub ;;
    bootstrap-add-malformed) bootstrap_add_malformed ;;
    status-missing) status_missing ;;
    status-duplicate) status_duplicate ;;
    status-unknown) status_unknown ;;
    status-trailing) status_trailing ;;
    stub-src) stub_src ;;
    stub-docs-main) stub_docs_main ;;
    accept-on-main) accept_on_main ;;
    accepted-main) accepted_main ;;
    accepted-docs-unit) accepted_docs_unit ;;
    accepted-ladder-missing) accepted_ladder_missing ;;
    accepted-ladder-empty) accepted_ladder_empty ;;
    accepted-ladder-empty-id) accepted_ladder_empty_id ;;
    accepted-ladder-bad-header) accepted_ladder_bad_header ;;
    same-commit-gate-code) same_commit_gate_code ;;
    code-first-gate-later) code_first_gate_later ;;
    gate-then-code) gate_then_code ;;
    impl-deletes-gate) impl_deletes_gate ;;
    id-not-on-ladder) id_not_on_ladder ;;
    later-gate-edit) later_gate_edit ;;
    merge-in-unit-range) merge_in_unit_range ;;
    pack-exempt) pack_exempt ;;
    accepted-revert-stub) accepted_revert_stub ;;
    accepted-delete-constitution) accepted_delete_constitution ;;
    docs-only-non-unit-branch) docs_only_non_unit_branch ;;
    slug-decoration) slug_decoration ;;
    no-base) no_base ;;
    *)
      echo "unknown case: $1" >&2
      return 2
      ;;
  esac
}

bootstrap_src() {
  EXPECT=fail
  MODE=range
  fixture_git_init
  mkdir -p src
  printf 'x\n' > src/x.py
  fixture_commit "src without constitution"
}

bootstrap_docs() {
  EXPECT=pass
  MODE=range
  fixture_git_init
  printf 'readme\n' > README.md
  fixture_commit "readme without constitution"
}

bootstrap_add_stub() {
  EXPECT=pass
  MODE=range
  fixture_git_init
  write_constitution stub
  fixture_commit "add Status: stub"
}

bootstrap_add_malformed() {
  EXPECT=fail
  MODE=range
  fixture_git_init
  mkdir -p docs/north-star
  printf '**Status:** unwritten — lock\n' > docs/north-star/CONSTITUTION.md
  fixture_commit "add malformed constitution"
}

status_missing() {
  EXPECT=fail
  MODE=range
  fixture_git_init
  mkdir -p docs/north-star
  printf 'Purpose\n' > docs/north-star/CONSTITUTION.md
  fixture_commit "constitution without Status"
}

status_duplicate() {
  EXPECT=fail
  MODE=range
  fixture_git_init
  mkdir -p docs/north-star
  printf 'Status: stub\nStatus: accepted\n' > docs/north-star/CONSTITUTION.md
  fixture_commit "duplicate Status"
}

status_unknown() {
  EXPECT=fail
  MODE=range
  fixture_git_init
  mkdir -p docs/north-star
  printf 'Status: unwritten\n' > docs/north-star/CONSTITUTION.md
  fixture_commit "unknown Status"
}

status_trailing() {
  EXPECT=fail
  MODE=range
  fixture_git_init
  mkdir -p docs/north-star
  printf 'Status: accepted \n' > docs/north-star/CONSTITUTION.md
  fixture_commit "Status with trailing space"
}

stub_src() {
  EXPECT=fail
  MODE=staged
  fixture_git_init
  write_constitution stub
  fixture_commit "stub"
  mkdir -p src
  printf 'x\n' > src/x.py
  g add src/x.py
}

stub_docs_main() {
  EXPECT=pass
  MODE=range
  fixture_git_init
  write_constitution stub
  fixture_commit "stub"
  mkdir -p docs/north-star
  printf 'note\n' > docs/north-star/NOTE.md
  fixture_commit "stub docs on main"
}

accept_on_main() {
  EXPECT=pass
  MODE=range
  fixture_git_init
  write_constitution stub
  write_ladder_1
  fixture_commit "stub+ladder"
  write_constitution accepted
  fixture_commit "accept on main"
}

accepted_main() {
  EXPECT=fail
  MODE=range
  fixture_git_init
  write_constitution stub
  write_ladder_1
  fixture_commit "stub+ladder"
  write_constitution accepted
  fixture_commit "accept on main"
  printf 'x\n' > WORKING_STATE.md
  fixture_commit "docs on main after accept"
}

accepted_docs_unit() {
  EXPECT=pass
  MODE=range
  bootstrap_to_accepted_unit
  printf 'x\n' > WORKING_STATE.md
  fixture_commit "docs on unit branch"
}

accepted_ladder_missing() {
  EXPECT=fail
  MODE=range
  fixture_git_init
  write_constitution stub
  fixture_commit "stub no ladder"
  g checkout -q -b unit/1-ingest
  write_constitution accepted
  fixture_commit "accept"
  printf 'x\n' > WORKING_STATE.md
  fixture_commit "docs without ladder"
}

accepted_ladder_empty() {
  EXPECT=fail
  MODE=range
  fixture_git_init
  write_constitution stub
  write_ladder_empty
  fixture_commit "stub empty ladder"
  g checkout -q -b unit/1-ingest
  write_constitution accepted
  fixture_commit "accept"
  printf 'x\n' > WORKING_STATE.md
  fixture_commit "docs with empty ladder"
}

accepted_ladder_empty_id() {
  EXPECT=fail
  MODE=range
  fixture_git_init
  write_constitution stub
  write_ladder_empty_id
  fixture_commit "stub empty id"
  g checkout -q -b unit/1-ingest
  write_constitution accepted
  fixture_commit "accept"
  printf 'x\n' > WORKING_STATE.md
  fixture_commit "docs with empty Id cell"
}

accepted_ladder_bad_header() {
  EXPECT=fail
  MODE=range
  fixture_git_init
  write_constitution stub
  write_ladder_bad_header
  fixture_commit "stub bad header"
  g checkout -q -b unit/1-ingest
  write_constitution accepted
  fixture_commit "accept"
  printf 'x\n' > WORKING_STATE.md
  fixture_commit "docs with bad ladder header"
}

same_commit_gate_code() {
  EXPECT=fail
  MODE=range
  bootstrap_to_accepted_unit
  write_gate 1
  mkdir -p src
  printf 'x\n' > src/x.py
  fixture_commit "gate and src together"
}

code_first_gate_later() {
  EXPECT=fail
  MODE=range
  bootstrap_to_accepted_unit
  mkdir -p src
  printf 'x\n' > src/x.py
  fixture_commit "B src before gate"
  write_gate 1
  fixture_commit "C gate"
  printf 'y\n' > src/x.py
  fixture_commit "D more src"
}

gate_then_code() {
  EXPECT=pass
  MODE=range
  bootstrap_to_accepted_unit
  write_gate 1
  fixture_commit "A gate"
  mkdir -p src
  printf 'x\n' > src/x.py
  fixture_commit "B src"
}

impl_deletes_gate() {
  EXPECT=fail
  MODE=range
  bootstrap_to_accepted_unit
  write_gate 1
  fixture_commit "gate"
  mkdir -p src
  printf 'x\n' > src/x.py
  fixture_commit "src"
  rm docs/agent-os/gates/1.md
  printf 'y\n' > src/x.py
  fixture_commit "delete gate and more src"
}

id_not_on_ladder() {
  EXPECT=fail
  MODE=range
  fixture_git_init
  write_constitution stub
  write_ladder_1
  fixture_commit "stub+ladder"
  g checkout -q -b unit/9-missing
  write_constitution accepted
  fixture_commit "accept"
  printf 'x\n' > WORKING_STATE.md
  fixture_commit "docs on unknown id"
}

later_gate_edit() {
  EXPECT=pass
  MODE=range
  bootstrap_to_accepted_unit
  write_gate 1
  fixture_commit "gate"
  mkdir -p src
  printf 'x\n' > src/x.py
  fixture_commit "src"
  printf 'probe v2\n' > docs/agent-os/gates/1.md
  fixture_commit "edit gate"
}

merge_in_unit_range() {
  EXPECT=fail
  MODE=range
  bootstrap_to_accepted_unit
  write_gate 1
  fixture_commit "gate"
  g checkout -q -b other
  mkdir -p docs
  printf 'n\n' > docs/note.md
  fixture_commit "other docs"
  g checkout -q unit/1-ingest
  g merge --no-ff --no-edit -q -m "merge" other
}

pack_exempt() {
  EXPECT=pass
  MODE=range
  fixture_git_init
  mkdir -p pack/docs/agent-os src
  printf 'kernel\n' > pack/docs/agent-os/KERNEL.md
  printf 'x\n' > src/x.py
  fixture_commit "pack shape plus src"
}

accepted_revert_stub() {
  EXPECT=fail
  MODE=range
  bootstrap_to_accepted_unit
  write_constitution stub
  fixture_commit "revert to stub"
}

accepted_delete_constitution() {
  EXPECT=fail
  MODE=range
  bootstrap_to_accepted_unit
  rm docs/north-star/CONSTITUTION.md
  fixture_commit "delete constitution"
}

docs_only_non_unit_branch() {
  EXPECT=fail
  MODE=range
  fixture_git_init
  write_constitution stub
  write_ladder_1
  fixture_commit "stub+ladder"
  write_constitution accepted
  fixture_commit "accept on main"
  g checkout -q -b hotfix
  printf 'x\n' > WORKING_STATE.md
  fixture_commit "docs on hotfix"
}

slug_decoration() {
  EXPECT=pass
  MODE=range
  fixture_git_init
  write_constitution stub
  write_ladder_1
  fixture_commit "stub+ladder"
  g checkout -q -b unit/1-other
  write_constitution accepted
  fixture_commit "accept"
  printf 'x\n' > WORKING_STATE.md
  fixture_commit "docs on decorated slug"
}

no_base() {
  EXPECT=fail
  MODE=no-base
  fixture_git_init
  write_constitution stub
  fixture_commit "stub isolated"
}
