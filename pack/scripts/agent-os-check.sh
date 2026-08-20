#!/usr/bin/env bash
# agent-os-check — read-only structural refuse. Not a product gate.
# Parent tree determines the epoch; the proposed/resulting tree must still
# be structurally valid. accepted is monotonic. Commit-by-commit, never
# an aggregate diff. Bypass is not PASS.
set -euo pipefail

EMPTY_TREE="4b825dc642cb6eb9a060e54bf8d34767ae668d1e"
CONSTITUTION="docs/north-star/CONSTITUTION.md"
LADDER="docs/north-star/LADDER.md"
PACK_SHAPE="pack/docs/agent-os/KERNEL.md"
HEADER1="| Id | Risk this unit retires | Contract it exposes | Depends on | Out of scope |"
HEADER2="|---|---|---|---|---|"

fail() {
  printf 'agent-os-check: %s\n' "$*" >&2
  exit 1
}

usage() {
  fail "usage: agent-os-check.sh --staged | --range <base>...<head>"
}

in_git_repo() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || fail "not a git repository"
  cd "$(git rev-parse --show-toplevel)"
}

blob_exists() {
  local rev="$1" path="$2"
  if [ "$rev" = ROOT ]; then
    return 1
  fi
  if [ "$rev" = INDEX ]; then
    git cat-file -e ":${path}" 2>/dev/null
  else
    git cat-file -e "${rev}:${path}" 2>/dev/null
  fi
}

blob_text() {
  local rev="$1" path="$2"
  if [ "$rev" = INDEX ]; then
    git cat-file -p ":${path}"
  else
    git cat-file -p "${rev}:${path}"
  fi
}

# ABSENT | INVALID | stub | accepted
status_of() {
  local rev="$1"
  if [ "$rev" = ROOT ]; then
    printf '%s\n' ABSENT
    return 0
  fi
  if ! blob_exists "$rev" "$CONSTITUTION"; then
    printf '%s\n' ABSENT
    return 0
  fi
  local text n line
  text=$(blob_text "$rev" "$CONSTITUTION")
  n=$(printf '%s\n' "$text" | grep -c '^Status:' || true)
  if [ "$n" -ne 1 ]; then
    printf '%s\n' INVALID
    return 0
  fi
  line=$(printf '%s\n' "$text" | grep '^Status:')
  case "$line" in
    "Status: stub") printf '%s\n' stub ;;
    "Status: accepted") printf '%s\n' accepted ;;
    *) printf '%s\n' INVALID ;;
  esac
}

allowlisted() {
  case "$1" in
    docs/* | .cursor/* | scripts/hooks/*) return 0 ;;
    AGENTS.md | WORKING_STATE.md | README.md | LICENSE | .gitignore) return 0 ;;
    scripts/agent-os-check.sh | scripts/install-hooks.sh) return 0 ;;
    .github/workflows/agent-os-check.yml) return 0 ;;
    *) return 1 ;;
  esac
}

# Prints ids, one per line. Exit 1 if unrecognizable or empty.
ladder_ids() {
  local rev="$1"
  if ! blob_exists "$rev" "$LADDER"; then
    return 1
  fi
  local text line expect_h2=0 body=0 count_h1=0 id any=0
  text=$(blob_text "$rev" "$LADDER")
  while IFS= read -r line || [ -n "$line" ]; do
    if [ "$body" -eq 1 ]; then
      if [ -z "$line" ]; then
        body=2
        continue
      fi
      if printf '%s\n' "$line" | grep -qE '^\| [A-Za-z0-9][A-Za-z0-9.]* \|'; then
        id="${line#| }"
        id="${id%% |*}"
        printf '%s\n' "$id"
        any=1
      else
        return 1
      fi
      continue
    fi
    if [ "$body" -eq 2 ]; then
      continue
    fi
    if [ "$expect_h2" -eq 1 ]; then
      [ "$line" = "$HEADER2" ] || return 1
      expect_h2=0
      body=1
      continue
    fi
    if [ "$line" = "$HEADER1" ]; then
      count_h1=$((count_h1 + 1))
      [ "$count_h1" -eq 1 ] || return 1
      expect_h2=1
    fi
  done <<EOF
$text
EOF
  [ "$expect_h2" -eq 0 ] || return 1
  [ "$body" -ge 1 ] || return 1
  [ "$any" -eq 1 ] || return 1
  return 0
}

id_on_ladder() {
  local rev="$1" want="$2" got
  got=$(ladder_ids "$rev") || return 1
  printf '%s\n' "$got" | grep -qx "$want"
}

current_branch() {
  git symbolic-ref -q --short HEAD 2>/dev/null || printf '%s\n' HEAD
}

parse_unit_id() {
  local branch="$1"
  if printf '%s\n' "$branch" | grep -qE '^unit/[A-Za-z0-9][A-Za-z0-9.]*-[^/]+$'; then
    local rest="${branch#unit/}"
    printf '%s\n' "${rest%%-*}"
    return 0
  fi
  return 1
}

paths_between() {
  local parent="$1" result="$2"
  if [ "$result" = INDEX ]; then
    git diff --cached --name-only --diff-filter=ACDMR
    return 0
  fi
  if [ "$parent" = ROOT ]; then
    git diff-tree --root --no-commit-id --name-only --diff-filter=ACDMR -r "$result"
    return 0
  fi
  git diff-tree --no-commit-id --name-only --diff-filter=ACDMR -r "$parent" "$result"
}

is_merge_commit() {
  local commit="$1" n
  n=$(git rev-list --parents -n 1 "$commit" | awk '{print NF}')
  [ "$n" -gt 2 ]
}

check_transition() {
  local parent="$1" result="$2"
  local st_p st_r path epoch id branch

  st_p=$(status_of "$parent")
  st_r=$(status_of "$result")

  if [ "$st_p" = INVALID ]; then
    fail "constitution Status missing, duplicate, or unknown in parent"
  fi
  if [ "$st_r" = INVALID ]; then
    fail "constitution Status missing, duplicate, or unknown in result"
  fi
  if [ "$st_p" != ABSENT ] && [ "$st_r" = ABSENT ]; then
    fail "constitution cannot be removed once it exists"
  fi
  if [ "$st_p" = accepted ] && [ "$st_r" != accepted ]; then
    fail "accepted is monotonic; cannot revert to stub"
  fi

  if [ "$st_p" = accepted ]; then
    epoch=accepted
  else
    epoch=stub
  fi

  if [ "$epoch" = stub ]; then
    while IFS= read -r path || [ -n "$path" ]; do
      [ -z "$path" ] && continue
      allowlisted "$path" || fail "stub lock: $path"
    done <<EOF
$(paths_between "$parent" "$result")
EOF
    return 0
  fi

  branch=$(current_branch)
  id=$(parse_unit_id "$branch") || fail "accepted epoch requires branch unit/<id>-<slug> (got $branch)"
  id_on_ladder "$result" "$id" || fail "unit id $id not a canonical ladder Id cell"

  local impl=0
  while IFS= read -r path || [ -n "$path" ]; do
    [ -z "$path" ] && continue
    if ! allowlisted "$path"; then
      impl=1
    fi
  done <<EOF
$(paths_between "$parent" "$result")
EOF

  if [ "$impl" -eq 0 ]; then
    return 0
  fi

  local gate="docs/agent-os/gates/${id}.md"
  blob_exists "$parent" "$gate" || fail "gate $gate must exist in parent before implementation"
  blob_exists "$result" "$gate" || fail "implementation commit must not delete $gate"
}

pack_exempt() {
  blob_exists HEAD "$PACK_SHAPE" && return 0
  blob_exists INDEX "$PACK_SHAPE" && return 0
  return 1
}

resolve_base() {
  local up
  up=$(git rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>/dev/null || true)
  if [ -n "$up" ]; then
    git merge-base HEAD "$up" 2>/dev/null && return 0
  fi
  if git rev-parse --verify origin/main >/dev/null 2>&1; then
    git merge-base HEAD origin/main 2>/dev/null && return 0
  fi
  if git rev-parse --verify origin/master >/dev/null 2>&1; then
    git merge-base HEAD origin/master 2>/dev/null && return 0
  fi
  return 1
}

parent_of_commit() {
  local commit="$1" n parent
  n=$(git rev-list --parents -n 1 "$commit" | awk '{print NF}')
  if [ "$n" -eq 1 ]; then
    printf '%s\n' ROOT
    return 0
  fi
  parent=$(git rev-list --parents -n 1 "$commit" | awk '{print $2}')
  printf '%s\n' "$parent"
}

check_range() {
  local base="$1" head="$2" commit parent list
  head=$(git rev-parse --verify "$head^{commit}") || fail "unresolvable range head"
  if [ "$base" = "$EMPTY_TREE" ]; then
    list=$(git rev-list --reverse "$head")
  else
    base=$(git rev-parse --verify "$base^{commit}") || fail "unresolvable range base"
    list=$(git rev-list --reverse "${base}..${head}")
  fi
  while IFS= read -r commit || [ -n "$commit" ]; do
    [ -z "$commit" ] && continue
    if is_merge_commit "$commit"; then
      fail "merge commits are refused; rebase instead"
    fi
    parent=$(parent_of_commit "$commit")
    check_transition "$parent" "$commit"
  done <<EOF
$list
EOF
}

check_staged() {
  local gitdir
  gitdir=$(git rev-parse --git-dir)
  if [ -f "${gitdir}/MERGE_HEAD" ]; then
    fail "merge commits are refused; rebase instead"
  fi
  git rev-parse --verify HEAD >/dev/null 2>&1 || fail "no HEAD for --staged"
  check_transition HEAD INDEX
}

# --- argv ---
in_git_repo

MODE=""
RANGE_SPEC=""
while [ $# -gt 0 ]; do
  case "$1" in
    --staged)
      MODE=staged
      shift
      ;;
    --range)
      shift
      [ $# -ge 1 ] || usage
      MODE=range
      RANGE_SPEC="$1"
      shift
      ;;
    *)
      usage
      ;;
  esac
done

if pack_exempt; then
  exit 0
fi

if [ -z "$MODE" ]; then
  RANGE_BASE=$(resolve_base) || fail "no trustworthy comparison base"
  MODE=range
  RANGE_SPEC="${RANGE_BASE}...HEAD"
fi

if [ "$MODE" = staged ]; then
  check_staged
  exit 0
fi

RANGE_BASE=""
RANGE_HEAD=""
case "$RANGE_SPEC" in
  *...*)
    RANGE_BASE="${RANGE_SPEC%%...*}"
    RANGE_HEAD="${RANGE_SPEC#*...}"
    ;;
  *..*)
    RANGE_BASE="${RANGE_SPEC%%..*}"
    RANGE_HEAD="${RANGE_SPEC#*..}"
    ;;
  *)
    fail "--range must be <base>...<head>"
    ;;
esac
[ -n "$RANGE_BASE" ] && [ -n "$RANGE_HEAD" ] || fail "--range must be <base>...<head>"

# Empty-tree base is only legal when the caller passed it explicitly (fixtures).
if [ "$RANGE_BASE" = "$EMPTY_TREE" ]; then
  check_range "$RANGE_BASE" "$RANGE_HEAD"
  exit 0
fi
check_range "$RANGE_BASE" "$RANGE_HEAD"
exit 0
