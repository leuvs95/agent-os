#!/usr/bin/env bash
# Import agent-os kernel into a project. No hub substrate library.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PACK="$ROOT/pack"
VERSION="$(tr -d '[:space:]' < "$ROOT/VERSION")"

usage() {
  echo "usage: $0 /path/to/project [--force]"
  echo "  copies pack rules, skills, stubs, and scripts/agent-os-check.sh"
  exit 1
}

TARGET="${1:-}"
FORCE="${2:-}"
[[ -n "$TARGET" && -d "$TARGET" ]] || usage
TARGET="$(cd "$TARGET" && pwd)"

if [[ "$TARGET" == "$ROOT" ]]; then
  echo "refusing to import agent-os into itself"
  exit 1
fi

copy_file() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [[ -e "$dest" && "$FORCE" != "--force" ]]; then
    echo "keep  $dest"
    return
  fi
  cp "$src" "$dest"
  echo "write $dest"
}

copy_if_missing() {
  local src="$1" dest="$2"
  if [[ -e "$dest" ]]; then
    echo "keep  $dest"
    return
  fi
  mkdir -p "$(dirname "$dest")"
  cp "$src" "$dest"
  echo "write $dest"
}

sync_dir() {
  local src="$1" dest="$2"
  mkdir -p "$dest"
  local f
  for f in "$src"/*; do
    [[ -e "$f" ]] || continue
    if [[ -d "$f" ]]; then
      sync_dir "$f" "$dest/$(basename "$f")"
    else
      copy_file "$f" "$dest/$(basename "$f")"
    fi
  done
}

echo "agent-os $VERSION → $TARGET"

mkdir -p "$TARGET/.cursor/rules" "$TARGET/.cursor/skills"
mkdir -p "$TARGET/docs/agent-os/gates" "$TARGET/docs/agent-os/templates"
mkdir -p "$TARGET/docs/agent-os/substrates"
mkdir -p "$TARGET/docs/north-star/AMENDMENTS" "$TARGET/docs/north-star/templates"

OLD_FORCE="$FORCE"
if [[ "$FORCE" == "--force" ]] || [[ ! -f "$TARGET/.cursor/rules/agent-os-core.mdc" ]]; then
  FORCE="--force"
fi
sync_dir "$PACK/.cursor/rules" "$TARGET/.cursor/rules"
sync_dir "$PACK/.cursor/skills" "$TARGET/.cursor/skills"
FORCE="$OLD_FORCE"

copy_if_missing "$PACK/AGENTS.md" "$TARGET/AGENTS.md"
copy_if_missing "$PACK/WORKING_STATE.md" "$TARGET/WORKING_STATE.md"
copy_if_missing "$PACK/docs/agent-os/CATALOG.md" "$TARGET/docs/agent-os/CATALOG.md"
copy_if_missing "$PACK/docs/agent-os/gates/README.md" "$TARGET/docs/agent-os/gates/README.md"
copy_if_missing "$PACK/docs/agent-os/substrates/README.md" "$TARGET/docs/agent-os/substrates/README.md"
copy_if_missing "$PACK/docs/north-star/CONSTITUTION.md" "$TARGET/docs/north-star/CONSTITUTION.md"
copy_if_missing "$PACK/docs/north-star/LADDER.md" "$TARGET/docs/north-star/LADDER.md"
copy_if_missing "$PACK/docs/north-star/AMENDMENTS/README.md" "$TARGET/docs/north-star/AMENDMENTS/README.md"

copy_file "$PACK/docs/agent-os/KERNEL.md" "$TARGET/docs/agent-os/KERNEL.md"
copy_file "$PACK/docs/agent-os/templates/GATE.md" "$TARGET/docs/agent-os/templates/GATE.md"
copy_file "$PACK/docs/agent-os/templates/SUBSTRATE.md" "$TARGET/docs/agent-os/templates/SUBSTRATE.md"
copy_file "$PACK/docs/north-star/templates/AMENDMENT.md" "$TARGET/docs/north-star/templates/AMENDMENT.md"
checker_dest="$TARGET/scripts/agent-os-check.sh"
checker_existed=0
[[ -e "$checker_dest" ]] && checker_existed=1
copy_file "$PACK/scripts/agent-os-check.sh" "$checker_dest"
if [[ "$FORCE" == "--force" || "$checker_existed" -eq 0 ]]; then
  chmod +x "$checker_dest"
fi

printf '%s\n' "$VERSION" > "$TARGET/docs/agent-os/VERSION"
echo "write $TARGET/docs/agent-os/VERSION ($VERSION)"

STAMP="$TARGET/docs/agent-os/IMPORTED.md"
cat > "$STAMP" <<EOF
# agent-os import

- version: $VERSION
- imported_at: $(date -u +%Y-%m-%dT%H:%M:%SZ)
- source: $ROOT
- force: ${FORCE:-no}

Next: open this project as the workspace. Read docs/agent-os/KERNEL.md and WORKING_STATE.md.
Run /build-north-star until constitution v1.0 is accepted. Then /unit-unlock.
EOF
echo "write $STAMP"

echo "done."
