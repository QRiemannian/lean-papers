# BUILD-LOG — unit U10 (`RiemannZeta/LValue`, namespace `RiemannZeta.LValue`)

Seat L (Lean coder), PHASE STATEMENTS, dispatched by Orchestrator A 2026-10-28 (≈20:55Z by the brief); method `Orchestrator/Chat-Design/cc-handoff/projects/reputation-play/lean-scoping/seats/TEMPLATE-L-lean-coder.md` (whole, with the sitting-71 scratch addendum; scratch at `<scratchpad>/l-u10/`). Clocks from `date -u`. No git, no web, nothing under the lab's non-public research trees.

- seat opened 2026-10-28T20:46:38Z; this file (first artefact) 2026-10-28T20:47:08Z
- inputs read: TEMPLATE-L (whole), `specs/_UNIT-U10.md` (with the CO decisions at its foot, 20:38:32Z), `specs/RZ-58.md` (V1-GREEN 20:44:03Z, V1-SPLIT-OK a · b · c), `specs/_V1-U10.md`; shape from `RiemannZeta/SmallArith/{Challenge.lean,comparator.json,formalization.yaml,BUILD-LOG.md}` and `RiemannZeta/Bridge/{Challenge.lean,formalization.yaml}` (the instance at :24–26, `chi5` at :188–189).

## Builds

- **B1** 2026-10-28T20:47:35Z → 20:48:03Z — `lake build RiemannZeta.LValue.Challenge` · exit **0** · `Build completed successfully (8706 jobs)`, Challenge 24 s · first error: none · warnings: 5 × `declaration uses 'sorry'` (one per theorem, lines 46, 58, 69, 78, 90), nothing else (no `longLine`).
- **inspect** 2026-10-28T20:48:11Z → 20:48:27Z — scratch file `<scratchpad>/l-u10/inspect.lean` (outside the repo) importing `RiemannZeta.LValue.Challenge`, `RiemannZeta.Bridge.Challenge`, `RiemannZeta.Pilot.Challenge`, run with `lake env lean` after `lake build RiemannZeta.Bridge.Challenge RiemannZeta.Pilot.Challenge` (exit 0) · exit **0**, no error. `#check` with `pp.numericTypes` / `pp.coercions` on the five theorems: 58a reads `DirichletCharacter.LFunction RiemannZeta.LValue.chi5 (1 : ℂ) = ↑((2 : ℝ) * Real.log Real.goldenRatio / √(5 : ℝ))` (the real number cast to ℂ; `goldenRatio` resolves to `Real.goldenRatio` under `open Real in`); 58b-kronecker's `jacobiSym (5 : ℤ) n` with n : ℕ and `ZMod.χ₈ (5 : ZMod 8)` cast ℤ → ℂ; 58b-real/primitive/conductor's `chi5.IsPrimitive` and `chi5.conductor = (5 : ℕ)` resolve to `DirichletCharacter.IsPrimitive` / `.conductor` through the abbrev; 58b-unique quantifies over `DirichletCharacter ℂ (5 : ℕ)`; 58c over ℝ with `(43035 / 100000 : ℝ)`. **The cross-unit link:** `example : RiemannZeta.Bridge.chi5 = RiemannZeta.LValue.chi5 := rfl` and `example : (RiemannZeta.Pilot.chi5 : DirichletCharacter ℂ 5) = RiemannZeta.LValue.chi5 := rfl` both elaborate — the `rfl` of CO decisions 2–3 holds at the pin.
- **index** 2026-10-28T20:48:39Z — `RiemannZeta.lean` re-read immediately before the append (header comment + Pilot, ZetaL, Bridge, NoGo, SmallArith, Cyclotomic, MatricesMobius imports); `import RiemannZeta.LValue.Challenge` appended with `>>` (guarded by an exact-line `/usr/bin/grep -qxF`), existing lines kept. The lakefile's `[[lean_lib]] name = "RiemannZeta"` carries `globs = ["RiemannZeta.*"]`, which takes the submodules recursively (U7's B3 built the depth-3 `RiemannZeta.Bridge.Solution` through it), so `RiemannZeta.LValue.Challenge` is in the library with no lakefile change.
- **B2** 2026-10-28T20:48:39Z → 20:48:53Z — `lake build +RiemannZeta` (the index module and its imports) · exit **0** · `Build completed successfully (8714 jobs)` · first error: none · warnings besides `sorry`: 1 × `longLine` on `RiemannZeta.lean:1` (the index's pre-existing header comment, not this seat's line) and 1 × the header linter ("Copyright too short!") on `RiemannZeta/ZetaL/Challenge.lean:1` (another unit's file) — both left as found.
- **B3** 2026-10-28T20:49:08Z → 20:49:10Z — `lake build RiemannZeta.LValue.Challenge` (final) · exit **0** · `Build completed successfully (8706 jobs)` (replayed) · first error: none · warnings: 5 × `sorry`, nothing else.

## Departures from the spec's text (`specs/RZ-58.md` §5), each with its reason
1. **Namespace** `RiemannZeta.LValue`, not the spec's `RiemannZeta.LFunction` (§1, §5): CO decision 1 (20:38:32Z), named by V₁ as housekeeping. The statements are namespace-independent (`DirichletCharacter.LFunction` written fully qualified everywhere).
2. **The instance's docstring** is U2's (`Bridge/Challenge.lean:24–25`) rather than the spec's one-line docstring: the brief asks for the instance as Bridge writes it; lines 24–26 of Bridge and 26–28 here are byte-identical (`diff`, 20:49Z). The instance line itself equals the spec's.
3. **`chi5`'s docstring** extended (binding definition; byte-identity with U2/U1 named); the two code lines are byte-identical to `Bridge/Challenge.lean:188–189` (`diff`, 20:49Z) and to the spec's.
4. **Docstrings on every theorem** (row id, served locus, PDF sha256 prefix `2d5287e7`) per TEMPLATE-L; for 58a and 58c the `open Real in` line stands before the docstring (the U2 placement), the spec writes it directly before `theorem`. Position of a scoping line only.
5. **None in any statement.** The five theorem texts from `theorem` to `:= by` equal the spec's §5 Lean blocks byte for byte (python3 -I comparison, 20:49Z). No `LSeries` and no `tsum`/`∑'` in any statement; the module docstring names both only to say the unit never uses them at s = 1.

## Digest (statements phase)
- `Challenge.lean` sha256 `ed3c5e79b0c6f6fe2e369b48b75d6648bafaf23d86c5c8c0835764eb39481c7b` (after B3) → `formalization.yaml` `statement_sha256_draft:` (V₂ signs `statement_sha256:`).
- `comparator.json` parsed as JSON (python3 -I), `formalization.yaml` parsed as YAML (ruby) — 20:49:48Z.

## Row table
| row | theorem(s) | status |
|---|---|---|
| L:RZ-58a | `rz_58a_LFunction_chi5_one` | STATED |
| L:RZ-58b | `rz_58b_chi5_kronecker`, `rz_58b_chi5_real_primitive_conductor`, `rz_58b_chi5_unique` | STATED |
| L:RZ-58c | `rz_58c_value_approx` | STATED |
| L:RZ-61c | — (frozen in U2, `RiemannZeta.Bridge.rz_61c_weight_eq_two_L`) | RIDES-IN-U2 (uncounted here) |

## Notes for V₂ and the proofs phase
- `comparator.json` lists all five theorems; the proofs seat trims to what it proves (and an unproved 58a moves to `statements_not_checked`, the U2 form).
- Proofs-phase pointers (from the spec, not this phase): 58b by `decide` on the five residue values (U1's `rz_11` precedent), `jacobiSym.quadratic_reciprocity_one_mod_four` + `jacobiSym.legendreSym.to_jacobiSym` + `jacobiSym.mod_left`, `ZMod.χ₈_nat_eq_if_mod_eight`, conductor via `conductor_dvd_level` / `eq_one_iff_conductor_eq_one`, uniqueness via `MulChar.ext'`; 58c restates U2's `rz_61a_weight_approx` bound argument halved (Solution imports `Mathlib` only); 58a by the A0–A8 route, `DirichletCharacter.LSeriesSummable_of_one_lt_re` (Dirichlet.lean:188) the direct form for A2 (V₁ note).
- Scratch files (outside the repo): `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/l-u10/inspect.lean` (the elaboration and `rfl`-link check; a later stage may re-run it).
- seat closed 2026-10-28T20:50:20Z

---

# Proofs phase — seat L, 2026-10-28

Seat L (Lean prover), PHASE PROOFS, dispatched by Orchestrator A. Statements frozen: V₂ signed `Challenge.lean` at sha256 `ed3c5e79b0c6f6fe2e369b48b75d6648bafaf23d86c5c8c0835764eb39481c7b` (2026-10-28T20:53:05Z); re-read with `shasum -a 256` at the close, unchanged. Clocks from `date -u`. No git, no web, nothing under the lab's non-public research trees; scratch at `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/l-u10-proofs/`.

- seat opened 2026-10-28T20:58:54Z (scratch folder created); real half (A5–A8) first compiled in scratch ≈21:04Z; L-function half (A0–A4) ≈21:08Z; `Solution.lean` assembled 21:09Z.
- inputs read: `specs/RZ-58.md` (whole), `specs/_UNIT-U10.md` (with the CO decisions at its foot), `specs/_V2-U10.md`, this unit's `Challenge.lean` / `comparator.json` / `formalization.yaml` / this log; worked examples `RiemannZeta/Bridge/Solution.lean`, `RiemannZeta/Pilot/Solution.lean`; `tools/check.sh` (read, not run).

## Verdict
**Five of five frozen theorems PROVED** in `RiemannZeta/LValue/Solution.lean` (579 lines, sha256 `9847c4c5df5eeb60d597c593c214fb7781fdaeed9c1d6727df62a648ec9762b7`): `rz_58a_LFunction_chi5_one`, `rz_58b_chi5_kronecker`, `rz_58b_chi5_real_primitive_conductor`, `rz_58b_chi5_unique`, `rz_58c_value_approx`. Nothing left frozen; `comparator.json` unchanged (its `theorem_names` already list exactly the five, all proved); no `statements_not_checked` entry needed. STATEMENT-CHANGE-NEEDED: none.

## Form of the module
`import Mathlib` only (never the Challenge); namespace `RiemannZeta.LValue`; the Challenge's `fact_prime_five` and `chi5` (with their docstrings) restated byte-identically and in order; every theorem's docstring, `open Real in` line and text from `theorem` through `:= by` restated byte-identically. Checked by script (python3 -I, 21:10Z): the Challenge body, split at its `sorry` lines and at the `chi5` definition, occurs piece by piece verbatim and in order in `Solution.lean` (7/7 pieces). The development sits between `chi5` and the first theorem in `section Aux` (with `open Real Filter Topology` scoped to the section): 34 proof-side declarations, all named `aux_*`, none used by any statement.

## Route taken for L:RZ-58a (the spec's A0–A8, with the departures below)
- **A0** `aux_chi5_ne_one`: chi5 2 = −1 while (1 : DirichletCharacter ℂ 5) 2 = 1 (`MulChar.one_apply`, 2 a unit by `decide`); residue values of `quadraticChar (ZMod 5)` by `decide` (U1's form, `aux_q_vals`).
- **A2** `aux_LFunction_eq_tsum_bs`: for real σ > 1, `DirichletCharacter.LFunction_eq_LSeries`, summability by `DirichletCharacter.LSeriesSummable_of_one_lt_re` (V₁'s closer fit), `Nat.sumByResidueClasses` at N = 5, `Fin.sum_univ_five`; class 0 vanishes term by term; each class k = 1..4 rewritten as a real series (`LSeries.term_of_ne_zero`, `Complex.ofReal_cpow`, `Complex.ofReal_tsum`, `Complex.summable_ofReal`) and recombined (`Summable.tsum_add`) into Σ b_m(σ), b_m(σ) = (5m+1)^{−σ} − (5m+2)^{−σ} − (5m+3)^{−σ} + (5m+4)^{−σ}.
- **A3** `aux_tendsto_tsum_bs`: `tendsto_tsum_of_dominated_convergence` on 𝓝[>] 1 with bound 4/(m+1)², summable (`Real.summable_one_div_nat_pow` shifted by `summable_nat_add_iff`); the bound from `aux_diff_bound`: 0 ≤ x^{−σ} − (x+1)^{−σ} ≤ 2/x² for x ≥ 1, 1 ≤ σ ≤ 2, exactly the spec's argument (`Real.rpow_le_rpow_of_exponent_ge` on r = x/(x+1), `Real.div_rpow`, x ≤ x^σ by `Real.rpow_le_rpow_of_exponent_le`); the window 1 < σ < 2 by `Ioo_mem_nhdsGT`; pointwise limits by continuity in σ (`Continuous.rpow` with a positive constant base).
- **A1 + A4** `aux_LFunction_chi5_one_eq_tsum`: `DirichletCharacter.differentiable_LFunction aux_chi5_ne_one` gives continuity at 1, composed with `Complex.ofReal`; the two limits agree eventually on 𝓝[>] 1 (`self_mem_nhdsWithin`) and `tendsto_nhds_unique` gives L(1, χ₅) = ↑(Σ b_m(1)).
- **A5–A8** `aux_hasSum_bterm`: b_m = ∫₀¹ t^{5m}(1 − t − t² + t³) dt (`integral_pow` on four monomials); partial sums Σ_{m<M} b_m = ∫₀¹ (1 − t²)/Q − ∫₀¹ t^{5M}(1 − t²)/Q (Q = t⁴ + t³ + t² + t + 1 > 0 on ℝ); the error lies in [0, 1/(M+1)] and tends to 0; b_m ≥ 0 gives the HasSum (`hasSum_iff_tendsto_nat_of_nonneg`); ∫₀¹ (1 − t²)/Q = F(1) − F(0) by `intervalIntegral.integral_eq_sub_of_hasDerivAt` with F(t) = (log(t² + φt + 1) − log(t² + ψt + 1))/√5, and F(1) − F(0) = log(φ²)/√5 = 2 log φ/√5 from 2 + φ = φ²(2 + ψ). The theorem: `rw [aux_LFunction_chi5_one_eq_tsum]`, b_m(1) = b_m by `Real.rpow_one`, `HasSum.tsum_eq`.

## Departures from the spec's route, each with its reason
1. **A5–A6, the sum ↔ integral exchange:** the spec names `intervalIntegral.hasSum_integral_of_dominated_convergence` + `hasSum_geometric_of_lt_one` (an infinite geometric series in t⁵, with the endpoint t = 1 handled separately). Taken instead: the finite form — `intervalIntegral.integral_finsetSum` over the first M blocks and the pointwise identity Σ_{m<M} t^{5m}(1 − t)(1 − t²) = (1 − t²)(1 − t^{5M})/Q from `geom_sum_mul_neg` (valid at every real t, so no endpoint case), then a squeeze of the error integral (`intervalIntegral.integral_nonneg`, `intervalIntegral.integral_mono_on`, `squeeze_zero`, `tendsto_one_div_add_atTop_nhds_zero_nat`). Reason: no measure-theoretic dominated convergence and no a.e. bookkeeping; every object finite. Same identity, same integral.
2. **A3, the dominating function** is 4/(m+1)² (one summable sequence for all m) rather than 4/(5m+1)² per block: |b_m(σ)| ≤ 2/(5m+1)² + 2/(5m+3)² ≤ 4/(m+1)². Same estimate, a simpler summability lemma.
3. **A7, positivity** of t² + φt + 1 and t² + ψt + 1 proved for all real t (|c| < 2: `aux_quad_pos`, φ < 2 from √5 < 3, ψ > −1) rather than on [0, 1] — FTC's hypothesis is then met everywhere; the derivative identity closes by `linear_combination` with √5² = 5.
4. **Leg b** needed neither `jacobiSym.mod_left` nor `ZMod.χ₈_nat_eq_if_mod_eight`: J(5 | n) = J(n | 5) (`jacobiSym.quadratic_reciprocity_one_mod_four`, 5 % 4 = 1) = legendreSym 5 n (`jacobiSym.legendreSym.to_jacobiSym`) = quadraticChar (ZMod 5) n (definition, `Int.cast_natCast`); χ₈ (5 : ZMod 8) = −1 by `rfl` (the table of the definition). Conductor: `conductor_dvd_level` + `Nat.prime_five.eq_one_or_self_of_dvd`, the 1 branch refuted by `DirichletCharacter.eq_one_iff_conductor_eq_one` and A0. Uniqueness: χ(4) = χ(2)², χ(3) = χ(2)³, χ(2)⁴ = 1 (2 generates (ZMod 5)ˣ), χ(2) real so ±1; +1 forces χ = 1, whose conductor is 1 (`DirichletCharacter.conductor_one`), contradicting primitivity; −1 gives χ = chi5 by `MulChar.ext'` on the five residues.
5. **Leg c** restates U2's `rz_06a_four_log_phi_approx` proof verbatim as the helper `aux_four_log_phi_bounds` (Taylor bounds via `Real.exp_bound'` / `Real.sum_le_exp_of_nonneg`), then halves with √5 ∈ [2.236, 2.2361] (`le_div_iff₀` / `div_lt_iff₀`, `nlinarith`) — the spec's §4 "Leg c" plan under the self-contained-module ruling.

## Name check (the sitting-71 form, `<scratchpad>/u10/namecheck.sh`, run 21:12Z on the pin), hits pasted with their namespace
- `NumberTheory/LSeries/DirichletContinuation.lean:75:lemma LFunction_eq_LSeries (χ : DirichletCharacter ℂ N) {s : ℂ} (hs : 1 < re s) :` — inside `namespace DirichletCharacter` → `DirichletCharacter.LFunction_eq_LSeries` (a second hit, `NumberTheory/LSeries/ZMod.lean:93`, is `ZMod.LFunction_eq_LSeries`, not used).
- `NumberTheory/LSeries/DirichletContinuation.lean:98:lemma differentiable_LFunction {χ : DirichletCharacter ℂ N} (hχ : χ ≠ 1) :` — `DirichletCharacter.differentiable_LFunction`.
- `NumberTheory/LSeries/Dirichlet.lean:188:lemma LSeriesSummable_of_one_lt_re {N : ℕ} (χ : DirichletCharacter ℂ N) {s : ℂ} (hs : 1 < s.re) :` — `DirichletCharacter.LSeriesSummable_of_one_lt_re`.
- `Analysis/SumOverResidueClass.lean:106:lemma Nat.sumByResidueClasses` — prefix in the name → `Nat.sumByResidueClasses`.
- `Analysis/Normed/Group/Tannery.lean:40:lemma tendsto_tsum_of_dominated_convergence` — top level.
- `MeasureTheory/Integral/IntervalIntegral/Basic.lean:778:nonrec theorem integral_finsetSum` — inside `namespace intervalIntegral` (:668) → `intervalIntegral.integral_finsetSum` (the old `integral_finset_sum` is deprecated at the pin; the first build warned and the name was switched).
- `MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean:1148:theorem integral_eq_sub_of_hasDerivAt` — `intervalIntegral.integral_eq_sub_of_hasDerivAt`.
- `Algebra/Ring/GeomSum.lean:240:lemma geom_sum_mul_neg` — top level.
- `Topology/Algebra/InfiniteSum/ENNReal.lean:558:theorem hasSum_iff_tendsto_nat_of_nonneg` — top level.
- `Analysis/SpecialFunctions/Pow/Real.lean:282:theorem ofReal_cpow` — `Complex.ofReal_cpow`; `Analysis/Complex/Basic.lean:602:theorem ofReal_tsum` — `Complex.ofReal_tsum`.
- `NumberTheory/DirichletCharacter/Basic.lean:268:lemma eq_one_iff_conductor_eq_one [NeZero n] : χ = 1 ↔ conductor χ = 1` — `DirichletCharacter.eq_one_iff_conductor_eq_one` (χ implicit; the first build passed it explicitly and failed, fixed).
- `NumberTheory/LegendreSymbol/JacobiSymbol.lean:431:theorem quadratic_reciprocity_one_mod_four {a b : ℕ} (ha : a % 4 = 1) (hb : Odd b) :` — inside `namespace jacobiSym` → `jacobiSym.quadratic_reciprocity_one_mod_four` (a same-short-name hit, `QuadraticReciprocity.lean:133`, is `legendreSym.quadratic_reciprocity_one_mod_four`, not used).
- `tsum_add` (the name this seat tried first) is absent at the pin as a top-level theorem; the form is `Summable.tsum_add`, generated by `@[to_additive]` from `Multipliable.tprod_mul` (`Topology/Algebra/InfiniteSum/Basic.lean:717`).

## Builds
- **P1** 2026-10-28T21:09:09Z → 21:09:22Z — `lake build RiemannZeta.LValue.Solution` · exit **1** · first error: `DirichletCharacter.eq_one_iff_conductor_eq_one` applied to an explicit argument (χ is implicit) · second: a `(-1) ^ 3 = -1` goal left by `simp` · plus 5 `longLine` warnings.
- **P2** 2026-10-28T21:09:53Z → 21:10:01Z — `lake build RiemannZeta.LValue.Solution` · exit **0** · `Build completed successfully (8706 jobs)` · no warnings (no `sorry`, no `longLine`).
- **P3** 2026-10-28T21:11:36Z → 21:11:38Z — `lake build RiemannZeta` (the whole library, after the U2 change below) · exit **0** · warnings only the Challenge files' expected `declaration uses 'sorry'`.
- Forbidden-token scan of `Solution.lean` (`/usr/bin/grep -nwE "sorry|admit|native_decide|axiom|opaque|maxRecDepth"`): no hit.

## Axioms (scratch file `<scratch>/l-u10-proofs/axioms.lean`, `lake env lean`, 2026-10-28T21:10:09Z, exit 0)
```
'RiemannZeta.LValue.rz_58a_LFunction_chi5_one' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.LValue.rz_58b_chi5_kronecker' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.LValue.rz_58b_chi5_real_primitive_conductor' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.LValue.rz_58b_chi5_unique' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.LValue.rz_58c_value_approx' depends on axioms: [propext, Classical.choice, Quot.sound]
```

## L:RZ-61c (rides 58a; CO decision 2)
Closed in unit U2: `RiemannZeta/Bridge/Solution.lean` now imports `RiemannZeta.LValue.Solution` (the one ruled cross-unit import) and proves `RiemannZeta.Bridge.rz_61c_weight_eq_two_L` from `RiemannZeta.LValue.rz_58a_LFunction_chi5_one`, the `Bridge.chi5` ↔ `LValue.chi5` step definitional (the term elaborates with no cast). Record in `RiemannZeta/Bridge/BUILD-LOG.md`.

## Row table (proofs phase)
| row | theorem(s) | status |
|---|---|---|
| L:RZ-58a | `rz_58a_LFunction_chi5_one` | PROVED |
| L:RZ-58b | `rz_58b_chi5_kronecker`, `rz_58b_chi5_real_primitive_conductor`, `rz_58b_chi5_unique` | PROVED (3/3) |
| L:RZ-58c | `rz_58c_value_approx` | PROVED |
| L:RZ-61c | (in U2) `RiemannZeta.Bridge.rz_61c_weight_eq_two_L` | PROVED in U2 on 58a |

## Flags for the orchestrator (not acted on)
- `formalization.yaml` (this unit) row statuses still read as the statements phase left them; not touched (outside this seat's files).
- U2's `formalization.yaml` still carries `rz_61c_weight_eq_two_L` under `statements_not_checked:` ("GATED on L:RZ-58 … absent from Solution.lean and from comparator.json theorem_names"); that line is now stale — the theorem is in U2's `Solution.lean` and in its `comparator.json` `theorem_names`. Not edited (formalization.yaml is outside this seat's files).
- `tools/check.sh` not run (the orchestrator gates the settled tree). Comparator was not run by this seat.

PROOFS-PHASE CLOSE 2026-10-28T21:13:12Z — seat L, unit U10.
