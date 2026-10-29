# BUILD-LOG — unit U7 (`RiemannZeta/SmallArith`)

Seat L (Lean coder), PHASE STATEMENTS, brief `Orchestrator/Chat-Design/cc-handoff/projects/reputation-play/lean-scoping/seats/L-statements-U7-2026-10-28.md`. Clocks from `date -u`. No git, no web.

- seat opened 2026-10-28T17:35:13Z; this file (first artefact) 2026-10-28T17:35:46Z
- inputs read: `specs/_UNIT-U7.md`, `specs/_V1-U7.md`, the 7 spec files (RZ-24, 38, 44a, 76a, 76b, 77a, 77b); U3's `RiemannZeta/ZetaL/Challenge.lean` for `riemannXiRZ` and the record schema. V₁ verdicts: 5 GREEN in Q5 (RZ-24, 38, 44a, 76a, 77a) · RZ-76b NOT A LEAN TARGET · RZ-77b OUT-OF-Q5, NEEDS-DEVELOPMENT (prose only, no signature).

## Builds

- **B1** 2026-10-28T17:36:23Z → 17:37:13Z — `lake build RiemannZeta.SmallArith.Challenge` · exit **0** · `Build completed successfully (8706 jobs)`, Challenge 44 s · first error: none · warnings: 5 × `declaration uses 'sorry'` (one per theorem) + 2 × `linter.style.longLine` at lines 25–26 (the `orbEulerChar` docstring as the spec wrote it, > 100 chars). Docstring reflowed (text unchanged; no signature touched) → B2.
- **B2** 2026-10-28T17:37:27Z → 17:37:57Z — `lake build RiemannZeta.SmallArith.Challenge` · exit **0** · `Build completed successfully (8706 jobs)`, Challenge 25 s · first error: none · warnings: 5 × `declaration uses 'sorry'`, nothing else.
- **inspect** 17:38:04Z → 17:38:31Z — scratch file (scratchpad, outside the repo) `import RiemannZeta.SmallArith.Challenge` + `#check` with `pp.numericTypes` / `pp.coercions` on RZ-24, 44a, 76a, 77a + `#print orbEulerChar` · exit 0 · each elaborates to the spec's statement: RZ-24 (iv) reads `(PowerSeries.coeff n) Q = (0 : ℚ)` (index-first form at the pin, no adjustment needed); RZ-44a's `-1 / 6` is `(-1 / 6 : ℚ)` and `m` enters the list as `ℕ`, cast inside `orbEulerChar` to ℚ; RZ-76a's `π` is `Real.pi` (via `open Real in`), (12.5) sits in ℂ, (12.2) in ℚ, (12.3) and (12.6) in ℝ; RZ-77a's `let`s elaborate as `have M := …; have lam := …` over ℝ. No error.
- **index** 2026-10-28T17:38:36Z — `RiemannZeta.lean` re-read immediately before the append (header comment + Pilot, ZetaL, Bridge, NoGo imports); `import RiemannZeta.SmallArith.Challenge` appended with `>>` (guarded by an exact-line grep), existing lines kept.
- **B3** 2026-10-28T17:38:42Z → 17:39:58Z — `lake build RiemannZeta` · exit **0** · `Build completed successfully (8716 jobs)` · first error: none · warnings: 60 × `sorry` across the units the glob `RiemannZeta.*` builds (incl. other seats' `MatricesMobius`, `Bridge.Solution`), 1 × `longLine` on `RiemannZeta.lean:1` (the index's pre-existing header comment, not this seat's line) and 3 × `longLine` in `RiemannZeta/MatricesMobius/Challenge.lean` (another seat's file) — both left as found. No name collision: U7's `riemannXiRZ` lives in `RiemannZeta.SmallArith`, U3's in `RiemannZeta.ZetaL`.
- **B4** 2026-10-28T17:40:03Z → 17:40:09Z — `lake build RiemannZeta.SmallArith.Challenge` (final) · exit **0** · `Build completed successfully (8706 jobs)` (replayed) · first error: none · warnings: 5 × `sorry`, nothing else.

## Digest (statements phase)
- `Challenge.lean` sha256 `2031d927a8140337d7753b28688f9f1e309fea976472d6fba51507515927fa3f` (after B4) → `formalization.yaml` `statement_sha256_draft:` (V₂ signs `statement_sha256:`).
- `comparator.json` parsed as JSON (python3 -I); `formalization.yaml` parsed as YAML (ruby) — 17:40:27Z.

## Row table
| row | theorem | status |
|---|---|---|
| L:RZ-24 | `rz_24_bernoulli_gf_symmetry` | STATED |
| L:RZ-38 | `rz_38_xp_trajectories` | STATED |
| L:RZ-44a | `rz_44a_orbifold_euler_arith` | STATED |
| L:RZ-76a | `rz_76a_seven_eighths_arith` | STATED |
| L:RZ-76b | — | OPEN (NOT A LEAN TARGET, V₁-confirmed; no theorem by rule, uncounted) |
| L:RZ-77a | `rz_77a_casimir_arith` | STATED |
| L:RZ-77b | — | OPEN (OUT-OF-Q5 pending the wall, NEEDS-DEVELOPMENT: no Casimir element, no principal series, no derived action, no hyperbolic Laplacian on `UpperHalfPlane` at the pin; the V₁-signed spec is prose only — no statement elaborates with the pin's objects; uncounted) |

## Notes for V₂ and the proofs phase
- Every theorem statement is the V₁-signed spec signature verbatim, inside `namespace RiemannZeta.SmallArith`; docstrings extended with the served locus and PDF prefix (docstrings only). RZ-76a's signature uses `π`, so it carries `open Real in` (the spec: "shape only; `open Real`").
- Local definitions with bodies, not holes (no `definition_names` in `comparator.json`): `bernoulliGF` and `orbEulerChar` as the specs write them (`orbEulerChar`'s docstring reflowed for the 100-char linter, text unchanged), and `riemannXiRZ` restated identically to U3's (body byte-equal to `RiemannZeta/ZetaL/Challenge.lean:42`). RZ-76a's signed statement writes the Path B prefactor as the polynomial `fun s : ℂ => s * (s - 1) / 2`, not through `riemannXiRZ`; the def is carried because the signed docstring names it, and no theorem depends on it — V₂ may judge whether it stays.
- Proofs-phase pointers (not this phase): RZ-24 (iv) via `PowerSeries.ext`/`coeff_rescale` (coefficientwise ((−1)ⁿ − 1)qₙ = [n = 1]); RZ-38 (b) via `is_const_of_deriv_eq_zero` on x(t)e^{−t}; RZ-44a by `simp [orbEulerChar]` + `field_simp`/`linarith` with `1/m ≤ 1/7`; RZ-77a's max by `nlinarith [sq_nonneg (σ - 1/2)]`.
- seat closed 2026-10-28T17:40:52Z

---

# PHASE PROOFS — seat L (proofs), brief `Orchestrator/Chat-Design/cc-handoff/projects/reputation-play/lean-scoping/seats/L-proofs-U7-2026-10-28.md`

Clocks from `date -u`. No git, no web. Solution under the CO ruling (no import of Challenge; `import Mathlib`; same namespace; non-theorem declarations restated byte-identically).

- seat opened 2026-10-28T17:52:02Z
- sha at open: `shasum -a 256 Challenge.lean` = `2031d927a8140337d7753b28688f9f1e309fea976472d6fba51507515927fa3f` (equals the signed `statement_sha256`)
- `Solution.lean` first written between 2026-10-28T17:52:02Z and 17:53:23Z (stamp not taken at the write; bounded by the open stamp and P1), patched before P2, generated from `Challenge.lean` by a scratchpad script (outside the repo): the module docstring replaced, each `by sorry` replaced by its proof; everything from `namespace` on outside the five proof bodies is byte-identical to Challenge (script check 17:54Z: the five statement texts equal, the definitions block — `bernoulliGF`, `orbEulerChar`, `riemannXiRZ` — equal, the `open Real in` line and every docstring equal). No `import` of Challenge.

## Builds (proofs phase)

- **P1** 2026-10-28T17:53:23Z → 17:53:29Z — `lake build RiemannZeta.SmallArith.Solution` · exit **1** · first error: `Solution.lean:125:4: ring_nf made no progress on the goal` (RZ-38: `convert … using 1` split on instance paths, `Real.instAddCommGroup = Real.normedCommRing.toAddCommGroup`, leaving `ring` a non-ring goal; same at 131:6, 136:6) + 1 × `longLine` (68:100). RZ-24, RZ-44a, RZ-76a, RZ-77a elaborated without error in this build.
- **P2** 2026-10-28T17:53:49Z → 17:53:55Z — the three `convert … using 1; ring` replaced by `exact this.congr_deriv (by ring)`; the long line wrapped · exit **0** · `Build completed successfully (8706 jobs)` · first error: none · warnings: none (no `sorry`).
- **axioms** 2026-10-28T17:54:14Z → 17:54:18Z — scratchpad file `import RiemannZeta.SmallArith.Solution` + `#print axioms` per theorem, `lake env lean` · exit 0 · verbatim:

```
'RiemannZeta.SmallArith.rz_24_bernoulli_gf_symmetry' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.SmallArith.rz_38_xp_trajectories' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.SmallArith.rz_44a_orbifold_euler_arith' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.SmallArith.rz_76a_seven_eighths_arith' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.SmallArith.rz_77a_casimir_arith' depends on axioms: [propext, Classical.choice, Quot.sound]
```

- **P3** 2026-10-28T17:54:28Z → 17:54:31Z, replay 17:54:39Z — `lake build RiemannZeta.SmallArith.Solution` (final) · exit **0** · `Build completed successfully (8706 jobs)` · first error: none · warnings: 0. `/usr/bin/grep` for `sorry|admit|axiom|native_decide` in `Solution.lean`: no hits.

## How each row closed
- **RZ-24**: (i) case split on t = 0; off zero, e^{−t} − 1 = (1 − eᵗ)/eᵗ, `Real.exp_eq_one_iff` for the nonzero denominators, `field_simp; ring`. (ii) from (i) by `linarith`. (iii) coefficientwise: `evalNegHom` = `rescale (-1)`, `coeff_rescale` gives ((−1)ⁿ − 1)·Bₙ/n!; even n → 0; n = 1 → `bernoulli_one`; odd n > 1 → `bernoulli_eq_zero_of_odd`; against `PowerSeries.coeff_X`. (iv) the same coefficient identity: −2·qₙ = 0 for odd n > 1.
- **RZ-38**: the partials by `hasDerivAt_id` · `const_mul`/`mul_const`; (a) `Real.hasDerivAt_exp`, `(hasDerivAt_neg t).exp`; (b) x(t)e^{−t} and p(t)eᵗ have derivative 0, constant by `is_const_of_deriv_eq_zero`; (c) `mul_mul_mul_comm` + `Real.exp_add`; (d) case on x₀ = 0, `mul_left_cancel₀` + `Real.exp_injective`.
- **RZ-44a**: `norm_num [orbEulerChar]` for the two values; m ≥ 7 by `one_div_le_one_div_of_le` and `linarith`.
- **RZ-76a**: `norm_num`, `ring`, `field_simp` with `Real.pi_ne_zero`, `Real.sin_pi_div_two`.
- **RZ-77a**: `norm_num` on the values; `isMaxOn_iff` + `nlinarith [sq_nonneg (σ - 1/2)]`.

## Records
- `comparator.json` unchanged: `theorem_names` lists all five (every one is proved); no `statements_not_checked:` entry needed.
- `formalization.yaml`: the five rows' `status:` STATED → PROVED (prior copy kept in the seat's scratchpad); RZ-76b, RZ-77b stay OPEN as found; `statement_sha256` / `v2_signed` untouched.
- `Solution.lean` sha256 `f64d9dcda951d3d2e6fced5fe32a62be1f174b39c485aab019a5ddd4e8eaa8a3`.
- sha at close: `shasum -a 256 Challenge.lean` = `2031d927a8140337d7753b28688f9f1e309fea976472d6fba51507515927fa3f` (equals the signed `statement_sha256`; Challenge not edited).

## Row table (proofs phase)
| row | theorem | status |
|---|---|---|
| L:RZ-24 | `rz_24_bernoulli_gf_symmetry` | PROVED |
| L:RZ-38 | `rz_38_xp_trajectories` | PROVED |
| L:RZ-44a | `rz_44a_orbifold_euler_arith` | PROVED |
| L:RZ-76a | `rz_76a_seven_eighths_arith` | PROVED |
| L:RZ-76b | — | OPEN (as found; NOT A LEAN TARGET) |
| L:RZ-77a | `rz_77a_casimir_arith` | PROVED |
| L:RZ-77b | — | OPEN (as found; OUT-OF-Q5, NEEDS-DEVELOPMENT) |

- seat closed 2026-10-28T17:55:01Z
