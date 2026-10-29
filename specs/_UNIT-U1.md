# Unit U1 (`RiemannZeta/Pilot`) — seat M summary

- seat: M (statement author), FAN-OUT-PLAN-v1 §4 step 2; brief `Orchestrator/Chat-Design/cc-handoff/projects/reputation-play/lean-scoping/seats/M-U1-2026-10-28.md`
- authority: RZ served PDF, sha256 `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54` (digest re-checked with `shasum -a 256` at the seat's opening, between 17:00:26Z and 17:04:29Z); loci read by `pdftotext -layout` at PDF pages p07, p10, p11, p12, p23, p26
- mathlib pin: `db584cd6d46c92f209a44c0f1c829460d327499d` (lake-manifest `rev`); every name below found by `/usr/bin/grep -rn` under `~/Claude/projects/lean-papers/.lake/packages/mathlib/Mathlib/`
- seat opened 2026-10-28T17:00:26Z; first artefact (`RZ-02.md`) 17:05:25Z; summary clock 2026-10-28T17:11:06Z
- no git, no web, no Lean compiled, nothing under the lab's non-public research trees read

## Rows: 7 ledger rows → 9 spec files

| ledger row | spec file(s) | disposition | bucket |
|---|---|---|---|
| L:RZ-02 | `RZ-02.md` | SPECCED | NOW (ledger figure, E0) |
| L:RZ-07 | `RZ-07a.md`, `RZ-07b.md` | **SPLIT** — 07a the conjugate products in ℝ (in scope, keeps the ledger figure); 07b "N is the field norm" as a field-norm statement on ℚ(√5) — **OUT-OF-Q5 (pending the wall)**, proposed NOW ≈ 0.5 pd E1 | 07a NOW E0 · 07b proposed only |
| L:RZ-11 | `RZ-11.md` | SPECCED (sign stated explicitly: +√5 for the standard additive character) | NOW (ledger figure, E2) |
| L:RZ-20 | `RZ-20a.md`, `RZ-20b.md` | **SPLIT** — 20a formula (4.1)=(4.7) plus the printed "rational multiples of π^{2n}" (in scope, keeps the ledger figure); 20b Theorem 4.1(i)'s "finite expressions in the isotropic sector T_iso … single operator eigenvalue (π)" — CONCEPT leg, no Lean statement, uncounted | 20a NOW E1 · 20b CONCEPT |
| L:RZ-23 | `RZ-23.md` | SPECCED | NOW (ledger figure, E0) |
| L:RZ-66 | `RZ-66.md` | SPECCED | NOW (ledger figure, E0) |
| L:RZ-67 | `RZ-67.md` | SPECCED | NOW (ledger figure, E0) |

**CC-CANDIDATES: none.** Every printed statement in this unit is true in the served edition under the reading each spec names. One wording note (not a defect of truth) is carried in `RZ-11.md` §6: "the non-trivial character mod 5" is ambiguous as printed (three exist); "quadratic Gauss sum" fixes the quadratic one.

**Splits for V₁'s sign-off:** RZ-07 → 07a/07b; RZ-20 → 20a/20b (as above).

## Mathlib names not found at the pin (and what replaced them)

- `χ₅` — no conductor-5 character object (as LEDGER-NAMES §4b found). Replaced in RZ-11 by a local `def chi5 : MulChar (ZMod 5) ℂ := (quadraticChar (ZMod 5)).ringHomComp (Int.castRingHom ℂ)` — a `def`, no `structure`/`class`.
- No global instance `Fact (Nat.Prime 5)` (ℕ): only `Nat.fact_prime_two`, `Nat.fact_prime_three` (Data/Nat/Prime/Defs.lean:469, :472) and a ℕ+ `fact_prime_five` (Data/PNat/Prime.lean:124). Needed by `quadraticChar (ZMod 5)` (field structure) in RZ-11 and by `IsCyclotomicExtension.Rat.discr_prime` in RZ-66; L supplies `⟨by norm_num⟩` locally.
- No direct lemma `Algebra.norm R z = QuadraticAlgebra.norm z` (0 hits for `Algebra.norm` under Mathlib/Algebra/QuadraticAlgebra/). RZ-07b's bridge is `Algebra.norm_apply` + `QuadraticAlgebra.det_toLinearMap_eq_norm`, proved locally; not NEEDS-DEVELOPMENT.
- Not used by U1 and so not re-sourced here: `bernoulli_power_series` (the generating function is cited in RZ-20a/RZ-23 as `bernoulliPowerSeries`), `Complex.abs`.
- `NumberField.discr` exists but is a `noncomputable abbrev` (Discriminant/Defs.lean:36): the brief's `theorem|lemma|def` grep pattern misses it; `abbrev discr` finds it.

**No row is NEEDS-DEVELOPMENT.**

## Declarations each row targets

- **RZ-02:** `Matrix.SpecialLinearGroup` (LinearAlgebra/Matrix/SpecialLinearGroup.lean:70), `Matrix.det_fin_two_of` / `Matrix.det_fin_two` (Determinant/Basic.lean:814/:807), `Matrix.trace_fin_two_of` / `Matrix.trace_fin_two` (Matrix/Trace.lean:232/:220), `Matrix.charpoly_fin_two` (Charpoly/Coeff.lean:229), `Polynomial.discr` + `Polynomial.discr_of_degree_eq_two` (RingTheory/Polynomial/Resultant/Basic.lean:931/:954).
- **RZ-07a:** `Real.goldenRatio`, `Real.goldenConj` (abbrevs, NumberTheory/Real/GoldenRatio.lean:37/:40), `Real.goldenRatio_mul_goldenConj` (:57).
- **RZ-07b:** `QuadraticAlgebra` (Defs.lean:38), `QuadraticAlgebra.omega` (Basic.lean:49), `QuadraticAlgebra.omega_mul_omega_eq_add` (:70), `QuadraticAlgebra.norm` (:201), `QuadraticAlgebra.norm_def` (:205), `QuadraticAlgebra.algebraMap_norm_eq_mul_star` (:228), `QuadraticAlgebra.det_toLinearMap_eq_norm` (NormDeterminant.lean:27), `Algebra.norm` / `Algebra.norm_apply` (RingTheory/Norm/Defs.lean:61/:64).
- **RZ-11:** `gaussSum` (GaussSum.lean:72), `gaussSum_sq` (:222), `quadraticChar` (QuadraticChar/Basic.lean:120), `quadraticChar_isQuadratic` (:199), `quadraticChar_ne_one` (:207), `quadraticChar_neg_one` (:258), `MulChar.ringHomComp` (MulChar/Basic.lean:453), `MulChar.IsQuadratic` (:441), `MulChar.IsQuadratic.comp` (:513), `ZMod.stdAddChar` / `ZMod.stdAddChar_coe` / `ZMod.isPrimitive_stdAddChar` (Analysis/SpecialFunctions/Complex/CircleAddChar.lean:83/:86/:95), `AddChar.IsPrimitive` (LegendreSymbol/AddCharacter.lean:61), `ZMod.χ₄` / `ZMod.χ₄_nat_one_mod_four` (ZModChar.lean:42/:88), `Real.cos_pi_div_five` (Trigonometric/Basic.lean:849), `Real.sqrt` (Analysis/Real/Sqrt.lean:112).
- **RZ-20a:** `riemannZeta` (LSeries/RiemannZeta.lean:121), `riemannZeta_two_mul_nat` (LSeries/HurwitzZetaValues.lean:206), `zeta_eq_tsum_one_div_nat_cpow` (RiemannZeta.lean:207), `hasSum_zeta_nat` (ZetaValues.lean:430), `bernoulli` (Bernoulli.lean:197), `bernoulli_one` (:207), `bernoulli_eq_bernoulli'_of_ne_one` (:217), `bernoulliPowerSeries` (:268).
- **RZ-20b:** none (CONCEPT).
- **RZ-23:** `bernoulli` (Bernoulli.lean:197), `bernoulli_eq_zero_of_odd` (:214), `bernoulli'_eq_zero_of_odd` (:180, twin, not needed), `bernoulli_one` (:207), `bernoulli_eq_bernoulli'_of_ne_one` (:217), `bernoulliPowerSeries` (:268), `odd_two_mul_add_one` (Algebra/Ring/Parity.lean:130).
- **RZ-66:** `IsCyclotomicExtension.Rat.discr_prime` (NumberField/Cyclotomic/Basic.lean:651), `NumberField.discr` (Discriminant/Defs.lean:36, abbrev), `IsCyclotomicExtension.numberField` (Cyclotomic/Basic.lean:410), `IsCyclotomicExtension.algEquiv` (:601), `CyclotomicField` (:654).
- **RZ-67:** `NumberField.classNumber` (NumberField/ClassNumber.lean:64), `NumberField.classNumber_eq_one_iff` (:74; not the function-field namesake at ClassNumber/FunctionField.lean:53), `IsCyclotomicExtension.Rat.five_pid` (NumberField/Cyclotomic/PID.lean:48), `IsCyclotomicExtension.algEquiv`, `CyclotomicField`.

## Conventions fixed in this unit
- Bernoulli: the paper's generating function t/(e^t − 1) (p11) is mathlib's `bernoulli` (B₁ = −1/2); for every index this unit uses (2n ≥ 2, 2n + 1 ≥ 3) `bernoulli` and `bernoulli'` agree.
- τ(χ₅): χ₅ = the Legendre character (·/5) (= the paper's §9.2 Kronecker symbol (5/·) on residues mod 5); ψ = `ZMod.stdAddChar`, a ↦ e^{2πia/5}; the value is +√5 (with ψ(a) = e^{2πi·2a/5} it would be −√5 — the sign is the row's content).
- "Discriminant" of the matrix F²: discriminant of its characteristic polynomial = tr² − 4·det, the paper's own (2.7) convention.
- φ̄: the Galois conjugate (1 − √5)/2 = `Real.goldenConj`; N: the field norm `Algebra.norm ℚ`.
- ℚ(ζ₅): any K with `IsCyclotomicExtension {5} ℚ K` (all ℚ-isomorphic); discriminant signed (`NumberField.discr`, here +125).
- ζ(2n): `riemannZeta (2 * n)` for n ≥ 1, equal to the paper's series there.

## The one thing V₁ should look at hardest, per row
- **RZ-02:** whether "discriminant 5" is rightly read as the characteristic-polynomial discriminant (tr² − 4·det) — and the overlap with L:RZ-12's display (2.7), which states the same number; plus whether F^2 = (2 1; 1 1) belongs here or in L:RZ-04 (included here because the symbol F² asserts it).
- **RZ-07a/07b:** the split itself — whether "(N is the field norm in (2.4) …)" makes the field-norm statement part of the printed claim (my reading: yes, hence 07b) or a gloss the row may leave out; and in 07b whether the model `QuadraticAlgebra ℚ 1 1` with ω for φ is an honest stand-in for ℚ(√5) (the norm is conjugation-invariant, so the choice of root does not matter).
- **RZ-11:** the additive-character convention: the statement is false for ψ_k with k = 2, 3; check that `ZMod.stdAddChar (N := 5)` is exactly a ↦ exp(2πi·a/5) (`stdAddChar_coe`) and that the target is `Real.sqrt 5` cast to ℂ, not ±.
- **RZ-20a/20b:** the range n ≥ 1 (the print leaves it implicit; n = 0 is excluded though mathlib's continuation would also satisfy the formula there), and whether the rational-multiple theorem is rightly kept in the checkable leg while the T_iso clause goes to the CONCEPT leg.
- **RZ-23:** the hypothesis shape `1 ≤ n` on index `2 * n + 1` against the print's "for n ≥ 1"; and that the convention note (t/(e^t − 1) ↔ `bernoulli`) is stated right even though it does not move the statement.
- **RZ-66:** the sign — `NumberField.discr` is signed and the statement asserts +125; the print's "5³ = 125" is unsigned. (−1)^{(5−1)/2} = +1, so they agree; check that `discr_prime`'s exponent arithmetic in ℕ ((5 − 1)/2 = 2, 5 − 2 = 3) gives exactly that.
- **RZ-67:** that `NumberField.classNumber` (card of the class group of 𝓞 K) is the paper's h, and that the ∀ K formulation is no stronger than the print (it is equivalent, by `IsCyclotomicExtension.algEquiv`).

SPEC-DRAFT 2026-10-28T17:11:06Z — unit U1, seat M.

*The spec says what the paper says, and only that; the wall and V₁ take it from here — we cooked it together.*
