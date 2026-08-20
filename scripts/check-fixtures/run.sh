#!/usr/bin/env bash
# Run frozen fixtures against pack/scripts/agent-os-check.sh.
# Do not change EXPECT codes. Empty-tree range only because fixtures ask.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
REPO="$(cd "$ROOT/../.." && pwd)"
CHECK="$REPO/pack/scripts/agent-os-check.sh"
EMPTY_TREE="4b825dc642cb6eb9a060e54bf8d34767ae668d1e"

# shellcheck source=lib.sh
. "$ROOT/lib.sh"
# shellcheck source=matrix.sh
. "$ROOT/matrix.sh"

chmod +x "$CHECK"

run_checker() {
  case "$MODE" in
    range)
      "$CHECK" --range "${EMPTY_TREE}...HEAD"
      ;;
    staged)
      "$CHECK" --staged
      ;;
    no-base)
      "$CHECK"
      ;;
    *)
      echo "bad MODE=$MODE" >&2
      return 2
      ;;
  esac
}

mkdir -p "$REPO/_smoke-import"
fail=0
for name in "${CASES[@]}"; do
  tmp="$(mktemp -d "$REPO/_smoke-import/run-${name}.XXXXXX")"
  set +e
  line="$(
    cd "$tmp"
    unset GIT_DIR GIT_WORK_TREE
    build_case "$name"
    set +e
    run_checker
    actual=$?
    printf 'RESULT %s %s\n' "$EXPECT" "$actual"
  )"
  built=$?
  set -e
  rm -rf "$tmp"
  if [ "$built" -ne 0 ]; then
    echo "BUILD $name" >&2
    fail=1
    continue
  fi
  rest="${line#RESULT }"
  actual="${rest##* }"
  expect="${rest%% *}"
  want=1
  [ "$expect" = pass ] && want=0
  if [ "$actual" = "$want" ]; then
    echo "ok    $name  expect=$expect actual=$actual"
  else
    echo "FAIL  $name  expect=$expect actual=$actual" >&2
    fail=1
  fi
done

if [ "$fail" -ne 0 ]; then
  exit 1
fi
echo "run.sh: ${#CASES[@]} frozen fixtures matched"
