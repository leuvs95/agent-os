#!/usr/bin/env bash
# Canonical bytes for check-fixtures only. Not the MMU. Not imported.

g() {
  git --git-dir="$PWD/.git" --work-tree="$PWD" "$@"
}

fixture_git_init() {
  unset GIT_DIR GIT_WORK_TREE
  git init -q --initial-branch=main
  g config user.email "fixture@agent-os"
  g config user.name "fixture"
}

fixture_commit() {
  g add -A
  g commit -q --allow-empty -m "$1"
}

write_constitution() {
  mkdir -p docs/north-star
  printf 'Status: %s\n' "$1" > docs/north-star/CONSTITUTION.md
}

write_ladder_1() {
  mkdir -p docs/north-star
  cat > docs/north-star/LADDER.md <<'EOF'
| Id | Risk this unit retires | Contract it exposes | Depends on | Out of scope |
|---|---|---|---|---|
| 1 | risk | contract | none | out |
EOF
}

write_ladder_empty() {
  mkdir -p docs/north-star
  cat > docs/north-star/LADDER.md <<'EOF'
| Id | Risk this unit retires | Contract it exposes | Depends on | Out of scope |
|---|---|---|---|---|
EOF
}

write_ladder_empty_id() {
  mkdir -p docs/north-star
  cat > docs/north-star/LADDER.md <<'EOF'
| Id | Risk this unit retires | Contract it exposes | Depends on | Out of scope |
|---|---|---|---|---|
| | | | | |
EOF
}

write_ladder_bad_header() {
  mkdir -p docs/north-star
  cat > docs/north-star/LADDER.md <<'EOF'
| ID | Risk this unit retires | Contract it exposes | Depends on | Out of scope |
|---|---|---|---|---|
| 1 | risk | contract | none | out |
EOF
}

write_gate() {
  mkdir -p docs/agent-os/gates
  printf 'probe\n' > "docs/agent-os/gates/${1}.md"
}

# Stub + ladder on main, then unit/1-ingest, then Status: accepted.
bootstrap_to_accepted_unit() {
  fixture_git_init
  write_constitution stub
  write_ladder_1
  fixture_commit "stub+ladder"
  g checkout -q -b unit/1-ingest
  write_constitution accepted
  fixture_commit "accept"
}
