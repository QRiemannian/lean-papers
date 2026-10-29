# L:RZ-41c — the §7.1 table's action column as normal forms: "Dilation along a geodesic", "Rotation about a fixed point" — OUT-OF-Q5 (pending the wall)

1. **Header**
   - row: `L:RZ-41c` (split from `L:RZ-41`; siblings `L:RZ-41a` (keeps the ledger's E2 content), `L:RZ-41b` (CC-CANDIDATE)) — **OUT-OF-Q5 (pending the wall)**: the action words name a conjugacy normal form in SL(2, ℝ), beyond the ledger's "trace characterisation at det 1 and the fixed-point statements".
   - unit: U4 `RiemannZeta/MatricesMobius`
   - paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
   - pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
   - locus: §7.1 table, "Action on ℍ" column, Hyperbolic and Elliptic rows; served PDF p17 (printed folio 16). The same words recur in §7.2 ("Hyperbolic elements generate dilation along geodesics"; "Elliptic elements generate rotations about fixed points"), served p18.
   - spec_clock: 2026-10-28T17:17:52Z

2. **Printed statement, verbatim**

   > | Hyperbolic (generic) | \|tr(γ)\| > 2 | Dilation along a geodesic |
   > | Elliptic | \|tr(γ)\| < 2 | Rotation about a fixed point |

   Taken here: "Dilation along a geodesic" (hyperbolic) and "Rotation about a fixed point" (elliptic).

3. **Formal reading**
   - **Dilation along a geodesic:** a hyperbolic γ ∈ SL(2, ℤ) is conjugate in SL(2, ℝ) to ±diag(λ, λ⁻¹) with λ > 1, which acts on ℍ as z ↦ λ²z: a dilation, preserving the geodesic iℝ₊ (the imaginary axis) and moving along it. Read as: ∃ h ∈ SL(2, ℝ), ∃ λ > 1, h · γ · h⁻¹ = diag(λ, λ⁻¹) or = −diag(λ, λ⁻¹) (as real matrices), and for such h the element h γ h⁻¹ maps the imaginary axis {z : re z = 0} onto itself.
   - **Rotation about a fixed point:** an elliptic γ is conjugate in SL(2, ℝ) to a rotation matrix (cos θ −sin θ; sin θ cos θ) with θ ∉ πℤ, which fixes i and acts as a hyperbolic rotation about it. Read as: ∃ h ∈ SL(2, ℝ), ∃ θ, sin θ ≠ 0 ∧ h · γ · h⁻¹ = that matrix.
   - The geodesic in "along a geodesic" is named concretely (the image of the imaginary axis under h⁻¹); mathlib has the hyperbolic metric on ℍ (`UpperHalfPlane.dist_eq`) but no geodesic object, so the reading uses the explicit line.

4. **Target mathlib declarations** (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
   - `Matrix.IsHyperbolic`, `Matrix.IsElliptic` — Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.FinTwo
   - `Matrix.SpecialLinearGroup.map` — Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup; `Int.castRingHom` — Mathlib.Data.Int.Cast.Lemmas
   - `Real.sin` (Trigonometric.lean:74), `Real.cos` (:79) — Mathlib.Analysis.Complex.Trigonometric (matrices written with the `!![…]` literal; no diagonal API needed)
   - `UpperHalfPlane.SLAction` — Mathlib.Analysis.Complex.UpperHalfPlane.MoebiusAction
   - **NEEDS-DEVELOPMENT:** the SL(2, ℝ) conjugacy normal forms (diagonalisation of a hyperbolic element over ℝ with det-1 conjugator; rotation form of an elliptic element) are not lemmas at the pin; both are E2 linear algebra from the eigen-decomposition.

5. **Intended Lean statement**

   ```lean
   /-- L:RZ-41c · RZ §7.1 table, action column, served p17: hyperbolic elements are dilations
   along a geodesic, elliptic elements rotations about a fixed point (SL(2, ℝ) normal forms).
   OUT-OF-Q5 (pending the wall). -/
   theorem rz_41c_normal_forms (γ : SL(2, ℤ)) :
       let m : Matrix (Fin 2) (Fin 2) ℤ := γ
       let γR : SL(2, ℝ) := Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ) γ
       (m.IsHyperbolic → ∃ h : SL(2, ℝ), ∃ lam : ℝ, 1 < lam ∧
          (((h * γR * h⁻¹ : SL(2, ℝ)) : Matrix (Fin 2) (Fin 2) ℝ) = !![lam, 0; 0, lam⁻¹] ∨
           ((h * γR * h⁻¹ : SL(2, ℝ)) : Matrix (Fin 2) (Fin 2) ℝ) = -!![lam, 0; 0, lam⁻¹])) ∧
       (m.IsElliptic → ∃ h : SL(2, ℝ), ∃ θ : ℝ, Real.sin θ ≠ 0 ∧
          ((h * γR * h⁻¹ : SL(2, ℝ)) : Matrix (Fin 2) (Fin 2) ℝ)
            = !![Real.cos θ, -Real.sin θ; Real.sin θ, Real.cos θ]) := by
     sorry
   ```

   (That diag(λ, λ⁻¹) acts as z ↦ λ²z preserving the imaginary axis, and that the rotation matrix fixes i, are one-line consequences via `UpperHalfPlane.coe_specialLinearGroup_apply` and `UpperHalfPlane.gl_smul_I_eq_I_iff_of_pos`; L may add them as conjuncts.)

6. **What the row does not claim**
   - Not the trace conditions or the fixed-point counts (`L:RZ-41a`), not the Parabolic row (`L:RZ-41b`).
   - Not that the dilation's translation length is 2 log λ (`L:RZ-05`).
   - Not the Hyperbolic → Spiral / Elliptic → Harmonic pairings ([C]; `L:RZ-42`).

7. **Status line**
   - `SPEC-DRAFT 2026-10-28T17:17:52Z`

V1: V1-GREEN 2026-10-28T17:29:27Z (as a proposed OUT-OF-Q5 statement) — 'Dilation along a geodesic' / 'Rotation about a fixed point' read as SL(2, ℝ)-conjugacy to ±diag(λ, λ⁻¹), λ > 1, and to a rotation with sin θ ≠ 0: the standard content, true for every hyperbolic/elliptic γ ∈ SL(2, ℤ); the ± on the diagonal form is needed (negative-trace hyperbolics) and present. Note for L: §3's 'h γ h⁻¹ preserves the imaginary axis' is not in the shape; it follows from the matrix form, so the shape is not weaker, but write it as a conjunct if kept in the docstring. Separation from 41a honest: the ledger's E2 figure names 'the trace characterisation at det 1 and the fixed-point statements', not normal forms.

V2: V2-GREEN 2026-10-28T17:50:42Z (OUT-OF-Q5, pending the wall) — rz_41c_normal_forms is the spec verbatim: hyperbolic γ conjugate in SL(2, ℝ) to ±diag(λ, λ⁻¹), λ > 1 (the ± needed for negative trace); elliptic γ conjugate to a rotation with sin θ ≠ 0. True for every such γ (a GL-conjugator of the wrong sign is fixed by negating one column; the rotation sense is absorbed by θ). The docstring claims no 'preserves the imaginary axis' conjunct, so docstring and statement agree; reading of 'dilation along a geodesic' / 'rotation about a fixed point' as normal forms, no more.
