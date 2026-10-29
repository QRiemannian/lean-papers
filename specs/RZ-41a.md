# L:RZ-41a — the §7.1 table, hyperbolic and elliptic rows: trace conditions at det 1, class invariance, fixed-point behaviour

1. **Header**
   - row: `L:RZ-41a` (split from `L:RZ-41`; siblings `L:RZ-41b` (the parabolic row and the "classify" sentence — **CC-CANDIDATE**, stopped) and `L:RZ-41c` (the action column's "dilation along a geodesic" / "rotation about a fixed point" as normal forms — OUT-OF-Q5 pending the wall)). This sub-row carries the ledger's E2 content for the two rows that are true as printed: "the trace characterisation at det 1 and the fixed-point statements".
   - unit: U4 `RiemannZeta/MatricesMobius`
   - paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
   - pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
   - locus: §7.1 "The key identification", the sentence introducing the table and the table's Hyperbolic and Elliptic rows; served PDF p17 (printed folio 16). No equation tag.
   - spec_clock: 2026-10-28T17:17:06Z

2. **Printed statement, verbatim**

   > The modular group SL(2, ℤ) acts on ℍ = {z ∈ ℂ : Im(z) > 0} by Möbius transformations; its elements classify into three types by fixed-point behavior:
   >
   > | Conjugacy class | Condition | Action on ℍ |
   > |---|---|---|
   > | Hyperbolic (generic) | \|tr(γ)\| > 2 | Dilation along a geodesic |
   > | Elliptic | \|tr(γ)\| < 2 | Rotation about a fixed point |
   > | Parabolic | \|tr(γ)\| = 2 | Fixes a single boundary point (cusp) |

   Taken here: the Hyperbolic and Elliptic rows — their Condition column, the "Conjugacy class" header (the type is a class property), and the fixed-point behaviour the introductory sentence attaches to each type. Not taken here: the Parabolic row and the claim that the three types exhaust the elements (`L:RZ-41b`), and the action column read as normal forms (`L:RZ-41c`).

3. **Formal reading**
   - **Group and action:** γ ∈ SL(2, ℤ) acts on ℍ through ℝ (`UpperHalfPlane.SLAction`, which goes through `Matrix.SpecialLinearGroup.mapGL ℝ`), and on the boundary ∂ℍ = ℝ ∪ {∞} = `OnePoint ℝ` through `mapGL ℝ γ ∈ GL(2, ℝ)` (`OnePoint.instGLAction`, Möbius transformations on the projective line).
   - **Types:** mathlib's discriminant predicates — `Matrix.IsHyperbolic m : 0 < m.discr`, `Matrix.IsElliptic m : m.discr < 0`, with `m.discr = m.trace ^ 2 - 4 * m.det` (`Matrix.discr_fin_two`) — on the integer matrix of γ. **The Condition column at det 1** is the statement that these predicates are |tr γ| > 2 and |tr γ| < 2 respectively.
   - **"Conjugacy class" header:** the type is constant on conjugacy classes — for h, γ ∈ SL(2, ℤ), h γ h⁻¹ is hyperbolic (elliptic) iff γ is.
   - **"by fixed-point behavior"**, read for these two types as (the standard content of the classification, which the print asserts without listing): a hyperbolic γ fixes no point of ℍ and exactly two points of ∂ℍ; an elliptic γ fixes exactly one point of ℍ and no point of ∂ℍ. ("Rotation about a fixed point" agrees with the elliptic clause; "Dilation along a geodesic" agrees with the hyperbolic clause — the two fixed boundary points are the geodesic's ends — and the dilation itself is `L:RZ-41c`.)
   - Over SL(2, ℤ) the elliptic condition means tr γ ∈ {−1, 0, 1}; no element of SL(2, ℤ) with |tr| < 2 is scalar, so no exclusion is needed in either row.

4. **Target mathlib declarations** (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
   - `Matrix.IsHyperbolic` (FinTwo.lean:137), `Matrix.IsElliptic` (:140), `Matrix.isHyperbolic_conj_iff` (:144), `Matrix.isElliptic_conj_iff` (:150), `Matrix.GeneralLinearGroup.IsHyperbolic` (:224), `Matrix.GeneralLinearGroup.IsElliptic` (:221), `Matrix.GeneralLinearGroup.fixpointPolynomial` (:229) — Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.FinTwo
   - `Matrix.discr_fin_two` — Mathlib.LinearAlgebra.Matrix.Charpoly.Disc; `Matrix.trace_fin_two` — Mathlib.LinearAlgebra.Matrix.Trace; `Matrix.det_fin_two` — Mathlib.LinearAlgebra.Matrix.Determinant.Basic
   - `Matrix.SpecialLinearGroup.mapGL` (GeneralLinearGroup/Defs.lean:284) — Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
   - `UpperHalfPlane.SLAction` (MoebiusAction.lean:285), `UpperHalfPlane.coe_specialLinearGroup_apply` (:288) — Mathlib.Analysis.Complex.UpperHalfPlane.MoebiusAction
   - `UpperHalfPlane.fixedPt` (FixedPoints.lean), `UpperHalfPlane.gl_smul_eq_self_iff_eq_fixedPt`, `UpperHalfPlane.isElliptic_of_exists_smul_eq_self`, `UpperHalfPlane.forall_smul_eq_self_iff_mem_center` — Mathlib.Analysis.Complex.UpperHalfPlane.FixedPoints
   - `OnePoint.instGLAction`, `OnePoint.smul_infty_eq_self_iff`, `OnePoint.smul_some_eq_ite`, `Matrix.GeneralLinearGroup.fixpointPolynomial_aeval_eq_zero_iff` (ProjectiveLine.lean:176), `Matrix.GeneralLinearGroup.IsElliptic.smul_ne_self` (:220) — Mathlib.Topology.Compactification.OnePoint.ProjectiveLine
   - **Gap named (inside this row's E2, not a missing object):** "a hyperbolic element fixes exactly two points of `OnePoint ℝ`" is not a lemma at the pin (`/usr/bin/grep -rln "IsHyperbolic"` over Mathlib/ returns only FinTwo.lean, where no fixed-point lemma about it sits). It follows from `fixpointPolynomial_aeval_eq_zero_iff` (a quadratic with positive discriminant, or a linear one plus ∞ when the lower-left entry is 0); L develops it in the row. "A hyperbolic element fixes no point of ℍ" is the contrapositive of `isElliptic_of_exists_smul_eq_self` (γ non-central, det > 0).

5. **Intended Lean statement**

   Prose: for every γ ∈ SL(2, ℤ) with trace t: (i) γ is hyperbolic iff |t| > 2, and elliptic iff |t| < 2; (ii) both types are conjugation-invariant in SL(2, ℤ); (iii) if γ is hyperbolic it fixes no point of ℍ and exactly two points of ℝ ∪ {∞}; (iv) if γ is elliptic it fixes exactly one point of ℍ and no point of ℝ ∪ {∞}.

   ```lean
   /-- L:RZ-41a · RZ §7.1 table, Hyperbolic and Elliptic rows, served p17. -/
   theorem rz_41a_hyperbolic_elliptic (γ : SL(2, ℤ)) :
       let m : Matrix (Fin 2) (Fin 2) ℤ := γ
       let g : GL (Fin 2) ℝ := Matrix.SpecialLinearGroup.mapGL ℝ γ
       (m.IsHyperbolic ↔ 2 < |m.trace|) ∧ (m.IsElliptic ↔ |m.trace| < 2) ∧
       (∀ h : SL(2, ℤ),
          (((h * γ * h⁻¹ : SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic ↔ m.IsHyperbolic) ∧
          (((h * γ * h⁻¹ : SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ).IsElliptic ↔ m.IsElliptic)) ∧
       (m.IsHyperbolic →
          (∀ z : ℍ, γ • z ≠ z) ∧
          ∃ p q : OnePoint ℝ, p ≠ q ∧ ∀ c : OnePoint ℝ, g • c = c ↔ c = p ∨ c = q) ∧
       (m.IsElliptic →
          (∃! z : ℍ, γ • z = z) ∧ ∀ c : OnePoint ℝ, g • c ≠ c) := by
     sorry
   ```

6. **What the row does not claim**
   - Not the Parabolic row, and not that every element of SL(2, ℤ) is of one of the three types (`L:RZ-41b`, CC-CANDIDATE).
   - Not "dilation along a geodesic" or "rotation" as conjugacy normal forms (`L:RZ-41c`).
   - Not "(generic)" in any measure-theoretic or density sense.
   - Not the paragraph after the table: the three-types-plus-distinguished-element pairing with the four operators — "a proposal [C], not a partition of conjugacy classes" (`L:RZ-42`, CONCEPT).

7. **Status line**
   - `SPEC-DRAFT 2026-10-28T17:17:06Z`

V1: V1-GREEN 2026-10-28T17:29:27Z — faithful to served p17 (§7.1 intro sentence + Hyperbolic/Elliptic rows). Conventions confirmed: types = mathlib discriminant predicates on the integer matrix, which at det 1 are exactly the printed |tr| > 2 / |tr| < 2; the 'Conjugacy class' header = conjugation invariance; 'by fixed-point behavior' = the standard counts (hyperbolic: none in ℍ, exactly two on OnePoint ℝ; elliptic: exactly one in ℍ, none on the boundary) — the content the print asserts by naming a fixed-point classification, no more. No scalar exclusion needed in these rows (no element of SL(2, ℤ) with |tr| ≠ 2 is scalar). Split leg in scope, keeps the ledger's E2.

V2: V2-GREEN 2026-10-28T17:50:42Z — rz_41a_hyperbolic_elliptic says what p17 prints for the Hyperbolic and Elliptic rows: for γ ∈ SL(2, ℤ), mathlib's discriminant types (FinTwo.lean:137/:140, discr = tr² − 4·det) are |tr| > 2 / |tr| < 2 at det 1 (the Condition column); conjugation invariance (the 'Conjugacy class' header); 'by fixed-point behavior' as the standard counts (hyperbolic: none in ℍ, exactly two on OnePoint ℝ under the Möbius GL action, smul_some_eq_ite = (ax+b)/(cx+d); elliptic: exactly one in ℍ, none on the boundary). Paper's domain (SL(2, ℤ) on ℍ and ℝ ∪ {∞}); no scalar exclusion needed off |tr| = 2. Not the Parabolic row (41b, CC-16), not normal forms (41c).
