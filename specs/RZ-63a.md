# L:RZ-63a — √(t² − 4) = 2 sinh(ℓ/2) with ℓ := 2 log λ; the systolic instance √5 = 2 sinh(σ/2); (9.9a) g_c = 1/(2π sinh(σ/2))

1. **Header**
   - row: `L:RZ-63a` (split from `L:RZ-63`; sibling `L:RZ-63b`). This sub-row keeps the ledger figure (E1, 1 pd): ℓ is *defined* as 2 log λ, as the print writes it, and σ is the number 4 log φ.
   - unit: U4 `RiemannZeta/MatricesMobius`
   - paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
   - pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
   - locus: §9.5, paragraph "The metric twin, and what it does not buy.", display (9.9a) (tag moved from v0.1's (9.11a)); served PDF p25 (printed folio 24). The geometry constant's definition g_c = 1/(√5 · π): abstract, served p02 (printed folio 1).
   - spec_clock: 2026-10-28T17:13:14Z

2. **Printed statement, verbatim**

   (p25) > For every hyperbolic element of every Fuchsian group, √(t² − 4) = 2 sinh(ℓ/2), where t is the trace and ℓ = 2 log λ the translation length [CV]. At the systolic element of X(1) — t = 3, σ = 4 log φ — this returns √5 = 2 sinh(σ/2) exactly, so the geometry constant may equivalently be written
   > g_c = 1/(2π sinh(σ/2)),   σ = systole(X(1)) = 4 log φ,   (9.9a)
   > a purely metric expression in which no discriminant appears [D].

   (p02) > Throughout, g_c is named the geometry constant g_c = 1/(√5 ⋅ π) (≈ 0.1424; exact; no empirical anchor).

3. **Formal reading**
   - **"hyperbolic element of every Fuchsian group"**: a Fuchsian group is a discrete subgroup of SL(2, ℝ) (or PSL(2, ℝ)); the identity is a statement about one element, and every hyperbolic γ ∈ SL(2, ℝ) lies in a Fuchsian group (the cyclic group it generates is discrete). So the reading is: for every γ ∈ SL(2, ℝ) that is hyperbolic. "Hyperbolic" = `Matrix.IsHyperbolic` on the real matrix (discriminant t² − 4·det > 0, i.e. |t| > 2 at det 1 — the paper's §7.1 condition). A PSL(2, ℝ) element is ±γ; both sides below are unchanged under γ ↦ −γ, so the SL(2, ℝ) form carries the PSL(2, ℝ) form.
   - **t** = `Matrix.trace` of γ. √(t² − 4) is `Real.sqrt (t ^ 2 - 4)`; it depends on t only through t², so it reads the same with |t| (the brief's note).
   - **λ — the sign convention, stated explicitly.** The paper's λ (§2.2 "a hyperbolic element with eigenvalue λ"; §9.5 "multiplier λ = φ²") is the eigenvalue of modulus > 1. For t > 2 it is the root λ > 1 of λ² − tλ + 1 = 0; for t < −2 both eigenvalues are negative, and ℓ = 2 log λ is read with the modulus: ℓ := 2 log |λ|. (Lean's `Real.log` already satisfies `Real.log |x| = Real.log x`, `Real.log_abs`; the spec writes |λ| so the reading is visible, not inherited from a library convention.) In terms of t alone, |λ| = (|t| + √(t² − 4))/2.
   - **ℓ in this sub-row is the number 2 log |λ|**, as printed ("ℓ = 2 log λ"). That this number is the geometric translation length inf_z d(z, γz) is `L:RZ-05` and is taken in `L:RZ-63b`.
   - **The systolic instance**: "t = 3, σ = 4 log φ": the element F² = (2 1; 1 1) has t = 3 and multiplier λ = φ² (φ = `Real.goldenRatio`), so ℓ = 2 log φ² = 4 log φ = σ. The claims: √(3² − 4) = √5, and √5 = 2 sinh(σ/2) with σ = 4 log φ.
   - **(9.9a)**: with g_c = 1/(√5 · π) (abstract), g_c = 1/(2π sinh(σ/2)) at σ = 4 log φ. In this sub-row σ is the number 4 log φ; "σ = systole(X(1))" (a minimum over hyperbolic classes) is `L:RZ-06b`'s statement and is taken in `L:RZ-63b`.
   - "exactly" is the equality sign; nothing numerical is approximated.

4. **Target mathlib declarations** (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
   - `Matrix.SpecialLinearGroup` — Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup; `Matrix.IsHyperbolic` (FinTwo.lean:137) — Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.FinTwo; `Matrix.discr_fin_two` — Mathlib.LinearAlgebra.Matrix.Charpoly.Disc; `Matrix.trace_fin_two` — Mathlib.LinearAlgebra.Matrix.Trace
   - `Real.sinh` (Trigonometric.lean:93) — Mathlib.Analysis.Complex.Trigonometric
   - `Real.sinh_log` (`sinh (log x) = (x − x⁻¹)/2` for 0 < x; Log/Basic.lean:123), `Real.log_abs` (:115), `Real.log_pow` (:288) — Mathlib.Analysis.SpecialFunctions.Log.Basic
   - `Real.sqrt` (Sqrt.lean:112), `Real.sqrt_eq_iff_mul_self_eq` — Mathlib.Analysis.Real.Sqrt
   - `Real.goldenRatio` (GoldenRatio.lean:37), `Real.goldenRatio_sq`, `Real.inv_goldenRatio`, `Real.goldenRatio_sub_goldenConj` (φ − ψ = √5), `Real.goldenRatio_pos` — Mathlib.NumberTheory.Real.GoldenRatio
   - `Real.pi` (Trigonometric/Basic.lean:127) — Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic

   No name in this spec is absent at the pin.

5. **Intended Lean statement**

   Prose: (i) for every hyperbolic γ ∈ SL(2, ℝ) with trace t, and every real root λ of λ² − tλ + 1 = 0 with |λ| > 1, √(t² − 4) = 2 sinh((2 log |λ|)/2); (ii) √(3² − 4) = √5, φ² is a root of λ² − 3λ + 1 = 0 with φ² > 1, 2 log(φ²) = 4 log φ, and √5 = 2 sinh((4 log φ)/2); (iii) 1/(√5 · π) = 1/(2π sinh((4 log φ)/2)).

   ```lean
   /-- L:RZ-63a · RZ §9.5, (9.9a), served p25. For a hyperbolic element with trace t and
   multiplier λ (|λ| > 1), √(t² − 4) = 2 sinh(ℓ/2) with ℓ = 2 log |λ|; at t = 3, σ = 4 log φ,
   √5 = 2 sinh(σ/2), so the geometry constant g_c = 1/(√5·π) equals 1/(2π sinh(σ/2)). -/
   theorem rz_63a_sinh_identity :
       (∀ γ : SL(2, ℝ), (γ : Matrix (Fin 2) (Fin 2) ℝ).IsHyperbolic →
         ∀ lam : ℝ, lam ^ 2 - (γ : Matrix (Fin 2) (Fin 2) ℝ).trace * lam + 1 = 0 → 1 < |lam| →
           √((γ : Matrix (Fin 2) (Fin 2) ℝ).trace ^ 2 - 4)
             = 2 * Real.sinh ((2 * Real.log |lam|) / 2)) ∧
       (√((3 : ℝ) ^ 2 - 4) = √5 ∧
         (Real.goldenRatio ^ 2) ^ 2 - 3 * Real.goldenRatio ^ 2 + 1 = 0 ∧
         1 < Real.goldenRatio ^ 2 ∧
         2 * Real.log (Real.goldenRatio ^ 2) = 4 * Real.log Real.goldenRatio ∧
         √5 = 2 * Real.sinh ((4 * Real.log Real.goldenRatio) / 2)) ∧
       1 / (√5 * Real.pi) = 1 / (2 * Real.pi * Real.sinh ((4 * Real.log Real.goldenRatio) / 2)) := by
     sorry
   ```

   The docstring names g_c "the geometry constant"; the statement writes it out as 1/(√5 · π) and introduces no `def` for it.

6. **What the row does not claim**
   - Not that 2 log |λ| is the hyperbolic translation length of γ, nor that 4 log φ is the systole of X(1) — `L:RZ-63b` (inherits `L:RZ-05`, `L:RZ-06b`).
   - Not "a purely metric expression in which no discriminant appears [D]", nor the paragraph's grading remarks ("This does not promote the √5 … The identity is a diagnostic, not a grade upgrade") — readings about the identity, not mathematics.
   - Not the Γ(2) comparison that follows (`L:RZ-64a`/`b`/`c`).
   - Not that the systolic element is the element of smallest trace (`L:RZ-03`).

7. **Status line**
   - `SPEC-DRAFT 2026-10-28T17:13:14Z`

V1: V1-GREEN 2026-10-28T17:29:27Z — faithful to (9.9a) and its sentence, served p25, with g_c = 1/(√5·π) from p02. Conventions confirmed: 'every hyperbolic element of every Fuchsian group' = every hyperbolic γ ∈ SL(2, ℝ) (each generates a discrete cyclic group); λ = the eigenvalue of modulus > 1 and ℓ := 2 log |λ| (needed for t < −2; √(t² − 4) = |λ| − |λ|⁻¹); ℓ and σ as NUMBERS here, their geometric names in 63b. Numerics checked: 1/(√5π) = 1/(2π sinh(2 log φ)) = 0.14235250868…, 2 sinh(2 log φ) = √5. In-scope leg, keeps the ledger figure ('E1 with ℓ := 2 log λ').

V2: V2-GREEN 2026-10-28T17:50:42Z — rz_63a_sinh_identity says what p25 (9.9a) and p02 print: every hyperbolic γ ∈ SL(2, ℝ) (each lies in a Fuchsian group, its discrete cyclic subgroup) with root λ, |λ| > 1, of λ² − tλ + 1: √(t² − 4) = 2 sinh(ℓ/2), ℓ := 2 log |λ| (the modulus is needed for t < −2); at t = 3, φ² is the multiplier, σ = 4 log φ, √5 = 2 sinh(σ/2); g_c = 1/(√5·π) written out = 1/(2π sinh(σ/2)). ℓ and σ are the numbers here; their geometric names are 63b. 'exactly' = equality.
