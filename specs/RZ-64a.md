# L:RZ-64a — Γ(2): minimal hyperbolic |trace| 6, √(t² − 4) = √32, multiplier 3 + 2√2

1. **Header**
   - row: `L:RZ-64a` (split from `L:RZ-64`; siblings `L:RZ-64b` (√d_K = √8 for ℚ(√2)), `L:RZ-64c` (conductor 1 on X(1))). This sub-row keeps the ledger figure (E1, 1 pd; the ledger: "E1 for the trace part").
   - unit: U4 `RiemannZeta/MatricesMobius`
   - paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
   - pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
   - locus: §9.5, paragraph "The metric twin, and what it does not buy.", the sentence after display (9.9a); served PDF p25 (printed folio 24). REWORDED in the republish ("for its trace field ℚ(√2)" → "for the quadratic field ℚ(√2) of its multiplier 3 + 2√2").
   - spec_clock: 2026-10-28T17:14:29Z

2. **Printed statement, verbatim**

   > Nor are the two writings the same function off X(1): at Γ(2) the minimal hyperbolic trace is t = 6, giving √(t² − 4) = √32 against √d_K = √8 for the quadratic field ℚ(√2) of its multiplier 3 + 2√2 — they agree on X(1) only because the systolic element there has conductor 1.

   Taken here: "at Γ(2) the minimal hyperbolic trace is t = 6, giving √(t² − 4) = √32", and "its multiplier 3 + 2√2" (the multiplier of a trace-6 element). "√d_K = √8 for the quadratic field ℚ(√2)" is `L:RZ-64b`; "conductor 1" is `L:RZ-64c`.

3. **Formal reading**
   - **Γ(2)** = the principal congruence subgroup of level 2 of SL(2, ℤ): matrices ≡ I mod 2 — mathlib `CongruenceSubgroup.Gamma 2` (notation Γ(2)), membership by `CongruenceSubgroup.Gamma_mem`.
   - **"hyperbolic"**: `Matrix.IsHyperbolic` on the integer matrix (t² − 4 > 0, i.e. |t| > 2 at det 1).
   - **"the minimal hyperbolic trace is t = 6"**: −I ∈ Γ(2), so traces come in ± pairs (tr(−γ) = −tr γ); "minimal trace" is read with |t|: the least |tr γ| over hyperbolic γ ∈ Γ(2) is 6, attained (with t = 6 itself attained). Underlying arithmetic (not printed): γ ∈ Γ(2) forces a ≡ d ≡ 1 (mod 2) and bc ≡ 0 (mod 4), so ad ≡ 1 (mod 4), a ≡ d (mod 4), t ≡ 2 (mod 4); the |t| > 2 values are 6, 10, …. This is a proof route, not a clause of the statement.
   - **"giving √(t² − 4) = √32"**: √(6² − 4) = √32.
   - **"its multiplier 3 + 2√2"**: the multiplier (eigenvalue of modulus > 1) of a trace-6 element of SL(2, ℝ) is 3 + 2√2: it is a root of λ² − 6λ + 1 = 0 and exceeds 1. ("its" refers to the minimal-trace element; every trace-6 element of SL(2, ℝ) has this multiplier.)

4. **Target mathlib declarations** (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
   - `CongruenceSubgroup.Gamma` (CongruenceSubgroups.lean:41, notation `Γ(N)`), `CongruenceSubgroup.Gamma_mem` (:50) — Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
   - `Matrix.SpecialLinearGroup` — Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup; `Matrix.IsHyperbolic` (FinTwo.lean:137) — Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.FinTwo; `Matrix.discr_fin_two` — Mathlib.LinearAlgebra.Matrix.Charpoly.Disc; `Matrix.trace_fin_two` — Mathlib.LinearAlgebra.Matrix.Trace; `Matrix.det_fin_two` — Mathlib.LinearAlgebra.Matrix.Determinant.Basic
   - `Real.sqrt` — Mathlib.Analysis.Real.Sqrt
   - A witness for attainment (not printed; for L): (1 2; 2 5) — det 1, ≡ I mod 2, trace 6.

   No name in this spec is absent at the pin.

5. **Intended Lean statement**

   Prose: (i) some hyperbolic γ ∈ Γ(2) has trace 6; (ii) every hyperbolic γ ∈ Γ(2) has |tr γ| ≥ 6; (iii) √(6² − 4) = √32; (iv) 3 + 2√2 is a root of λ² − 6λ + 1 = 0 and 3 + 2√2 > 1.

   ```lean
   /-- L:RZ-64a · RZ §9.5, served p25: at Γ(2) the minimal hyperbolic trace is t = 6
   (read with |t|), giving √(t² − 4) = √32; the multiplier of trace 6 is 3 + 2√2. -/
   theorem rz_64a_gamma2_min_trace :
       (∃ γ ∈ CongruenceSubgroup.Gamma 2,
           (γ : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic ∧ (γ : Matrix (Fin 2) (Fin 2) ℤ).trace = 6) ∧
       (∀ γ ∈ CongruenceSubgroup.Gamma 2, (γ : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic →
           6 ≤ |(γ : Matrix (Fin 2) (Fin 2) ℤ).trace|) ∧
       √((6 : ℝ) ^ 2 - 4) = √32 ∧
       ((3 + 2 * √2 : ℝ) ^ 2 - 6 * (3 + 2 * √2) + 1 = 0 ∧ (1 : ℝ) < 3 + 2 * √2) := by
     sorry
   ```

6. **What the row does not claim**
   - Not √d_K = √8 nor that ℚ(3 + 2√2) = ℚ(√2) (`L:RZ-64b`).
   - Not "they agree on X(1) only because the systolic element there has conductor 1" (`L:RZ-64c`; the "only because" is an explanation, not taken as a formal claim anywhere).
   - Not "Nor are the two writings the same function off X(1)" as a general statement about all Fuchsian groups — only the Γ(2) instance printed.
   - Not any claim about Γ(2)'s systole as a translation length (that would ride `L:RZ-05`).

7. **Status line**
   - `SPEC-DRAFT 2026-10-28T17:14:29Z`

V1: V1-GREEN 2026-10-28T17:29:27Z — faithful to served p25 (REWORDED sentence). 'minimal hyperbolic trace is t = 6' read with |t| — necessary, since −I ∈ Γ(2) and signed traces of hyperbolic elements are unbounded below; the shape also asserts t = +6 attained, matching the printed 't = 6'. Checked by brute force over entries in [−15, 15]: hyperbolic |traces| in Γ(2) are 6, 10, 14, 18, …; √32, and 3 + 2√2 as the trace-6 multiplier, true. In-scope leg, keeps the ledger figure ('E1 for the trace part').

V2: V2-GREEN 2026-10-28T17:50:42Z — rz_64a_gamma2_min_trace says what p25 prints: some hyperbolic γ ∈ Γ(2) has trace 6 (e.g. (1 2; 2 5)); every hyperbolic γ ∈ Γ(2) has |tr| ≥ 6 (the |t| reading is forced: −I ∈ Γ(2)); √(6² − 4) = √32; 3 + 2√2 is the root > 1 of λ² − 6λ + 1 (the multiplier). Nothing about d_K or conductor (64b, 64c).
