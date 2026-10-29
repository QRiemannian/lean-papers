# BUILD-LOG — unit U14 (`RiemannZeta/CorrectedReflections`, namespace `RiemannZeta.CorrectedReflections`)

Seat L (Lean coder), PHASE STATEMENTS, dispatched by Orchestrator A 2026-10-29 for the corrected leg L:RZ-N2b (CC-13); method `Orchestrator/Chat-Design/cc-handoff/projects/reputation-play/lean-scoping/seats/TEMPLATE-L-lean-coder.md` (whole, with the sitting-71 addendum; the brief's `TEMPLATE-L-statements.md` does not exist, this is the L template beside the M template). Clocks from `date -u`. No git, no web, nothing under the lab's non-public research trees. Scratch at `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/l-u14/`.

**Edition:** the corrected edition is served, sha256 `6b89ce0e7ae0a71301a8d792b6e80f4cb850244df83f4731810377d70e3d2d12` (the site tree's `qriemannian-site/public/pdfs/riemann-zeta-tetrahedral.pdf`, re-hashed 18:04:50Z, matches the brief's served digest). The docstrings and `formalization.yaml` carry it; nothing here is read from the old served edition `2d5287e7`.

- seat opened 2026-10-29T18:04:02Z; `Challenge.lean` first written 18:05:04Z, final 18:07:06Z; this file 18:09Z
- inputs read: `specs/RZ-N2b.md` (whole; the live block is the last section, "M spec against the corrected text (2026-10-29)", 17:53:23Z), `specs/_V1-RZ-N2b.md` (whole; (d) and (e) in particular), TEMPLATE-L; form from U11 `RiemannZeta/Corrected/` (Challenge head, `formalization.yaml`, `comparator.json`, this file's shape) and U12 `RiemannZeta/Accepted/` (Challenge, `formalization.yaml`, `comparator.json`); rz_81's `universe u` form from U5 `RiemannZeta/NoGo/Challenge.lean:26–78`; the index `RiemannZeta.lean`; `lakefile.toml` (the `RiemannZeta` lib is `globs = ["RiemannZeta.*"]`, so the lakefile needs no line).

## Builds

- **E1** 2026-10-29T18:05:04Z → 18:05:32Z — `lake env lean RiemannZeta/CorrectedReflections/Challenge.lean` (the spec's §5 text, composed by script) · exit **0** · only 2 × `declaration uses 'sorry'` (42:8, 102:8). First elaboration: no precedence, instance-path or `open` issue arose (traps 3, 5, 6, 9 — nothing to fix).
- **inspect-1** 18:05:3xZ → 18:06:04Z — `lake build RiemannZeta.CorrectedReflections.Challenge` exit 0, but the length linter fired 16 × `This line exceeds the 100 character limit` (the sixteen Aᵐᵒᵖ lines of (i), 101–119 characters, each long only through its trailing line comment). Every other Challenge in the lane has zero lines over 100 (counted by script).
- **E2** 2026-10-29T18:07:06Z → 18:07:24Z — after the comment fix (departure 2) · `lake env lean RiemannZeta/CorrectedReflections/Challenge.lean` · exit **0**, output:
```
RiemannZeta/CorrectedReflections/Challenge.lean:42:8: warning: declaration uses `sorry`
RiemannZeta/CorrectedReflections/Challenge.lean:102:8: warning: declaration uses `sorry`
```
- **B1** 2026-10-29T18:07:24Z → 18:07:36Z — `lake build RiemannZeta.CorrectedReflections.Challenge` · exit **0** · `Build completed successfully (8706 jobs)`, Challenge 8.9 s · first error: none · warnings: the 2 × `sorry`, nothing else (longest line 99 characters).
- **inspect-2** 2026-10-29T18:07:58Z → 18:08:1xZ — scratch `inspect.lean` (outside the repo), `lake env lean`, exit **0**, no error. `#check` of both theorems prints `MulOpposite.op` on every Aᵐᵒᵖ term and `-(Complex.I * ↑ħ) • …` on every negated scalar; `#print` shows `rz_N2b_reflections_sign_up_to_order.{u}` with the inner `∀ {A : Type u}` (rz_81's form). Two probes: `MulOpposite.op (c • x) = c • MulOpposite.op x := rfl` elaborates (trap 6: the two `•` paths agree definitionally), and σ₁'s first Aᵐᵒᵖ line `op E * op D − op D * op E = c • (op H * op S)` ↔ `D * E − E * D = c • (S * H)` closes by `simp only [← MulOpposite.op_mul, ← MulOpposite.op_sub, ← MulOpposite.op_smul, MulOpposite.op_inj]` (M's §6 route for (i), first step, exercised once).
- **index** 2026-10-29T18:08:16Z — `RiemannZeta.lean` re-read immediately before the append (header comment + eleven imports, last `import RiemannZeta.Corrected.Challenge`, final byte `\n`); `import RiemannZeta.CorrectedReflections.Challenge` appended as the new last line with `>>`, guarded by an exact-line `/usr/bin/grep -qxF`; existing lines kept. Same place and same hand as U11 (its BUILD-LOG, "index" line).
- **B2** 2026-10-29T18:08:16Z → 18:08:32Z — `lake build RiemannZeta` · exit **0** · `Build completed successfully (8730 jobs)` · first error: none · warnings besides `sorry`: 1 × `longLine` on `RiemannZeta.lean:1` (the index's header comment) and the header-linter warning replayed on `RiemannZeta/ZetaL/Challenge.lean:1:1` — both pre-existing (U11's B2 records the same two), neither on this seat's lines; left as found.
- **B3 (final)** 2026-10-29T18:08:39Z → 18:08:42Z — `lake build RiemannZeta.CorrectedReflections.Challenge` · exit **0** · `Build completed successfully (8706 jobs)` (replayed) · warnings: 2 × `sorry` (42:8, 102:8), nothing else.

## `#print axioms` (inspect-2) — statements phase, `sorryAx` expected
```
'RiemannZeta.CorrectedReflections.rz_N2b_reflections_anti_automorphism' depends on axioms: [propext, sorryAx, Classical.choice, Quot.sound]
```

## Identity with the spec (by script, `python3 -I <scratch>/l-u14/bytecheck.py`, exit 0)
```
block 1: statement 3400 bytes in spec; byte-identical=False; identical-with-comments-stripped=True
  16 lines differ (same line count: True); all differences after '--': True
  docstring (placeholder filled) occurs in Challenge: 1x
block 2: statement 4301 bytes in spec; byte-identical=True; identical-with-comments-stripped=True
  docstring (placeholder filled) occurs in Challenge: 1x
open MulOpposite in before (i)'s docstring: True
ALL OK
```
The script re-extracts the two ```lean blocks of the spec's §5 on its own (independently of `compose.py`), takes each statement from `theorem` through the `:= by` line, and compares. (ii) is byte-identical. (i) differs only inside sixteen line comments (departure 2).

## Departures from the spec's text, each with its reason
1. **Docstrings, the sha line.** Both §5 docstrings end "PDF sha256 prefix: the corrected edition's, at the republish." — a placeholder the spec and V₁ (e) say is filled from the served edition at the flip. It reads "PDF sha256 prefix `6b89ce0e` (the corrected edition, served 2026-10-29)." in both. The rest of each docstring is the spec's, verbatim (script above).
2. **(i)'s sixteen Aᵐᵒᵖ line comments.** `-- (3.k) under it, in Aᵐᵒᵖ` → `-- (3.k) in Aᵐᵒᵖ`, for the length linter (the lane's Challenges have no line over 100; the long lines were 101–119 characters, long only through the comment). Code bytes are unchanged; each comment still follows its closer (trap 4); the block's head comment names the reflection, so "under it" stays readable from the line above.
3. **Module header** (new, U11's form): `import Mathlib`, the module doc, `namespace RiemannZeta.CorrectedReflections`, `universe u` (spec §5 head), two `/-! ## … -/` section headings, `end RiemannZeta.CorrectedReflections`. No definitions (none needed).
4. **None in any statement's mathematics.** Elaboration forced no change.

## Name check
Every library name in the statements is one of: `Ring`, `Algebra`, `Complex.I`, `MulOpposite.op` (through `open MulOpposite in`; `#check` prints `MulOpposite.op`, not `AddOpposite.op` — trap 6's twin), `Matrix`, `Fin`. All resolve at the pin (inspect-2 exit 0, the `#check` output names them in full). M's §4 table (`MulOpposite.instRing`, `instAlgebra`, `op_mul`, `op_sub`, `op_smul`, `op_inj`, file:line at the pin) was not re-grepped here; `op_mul`, `op_sub`, `op_smul`, `op_inj` were exercised by name in the inspect probe.

## Digest (statements phase)
- `Challenge.lean` (156 lines, 11 279 bytes) sha256 `b6fb5ea6f8999345bc5115b48366496338b34661b774bed2d9514fc46e9615f5` (after B3) → `formalization.yaml` `statement_sha256_draft:` (V₂ signs `statement_sha256:`).
- `comparator.json` parsed as JSON (python3 -I), `formalization.yaml` parsed as YAML (ruby) — 18:08:57Z. `theorem_names: []` (proved only — none yet; the proofs seat lists the two at the proofs phase).

## Row table
| row | theorems | status |
|---|---|---|
| L:RZ-N2b | `rz_N2b_reflections_anti_automorphism` · `rz_N2b_reflections_sign_up_to_order` | STATED |

## Notes for V₂ and the proofs phase
- **V₂**: (i) and (ii)(a) are one fact through op (V₁ (d)); read (ii)(a) as (i) in the clause's own terms, the independent content being (ii)(b). Re-run `bytecheck.py` to see the two departures and nothing else.
- **Proofs** (M's §6): (i) the `simp only [← op_mul, ← op_sub, ← op_smul, op_inj]` fold is exercised once in `inspect.lean`; then `tauto` per conjunct. (ii)(a) `neg_sub`/`neg_smul` per relation. (ii)(b) τ = (ħ + √(ħ² + 4))/2 and the four 2 × 2 matrices of §6. The Solution restates `universe u` and `open MulOpposite in` (no definitions to restate), does not import the Challenge (CO's ruling).
- Scratch files (outside the repo): `compose.py` (how the Challenge was assembled from the spec's §5 blocks), `bytecheck.py` (V₂ may re-run it), `inspect.lean` + `inspect.out`, `E1.out`, `E2.out`, `B1.out`, `B2.out`, `B3.out`.
- seat closed 2026-10-29T18:10Z

## Proofs phase

Seat L (Lean prover), PHASE PROOFS, dispatched by Orchestrator A 2026-10-29 after V₂'s signature (statement_sha256 `b6fb5ea6f8999345bc5115b48366496338b34661b774bed2d9514fc46e9615f5`, v2_signed 2026-10-29T18:15:37Z). Clocks from `date -u`. No git, no web, nothing under the lab's non-public research trees; `tools/check.sh` not run (the gate is Orchestrator A's). Challenge.lean untouched: sha256 `b6fb5ea6…15f5` re-read after the last build and after the Comparator run. Scratch: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/l-u14-proofs/`.

- seat opened 2026-10-29T18:18:34Z; inputs read: this unit's `Challenge.lean` (whole), `formalization.yaml`, `comparator.json`, this file; `specs/RZ-N2b.md` (§3 content and table, §6 route, §7 traps, §10 status lines through V2); `specs/_V1-RZ-N2b.md` (whole); `specs/_V2-U14.md` (head through "Lean run"); house form `RiemannZeta/Corrected/Solution.lean` (header and `section Aux`), `RiemannZeta/Accepted/Solution.lean` (header), `RiemannZeta/Corrected/BUILD-LOG.md` (proofs phase), `tools/env.sh`, `tools/check.sh` (the Comparator arm, for the binary paths only).
- **Import decision:** `Solution.lean` imports `Mathlib` only (U14 needs no other unit; the CO's ruling); it does NOT import the Challenge (`/usr/bin/grep -n "import RiemannZeta"` → no hit).
- **Form.** `Solution.lean` (209 lines, 14 037 bytes) = `import Mathlib`, a proofs module doc, then the Challenge's lines 23–26 byte for byte (`namespace RiemannZeta.CorrectedReflections`, `universe u`), `section Aux … end Aux` (`aux_flip`), the Challenge's lines 27–83 byte for byte (section heading, `open MulOpposite in`, (i)'s docstring and statement through `:= by   -- (3.5) in Aᵐᵒᵖ`), (i)'s proof in place of `sorry`, the Challenge's lines 85–153 byte for byte ((ii)'s heading, docstring, statement), (ii)'s proof in place of `sorry`, the Challenge's line 155 to the end (`end RiemannZeta.CorrectedReflections`). Assembled by script (`assemble.py`, scratch), which asserts each of the four Challenge blocks occurs exactly once in the output; no statement byte was retyped. No definitions to restate (`definitions: []`). Longest line 99 characters.

### Numerical check of the witness before trusting it
`witness_num.py` (scratch, numpy) at ħ = 3/2 (τ = 2) and ħ = −0.7: the four sign-and-order-reversed (R⁻) equations hold, each with exactly one live entry, (1, 0) (values 3, −3, 6i, −6i at ħ = 3/2); the four sign-only (R₋) differences are nonzero, only at (1, 0) (−9, 9, 4.5i, −4.5i at ħ = 3/2, i.e. −(ħτ)², (ħτ)², iħ²τ, −iħ²τ). This fixed which entry carries the τ identity in each block and which entry the negation reads.

### Route per theorem
- **(i)** `rz_N2b_reflections_anti_automorphism` — PROVED. The spec's §6 route as written: `simp only [← MulOpposite.op_mul, ← MulOpposite.op_sub, ← MulOpposite.op_smul, MulOpposite.op_inj]` folds every Aᵐᵒᵖ line into its anti-image in A (a relation of (3.2)–(3.5) literally, the §3 table), then `refine ⟨?_, ?_, ?_, ?_⟩ <;> tauto` (each reflection's iff is a permutation of a four-fold conjunction). The fallback through `unop_injective` was not needed.
- **(ii)(a)** — PROVED, by a helper rather than per-goal rewriting (departure 1): `aux_flip (X Y Z W : A) (c : ℂ) : (X * Y - Y * X = (-c) • (Z * W)) ↔ (Y * X - X * Y = c • (Z * W))`, proved by `rw [neg_smul, ← neg_sub (Y * X) (X * Y), neg_inj]` — the spec's `neg_smul`/`neg_sub` step, once, for both directions. `simp only [aux_flip]` turns each R⁻ line into a relation of the same shape as the reflected lines on the left, after which `refine ⟨?_, ?_, ?_, ?_⟩ <;> tauto`. No `ring` on the noncommutative A. The pairing `tauto` finds is the §3 table; it was not written out by hand.
- **(ii)(b)** — PROVED, the spec's witness and τ. τ := (ħ + √(ħ² + 4))/2 introduced as `obtain ⟨τ, hτ⟩ : ∃ τ : ℝ, τ ^ 2 = ħ * τ + 1` with `Real.sq_sqrt (by positivity)` and `linear_combination hs / 4` (departure 2: the ∃ packaging instead of `set`, so only the identity is carried); `hτ0 : τ ≠ 0` by `rintro rfl; norm_num at hτ`; `hτC` by `exact_mod_cast`. Witness E = `!![-(τ : ℂ) ^ 2, 0; 0, -1]`, S = `!![0, 0; 1, 0]`, H = `!![1, 0; 0, (τ : ℂ) ^ 2]`, D = `!![0, 0; Complex.I * τ, 0]` (the spec's, unchanged). Each R⁻ equation: `ext i j; fin_cases i <;> fin_cases j <;> simp` (departure 3: plain `simp` — the `Matrix.mul_apply`, `Fin.sum_univ_two` arguments were reported unused on `!![…]` literals) closes three entries; the live entry (1, 0) by `linear_combination` with `hτC` and `Complex.I_sq` — (3.2)-slot `hτC + ħτ·I_sq`, (3.3)-slot `−hτC − ħτ·I_sq`, (3.4)-slot `iτ·hτC`, (3.5)-slot `−iτ·hτC`. The negation: from the sign-only (3.2) equation, entry (1, 0) stated as `-1 + τ² = -(i ħ (τ² (i τ)))` and closed by `simpa using congrFun (congrFun h2 1) 0` (departure 4: a stated `have … := by simpa`, not `simp at h`, to clear the flexible-tactic linter); then `(ħτ)² = 0` by `linear_combination (1 − ħτ)·hτC − h + ħτ³·I_sq`; `(ħ : ℂ) * τ ≠ 0` by `Complex.ofReal_mul` and `mul_ne_zero hħ hτ0` (cast); contradiction by `pow_eq_zero_iff`.

### Departures from the spec's §6 route (the statements are untouched)
1. (ii)(a) through the one helper `aux_flip` (`section Aux`; enters no statement) + `simp only` + `tauto`, instead of per-goal `rw [neg_smul, ← h_k, neg_sub]`; same lemmas, applied once.
2. (ii)(b) τ introduced by an existential carrying only τ² = ħτ + 1, not by `set`.
3. `simp` in place of `simp [Matrix.mul_apply, Fin.sum_univ_two]` (the arguments are unused on `!![…]` literals at the pin; the unused-simp-args linter said so in a scratch probe).
4. The negation's entry equation stated explicitly (`have h : … := by simpa using …`) instead of `simp at h` (P1 below raised the flexible-tactic linter on `simp at h`).

### Builds and checks
- **S1** 2026-10-29T18:19:53Z — scratch `Probe.lean` ((ii)(b) alone, `sorry`s and `trace_state`): the residual goals after `simp` are the (1, 0) entries only; read off the `linear_combination` coefficients from them. S1b ≈18:20Z: the negation hypothesis after `simp`: `-1 + ↑τ ^ 2 = -(Complex.I * ↑ħ * (↑τ ^ 2 * (Complex.I * ↑τ)))`.
- **S2** 2026-10-29T18:21:17Z → 18:21:25Z — scratch `Solution.lean` (assembled), `lake env lean` · exit 1 · one error, `aux_flip`: `rw [← neg_sub Y X]` found no `X − Y`; repaired to `← neg_sub (Y * X) (X * Y)`.
- **S3** 2026-10-29T18:21:33Z → 18:21:39Z — `lake env lean` on the reassembled scratch file · exit **0**, no output.
- **P1** 2026-10-29T18:21:46Z → 18:22:03Z — file installed at `RiemannZeta/CorrectedReflections/Solution.lean`; `lake build RiemannZeta.CorrectedReflections.Solution` · exit 0 · `Build completed successfully (8706 jobs)` · 1 linter warning (reported twice): `linter.flexible` on `simp at h` (201:6) with two infos; repaired (departure 4).
- **P2 (final)** 2026-10-29T18:22:27Z → 18:22:44Z — `lake build RiemannZeta.CorrectedReflections.Solution` · exit **0** · last lines:
```
✔ [8706/8706] Built RiemannZeta.CorrectedReflections.Solution (14s)
Build completed successfully (8706 jobs).
```
no warning, no `sorry`, no error. Solution.lean sha256 `efc6df016c3abbfd18316e9c2366c73543a0125c4e0b53b921c916726242e1dc`.
- **axioms** 2026-10-29T18:22:51Z — scratch `Axioms.lean` (`import RiemannZeta.CorrectedReflections.Solution`, three `#print axioms`), `lake env lean` exit 0:
```
'RiemannZeta.CorrectedReflections.rz_N2b_reflections_anti_automorphism' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.CorrectedReflections.rz_N2b_reflections_sign_up_to_order' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.CorrectedReflections.aux_flip' depends on axioms: [propext, Classical.choice, Quot.sound]
```
(the tool printed the first two lists wrapped across lines; joined here.)
- **grep** `/usr/bin/grep -nE "native_decide|sorry|admit|axiom|opaque|set_option|import RiemannZeta" RiemannZeta/CorrectedReflections/Solution.lean` → no hits (exit 1).
- **comparator.json** 2026-10-29T18:23Z — `theorem_names` set to the two proved names, fully qualified, in U11's layout (`RiemannZeta.CorrectedReflections.rz_N2b_reflections_anti_automorphism`, `RiemannZeta.CorrectedReflections.rz_N2b_reflections_sign_up_to_order`); parsed as JSON (python3 -I). Nothing else in the file changed.
- **Comparator** 2026-10-29T18:23:09Z → 18:23:35Z — `source tools/env.sh` (the macOS `fake-landrun.sh` shim, NOT a sandbox), `COMPARATOR_LEAN4EXPORT` set to check.sh's default, then `lake env ~/Claude/projects/comparator/.lake/build/bin/comparator RiemannZeta/CorrectedReflections/comparator.json` · exit **0**. Output, tail:
```
Building RiemannZeta.CorrectedReflections.Solution
WARNING: THIS IS NOT REAL LANDRUN! UNSAFELY RUNNING exec lake build RiemannZeta.CorrectedReflections.Solution
Build completed successfully (8706 jobs).
WARNING: THIS IS NOT REAL LANDRUN! UNSAFELY RUNNING exec …/lean4export RiemannZeta.CorrectedReflections.Solution -- RiemannZeta.CorrectedReflections.rz_N2b_reflections_anti_automorphism RiemannZeta.CorrectedReflections.rz_N2b_reflections_sign_up_to_order propext Quot.sound Classical.choice …
Running Lean default kernel on solution.
Lean default kernel accepts the solution
Your solution is okay!
```
The Challenge side replayed with its two expected `sorry` warnings (42:8, 102:8). Full output: scratch `comparator.out`. Run UNSANDBOXED (the shim; the lane's standing flag).
- `formalization.yaml`: unchanged (`statement_sha256` / `v2_signed` untouched; row status STATED is the orchestrator's to move). Index `RiemannZeta.lean`: unchanged (it lists Challenge modules only).

### Row table (proofs phase)
| row | theorems | status |
|---|---|---|
| L:RZ-N2b | `rz_N2b_reflections_anti_automorphism` · `rz_N2b_reflections_sign_up_to_order` | PROVED (row status in the yaml unchanged; the gate and the flip are Orchestrator A's) |

- seat closed 2026-10-29T18:23:43Z+ (after the `L-proofs:` line in `specs/RZ-N2b.md`)
