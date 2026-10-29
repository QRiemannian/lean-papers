# L:RZ-53b — the Selberg zeta product (8.5) — NEEDS-DEVELOPMENT · OUT-OF-Q5 (pending the wall)

1. **Header**
   - row: `L:RZ-53b` (split from `L:RZ-53`; siblings `L:RZ-53a`, `L:RZ-53c`) — **OUT-OF-Q5 (pending the wall)**; the ledger's own note: "Z(s) inherits RZ-01".
   - unit: U4 `RiemannZeta/MatricesMobius`
   - paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
   - pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
   - locus: §8.2, display (8.5) and the sentence around it; served PDF p21 (printed folio 20).
   - spec_clock: 2026-10-28T17:11:27Z

2. **Printed statement, verbatim**

   > Mayer (1991) established that the Selberg zeta function Z(s) of PSL(2, ℤ) satisfies [(8.4)] … The Selberg zeta function is
   > Z(s) = ∏_p ∏_{k=0}^∞ (1 − N(p)^{−s−k}),   (8.5)
   > the outer product over primitive hyperbolic conjugacy classes {p} with norms N(p).

   (The elided span is display (8.4) and its sentence, `L:RZ-54`; only "of PSL(2, ℤ)" is carried from it, as the group the product runs over.)

3. **Formal reading**
   - Group: PSL(2, ℤ) (named in the sentence before (8.4)); mathlib `PSL(2, ℤ)` = `Matrix.ProjectiveSpecialLinearGroup (Fin 2) ℤ`.
   - "hyperbolic conjugacy classes": conjugacy classes (`ConjClasses PSL(2, ℤ)`) of images of hyperbolic elements (`Matrix.IsHyperbolic` on a representative; the predicate is conjugation- and sign-invariant: `Matrix.isHyperbolic_conj_iff`, `Matrix.isHyperbolic_neg_iff`).
   - "primitive": a class whose elements are not a proper power (g ≠ h^m for every h and every m ≥ 2). Not printed in more detail than the word.
   - "norms N(p)": N(p) = λ², λ > 1 the larger absolute eigenvalue of a representative; at det 1, λ = (|t| + √(t² − 4))/2 with t the trace (this is the paper's §2.2 / §9.5 usage, "norm N = λ²"; for F², N = φ⁴). The print defines N(p) only by the word "norms"; the formula is the standard one and is named here as the reading.
   - The double product: an infinite product over a countable index set, in Lean `tprod`, which returns 1 where the family is not multipliable. The print gives no convergence region (classically re s > 1); none is claimed.
   - **The gap at the pin:** mathlib has `ConjClasses`, `Matrix.IsHyperbolic`, `tprod`, but no "primitive hyperbolic conjugacy class" object and no norm map on such classes. The definition is a few lines from these pieces; nothing in it is a theorem. The row's formal content is the definition alone, and its use (Mayer (8.4), `L:RZ-54`; the resonances, `L:RZ-N5`) is EFFORT-FAR.

4. **Target mathlib declarations** (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
   - `ConjClasses` — Mathlib.Algebra.Group.Conj (Conj.lean:133)
   - `Matrix.ProjectiveSpecialLinearGroup` — Mathlib.LinearAlgebra.Matrix.ProjectiveSpecialLinearGroup
   - `Matrix.IsHyperbolic`, `Matrix.isHyperbolic_conj_iff`, `Matrix.isHyperbolic_neg_iff` — Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.FinTwo
   - `tprod` — Mathlib.Topology.Algebra.InfiniteSum.Defs (Defs.lean:142)
   - `Complex.cpow` — Mathlib.Analysis.SpecialFunctions.Pow.Complex; `Real.sqrt` — Mathlib.Analysis.Real.Sqrt
   - **NEEDS-DEVELOPMENT:** `primitive hyperbolic conjugacy class of PSL(2, ℤ)` and `N : (those classes) → ℝ` — not at the pin under any name (searched: `/usr/bin/grep -rn "primitive"` over `Mathlib/NumberTheory/Modular.lean`, `Mathlib/NumberTheory/ModularForms/`, `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/` — 0 hits; no `selberg` declaration other than `SelbergSieve`, per the names re-check).

5. **Intended Lean statement**

   Prose: Z(s) is the product, over primitive hyperbolic conjugacy classes p of PSL(2, ℤ) and over k = 0, 1, 2, …, of (1 − N(p)^{−s−k}).

   Proposed shape (definitions only; no theorem asserts anything about Z):

   ```lean
   /-- primitive hyperbolic conjugacy classes of PSL(2, ℤ) — NEEDS-DEVELOPMENT (not at the pin). -/
   def RZ.PrimHypClass : Type := sorry   -- a subtype of `ConjClasses PSL(2, ℤ)`

   /-- the norm N(p) = λ², λ > 1 the eigenvalue modulus of a representative. -/
   noncomputable def RZ.classNorm : RZ.PrimHypClass → ℝ := sorry

   /-- RZ (8.5): Z(s) = ∏_p ∏_{k ≥ 0} (1 − N(p)^{−s−k}) (as `tprod`). -/
   noncomputable def RZ.selbergZeta (s : ℂ) : ℂ :=
     ∏' p : RZ.PrimHypClass, ∏' k : ℕ, (1 - ((RZ.classNorm p : ℝ) : ℂ) ^ (-s - k))
   ```

   The two `sorry`-bodied defs are the development the row needs; they are not to be filled by `sorry` in a counted `Challenge.lean`.

6. **What the row does not claim**
   - Not Mayer's identity (8.4) nor the Lewis–Zagier parity (`L:RZ-54`), nor the zeros at s = ρ/2 (`L:RZ-N5`).
   - Not convergence of the product for re s > 1, nor analytic continuation, nor the functional equation.
   - Not the correspondence hyperbolic classes ↔ closed geodesics (`L:RZ-01`, EFFORT-FAR); N(p) is defined from the matrix, not from geodesic length.

7. **Status line**
   - `SPEC-DRAFT 2026-10-28T17:11:27Z`

V1: V1-GREEN 2026-10-28T17:29:27Z (as a NEEDS-DEVELOPMENT, OUT-OF-Q5 definition) — (8.5) over primitive hyperbolic classes of PSL(2, ℤ) (the group named in the sentence before (8.4)), N(p) = λ² with λ the eigenvalue modulus > 1: confirmed by the paper's own usage (§9.5 p24 'multiplier λ = φ² and norm N = λ² = φ⁴'; (6.6) ℓ = log N(p)). tprod junk value 1, no convergence region claimed (none printed). Separation honest: the ledger itself says 'Z(s) inherits RZ-01'.

V2: N/A — no theorem 2026-10-28T17:50:42Z — OPEN, NEEDS-DEVELOPMENT (primitive hyperbolic classes and their norm absent at the pin); nothing in Challenge.lean to read for this row, uncounted.
