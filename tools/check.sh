#!/usr/bin/env bash
# tools/check.sh — K's one command (FAN-OUT-PLAN-v1 §4 step 7). Six checks; writes
# manifests/build-<short-sha|NOGIT>.json; exits non-zero on any failure.
# One git read, the full run's dirty-tree refusal (named in the install note below); the commit is read from
# .git files directly.
#   COMPARATOR_BIN        default ~/Claude/projects/comparator/.lake/build/bin/comparator
#   COMPARATOR_LANDRUN    real landrun (Linux) — on macOS only scripts/fake-landrun.sh exists, which does NOT sandbox
#   COMPARATOR_LEAN4EXPORT default ~/Claude/projects/comparator/.lake/packages/lean4export/.lake/build/bin/lean4export
#
# Usage:  bash tools/check.sh                   the full run: six checks over every unit -> manifests/build-<sha>.json;
#                                               on a dirty tree it refuses: exit 2, no manifest, the dirty paths named
#         bash tools/check.sh --unit <path>     the per-unit arms on ONE unit directory (e.g. RiemannZeta/SmallArith):
#                                               no sorry / no axiom, axioms, Comparator, digest, retired names; NO
#                                               lake build (the axioms arm reads the unit's modules as last built) ->
#                                               manifests/unit-<Module.Path>-<sha>.json
#         --allow-dirty                         the hand declares the tree dirty: build-<sha>-dirty.json
#                                               (unit-<Module.Path>-<sha>-dirty.json with --unit), "dirty_declared": true
#         -h | --help                           this text; exit 0
#
# Install note (governor sitting 71, R2: UPGRADE-685 (a) and (c); installed 2026-10-28 by the orchestrator-aide at
# Orchestrator A's word). The commit that keys every manifest is read from the files .git/HEAD, .git/<ref> and
# .git/packed-refs (the block "commit, read from .git"); no git binary runs for it.
# Install note (R2 (b), UPGRADE-685 (b); installed 2026-10-29 by the orchestrator-aide at Orchestrator A's word,
# unheld at the wall's word 5, WORD-wall-2026-10-29-read-and-ship): the full run refuses with exit 2 and no
# manifest, naming the dirty paths, when
#   GIT_OPTIONAL_LOCKS=0 git status --porcelain -- '*.lean' '*.json' '*.yaml'
# returns any line (or itself fails) and --allow-dirty is absent. This is the ONE git read this script makes,
# named here in the ruled form: a read-only form named by the running script's header is outside the no-git
# rule's class (_shared §12, word 5). GIT_OPTIONAL_LOCKS=0 keeps the read from refreshing the index. The --unit
# and --allow-dirty arms do not make it; with --allow-dirty the hand declares the tree dirty.
set -uo pipefail
UNIT=""; ALLOW_DIRTY=0
usage() { sed -n '/^# Usage:/,/^#         -h/p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'; }
while [ $# -gt 0 ]; do
  case "$1" in
    --unit) [ $# -ge 2 ] || { echo "check.sh: --unit needs a path" >&2; exit 2; }; UNIT="$2"; shift 2 ;;
    --unit=*) UNIT="${1#--unit=}"; shift ;;
    --allow-dirty) ALLOW_DIRTY=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "check.sh: unknown argument: $1" >&2; usage >&2; exit 2 ;;
  esac
done
export PYTHONDONTWRITEBYTECODE=1
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT" || exit 2
SCOPE=(.)
if [ -n "$UNIT" ]; then
  UNIT="${UNIT#./}"; UNIT="${UNIT%/}"
  case "$UNIT" in /*|..|../*|*/..|*/../*|"") echo "check.sh: --unit takes a path relative to the repo root: $UNIT" >&2; exit 2 ;; esac
  if [ ! -d "$UNIT" ] || { [ ! -f "$UNIT/Challenge.lean" ] && [ ! -f "$UNIT/Solution.lean" ]; }; then
    echo "check.sh: --unit $UNIT is not a unit directory (no Challenge.lean or Solution.lean)" >&2; exit 2; fi
  SCOPE=("./$UNIT")
fi
LAKE="${LAKE:-$HOME/.elan/bin/lake}"
GREP=/usr/bin/grep
CMP_HOME="$HOME/Claude/projects/comparator"
COMPARATOR_BIN="${COMPARATOR_BIN:-$CMP_HOME/.lake/build/bin/comparator}"
export COMPARATOR_LEAN4EXPORT="${COMPARATOR_LEAN4EXPORT:-$CMP_HOME/.lake/packages/lean4export/.lake/build/bin/lean4export}"
PERMITTED="propext Classical.choice Quot.sound"
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
CLOCK="$(date -u +%FT%TZ)"
FAIL=0
declare -a RES
note() { printf '%s\n' "$*"; }
res()  { RES+=("$1"$'\t'"$2"$'\t'"$3"); [ "$2" = FAIL ] && FAIL=1; printf '[%s] %s — %s\n' "$2" "$1" "$3"; }

# commit, read from .git without running git
COMMIT=NOGIT
if [ -f .git/HEAD ]; then
  head="$(cat .git/HEAD)"
  if [[ "$head" == ref:* ]]; then
    ref="${head#ref: }"
    if [ -f ".git/$ref" ]; then COMMIT="$(cut -c1-7 ".git/$ref")"
    elif [ -f .git/packed-refs ]; then
      c="$($GREP " $ref\$" .git/packed-refs | cut -c1-7)"; [ -n "$c" ] && COMMIT="$c"
    fi
  else COMMIT="$(printf '%s' "$head" | cut -c1-7)"; fi
fi

# dirty-tree refusal: the full run only, unless --allow-dirty (R2 (b); the one git read, named in the header)
if [ -z "$UNIT" ] && [ $ALLOW_DIRTY -eq 0 ]; then
  if ! DIRTY="$(GIT_OPTIONAL_LOCKS=0 git status --porcelain -- '*.lean' '*.json' '*.yaml')"; then
    echo "check.sh: REFUSED — the dirty-tree read (git status) failed; no manifest written" >&2; exit 2; fi
  if [ -n "$DIRTY" ]; then
    echo "check.sh: REFUSED — the tree is dirty in *.lean / *.json / *.yaml; no manifest written. Dirty paths:" >&2
    printf '%s\n' "$DIRTY" | sed 's/^/  /' >&2
    echo "check.sh: commit or remove them, or run with --allow-dirty to declare the tree dirty" >&2
    exit 2
  fi
fi

TOOLCHAIN="$(cat lean-toolchain)"
LAKEFILE_REV="$($GREP -E '^rev = "[0-9a-f]{40}"' lakefile.toml | head -1 | sed -E 's/^rev = "([0-9a-f]{40})"/\1/')"
MANIFEST_REV="$(python3 -I -c 'import json;print(next(p["rev"] for p in json.load(open("lake-manifest.json"))["packages"] if p["name"]=="mathlib"))')"

# units: every directory carrying a Challenge.lean or Solution.lean (outside .lake/.git)
if [ -n "$UNIT" ]; then printf '%s\n' "./$UNIT" > "$TMP/units"
else
find . \( -path ./.lake -o -path ./.git \) -prune -o \( -name Challenge.lean -o -name Solution.lean \) -print \
  | xargs -n1 dirname 2>/dev/null | sort -u > "$TMP/units"
fi
NUNITS=$(wc -l < "$TMP/units" | tr -d ' ')
note "check.sh @ $CLOCK · commit $COMMIT · $TOOLCHAIN · mathlib $LAKEFILE_REV · units $NUNITS${UNIT:+ · --unit $UNIT}$([ $ALLOW_DIRTY -eq 1 ] && printf ' · --allow-dirty')"

# 1 · lake build clean at the pin (the full run only)
BUILD_S=""
if [ -n "$UNIT" ]; then note "lake build: not run under --unit (the axioms arm reads the unit's modules as last built)"
else
pin_ok=1; why=""
[ -n "$LAKEFILE_REV" ] || { pin_ok=0; why="lakefile rev is not a 40-hex sha; "; }
[ "$LAKEFILE_REV" = "$MANIFEST_REV" ] || { pin_ok=0; why+="manifest mathlib rev $MANIFEST_REV != lakefile rev; "; }
if [ -f .lake/packages/mathlib/lean-toolchain ] && ! diff -q lean-toolchain .lake/packages/mathlib/lean-toolchain >/dev/null; then
  pin_ok=0; why+="lean-toolchain differs from the pinned mathlib's; "; fi
t0=$(python3 -I -c 'import time;print(time.time())')
"$LAKE" build > "$TMP/build.log" 2>&1; brc=$?
t1=$(python3 -I -c 'import time;print(time.time())')
BUILD_S=$(python3 -I -c "print(round($t1-$t0,2))")
tail -3 "$TMP/build.log"
if [ $pin_ok -eq 1 ] && [ $brc -eq 0 ]; then res lake_build PASS "exit 0 in ${BUILD_S}s at $TOOLCHAIN / mathlib $LAKEFILE_REV"
else res lake_build FAIL "${why}lake build exit $brc"; fi
fi

# 2 · no sorry/admit outside Challenge.lean; no axiom declarations anywhere
find "${SCOPE[@]}" \( -path ./.lake -o -path ./.git \) -prune -o -name '*.lean' -print | sort > "$TMP/lean_files"
: > "$TMP/sorry_hits"; : > "$TMP/axiom_hits"
while IFS= read -r f; do
  [ "$(basename "$f")" = Challenge.lean ] || $GREP -nHwE 'sorry|admit' "$f" >> "$TMP/sorry_hits"
  $GREP -nHE '^[[:space:]]*(@\[[^]]*\][[:space:]]*)?((private|protected|noncomputable|unsafe)[[:space:]]+)*axiom[[:space:]]' "$f" >> "$TMP/axiom_hits"
done < "$TMP/lean_files"
ns=$(wc -l < "$TMP/sorry_hits" | tr -d ' '); na=$(wc -l < "$TMP/axiom_hits" | tr -d ' ')
if [ "$ns" = 0 ] && [ "$na" = 0 ]; then res no_sorry_no_axiom PASS "$(wc -l < "$TMP/lean_files" | tr -d ' ') .lean files scanned"
else cat "$TMP/sorry_hits" "$TMP/axiom_hits"; res no_sorry_no_axiom FAIL "sorry/admit outside Challenge.lean: $ns; axiom declarations: $na"; fi

# 3 · #print axioms (collectAxioms) on every theorem of every Solution.lean module
: > "$TMP/axioms.txt"; ax_fail=0; nsol=0
while IFS= read -r u; do
  [ -f "$u/Solution.lean" ] || continue; nsol=$((nsol+1))
  mod="$(printf '%s' "${u#./}/Solution" | tr '/' '.')"
  cat > "$TMP/ax.lean" <<EOF
import $mod
open Lean Elab Command in
#eval show CommandElabM Unit from do
  let env ← getEnv
  let some idx := env.getModuleIdx? \`$mod | throwError "module not loaded: $mod"
  for c in env.header.moduleData[idx.toNat]!.constNames do
    if let some (.thmInfo _) := env.find? c then
      let axs ← Lean.collectAxioms c
      IO.println s!"AXIOMS $mod {c} {axs.toList}"
EOF
  if ! "$LAKE" env lean "$TMP/ax.lean" >> "$TMP/axioms.txt" 2>&1; then ax_fail=1; echo "axiom runner failed on $mod"; fi
done < "$TMP/units"
bad=$(python3 -I - "$TMP/axioms.txt" "$PERMITTED" <<'PY'
import sys,re
ok=set(sys.argv[2].split()); bad=0
for line in open(sys.argv[1]):
    m=re.match(r'AXIOMS (\S+) (\S+) \[(.*)\]$',line.strip())
    if not m: continue
    axs={a.strip() for a in m.group(3).split(',') if a.strip()}
    if axs-ok: bad+=1; print(line.strip(),file=sys.stderr)
print(bad)
PY
)
nth=$($GREP -c '^AXIOMS ' "$TMP/axioms.txt" || true)
if [ $ax_fail -eq 0 ] && [ "$bad" = 0 ]; then res axioms PASS "$nsol Solution module(s), $nth theorem(s), all within {$PERMITTED}"
else res axioms FAIL "$nsol Solution module(s), $nth theorem(s), $bad outside {$PERMITTED}, runner failures: $ax_fail"; fi

# 4 · Comparator "okay" on each unit's comparator.json
ncmp=0; cmp_fail=0; cmp_skip=""
if [ ! -x "$COMPARATOR_BIN" ]; then cmp_skip="Comparator binary not built at $COMPARATOR_BIN"
elif [ -z "${COMPARATOR_LANDRUN:-}" ] && ! command -v landrun >/dev/null; then cmp_skip="no landrun on PATH and COMPARATOR_LANDRUN unset"
fi
while IFS= read -r u; do
  [ -f "$u/Challenge.lean" ] || continue
  if [ ! -f "$u/comparator.json" ]; then cmp_fail=1; echo "missing $u/comparator.json"; continue; fi
  [ -n "$cmp_skip" ] && continue
  ncmp=$((ncmp+1))
  out="$("$LAKE" env "$COMPARATOR_BIN" "$u/comparator.json" 2>&1)"; rc=$?
  if [ $rc -ne 0 ] || ! printf '%s' "$out" | $GREP -q 'Your solution is okay!'; then cmp_fail=1; echo "Comparator NOT okay on $u (exit $rc)"; fi
done < "$TMP/units"
if [ $cmp_fail -ne 0 ]; then res comparator FAIL "a unit lacks comparator.json or Comparator did not return okay"
elif [ -n "$cmp_skip" ] && [ "$NUNITS" != 0 ]; then res comparator FAIL "SKIPPED with units present: $cmp_skip"
elif [ -n "$cmp_skip" ]; then res comparator PASS "no units (note: $cmp_skip)"
else res comparator PASS "$ncmp unit(s) okay${COMPARATOR_LANDRUN:+ (landrun: $COMPARATOR_LANDRUN)}"; fi

# 5 · Challenge.lean sha256 == statement_sha256 in the unit's formalization.yaml
: > "$TMP/digests"; dg_fail=0; ndg=0
while IFS= read -r u; do
  [ -f "$u/Challenge.lean" ] || continue; ndg=$((ndg+1))
  got="$(shasum -a 256 "$u/Challenge.lean" | cut -d' ' -f1)"
  want="$($GREP -E '^[[:space:]]*statement_sha256:' "$u/formalization.yaml" 2>/dev/null | head -1 | sed -E 's/.*statement_sha256:[[:space:]]*"?([0-9a-fA-F]*)"?.*/\1/')"
  printf '%s\t%s\t%s\n' "$u" "$got" "${want:-ABSENT}" >> "$TMP/digests"
  [ "$got" = "$want" ] || { dg_fail=1; echo "digest mismatch at $u: file $got, signed ${want:-ABSENT}"; }
done < "$TMP/units"
if [ $dg_fail -eq 0 ]; then res challenge_digest PASS "$ndg Challenge.lean digest(s) equal the signed statement_sha256"
else res challenge_digest FAIL "a Challenge.lean digest differs from (or lacks) its signed statement_sha256"; fi

# 6 · retired-names grep over the repo (this script excluded: it carries the list)
: > "$TMP/retired"
for term in "coupling constant" "coupling rate" "dimensional surplus" "14.2%"; do
  # the V-seat reports under specs/_V*.md quote the search seed itself; they are reports, not uses (CO 2026-10-28)
  $GREP -rniF --exclude-dir=.lake --exclude-dir=.git --exclude=check.sh --exclude='_V[0-9]-*.md' -- "$term" "${SCOPE[@]}" >> "$TMP/retired" || true
done
nr=$(wc -l < "$TMP/retired" | tr -d ' ')
if [ "$nr" = 0 ]; then res retired_names PASS "0 hits for the four retired names"
else cat "$TMP/retired"; res retired_names FAIL "$nr hit(s) for retired names"; fi

# manifest
mkdir -p manifests
if [ -n "$UNIT" ]; then MAN="manifests/unit-$(printf '%s' "$UNIT" | tr '/' '.')-$COMMIT"; else MAN="manifests/build-$COMMIT"; fi
[ $ALLOW_DIRTY -eq 1 ] && MAN="$MAN-dirty"
MAN="$MAN.json"
printf '%s\n' "${RES[@]}" > "$TMP/results"
find "${SCOPE[@]}" \( -path ./.lake -o -path ./.git -o -path ./manifests \) -prune -o -type f \( -name '*.lean' -o -name '*.json' -o -name '*.yaml' -o -name '*.toml' -o -name 'lean-toolchain' -o -name '*.sh' \) -print \
  | sort | while IFS= read -r f; do printf '%s\t%s\n' "$f" "$(shasum -a 256 "$f" | cut -d' ' -f1)"; done > "$TMP/hashes"
python3 -I - "$MAN" "$CLOCK" "$COMMIT" "$TOOLCHAIN" "$LAKEFILE_REV" "$BUILD_S" "$FAIL" "$TMP" "$UNIT" "$ALLOW_DIRTY" <<'PY'
import sys,json,re,os
man,clock,commit,tc,rev,bs,fail,tmp,unit,dirty=sys.argv[1:11]
def rows(p): return [l.rstrip('\n').split('\t') for l in open(os.path.join(tmp,p)) if l.strip()]
axioms=[]
for l in open(os.path.join(tmp,'axioms.txt')):
    m=re.match(r'AXIOMS (\S+) (\S+) \[(.*)\]$',l.strip())
    if m: axioms.append({"module":m.group(1),"theorem":m.group(2),"axioms":[a.strip() for a in m.group(3).split(',') if a.strip()]})
d={"clock":clock,"commit":commit,"toolchain":tc,"mathlib_rev":rev,"lake_build_seconds":float(bs) if bs else None,
   "checks":[{"check":c,"status":s,"detail":x} for c,s,x in rows('results')],
   "axioms":axioms,
   "challenge_digests":[{"unit":u,"sha256":g,"signed":w} for u,g,w in rows('digests')],
   "file_hashes":{f:h for f,h in rows('hashes')},
   "verdict":"FAIL" if fail=="1" else "PASS"}
if unit: d["mode"]="unit"; d["unit"]=unit; d["arms"]="no_sorry_no_axiom axioms comparator challenge_digest retired_names (no lake build)"
if dirty=="1": d["dirty_declared"]=True
json.dump(d,open(man,'w'),indent=2,ensure_ascii=False); open(man,'a').write('\n')
PY
note "manifest: $MAN · verdict $([ $FAIL -eq 0 ] && echo PASS || echo FAIL)"
exit $FAIL
