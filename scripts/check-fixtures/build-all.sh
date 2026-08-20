#!/usr/bin/env bash
# Construct every fixture story. Does not run the MMU.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
# shellcheck source=lib.sh
. "$ROOT/lib.sh"
# shellcheck source=matrix.sh
. "$ROOT/matrix.sh"

REPO="$(cd "$ROOT/../.." && pwd)"
mkdir -p "$REPO/_smoke-import"
fail=0
for name in "${CASES[@]}"; do
  tmp="$(mktemp -d "$REPO/_smoke-import/fx-${name}.XXXXXX")"
  if (cd "$tmp" && unset GIT_DIR GIT_WORK_TREE && build_case "$name"); then
    echo "ok    $name"
  else
    echo "BUILD $name" >&2
    fail=1
  fi
  rm -rf "$tmp"
done

if [[ "$fail" -ne 0 ]]; then
  exit 1
fi
echo "build-all: ${#CASES[@]} stories constructed"
