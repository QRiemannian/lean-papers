# BUILD-LOG — unit U8 (`ModularSurface/Now`), seat L, PHASE statements

- Seat: L (statements), Opus, dispatched by Orchestrator A 2026-10-28. Brief: `Orchestrator/Chat-Design/cc-handoff/projects/reputation-play/lean-scoping/seats/L-statements-U8-2026-10-28.md`.
- Opened: 2026-10-28T17:57:59Z (`date -u`).
- No git, no web, nothing under the lab's non-public research trees.

- Inputs read: the brief; `specs/_UNIT-U8.md` (incl. M-amend 17:56:43Z); `specs/_V1-U8.md`; the 16 spec files (MS-02, 03, 05, 07, 09a, 09b, 13, 14a, 14b, 14c, 22, 24b, 25, 32a, 32b, 39); `RiemannZeta/ZetaL/Challenge.lean` (`geometryConstant`), `RiemannZeta/MatricesMobius/Challenge.lean` (`RZ.gaussMap`, `RZ.mayer`), SmallArith's `comparator.json` / `formalization.yaml` / `BUILD-LOG.md` for the record shapes.
- V₁ gate on the two restated rows, polled 17:58:34Z: **MS-09b** `M-amend` 17:55:03Z → `V1: V1-GREEN 2026-10-28T17:58:10Z`; **MS-32b** `M-amend` 17:56:09Z → `V1: V1-GREEN 2026-10-28T17:58:10Z`. Both fresh and after their amend lines, so both rows are stated. The other 14 carry `V1-GREEN` / `V1-SPLIT-OK` at 17:51:21Z (no amend after it). 16 theorems.

## Builds

- **B1** 2026-10-28T18:00:06Z → 18:00:12Z — `lake build ModularSurface.Now.Challenge` · exit **0** · `Build completed successfully (8706 jobs)`, Challenge 3.7 s · first error: none · warnings: 16 × `declaration uses 'sorry'` (one per theorem), nothing else.
- **inspect** 18:00:22Z → 18:00:25Z — scratch file (scratchpad, outside the repo) `import ModularSurface.Now.Challenge` + `#check` with `pp.numericTypes` / `pp.coercions` on MS-02, 05, 09b, 14c, 22, 24b, 32a, 32b, 39 + `#print RZ.mayer` · exit 0 · each elaborates to the spec's statement: MS-02's `let F` elaborates as `have F := {r | (7 : ℕ∞) ≤ r}`; MS-05's coercions land in `OnePoint ℝ` (`↑Real.goldenRatio`, `↑((-1 : ℝ) / Real.goldenRatio)`); MS-32a's `ms32Gc D` casts `D : ℕ` to ℝ, MS-32b's `ms32Gc (NumberField.discr K)` casts ℤ to ℝ, and the ∃-bound `Field`/`NumberField` binders act as local instances; MS-39's `fun _ => 1` is `(1 : ℂ)`, the domain hypothesis is `(1 / 2 : ℝ) < s.re`. No error.
- **spec-text check** between 18:00:25Z and 18:00:51Z (not separately clocked) — a script (scratchpad) took every non-docstring, non-comment code line of each spec's §5 Lean block and found it verbatim in `Challenge.lean`: 16/16 ALL LINES PRESENT. The three shared definition lines compared byte-for-byte with their RZ sources (`grep` + `diff`): `geometryConstant`, `RZ.gaussMap`, `RZ.mayer` SAME.
- **index** 18:00:51Z — `ModularSurface.lean` read first (one header-comment line, no imports); `import ModularSurface.Now.Challenge` appended with `>>`, behind an exact-line grep guard; the header line kept. `lakefile.toml` already carries `[[lean_lib]] name = "ModularSurface"`, `globs = ["ModularSurface.*"]`; no change made.
- **B2** 18:00:51Z → 18:01:00Z — `lake build ModularSurface` · exit **0** · `Build completed successfully (8708 jobs)` · first error: none · warnings: 16 × `sorry` (this unit) + 1 × `linter.style.longLine` at `ModularSurface.lean:1` (the index's pre-existing header comment, the orchestrator's line, left as found — the same as `RiemannZeta.lean:1`). `lake env lean ModularSurface.lean` exit 0.
- **B3** 18:01:06Z → 18:01:10Z — `lake build ModularSurface.Now.Challenge` (final) · exit **0** · `Build completed successfully (8706 jobs)` (replayed) · first error: none · warnings: 16 × `declaration uses 'sorry'`, nothing else.

## Departures from the specs' text (every one in a docstring, a layout or a carrier; no signature touched)
1. **Docstrings extended** on each theorem with the row id, the served locus (from each spec's header) and the PDF sha256 prefix `b4841489`, in the RZ units' form; the specs' short docstrings are carried inside them. Reason: the brief asks that the docstring carry row id, locus and prefix.
2. **`:= by sorry` laid out as `:= by` / `  sorry`** (the RZ units' layout). Reason: house layout; the term is the same.
3. **`ms03HeckeArea`'s docstring reflowed onto two lines** (text unchanged). Reason: house layout at 100 columns.
4. **Shared definitions' docstrings rewritten, definition lines byte-identical.** `geometryConstant` (from `RiemannZeta/ZetaL/Challenge.lean`) and `RZ.gaussMap`, `RZ.mayer` (from `RiemannZeta/MatricesMobius/Challenge.lean`) keep their RZ def lines byte for byte; the docstrings say "restated identically to unit U3's / U4's …" and name the MS rows that use them, since the RZ docstrings' "shared by L:RZ-15, 16, 17; placed once for the unit" is false in this unit. The names land at `ModularSurface.Now.geometryConstant`, `ModularSurface.Now.RZ.gaussMap`, `ModularSurface.Now.RZ.mayer`, so they cannot collide with the RZ ones.
5. **`scatteringRatio` and `riemannXiRZ` NOT restated.** Reason: no U8 spec uses them; the rows that would (L:MS-41, L:MS-44) are shared rows, counted by their RZ twins (L:RZ-46a, L:RZ-49) and carry no statement here. The dispatch listed them under "where the spec names one", and no spec does. If the orchestrator wants them carried for a later row, adding them is a byte-copy from `RiemannZeta/ZetaL/Challenge.lean` and changes the digest.
6. **Module docstring** added at the top (paper, PDF digest, the in-scope / OUT-OF-Q5 split, the eight shared rows, the self-containment note). Reason: the RZ units' form.

No statement departs from its spec's Lean text. Out-of-Q5 rows (MS-09b, 14b, 14c, 32b) are stated like the rest and say so in their docstrings.

## Digest (statements phase)
- `Challenge.lean` sha256 `648a9eecd38f30ab6be4905c53fee7d7f41e1fafb57930717037f44da308f2f2` (after B3, `shasum -a 256`) → `formalization.yaml` `statement_sha256_draft:` (V₂ signs `statement_sha256:`).
- `comparator.json` parsed as JSON (`python3 -I`); `formalization.yaml` parsed as YAML (ruby, 16 rows, the digest field read back).
- `comparator.json` `theorem_names` = all 16 theorems for now; the proofs seat trims it.

## Row table
| row | theorem | status | scope |
|---|---|---|---|
| L:MS-02 | `ms_02_triangleFamily` | STATED | in |
| L:MS-03 | `ms_03_heckeFamily` | STATED | in |
| L:MS-05 | `ms_05_fixedPoints_F2` | STATED | in |
| L:MS-07 | `ms_07_selbergNorm_F2` | STATED | in |
| L:MS-09a | `ms_09a_goldenRatio_sq` | STATED | in |
| L:MS-09b | `ms_09b_fundamental_automorph` | STATED | OUT-OF-Q5 (re-weigh at the IsLeast cost, about E1) |
| L:MS-13 | `ms_13_smallest_fundDisc` | STATED | in |
| L:MS-14a | `ms_14a_listed_in_negPellSet` | STATED | in |
| L:MS-14b | `ms_14b_negPellSet_infinite` | STATED | OUT-OF-Q5 |
| L:MS-14c | `ms_14c_negPellSet_initial` | STATED | OUT-OF-Q5 |
| L:MS-22 | `ms_22_halfSystole` | STATED | in |
| L:MS-24b | `ms_24b_geometryConstant_approx5` | STATED | in |
| L:MS-25 | `ms_25_productRelation_logCollapse` | STATED | in |
| L:MS-32a | `ms_32a_certificate_max_and_next_rung` | STATED | in |
| L:MS-32b | `ms_32b_certificate_max_fields` | STATED | OUT-OF-Q5 |
| L:MS-39 | `ms_39_mayer_on_constant` | STATED | in |

## Notes for V₂ and the proofs phase
- The proofs seat should keep `hurwitzZeta φ` out of every step that touches MS-39's last conjunct: `ms39HurwitzClassical` is the classical series, and mathlib's periodic one differs at a = φ (V₁).
- MS-05's statement carries a `by norm_num [Matrix.det_fin_two_of]` proof of det ≠ 0 inside the `let`, as the spec writes it; it elaborates.
- Shell slip, declared: one scratch write went to `/tmp/x` (a throwaway grep output, no content of value) and was removed in the next call.
- seat closed 2026-10-28T18:02:21Z

---

# PHASE proofs — seat L (proofs), Orchestrator A dispatch 2026-10-28

- seat opened 2026-10-28T18:10:58Z (`date -u`)
- `shasum -a 256 Challenge.lean` at open: `648a9eecd38f30ab6be4905c53fee7d7f41e1fafb57930717037f44da308f2f2` = `statement_sha256` (V₂ signed 2026-10-28T18:07:07Z). Challenge.lean is not edited by this seat.
- Method (CO ruling): Solution.lean is generated from Challenge.lean by a script that replaces each `sorry` body with its proof; Solution imports Mathlib only (not Challenge); all non-theorem declarations carried byte-identically; block-wise byte comparison at close.
- Scratch iteration (outside the repo, `lake env lean` on a generated draft, ~5 s per pass): L:MS-09a, 07, 25, 22, 24b, 03, 13, 14a, 02, 05, 32a, 39 each elaborated in turn. One dead end recorded: `decide` on `Squarefree n` does not reduce at the pin (`Nat.minSqFac` is well-founded recursion); replaced by an in-proof bound (`∀ k ∈ Finset.Icc 2 n, ¬ k * k ∣ n` by `decide`, then the definition of `Squarefree` on ℕ). One timeout recorded: `interval_cases` + `simp_all` carrying a `Squarefree` hypothesis (MS-32a set equality) hit 200000 heartbeats; replaced by `omega` case splits.
- lake build #1 (in-scope twelve; the four OUT-OF-Q5 theorems left out): 2026-10-28T18:17:21Z → exit 1, first error `Solution.lean:653:0: unterminated comment` (generator slip: dropping an omitted theorem stopped at a blank line inside its docstring; generator fixed to drop from the `/--` line).
- lake build #2: 2026-10-28T18:17:50Z → 18:17:57Z, exit 0, no `sorry`; warnings: two long lines, two `push_neg` deprecations (style only). Axioms (collectAxioms over the module): every one of the twelve in {propext, Classical.choice, Quot.sound}.
- Out-of-Q5 attempts (after the twelve): L:MS-09b proved (t² − 5u² = 4 read over ℝ as (t + u√5)(t − u√5) = 4; the conjugate lies in (0, 2), so u ≥ 1 and t ≥ 3). L:MS-14b proved (n = N!, n² + 1 = b²k with k squarefree by `Nat.sq_mul_squarefree`; k ≠ 1; every prime factor of k exceeds N; (n, b) solves x² − ky² = −1 — so `ms14NegPellSet` is not bounded above). L:MS-14c proved (each d ≤ 37 off the list: a square factor 2², 3² or 5², or a prime p ∈ {3, 7, 11, 19, 23, 31}, p ≡ 3 mod 4, dividing d, with −1 and −4 non-squares mod p by `decide` on `ZMod p`; d = 34 by descent along the unit 35 + 6√34, (x, y) ↦ (35|x| − 204|y|, 35|y| − 6|x|), strictly decreasing |y|, for both −1 and −4). One dead end recorded: inside `first | …`, `norm_num` on a false divisibility left the goal `False` without failing, so a wrong alternative was taken; replaced by `decide`.
- L:MS-32b attempted and left out: the bound needs discr K ≥ 5 over every real quadratic K, and the pin's Minkowski bound (`NumberField.abs_discr_ge'`) evaluates to 4 at r₂ = 0, n = 2 — excluding discr K = 4 needs the quadratic ring of integers or a Galois-conjugate argument on an integral basis, neither at the pin; the attainment needs `NumberField.discr` of ℚ(√5) = 5, and the pin computes no quadratic-field discriminant. Statement frozen in Challenge.lean as signed; absent from Solution.lean; removed from `comparator.json` `theorem_names`; recorded under `statements_not_checked:` in `formalization.yaml`. Not weakened.
- lake build #3 (fifteen theorems): 2026-10-28T18:24:02Z → 18:24:10Z, exit 0, zero warnings. A scan then found the word `sorry` inside Solution's own module docstring (it would trip `tools/check.sh`'s word grep); docstring reworded ("placeholder proof body").
- lake build #4 (final): 2026-10-28T18:25:08Z → 18:25:16Z, exit 0 ("Build completed successfully (8706 jobs)"), zero warnings, zero errors. `/usr/bin/grep -nwiE 'sorry|admit|native_decide'` on Solution.lean: no hits; no `axiom` declaration.
- Block-wise byte comparison (independent script: Solution's proof bodies stripped back to `sorry`, compared block by block with Challenge minus the one left-out theorem): 43 blocks vs 43; 15 theorem statements and 10 definition blocks (all 13 defs) IDENTICAL; the script flags a one-token mutation in a def and in a statement (tested).
- `#print axioms` (lake env lean on a scratch file importing `ModularSurface.Now.Solution`), verbatim:
```
'ModularSurface.Now.ms_02_triangleFamily' depends on axioms: [propext, Classical.choice, Quot.sound]
'ModularSurface.Now.ms_03_heckeFamily' depends on axioms: [propext, Classical.choice, Quot.sound]
'ModularSurface.Now.ms_05_fixedPoints_F2' depends on axioms: [propext, Classical.choice, Quot.sound]
'ModularSurface.Now.ms_07_selbergNorm_F2' depends on axioms: [propext, Classical.choice, Quot.sound]
'ModularSurface.Now.ms_09a_goldenRatio_sq' depends on axioms: [propext, Classical.choice, Quot.sound]
'ModularSurface.Now.ms_09b_fundamental_automorph' depends on axioms: [propext, Classical.choice, Quot.sound]
'ModularSurface.Now.ms_13_smallest_fundDisc' depends on axioms: [propext, Classical.choice, Quot.sound]
'ModularSurface.Now.ms_14a_listed_in_negPellSet' depends on axioms: [propext, Classical.choice, Quot.sound]
'ModularSurface.Now.ms_14b_negPellSet_infinite' depends on axioms: [propext, Classical.choice, Quot.sound]
'ModularSurface.Now.ms_14c_negPellSet_initial' depends on axioms: [propext, Classical.choice, Quot.sound]
'ModularSurface.Now.ms_22_halfSystole' depends on axioms: [propext, Classical.choice, Quot.sound]
'ModularSurface.Now.ms_24b_geometryConstant_approx5' depends on axioms: [propext, Classical.choice, Quot.sound]
'ModularSurface.Now.ms_25_productRelation_logCollapse' depends on axioms: [propext, Classical.choice, Quot.sound]
'ModularSurface.Now.ms_32a_certificate_max_and_next_rung' depends on axioms: [propext, Classical.choice, Quot.sound]
'ModularSurface.Now.ms_39_mayer_on_constant' depends on axioms: [propext, Classical.choice, Quot.sound]
```
- `comparator.json` `theorem_names`: the fifteen proved theorems (ms_32b removed). `formalization.yaml`: fifteen rows PROVED, L:MS-32b STATED; `statements_not_checked:` and `proofs_phase:` added. Comparator itself not run by this seat (`tools/check.sh` writes `manifests/`, outside this seat's write paths).

### Row table (proofs phase)
| row | theorem | status |
|---|---|---|
| L:MS-02 | `ms_02_triangleFamily` | PROVED |
| L:MS-03 | `ms_03_heckeFamily` | PROVED |
| L:MS-05 | `ms_05_fixedPoints_F2` | PROVED |
| L:MS-07 | `ms_07_selbergNorm_F2` | PROVED |
| L:MS-09a | `ms_09a_goldenRatio_sq` | PROVED |
| L:MS-09b | `ms_09b_fundamental_automorph` | PROVED (OUT-OF-Q5) |
| L:MS-13 | `ms_13_smallest_fundDisc` | PROVED |
| L:MS-14a | `ms_14a_listed_in_negPellSet` | PROVED |
| L:MS-14b | `ms_14b_negPellSet_infinite` | PROVED (OUT-OF-Q5) |
| L:MS-14c | `ms_14c_negPellSet_initial` | PROVED (OUT-OF-Q5) |
| L:MS-22 | `ms_22_halfSystole` | PROVED |
| L:MS-24b | `ms_24b_geometryConstant_approx5` | PROVED |
| L:MS-25 | `ms_25_productRelation_logCollapse` | PROVED |
| L:MS-32a | `ms_32a_certificate_max_and_next_rung` | PROVED |
| L:MS-32b | `ms_32b_certificate_max_fields` | OPEN (NEEDS-DEVELOPMENT: no quadratic-field discriminant at the pin) — left out |
| L:MS-39 | `ms_39_mayer_on_constant` | PROVED |

- Counts: 15 of 16 proved; in scope 12 of 12; OUT-OF-Q5 3 of 4.
- `shasum -a 256 Challenge.lean` at close: `648a9eecd38f30ab6be4905c53fee7d7f41e1fafb57930717037f44da308f2f2` (= `statement_sha256`, unchanged). `Solution.lean` sha256: `f7eff0776a46032100ec9071f808fc919465c10d97e64e02f278d1acdb626e0f`.
- seat closed 2026-10-28T18:26:07Z

---

# ms_32b revisit — proofs phase (seat L, the wall's word 3, 2026-10-28)

- seat opened 2026-10-28T22:36Z (`date -u`); closed 2026-10-28T22:40:03Z.
- `shasum -a 256 Challenge.lean` at open and at close: `648a9eecd38f30ab6be4905c53fee7d7f41e1fafb57930717037f44da308f2f2` (= `statement_sha256`; M revisit STANDS 2026-10-28T22:33:11Z). Challenge.lean is not edited by this seat.
- Route as taken (M's seven steps, `specs/MS-32b.md` §"M revisit"): `open IntermediateField NumberField Polynomial in ( … )` inside the tactic block; `refine ⟨?_, ?_⟩`. Bound: `have h5le : 5 ≤ NumberField.discr K` by U9's δ route (r₂ = 0; d_K > 0 by `sign_discr`; d_K ≥ 4 by `abs_discr_ge'`; d_K ≠ 4 by δ = den(D₀)·(2α + c₁), δ integral, δ ∉ ℚ, δ² = D, discr(1, δ) = 4D = m²·d_K), then `exact_mod_cast` to ℝ, `unfold ms32Gc`, `one_div_le_one_div_of_le` + `mul_le_mul_of_nonneg_left (Real.sqrt_le_sqrt h5R) Real.pi_pos.le`. Attainment: `let _ : NumberField ℚ⟮(√5 : ℝ)⟯` (`let`, not `letI`), U9's power basis θ = (5 + √5)/2 (Eisenstein at 5, ℤ[θ] = 𝓞_K, `hdiscK : discr K = 5`, `hfin : finrank ℚ K = 2`), the real place (`hreal`, `hnrC`), closed by `exact ⟨K, inferInstance, inferInstance, nrComplexPlaces_eq_zero_iff.mp hnrC, hfin, hdiscK⟩`.
- Copied U9 line ranges (`RiemannZeta/Provenance/Solution.lean` at HEAD, last touched by `c856d59`), assembled by `sed` from the source, not retyped:
  - lines 33–37 — the body of `numberField_Q_sqrt5` (U9's byte-identical restatement of U4's instance), as the local `let` instance;
  - lines 1035–1160 — the ∀ conjunct of `rz_13_min_real_quadratic_discr` (the δ route), indented two columns into `have h5le`;
  - lines 1163–1316 — the power-basis computation and the real place (U9's copy of `RiemannZeta/MatricesMobius/Solution.lean` 1831–1970, U4's `rz_64c_conductor_one`), at their own indentation.
- Departures (declared): (1) U8 restates U9's steps inside the proof — `have`s and one local instance, no new top-level declaration, no import of any other unit; (2) one line of the copied δ route (`htrδ2`'s `rw [… Algebra.trace_algebraMap, hK2]`) re-wrapped after `Algebra.trace_algebraMap,` because the two-column indent took it to 102 characters (`linter.style.longLine` warning at build #1); tokens unchanged; (3) U9's comment at line 1161–1162 replaced by this unit's provenance comment, and U9's line 1317 `exact ⟨…⟩` replaced by the ∃ pack. The assembled theorem matches M's probe (`m-ms32b/probe_full.lean`, sha256 `3b1b487c…7f24`) token for token; only comments differ.
- Name check at the pin (M's sitting-71 form, `grep -rn` under `.lake/packages/mathlib/Mathlib/`): `one_div_le_one_div_of_le` (root) Algebra/Order/Field/Basic.lean:69 · `Real.sqrt_le_sqrt` (`Real`) Analysis/Real/Sqrt.lean:209 · `Real.pi_pos` (`Real`) Analysis/SpecialFunctions/Trigonometric/Basic.lean:157 · `mul_le_mul_of_nonneg_left` (root) Algebra/Order/GroupWithZero/Defs.lean:226; the rest are the U9-proved steps, elaborating unchanged at `K : Type`.
- lake build #1: 2026-10-28T22:37:58Z → 22:38:20Z, exit 0, one warning (the long line above). lake build #2: → 22:38:51Z, exit 0, "Build completed successfully (8706 jobs)", zero warnings, zero errors. Default heartbeat budget; no option changes.
- `/usr/bin/grep -nE 'native_decide|sorry|admit|axiom|opaque|set_option'` on Solution.lean: no hits.
- Statement comparison: the ms_32b block (section header through `:= by`) is byte-identical between Challenge and Solution; every Challenge line after `namespace` except the `sorry` lines occurs in Solution in order (252 lines); 16 theorems in each.
- `#print axioms` (`lake env lean` on a scratch file importing `ModularSurface.Now.Solution`, 22:39:05Z), verbatim:
```
'ModularSurface.Now.ms_32b_certificate_max_fields' depends on axioms: [propext, Classical.choice, Quot.sound]
```
- Records: `comparator.json` `theorem_names` gains `ModularSurface.Now.ms_32b_certificate_max_fields` (16). `formalization.yaml`: L:MS-32b STATED → PROVED, scope OUT-OF-Q5 (pending the wall) kept — proved beyond scope; `statements_not_checked: []` with a `statements_not_checked_history:` line (Bridge precedent); `proofs_phase` theorems_proved 15 → 16, in_scope_proved 12 (unchanged), ms_32b added to `out_of_q5_proved`. Solution's module docstring no longer lists ms_32b as left out. `tools/check.sh` not run by this seat.
- Counts: 16 of 16 proved; in scope 12 of 12; OUT-OF-Q5 4 of 4. Row table above: L:MS-32b now reads PROVED (OUT-OF-Q5), by this section.
- `Solution.lean` sha256 at close: `e5ae994bb1bdf754f548e7aaef5824d944d287f1221c303d00144e4e75d8455c`.
