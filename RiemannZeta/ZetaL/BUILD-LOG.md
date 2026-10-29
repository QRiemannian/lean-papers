# BUILD-LOG — unit U3 (`RiemannZeta/ZetaL`)

Seat L (Lean coder), PHASE STATEMENTS, brief `Orchestrator/Chat-Design/cc-handoff/projects/reputation-play/lean-scoping/seats/L-statements-U3-2026-10-28.md`. Clocks from `date -u`. No git, no web.

- seat opened 2026-10-28T17:21:19Z; this file (first artefact) 2026-10-28T17:21:49Z
- inputs read: `specs/_UNIT-U3.md`, `specs/_V1-U3.md`, the 13 spec files (RZ-15, 16, 17, 21, 32a, 32b, 33a, 33b, 34, 46a, 47, 49, 60); V₁ verdicts: 11 GREEN in Q5 · RZ-32b GREEN OUT-OF-Q5 · RZ-33b V1-CC (no theorem).

## Builds

- **B1** 2026-10-28T17:22:37Z → 17:22:53Z — `lake build RiemannZeta.ZetaL.Challenge` · exit **0** · `Build completed successfully (8706 jobs)`, Challenge 11 s · first error: none · warnings: 14 × `declaration uses 'sorry'` (one per theorem), nothing else.
- **inspect** 17:22:59Z → 17:23:06Z — scratch file (scratchpad, outside the repo) `import RiemannZeta.ZetaL.Challenge` + `#print zetaChi` + `#check` with `pp.coercions` / `pp.numericTypes` on RZ-16, 32a, 33a, 34, 46a (o), 46a (i), 47 · exit 0 · each elaborates to the spec's statement: `zetaChi` = `(2 : ℂ) ^ s * ↑π ^ (s − 1) * Complex.sin (↑π * s / 2) * Complex.Gamma (1 − s)`; the 46a exclusions read `s ≠ -((2 : ℂ) * ↑n)`, `s ≠ -↑n`, `s ≠ (1/2 : ℂ) − ↑n`; RZ-47's non-triviality is `¬∃ n, ρ = (-2 : ℂ) * (↑n + 1)` (RiemannHypothesis's own form); RZ-34's `↑↑p` is `Nat.Primes → ℕ → ℂ` as at `riemannZeta_eulerProduct_hasProd`; RZ-16's bound prints `5e-5` (ℝ). No error.
- **index** 2026-10-28T17:23:40Z — `RiemannZeta.lean` re-read immediately before the append (two lines: the header comment + `import RiemannZeta.Pilot.Challenge`); `import RiemannZeta.ZetaL.Challenge` appended with `>>`, existing lines kept.
- **B2** 2026-10-28T17:23:46Z → 17:23:59Z — `lake build RiemannZeta` · exit **0** · `Build completed successfully (8710 jobs)` · first error: none · warnings: 37 × `sorry` = 14 ZetaL + 10 Pilot + 13 `RiemannZeta/Bridge/Challenge.lean` (another seat's unit, built through the lean_lib glob `RiemannZeta.*`, not through the index) + 1 `linter.style.longLine` on `RiemannZeta.lean:1` — the index's pre-existing header comment, not this seat's line; left as found for the orchestrator.
- **B3** 2026-10-28T17:23:59Z → 17:24:02Z — `lake build RiemannZeta.ZetaL.Challenge` (final) · exit **0** · `Build completed successfully (8706 jobs)` · first error: none · warnings: 14 × `sorry`, nothing else.

## Digest (statements phase)
- `Challenge.lean` sha256 `0e7e6ca90da4fd55d8162c8f4a7b6c46dd11fbf456d473288fc6a5b0d143fb63` (re-hashed after B3, unchanged) → `formalization.yaml` `statement_sha256_draft:` (V₂ signs `statement_sha256:`).

## Row table
| row | theorem(s) | status |
|---|---|---|
| L:RZ-15 | `rz_15_geometryConstant_writings` | STATED |
| L:RZ-16 | `rz_16_geometryConstant_approx` | STATED |
| L:RZ-17 | `rz_17_quaternary_product` | STATED |
| L:RZ-21 | `rz_21_zeta_two_four` | STATED |
| L:RZ-32a | `rz_32a_correction_q_form` | STATED |
| L:RZ-32b | `rz_32b_zeta_three_q_form` | STATED — OUT-OF-Q5 (pending the wall), NEEDS-DEVELOPMENT; docstring says so |
| L:RZ-33a | `rz_33a_functional_equation` | STATED |
| L:RZ-33b | — | OPEN (V1-CC, correction track; no theorem by rule) |
| L:RZ-34 | `rz_34_euler_product` | STATED |
| L:RZ-46a | `rz_46a_o_lambda_convention`, `rz_46a_i_expansion`, `rz_46a_ii_iii_xi_factor` | STATED |
| L:RZ-47 | `rz_47_zero_gives_pole` | STATED |
| L:RZ-49 | `rz_49_norm_factor_eq_one` | STATED |
| L:RZ-60 | `rz_60_golden_identities` | STATED |

## Notes for V₂ and the proofs phase
- Every statement is the V₁-signed spec signature verbatim, inside `namespace RiemannZeta.ZetaL` (so `geometryConstant`, `zetaChi`, `scatteringRatio`, `riemannXiRZ` cannot collide with another unit's names in the index); `comparator.json` carries the fully-qualified names.
- One theorem per row, except **L:RZ-46a**, whose V₁-green spec signs three theorems ((o), (i), (ii)–(iii)); kept as signed rather than conjoined.
- The four defs are definitions with bodies, not holes — no `definition_names` in `comparator.json`. `formalization.yaml` lists them under an added `definitions:` key (informational; the Pilot record has no such key).
- RZ-46a (iii): `riemannXiRZ` carries V₁'s note in its docstring — it equals the paper's entire ξ only off {0, 1}; (iii) is stated as the spec's meromorphic identity (s ≠ 0, 1/2), as V₁ asked.
- RZ-32b is in `theorem_names` so a proof, if the wall admits it, is checked like the rest.
- **Proofs-phase flag (same as U1's):** a `Solution` that imports `Challenge` in the same namespace cannot re-declare the theorem names Comparator expects; the proofs seat will want `Solution` without that import (restating the four defs identically), or a ruling on the import line. Not acted on here.

STATEMENTS-PHASE CLOSE 2026-10-28T17:24:31Z — seat L, unit U3.

---

# PHASE PROOFS — seat L, unit U3 (opened 2026-10-28T17:30:09Z)

Ruling applied (CO, 2026-10-28): `Solution.lean` begins `import Mathlib`, does NOT import `Challenge`, opens `namespace RiemannZeta.ZetaL`, restates the four definitions (`geometryConstant`, `zetaChi`, `scatteringRatio`, `riemannXiRZ`) byte-identically (block diffed against `Challenge.lean`: identical), and proves each theorem under its identical name and statement text. The module is generated from `Challenge.lean` by replacing each `sorry` body with its proof, so every statement is copied, never retyped; a post-build regex comparison of the 13 statements against `Challenge.lean` reports zero mismatches. `Challenge.lean` untouched: sha256 `0e7e6ca90da4fd55d8162c8f4a7b6c46dd11fbf456d473288fc6a5b0d143fb63` before and after (= V₂'s `statement_sha256`).

## Builds
- 2026-10-28T17:32:35Z — `lake env lean` on a scratch copy (10 easy rows): 3 errors (RZ-32a rewrite target, RZ-46a (ii) `ring` after a closing `field_simp`, RZ-60 `inv_pow` direction). Fixed.
- between 2026-10-28T17:32:35Z and 17:35:44Z (this elaboration's own clock was not captured) — `lake env lean` on a scratch copy (all 13): 4 errors, all in RZ-47 (`ContinuousAt.comp` unification, `AnalyticOnNhd` field, a `field_simp` side condition s ≠ 0, the norm congruence). Fixed; the next elaboration was silent (no errors, no warnings).
- 2026-10-28T17:35:44Z → 17:35:58Z — `lake build RiemannZeta.ZetaL.Solution` — **exit 0**; first message: 4 style warnings (`linter.style.longLine`, lines 135/154/181/395). Lines wrapped.
- 2026-10-28T17:36:14Z → 17:36:56Z — `lake build RiemannZeta.ZetaL.Solution` — **exit 0**, no warnings.
- 2026-10-28T17:38:02Z → 17:38:36Z — `lake build RiemannZeta.ZetaL.Solution` — **exit 0**, no warnings (after rewording the RZ-32b note so the word for an unproved placeholder appears nowhere in the file). Final.
- Token scan of `Solution.lean` (`/usr/bin/grep -nwE "sorry|admit|axiom|native_decide|set_option"`): no matches.
- `Solution.lean` sha256 (final): `4e6a1c47e4e54b28d4bbe6ddfafaca23d843e737b99ca43af0a3d654036f9534` (437 lines).

## Row table (proofs phase)
| row | theorem(s) | status | route |
|---|---|---|---|
| L:RZ-15 | `rz_15_geometryConstant_writings` | PROVED | subst; `field_simp`; `ring` |
| L:RZ-16 | `rz_16_geometryConstant_approx` | PROVED | `Real.pi_gt_d6`/`Real.pi_lt_d6`, 2.236 < √5 < 2.236068, product bounds, `nlinarith` |
| L:RZ-17 | `rz_17_quaternary_product` | PROVED | `rfl` + `field_simp` |
| L:RZ-21 | `rz_21_zeta_two_four` | PROVED | `riemannZeta_two`, `riemannZeta_four` |
| L:RZ-32a | `rz_32a_correction_q_form` | PROVED | termwise q^k = (e^{2πk})⁻¹, `div_mul_cancel_right₀`; tsum by `congr` |
| L:RZ-32b | `rz_32b_zeta_three_q_form` | **OUT-OF-Q5 / NOT PROVED** — left out of `Solution.lean` entirely (Ramanujan's ζ(3), L:RZ-26, not at the pin; pending the wall) | — |
| L:RZ-33a | `rz_33a_functional_equation` | PROVED | `riemannZeta_one_sub` at 1 − s; cos(π(1−s)/2) = sin(πs/2); `Complex.mul_cpow_ofReal_nonneg` + `Complex.cpow_add` (no Gamma reflection needed) |
| L:RZ-33b | — | OPEN (V1-CC, correction track; no theorem by rule) | — |
| L:RZ-34 | `rz_34_euler_product` | PROVED | `riemannZeta_eulerProduct_hasProd` |
| L:RZ-46a | `rz_46a_o_lambda_convention`, `rz_46a_i_expansion`, `rz_46a_ii_iii_xi_factor` | PROVED (all three) | (o) `riemannZeta_def_of_ne_zero` + `Complex.Gammaℝ_eq_zero_iff`; (i) (o) at 2s − 1 and 2s; (ii)–(iii) `field_simp`, `mul_div_mul_comm` |
| L:RZ-47 | `rz_47_zero_gives_pole` | PROVED | strip 0 < Re ρ < 1 from `riemannZeta_ne_zero_of_one_le_re` + `completedRiemannZeta_one_sub` + `Complex.Gammaℝ_ne_zero_of_re_pos`; numerator Λ(ρ−1) = Λ(2−ρ) ≠ 0 (`riemannZeta_ne_zero_of_one_lt_re`); denominator's zeros isolated via the entire H(s) = 2s(1−2s)Λ₀(2s) − 1 (H(0) = −1, `eventually_eq_zero_or_eventually_ne_zero` + identity theorem on univ); ‖φ‖ → ∞ via `tendsto_norm_nhdsNE_zero`, `inv_tendsto_nhdsGT_zero`, `Tendsto.pos_mul_atTop`, `tendsto_norm_atTop_iff_cobounded`. The meromorphic-order lemma the spec names was not needed. |
| L:RZ-49 | `rz_49_norm_factor_eq_one` | PROVED | `norm_div`, `Complex.norm_def`, `normSq_apply`, `ring` |
| L:RZ-60 | `rz_60_golden_identities` | PROVED | `Real.inv_goldenRatio`, `goldenRatio_sq`, `goldenConj_sq`, `goldenRatio_sub_goldenConj`, `Real.log_pow` |

No row needed a statement change: no `STATEMENT-CHANGE-NEEDED` entries. No row left OPEN for time.

## Flag for the orchestrator (not acted on)
- `comparator.json` `theorem_names` still lists `RiemannZeta.ZetaL.rz_32b_zeta_three_q_form`, which `Solution.lean` does not contain (by the brief). A Comparator run over the unit as listed will report it missing; the list is left as V₂ signed it, pending the wall's word on RZ-32b (drop it from `theorem_names` while OUT-OF-Q5, or keep it and read that one line as the expected miss).

## `#print axioms` (2026-10-28T17:39Z, `lake env lean` on a scratch file importing `RiemannZeta.ZetaL.Solution`; exit 0)
```
'RiemannZeta.ZetaL.rz_15_geometryConstant_writings' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.ZetaL.rz_16_geometryConstant_approx' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.ZetaL.rz_17_quaternary_product' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.ZetaL.rz_21_zeta_two_four' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.ZetaL.rz_32a_correction_q_form' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.ZetaL.rz_33a_functional_equation' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.ZetaL.rz_34_euler_product' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.ZetaL.rz_46a_o_lambda_convention' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.ZetaL.rz_46a_i_expansion' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.ZetaL.rz_46a_ii_iii_xi_factor' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.ZetaL.rz_47_zero_gives_pole' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.ZetaL.rz_49_norm_factor_eq_one' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.ZetaL.rz_60_golden_identities' depends on axioms: [propext, Classical.choice, Quot.sound]
```

PROOFS-PHASE CLOSE 2026-10-28T17:40:21Z — seat L, unit U3: 13 of 13 in-scope theorems PROVED (11 rows), final `lake build` exit 0.

## Repair session — L:RZ-46a (ii)–(iii), the s = 1 point (seat M + L folded, under the orchestrator's brief)

- **Opened** 2026-10-28T17:51:52Z · **closed** 2026-10-28T17:54:41Z (both `date -u`). No git, no web, nothing under the lab's non-public research trees.
- **Cause:** `specs/_V3-U3.md`, V3-FINDING rz_46a_ii_iii_xi_factor — at s = 1 the (iii) conjunct held as 0 = 0 only because the local `riemannXiRZ 1 = 0`, where the paper's entire ξ has ξ(1) = 1/2 and the meromorphic identity's value is ξ(1)/ξ(2) = 3/π. The repair adds `(hs1 : s ≠ 1)` (s = 1 is φ's pole; the printed identity is meromorphic). The shared `riemannXiRZ` is unchanged.
- **Spec:** `specs/RZ-46a.md` amended (§3 Domains, §5 prose and Lean block) with a dated `M-amend:` line and a fresh `V1:` line for the amended statement.
- **Hashes (sha256):**

| file | open | close |
|---|---|---|
| `Challenge.lean` | `0e7e6ca90da4fd55d8162c8f4a7b6c46dd11fbf456d473288fc6a5b0d143fb63` | `a0b6518b7199d940ab263aa8b512927e3a2ac8ab84e87992ab65f8c6e0ac32af` |
| `Solution.lean` | `4e6a1c47e4e54b28d4bbe6ddfafaca23d843e737b99ca43af0a3d654036f9534` | `6221b95db5dc1fa4ee74f390c8536e1f4fde188fbeccedc478c3b920af4d4977` |

- **Statement diff** (identical hunk in both files; Challenge shown):
```diff
-ξ(2s − 1)/ξ(2s) = ((s − 1)/s) · φ(s). Stated as the meromorphic identity of the spec (s ≠ 0, 1/2).
+ξ(2s − 1)/ξ(2s) = ((s − 1)/s) · φ(s). Stated as the meromorphic identity of the spec
+(s ≠ 0, 1/2, 1).
@@
-theorem rz_46a_ii_iii_xi_factor (s : ℂ) (h₀ : s ≠ 0) (h₁ : s ≠ 1 / 2) :
+theorem rz_46a_ii_iii_xi_factor (s : ℂ) (h₀ : s ≠ 0) (h₁ : s ≠ 1 / 2) (hs1 : s ≠ 1) :
```
  The docstring line is the theorem's own restatement of its hypotheses, rewrapped to stay under the 100-character linter limit. The Challenge body stays `sorry`. The Solution proof is unchanged: it does not use `hs1`, and the build raised no unused-variable warning. The docstring-plus-signature blocks of the two files are byte-identical (`diff` of the two blocks: empty).
- **Build:** `lake build RiemannZeta.ZetaL.Challenge RiemannZeta.ZetaL.Solution` → `Build completed successfully (8707 jobs).`, exit 0. Solution: no warnings, 0 occurrences of `sorry` (`/usr/bin/grep -c`). Challenge: the expected `declaration uses 'sorry'` warnings and the pre-existing header-copyright lint.
- **Axioms** (`lake env lean` on a scratch file importing `RiemannZeta.ZetaL.Solution`; exit 0):
```
'RiemannZeta.ZetaL.rz_46a_ii_iii_xi_factor' depends on axioms: [propext, Classical.choice, Quot.sound]
```
- **Record:** `formalization.yaml` `statement_sha256_draft` now `a0b6518b…`; the signed `statement_sha256` line (`0e7e6ca9…`) kept, marked `superseded_by_repair: "2026-10-28"` on its own line. `comparator.json` stores theorem names only, so it is unchanged.
- **Left as found (outside the brief's "touch nothing else"):** the `riemannXiRZ` docstring note in both files still reads "with s ≠ 0, 1/2", and the Solution header still names Challenge sha256 `0e7e6ca9…`. Both are now stale wording, carried to the orchestrator.

Repair decided by the orchestrator under the 2026-09-03 lifted-bar ruling; the row returns through V₂.

- 2026-10-28T17:55:30Z — orchestrator: the two stale bits above closed by hand (riemannXiRZ docstring note now reads s ≠ 0, 1/2, 1 in both files, byte-identical; Solution header names the new Challenge hash). Challenge.lean sha256 now `7200988ea94a50a995e69adf8e7d44c480cd72423c24fd00da215bf1e9301a27`, Solution.lean `cb84523f6ab59f77ff2e13bb0dd7a4036a9d868a184618d21a958d61b1dad64a`; the draft line updated; the fresh V₂ re-signs this digest.

- 2026-10-28T17:59:36Z — orchestrator: the superseded digest pair renamed `statement_sha256_superseded:` / `v2_signed_superseded:` so check.sh arm 5 (first `statement_sha256:` match) reads the re-signed digest 7200988e… and the mapping has no duplicate keys; the old values are kept verbatim. Re-signed by a fresh V₂ at 17:57:38Z (specs/_V2-U3-resign.md).
