# L:RZ-64b — √d_K = √8 for the quadratic field ℚ(√2) of the multiplier 3 + 2√2 — OUT-OF-Q5 (pending the wall)

1. **Header**
   - row: `L:RZ-64b` (split from `L:RZ-64`; siblings `L:RZ-64a` (keeps the ledger figure), `L:RZ-64c`) — **OUT-OF-Q5 (pending the wall)**. The ledger: "d_K(ℚ(√2)) = 8 inherits RZ-13" (`L:RZ-13`, EFFORT: "quadratic-field discriminant formula (d or 4d) not found"). If `L:RZ-13` lands, this sub-row rides it at E1.
   - unit: U4 `RiemannZeta/MatricesMobius`
   - paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
   - pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
   - locus: §9.5, the sentence after display (9.9a); served PDF p25 (printed folio 24).
   - spec_clock: 2026-10-28T17:15:02Z

2. **Printed statement, verbatim**

   > … at Γ(2) the minimal hyperbolic trace is t = 6, giving √(t² − 4) = √32 against √d_K = √8 for the quadratic field ℚ(√2) of its multiplier 3 + 2√2 — …

   Taken here: "√d_K = √8 for the quadratic field ℚ(√2) of its multiplier 3 + 2√2".

3. **Formal reading**
   - "the quadratic field … of its multiplier 3 + 2√2": the field generated over ℚ by 3 + 2√2, which equals ℚ(√2). Read inside ℝ: the intermediate fields ℚ⟮3 + 2√2⟯ and ℚ⟮√2⟯ of ℝ/ℚ coincide.
   - "d_K": the absolute discriminant of the number field K = ℚ(√2), mathlib `NumberField.discr K : ℤ` (the discriminant of a ℤ-basis of 𝓞 K).
   - "√d_K = √8": `NumberField.discr K = 8`, so √d_K = √8 (the square root of the integer 8 cast to ℝ).

4. **Target mathlib declarations** (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
   - `NumberField.discr` (Discriminant/Defs.lean:36, an `abbrev`) — Mathlib.NumberTheory.NumberField.Discriminant.Defs
   - `IntermediateField.adjoin` (Adjoin/Defs.lean:34; notation `F⟮α⟯` in scope `IntermediateField`) — Mathlib.FieldTheory.IntermediateField.Adjoin.Defs
   - `NumberField` (class) — Mathlib.NumberTheory.NumberField.Basic
   - `Real.sqrt` — Mathlib.Analysis.Real.Sqrt
   - **NEEDS-DEVELOPMENT:** the discriminant of ℚ(√2) (more generally of a real quadratic field, `L:RZ-13`) is not at the pin: `/usr/bin/grep -rln "sqrt 2\|√2" Mathlib/NumberTheory/NumberField` returns no file. The `NumberField` instance on `ℚ⟮√2⟯` (as an intermediate field of ℝ) also has to be supplied (finite-dimensionality from √2 algebraic).

5. **Intended Lean statement**

   ```lean
   open IntermediateField in
   /-- L:RZ-64b · RZ §9.5, served p25: the quadratic field of the multiplier 3 + 2√2 is ℚ(√2),
   with d_K = 8. OUT-OF-Q5 (pending the wall); rides L:RZ-13. -/
   theorem rz_64b_disc_Q_sqrt2 [NumberField ℚ⟮(√2 : ℝ)⟯] :
       ℚ⟮((3 + 2 * √2 : ℝ))⟯ = ℚ⟮(√2 : ℝ)⟯ ∧ NumberField.discr ℚ⟮(√2 : ℝ)⟯ = 8 := by
     sorry
   ```

   (The instance argument is a shape placeholder; L supplies the instance in `Challenge.lean` rather than taking it as a hypothesis, so the statement is not conditional on it.)

6. **What the row does not claim**
   - Not the Γ(2) trace facts (`L:RZ-64a`), not the conductor clause (`L:RZ-64c`).
   - Not that 8 is the discriminant "of the trace field" (the republish removed that wording).

7. **Status line**
   - `SPEC-DRAFT 2026-10-28T17:15:02Z`

V1: V1-GREEN 2026-10-28T17:29:27Z (as a proposed OUT-OF-Q5 statement) — ℚ(3 + 2√2) = ℚ(√2) inside ℝ and d_K = 8 (√d_K = √8 with d_K ∈ ℤ is d_K = 8): faithful; the instance-as-hypothesis is a named placeholder L must discharge in Challenge.lean, not a condition of the statement. Separation honest: the ledger says 'd_K(ℚ(√2)) = 8 inherits RZ-13'.

V2: V2-GREEN 2026-10-28T17:50:42Z (OUT-OF-Q5, pending the wall) — rz_64b_disc_Q_sqrt2: ℚ⟮3 + 2√2⟯ = ℚ⟮√2⟯ inside ℝ and NumberField.discr ℚ⟮√2⟯ = 8 (√d_K = √8 with d_K ∈ ℤ). Departure ruled: the binder [NumberField ℚ⟮√2⟯] replaced by the file's instance numberField_Q_sqrt2 — NumberField is a Prop-valued class (NumberField/Basic.lean:44), so discr does not depend on which instance; the spec asked for the instance to be supplied; the statement is now unconditional and says the same thing (ACCEPTED).
