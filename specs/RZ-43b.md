# L:RZ-43b — the two orbifold points of X(1): stabilizers in PSL(2, ℤ), cone angles, deficits

1. **Header**
   - row: `L:RZ-43b` (split from `L:RZ-43`; sibling `L:RZ-43a`) — **IN SCOPE under `L:RZ-43`** (placement ruled by the orchestrator on V₁'s finding, 2026-10-28): the ledger's RZ-43 figure (NOW, E1, 1 pd) already counts this sentence — re-key column "CC-2 applied: … deficits π and 4π/3", effort note "the order-3 point has cone angle 2π/3 and deficit 4π/3". 43a and 43b together carry the L:RZ-43 figure. (Earlier label OUT-OF-Q5 (pending the wall), spec_clock 2026-10-28T17:08:01Z, withdrawn; statement text unchanged.)
   - unit: U4 `RiemannZeta/MatricesMobius`
   - paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
   - pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
   - locus: §7.2 "Verification of the mapping", paragraph "Elliptic → Harmonic", third sentence; served PDF page p18 (printed folio 17). No equation tag.
   - spec_clock: 2026-10-28T17:32:43Z (scope label changed only; first drafted 2026-10-28T17:08:01Z)

2. **Printed statement, verbatim**

   > The stabilizers of the two orbifold points in PSL(2, ℤ) are ℤ/2 and ℤ/3, giving cone angles π and 2π/3 — angular deficits π and 4π/3.

3. **Formal reading**
   - "the two orbifold points": the points of X(1) = SL(2, ℤ)\ℍ whose stabilizer in PSL(2, ℤ) is nontrivial, equivalently the points z ∈ ℍ whose stabilizer in SL(2, ℤ) is larger than {1, −1}, taken up to the SL(2, ℤ)-action. The article "the two" carries a count: there are exactly two such orbits, represented by i = `UpperHalfPlane.I` and ρ = e^{2πi/3} = `UpperHalfPlane.ρ` (mathlib's ρ is −1/2 + i√3/2). The count is part of the reading.
   - "stabilizers … in PSL(2, ℤ)": mathlib has no action of PSL(2, ℤ) on ℍ at the pin (only `PGL(2, ℝ)`); the PSL-stabilizer is read as the image of the SL(2, ℤ)-stabilizer `MulAction.stabilizer SL(2, ℤ) z` under `QuotientGroup.mk' (Subgroup.center SL(2, ℤ))` (the centre {±1} acts trivially, so this image is the stabilizer of the induced action).
   - "are ℤ/2 and ℤ/3": group isomorphisms to `Multiplicative (ZMod 2)` and `Multiplicative (ZMod 3)`, i at ℤ/2 and ρ at ℤ/3 (the order the paper gives).
   - "giving cone angles π and 2π/3": the cone angle at an orbifold point with stabilizer of order n is 2π/n — a definition the paper uses but does not print. Taken as a definition in the statement; the geometric fact that the quotient metric has that cone angle is not formalized here (see 6).
   - "angular deficits π and 4π/3": deficit := 2π − cone angle.

4. **Target mathlib declarations** (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
   - `UpperHalfPlane.I` (Basic.lean:41), `UpperHalfPlane.ρ` (Basic.lean:44) — Mathlib.Analysis.Complex.UpperHalfPlane.Basic
   - `UpperHalfPlane.SLAction` (the `MulAction SL(2, R) ℍ` instance) — Mathlib.Analysis.Complex.UpperHalfPlane.MoebiusAction
   - `MulAction.stabilizer` — Mathlib.GroupTheory.GroupAction.Defs
   - `ModularGroup.stabilizer_I` (Modular.lean:738: `g • I = I ↔ g ∈ {1, -1, S, -S}`), `ModularGroup.stabilizer_ρ` (:748), `ModularGroup.stabilizer_of_ne` (:722), `ModularGroup.exists_smul_mem_fd` (:426), `ModularGroup.cases_of_mem_fd_smul_mem_fd`, `ModularGroup.fd` — Mathlib.NumberTheory.Modular
   - `Matrix.ProjectiveSpecialLinearGroup` — Mathlib.LinearAlgebra.Matrix.ProjectiveSpecialLinearGroup; `Subgroup.center` — Mathlib.GroupTheory.Subgroup.Center; `QuotientGroup.mk'` — Mathlib.GroupTheory.QuotientGroup.Defs; `Subgroup.map` — Mathlib.Algebra.Group.Subgroup.Map
   - `Real.pi` — Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic

   No name in this spec is absent at the pin. The orbit-count clause needs a short development from `exists_smul_mem_fd` + `stabilizer_of_ne` (the point `1 +ᵥ ρ` is T-equivalent to ρ); it is not a single mathlib lemma.

5. **Intended Lean statement**

   Prose: (i) every point of ℍ whose SL(2, ℤ)-stabilizer is not contained in {1, −1} lies in the SL(2, ℤ)-orbit of i or of ρ, and these two orbits are distinct; (ii) the image in PSL(2, ℤ) of the stabilizer of i is isomorphic to ℤ/2 and that of ρ to ℤ/3; (iii) with cone angle 2π/n and deficit 2π − 2π/n for stabilizer order n, the angles are π and 2π/3 and the deficits π and 4π/3.

   Proposed signature (shape only; `open scoped MatrixGroups`; `open UpperHalfPlane`):

   ```lean
   /-- L:RZ-43b · RZ §7.2 "Elliptic → Harmonic", served p18.
   The stabilizers of the two orbifold points in PSL(2, ℤ) are ℤ/2 and ℤ/3, giving cone angles
   π and 2π/3 — angular deficits π and 4π/3. (Cone angle := 2π / order of the stabilizer.) -/
   theorem rz_43b_orbifold_points :
       let q := QuotientGroup.mk' (Subgroup.center SL(2, ℤ))
       ((∀ z : ℍ, ¬ (MulAction.stabilizer SL(2, ℤ) z ≤ Subgroup.center SL(2, ℤ)) →
           ∃ g : SL(2, ℤ), g • z = I ∨ g • z = ρ) ∧
         ¬ ∃ g : SL(2, ℤ), g • I = ρ) ∧
       Nonempty ((MulAction.stabilizer SL(2, ℤ) I).map q ≃* Multiplicative (ZMod 2)) ∧
       Nonempty ((MulAction.stabilizer SL(2, ℤ) ρ).map q ≃* Multiplicative (ZMod 3)) ∧
       (2 * Real.pi / Nat.card ((MulAction.stabilizer SL(2, ℤ) I).map q) = Real.pi ∧
         2 * Real.pi / Nat.card ((MulAction.stabilizer SL(2, ℤ) ρ).map q) = 2 * Real.pi / 3 ∧
         2 * Real.pi - 2 * Real.pi / Nat.card ((MulAction.stabilizer SL(2, ℤ) I).map q) = Real.pi ∧
         2 * Real.pi - 2 * Real.pi / Nat.card ((MulAction.stabilizer SL(2, ℤ) ρ).map q)
           = 4 * Real.pi / 3) := by
     sorry
   ```

   The clause (i) uses "stabilizer not inside the centre" for "nontrivial PSL-stabilizer"; that the centre is {1, −1} is `L:RZ-43a` (iv).

6. **What the row does not claim**
   - Not that the hyperbolic metric on X(1) has a cone singularity of angle 2π/n at these points — the cone angle enters as the definition 2π/n; the metric statement needs orbifold geometry absent at the pin (NEEDS-DEVELOPMENT if ever wanted, not asked by the print).
   - Not the "(2, 3) cone structure" reading of the cusp paragraph (§7.2 "Parabolic → Dimensional"; `L:RZ-44a`/`L:RZ-44b`).
   - Not the Harmonic-operator pairing ([C]; `L:RZ-42`).

7. **Status line**
   - `SPEC-DRAFT 2026-10-28T17:32:43Z` (supersedes SPEC-DRAFT 2026-10-28T17:08:01Z; scope label only)

V1: V1-GREEN 2026-10-28T17:29:27Z as a statement — 'the two orbifold points' read with the count (exactly two orbits, i and ρ), PSL stabilizers as images of SL(2, ℤ)-stabilizers (mathlib has no PSL action on ℍ), ℤ/2 at i and ℤ/3 at ρ, cone angle := 2π/n and deficit := 2π − cone angle as definitions (the print says 'giving', the standard formula, and asserts no metric fact); values π, 2π/3, π, 4π/3 true. **V1-SPLIT-WRONG on placement:** the leg is marked OUT-OF-Q5, but the ledger's RZ-43 row (NOW, E1, 1 pd) counts this sentence inside its in-scope figure — its re-key column reads 'CC-2 applied: … deficits π and 4π/3' and its effort note 'The order-3 point has cone angle 2π/3 and deficit 4π/3' — and the spec itself finds every name at the pin (stabilizer_I, stabilizer_ρ, exists_smul_mem_fd, stabilizer_of_ne) with only a short orbit-count development. 43b belongs IN SCOPE beside 43a (keep the two sub-rows, both counted under L:RZ-43); back to M/CO for the placement only, the statement text stands.

V2: V2-GREEN 2026-10-28T17:50:42Z — rz_43b_orbifold_points says what p18 prints: 'the two orbifold points' = every point with SL-stabilizer not inside the centre is in the orbit of i or ρ (mathlib ρ = −1/2 + i√3/2) and the orbits differ; PSL-stabilizers (images under mk' of the centre; no PSL action on ℍ at the pin) ≅ ℤ/2 at i, ℤ/3 at ρ; cone angle := 2π/Nat.card, deficit := 2π − cone angle, giving π, 2π/3, π, 4π/3 — definitions, no metric claim (the print says 'giving'). Not vacuous: an infinite stabilizer would give Nat.card 0 and 2π/0 = 0 ≠ π.
