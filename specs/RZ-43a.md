# L:RZ-43a — elliptic orders in SL(2, ℤ) and their images in PSL(2, ℤ)

1. **Header**
   - row: `L:RZ-43a` (split from `L:RZ-43`; sibling `L:RZ-43b`)
   - unit: U4 `RiemannZeta/MatricesMobius`
   - paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
   - pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
   - locus: §7.2 "Verification of the mapping", paragraph "Elliptic → Harmonic", first two sentences after the lead; served PDF page p18 (printed folio 17). No equation tag.
   - spec_clock: 2026-10-28T17:06:44Z

2. **Printed statement, verbatim** (served edition, `pdftotext -layout`, mathematical-italic letters written plain)

   > Elliptic → Harmonic. Elliptic elements generate rotations about fixed points. For SL(2, ℤ) the elliptic elements have orders 3, 4 and 6 (the only element of order 2, −I, is central and not elliptic); in PSL(2, ℤ) = SL(2, ℤ)/{±I} their images have orders 2 and 3.

   This sub-row takes the sentence "For SL(2, ℤ) … orders 2 and 3." The following sentence (stabilizers, cone angles, deficits) is `L:RZ-43b`. The lead sentence "Elliptic elements generate rotations about fixed points" is the action column of `L:RZ-41` (see `L:RZ-41a`, `L:RZ-41c`) and is not taken here.

3. **Formal reading**
   - Group: `SL(2, ℤ)` = `Matrix.SpecialLinearGroup (Fin 2) ℤ`.
   - "Elliptic": the mathlib predicate `Matrix.IsElliptic` on the underlying integer matrix, `m.discr < 0`, where `m.discr = m.trace ^ 2 - 4 * m.det` (`Matrix.discr_fin_two`). At det 1 this is `|tr γ| < 2`, the paper's own §7.1 condition, so over ℤ it is `tr γ ∈ {−1, 0, 1}`. Both readings coincide on SL(2, ℤ); the spec takes the mathlib predicate and V₁ may ask for the trace form instead — they are interchangeable here.
   - "have orders 3, 4 and 6": the set of orders of elliptic elements of SL(2, ℤ) is exactly {3, 4, 6} — each order attained, no other order occurring. (Read as set equality; the print lists the orders, which carries both directions.)
   - "the only element of order 2, −I": for γ ∈ SL(2, ℤ), `orderOf γ = 2 ↔ γ = -1`.
   - "is central and not elliptic": `-1 ∈ Subgroup.center SL(2, ℤ)` and `¬ (-1 : SL(2,ℤ)).IsElliptic` (its discriminant is 4 − 4 = 0).
   - "PSL(2, ℤ) = SL(2, ℤ)/{±I}": mathlib's `PSL(2, ℤ)` is `Matrix.ProjectiveSpecialLinearGroup (Fin 2) ℤ := SL(2, ℤ) ⧸ Subgroup.center SL(2, ℤ)`. The printed identification with the quotient by {±I} is the fact `Subgroup.center SL(2, ℤ) = {1, -1}`, stated as part (iv) below so that the mathlib quotient is the paper's.
   - "their images have orders 2 and 3": the set of orders of the images in PSL(2, ℤ) of elliptic elements of SL(2, ℤ) is exactly {2, 3}.

4. **Target mathlib declarations** (pin `db584cd6d46c92f209a44c0f1c829460d327499d`; each found by `/usr/bin/grep -rn` over `.lake/packages/mathlib/Mathlib/`)
   - `Matrix.SpecialLinearGroup` — Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
   - `Matrix.IsElliptic` (`def IsElliptic : Prop := m.discr < 0`, FinTwo.lean:140) — Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.FinTwo
   - `Matrix.discr` (Charpoly/Disc.lean:26), `Matrix.discr_fin_two` (:42) — Mathlib.LinearAlgebra.Matrix.Charpoly.Disc
   - `Matrix.trace_fin_two` — Mathlib.LinearAlgebra.Matrix.Trace; `Matrix.det_fin_two` — Mathlib.LinearAlgebra.Matrix.Determinant.Basic
   - `Matrix.aeval_self_charpoly` (Cayley–Hamilton) — Mathlib.LinearAlgebra.Matrix.Charpoly.Basic; `Matrix.charpoly_fin_two` — Mathlib.LinearAlgebra.Matrix.Charpoly.Coeff
   - `orderOf` — Mathlib.GroupTheory.OrderOfElement; `orderOf_eq_iff` (same module)
   - `Subgroup.center` — Mathlib.GroupTheory.Subgroup.Center
   - `Matrix.SpecialLinearGroup.mem_center_iff` — Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
   - `Matrix.ProjectiveSpecialLinearGroup` (notation `PSL(n, R)`, scope `MatrixGroups`) — Mathlib.LinearAlgebra.Matrix.ProjectiveSpecialLinearGroup
   - `QuotientGroup.mk'` — Mathlib.GroupTheory.QuotientGroup.Defs
   - Witnesses available for the "attained" direction: `ModularGroup.S` (trace 0, order 4), `ModularGroup.T`, `ModularGroup.S_mul_S_eq` — Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup.

   No name in this spec is absent at the pin.

5. **Intended Lean statement**

   Prose: (i) the set of natural numbers occurring as the order of an elliptic element of SL(2, ℤ) is {3, 4, 6}; (ii) an element of SL(2, ℤ) has order 2 exactly when it is −1; (iii) −1 is central and is not elliptic; (iv) the centre of SL(2, ℤ) is {1, −1}; (v) the set of orders of the images in PSL(2, ℤ) of elliptic elements of SL(2, ℤ) is {2, 3}.

   Proposed signature (shape only; `open scoped MatrixGroups`):

   ```lean
   /-- L:RZ-43a · RZ §7.2 "Elliptic → Harmonic", served p18.
   For SL(2, ℤ) the elliptic elements have orders 3, 4 and 6; the only element of order 2
   is −I, central and not elliptic; their images in PSL(2, ℤ) = SL(2, ℤ)/{±I} have orders 2 and 3. -/
   theorem rz_43a_elliptic_orders :
       {n : ℕ | ∃ γ : SL(2, ℤ), (γ : Matrix (Fin 2) (Fin 2) ℤ).IsElliptic ∧ orderOf γ = n}
         = {3, 4, 6} ∧
       (∀ γ : SL(2, ℤ), orderOf γ = 2 ↔ γ = -1) ∧
       ((-1 : SL(2, ℤ)) ∈ Subgroup.center SL(2, ℤ) ∧
         ¬ ((-1 : SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ).IsElliptic) ∧
       ((Subgroup.center SL(2, ℤ) : Set SL(2, ℤ)) = {1, -1}) ∧
       {n : ℕ | ∃ γ : SL(2, ℤ), (γ : Matrix (Fin 2) (Fin 2) ℤ).IsElliptic ∧
           orderOf (QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) γ) = n} = {2, 3} := by
     sorry
   ```

   L may split the conjunction into five theorems `rz_43a_i … rz_43a_v` under the one row; the conjunction above is the row's content, no more.

6. **What the row does not claim**
   - Not "elliptic elements generate rotations about fixed points" (the action reading; `L:RZ-41a`/`L:RZ-41c`).
   - Not the stabilizers of the orbifold points, the cone angles or the deficits (`L:RZ-43b`).
   - Not the "Elliptic → Harmonic" pairing of the class type with the Harmonic operator — a proposal [C] (`L:RZ-42`, CONCEPT).
   - Nothing about SL(2, ℝ) or other Fuchsian groups; the orders are a statement about SL(2, ℤ) only.

7. **Status line**
   - `SPEC-DRAFT 2026-10-28T17:06:44Z`

V1: V1-GREEN 2026-10-28T17:29:27Z — faithful to the served (CC-2-corrected) p18 sentence. Set-equality reading of 'have orders 3, 4 and 6' confirmed (tr ∈ {−1, 0, 1} gives orders 3, 4, 6, each attained); 'the only element of order 2' as an iff is the print's; centre = {±1} belongs in the row — it is the printed identification PSL(2, ℤ) = SL(2, ℤ)/{±I} that makes mathlib's quotient by the centre the paper's quotient; PSL image orders {2, 3} true. In-scope leg, keeps the ledger figure.

V2: V2-GREEN 2026-10-28T17:50:42Z — rz_43a_elliptic_orders says what p18 prints: elliptic orders in SL(2, ℤ) exactly {3, 4, 6} (tr −1, 0, 1 ⇒ γ³ = I, γ² = −I, γ³ = −I); orderOf γ = 2 ↔ γ = −1 ('the only element of order 2'); −1 central and not elliptic (discr 0); centre = {1, −1}, which makes mathlib's quotient by the centre the printed SL(2, ℤ)/{±I}; PSL image orders exactly {2, 3}. Set equality = 'have orders', both directions.
