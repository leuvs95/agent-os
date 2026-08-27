#!/usr/bin/env bash
# Unit 8 probe — Lot Clerk gold + antis + imported protocol.
# Kernel-local. Not imported. Pass if / Fail if live in gates/8.md.
set -euo pipefail

ROOT="$(git rev-parse --show-toplevel)"
cd "$ROOT"
FIX="$ROOT/docs/agent-os/gates/8-lot-clerk"
PACK="$ROOT/pack"
FAIL=0

ok() { printf 'OK  %s\n' "$1"; }
bad() { printf 'FAIL %s\n' "$1" >&2; FAIL=1; }

FIVE='^(research-retired|gate-retired|builder-retired|use-retired|deferred)$'
REQUIRED_BUILDERS='unknown identity'
FORBIDDEN_IDS='sftp scheduler cache ui api obs sso recs llm warehouse'
OLD_LAW5='5. **Ladder** — ordered by **risk retired**, sliced by contract, never by layer.'
MMU_HEADER='| Id | Risk this unit retires | Contract it exposes | Depends on | Out of scope |'

catalog_ids() {
  awk '/^### / { print $2 }' "$1"
}

field_for() {
  local file="$1" id="$2" key="$3" cur="" val=""
  while IFS= read -r line || [ -n "$line" ]; do
    if printf '%s\n' "$line" | grep -q '^### '; then
      if [ "$cur" = "$id" ]; then
        printf '%s\n' "$val"
        return 0
      fi
      cur=${line#\#\#\# }
      val=""
      continue
    fi
    case "$line" in
      "${key}:"*)
        if [ "$cur" = "$id" ]; then
          val="${line#${key}: }"
        fi
        ;;
    esac
  done < "$file"
  if [ "$cur" = "$id" ]; then
    printf '%s\n' "$val"
    return 0
  fi
  return 1
}

ladder_ids() {
  awk -F'|' '
    /^\| / {
      id=$2
      gsub(/^ +| +$/, "", id)
      if (id == "" || id == "Id" || id ~ /^-/) next
      print id
    }
  ' "$1"
}

ladder_row_text() {
  awk -F'|' -v want="$2" '
    /^\| / {
      id=$2
      gsub(/^ +| +$/, "", id)
      if (id == want) { print $0; exit }
    }
  ' "$1"
}

count_lines() {
  local n=0
  while IFS= read -r _; do
    n=$((n + 1))
  done
  printf '%s\n' "$n"
}

# check_tree DIR [mode]
# mode=gold — extra Lot Clerk exactness
# mode=legal — generic path-not-curriculum laws; exit 0 if legal
check_tree() {
  local dir="$1" mode="${2:-legal}"
  local cons cat lad
  cons="$dir/CONSTITUTION.md"
  cat="$dir/CATALOG.md"
  lad="$dir/LADDER.md"
  local reasons=()

  [ -f "$cons" ] || reasons+=("missing CONSTITUTION.md")
  [ -f "$cat" ] || reasons+=("missing CATALOG.md")
  [ -f "$lad" ] || reasons+=("missing LADDER.md")

  if [ "${#reasons[@]}" -eq 0 ]; then
    if ! grep -q '^## Observable Product Outcome' "$cons"; then
      reasons+=("missing OPO heading")
    else
      # section from OPO heading to next ## at start of line
      local opo
      opo=$(awk '
        /^## Observable Product Outcome$/ { p=1; next }
        /^## / { if (p) exit }
        p { print }
      ' "$cons")
      if ! printf '%s\n' "$opo" | grep -q 'Given'; then
        reasons+=("OPO section missing Given")
      fi
    fi

    local ids id disp thr n_cat n_lad
    ids=$(catalog_ids "$cat")
    n_cat=$(printf '%s\n' "$ids" | grep -c . || true)
    if [ "$n_cat" -lt 2 ]; then
      reasons+=("catalog has fewer than 2 risks")
    fi
    local n_builder=0
    while IFS= read -r id; do
      [ -n "$id" ] || continue
      disp=$(field_for "$cat" "$id" Disposition || true)
      thr=$(field_for "$cat" "$id" Threatens-OPO || true)
      if ! printf '%s\n' "$disp" | grep -Eq "$FIVE"; then
        reasons+=("$id: bad or missing Disposition ($disp)")
      fi
      if [ "$thr" != "yes" ] && [ "$thr" != "no" ]; then
        reasons+=("$id: Threatens-OPO must be yes|no ($thr)")
      fi
      if [ "$disp" = "builder-retired" ]; then
        n_builder=$((n_builder + 1))
      fi
    done <<EOF
$ids
EOF

    local lads
    lads=$(ladder_ids "$lad")
    n_lad=$(printf '%s\n' "$lads" | grep -c . || true)

    if [ "$n_lad" -ge "$n_cat" ]; then
      reasons+=("ladder count $n_lad is not < catalog count $n_cat")
    fi
    if [ "$n_lad" -lt 1 ]; then
      reasons+=("zero ladder rows")
    fi
    if [ "$n_builder" -lt 1 ]; then
      reasons+=("zero builder-retired catalog risks")
    fi

    while IFS= read -r id; do
      [ -n "$id" ] || continue
      disp=$(field_for "$cat" "$id" Disposition || true)
      thr=$(field_for "$cat" "$id" Threatens-OPO || true)
      if [ "$disp" != "builder-retired" ] || [ "$thr" != "yes" ]; then
        reasons+=("ladder id $id is not builder-retired ∧ threatens-OPO")
      fi
    done <<EOF
$lads
EOF

    local row
    while IFS= read -r id; do
      [ -n "$id" ] || continue
      row=$(ladder_row_text "$lad" "$id")
      if printf '%s\n' "$row" | grep -Eqi 'architecture is cleaner|framework exists|consumer migrated|transport implemented|abstraction created'; then
        reasons+=("ladder id $id has a plumbing-only destination phrase")
      fi
    done <<EOF
$lads
EOF

    if [ "$mode" = gold ]; then
      local got req
      got=$(printf '%s\n' "$lads" | sort | tr '\n' ' ')
      req=$(printf '%s\n' $REQUIRED_BUILDERS | sort | tr '\n' ' ')
      if [ "$got" != "$req" ]; then
        reasons+=("gold ladder ids must be exactly '$REQUIRED_BUILDERS' (got $got)")
      fi
      for id in $REQUIRED_BUILDERS; do
        local delta
        delta=$(field_for "$cat" "$id" Product-delta || true)
        case "$id" in
          unknown)
            if ! printf '%s\n' "$delta" | grep -Eqi 'unknown|preserv|expir'; then
              reasons+=("unknown Product-delta must name preserved unknown expiry")
            fi
            ;;
          identity)
            if ! printf '%s\n' "$delta" | grep -Eqi 'identit|lot_id|grain|stable'; then
              reasons+=("identity Product-delta must name stable lot identity")
            fi
            ;;
        esac
      done
      for id in $FORBIDDEN_IDS; do
        if printf '%s\n' "$lads" | grep -qx "$id"; then
          reasons+=("gold ladder contains forbidden plumbing id $id")
        fi
      done
      local inj="$dir/AMENDMENTS/001-sftp-inject.md"
      if [ ! -f "$inj" ]; then
        reasons+=("gold missing SFTP inject amendment")
      else
        if ! grep -q '^Disposition: deferred$' "$inj"; then
          reasons+=("SFTP inject must be deferred")
        fi
        if ! grep -q '^Threatens-OPO: no$' "$inj"; then
          reasons+=("SFTP inject must not threaten OPO")
        fi
        if grep -q '| sftp |' "$lad"; then
          reasons+=("SFTP inject added a ladder row")
        fi
      fi
    fi
  fi

  if [ "${#reasons[@]}" -gt 0 ]; then
    if [ "$mode" = gold ]; then
      local r
      for r in "${reasons[@]}"; do
        bad "gold: $r"
      done
      return 1
    fi
    return 1
  fi
  return 0
}

# --- A. gold ---
if check_tree "$FIX/gold" gold; then
  ok "gold Lot Clerk tree"
else
  :
fi

# --- B. antis must be illegal ---
expect_illegal() {
  local name="$1"
  if check_tree "$FIX/$name" legal; then
    bad "anti $name was accepted as a legal tree"
  else
    ok "anti $name rejected"
  fi
}

expect_illegal anti-every-risk-is-a-row
expect_illegal anti-zero-builder
expect_illegal anti-architecture-cleaner
expect_illegal anti-plumbing-row
expect_illegal anti-missing-opo
expect_illegal anti-sftp-derail
expect_illegal anti-gate-as-machinery

# --- C. imported protocol ---
KERNEL="$PACK/docs/agent-os/KERNEL.md"
need_in() {
  local file="$1" pat="$2" label="$3"
  if grep -Eq "$pat" "$file"; then
    ok "$label"
  else
    bad "$label"
  fi
}
forbid_in() {
  local file="$1" pat="$2" label="$3"
  if grep -Fq "$pat" "$file"; then
    bad "$label"
  else
    ok "$label"
  fi
}

need_in "$KERNEL" 'observable product outcome' "KERNEL names observable product outcome"
need_in "$KERNEL" 'research-retired' "KERNEL names research-retired"
need_in "$KERNEL" 'gate-retired' "KERNEL names gate-retired"
need_in "$KERNEL" 'builder-retired' "KERNEL names builder-retired"
need_in "$KERNEL" 'use-retired' "KERNEL names use-retired"
need_in "$KERNEL" 'deferred' "KERNEL names deferred"
need_in "$KERNEL" 'delete test' "KERNEL names delete test"
need_in "$KERNEL" 'destination test' "KERNEL names destination test"
need_in "$KERNEL" 'product delta' "KERNEL names product delta"
need_in "$KERNEL" 'Research broadly\. Build narrowly' "KERNEL shorthand"
forbid_in "$KERNEL" "$OLD_LAW5" "old one-line law 5 is gone"

need_in "$PACK/docs/north-star/CONSTITUTION.md" '^## Observable Product Outcome' "constitution stub has OPO"
need_in "$PACK/docs/agent-os/CATALOG.md" 'Disposition:' "catalog stub has Disposition"

if grep -Fxq "$MMU_HEADER" "$PACK/docs/north-star/LADDER.md"; then
  ok "ladder stub keeps frozen five-column header"
else
  bad "ladder stub must keep frozen MMU HEADER1"
fi
if grep -q 'Product delta' "$PACK/docs/north-star/LADDER.md" && grep -q '| Product delta |' "$PACK/docs/north-star/LADDER.md"; then
  bad "ladder stub must not add a Product delta column (MMU header frozen)"
else
  ok "ladder stub has no sixth column"
fi

need_in "$PACK/.cursor/skills/build-north-star/SKILL.md" 'Observable Product Outcome' "build-north-star names OPO"
need_in "$PACK/.cursor/skills/build-north-star/SKILL.md" 'disposition' "build-north-star names disposition"
forbid_in "$PACK/.cursor/skills/build-north-star/SKILL.md" \
  'scariest learned default, ladder row 1 (risk it retires)' \
  "understanding gate is not scariest-risk → row 1"

need_in "$PACK/.cursor/skills/amend-north-star/SKILL.md" 'threaten' "amend-north-star asks threaten"
need_in "$PACK/.cursor/skills/amend-north-star/SKILL.md" 'observable' "amend-north-star names observable outcome"
need_in "$PACK/.cursor/skills/amend-north-star/SKILL.md" 'Disposition' "amend-north-star names Disposition"

need_in "$PACK/.cursor/skills/gate-first/SKILL.md" 'no unit' "gate-first allows catalog probe with no unit"
need_in "$PACK/.cursor/skills/unit-unlock/SKILL.md" 'builder-retired' "unit-unlock refuses non-builder-retired"

need_in "$PACK/.cursor/rules/agent-os-workflow.mdc" 'shortest' "workflow next-unit is shortest path"
need_in "$PACK/.cursor/rules/agent-os-core.mdc" 'observable product outcome' "core rule names OPO"

if [ -d "$PACK/.cursor/skills/risk-disposition" ]; then
  bad "must not add risk-disposition skill"
else
  ok "no risk-disposition skill"
fi
if grep -q 'P6' "$PACK/.cursor/rules/agent-os-core.mdc"; then
  bad "must not add P6 to firing order"
else
  ok "no P6 in firing order"
fi

if grep -Fq "$MMU_HEADER" "$PACK/scripts/agent-os-check.sh"; then
  ok "MMU HEADER1 unchanged"
else
  bad "MMU HEADER1 changed"
fi

if [ "$FAIL" -ne 0 ]; then
  printf 'docs/agent-os/gates/8_probe.sh: FAIL\n' >&2
  exit 1
fi
printf 'docs/agent-os/gates/8_probe.sh: PASS\n'
exit 0
