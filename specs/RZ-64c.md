# L:RZ-64c — "they agree on X(1) … the systolic element there has conductor 1" — OUT-OF-Q5 (pending the wall)

1. **Header**
   - row: `L:RZ-64c` (split from `L:RZ-64`; siblings `L:RZ-64a` (keeps the ledger figure), `L:RZ-64b`) — **OUT-OF-Q5 (pending the wall)**. Rides `L:RZ-09` (ring of integers ℤ[φ] and d_K = 5 for ℚ(√5), EFFORT, 20 pd).
   - unit: U4 `RiemannZeta/MatricesMobius`
   - paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
   - pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
   - locus: §9.5, the sentence after display (9.9a), final clause; served PDF p25 (printed folio 24).
   - spec_clock: 2026-10-28T17:15:27Z

2. **Printed statement, verbatim**

   > … √d_K = √8 for the quadratic field ℚ(√2) of its multiplier 3 + 2√2 — they agree on X(1) only because the systolic element there has conductor 1.

   Taken here: "they agree on X(1)" and "the systolic element there has conductor 1". "only because" is an explanation and is not taken (see 6).

3. **Formal reading**
   - "the two writings" (√(t² − 4) and √d_K) "agree on X(1)": at the systolic element t = 3 and K = ℚ(√5): √(3² − 4) = √(d_K) with d_K = `NumberField.discr ℚ(√5)` = 5.
   - "the systolic element there has conductor 1": the systolic element F² = (2 1; 1 1) has multiplier λ = φ²; its conductor is the conductor of the order ℤ[λ] in the ring of integers 𝓞_K, K = ℚ(√5). mathlib's ring-theoretic conductor `conductor ℤ x : Ideal S` (the largest ideal of S contained in ℤ[x]); "conductor 1" is read as the unit ideal: `conductor ℤ λ = ⊤` in S = 𝓞 K, i.e. ℤ[φ²] = 𝓞_K. (Equivalently, the index [𝓞_K : ℤ[λ]] is 1; the paper's "conductor 1" is the integer form of the same statement.) Not printed, for V₁: t² − 4 = f²·d_K with f the conductor index — 5 = 1²·5 at X(1), 32 = 2²·8 at Γ(2) — is the identity behind the clause; the row does not claim it in general.

4. **Target mathlib declarations** (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
   - `conductor` (root namespace; RingTheory/Conductor.lean:32) — Mathlib.RingTheory.Conductor
   - `NumberField.discr` — Mathlib.NumberTheory.NumberField.Discriminant.Defs; `NumberField.RingOfIntegers` (notation 𝓞) — Mathlib.NumberTheory.NumberField.Basic
   - `IntermediateField.adjoin` — Mathlib.FieldTheory.IntermediateField.Adjoin.Defs
   - `Real.goldenRatio`, `Real.goldenRatio_sq` — Mathlib.NumberTheory.Real.GoldenRatio
   - **NEEDS-DEVELOPMENT:** 𝓞(ℚ(√5)) = ℤ[φ] and d_K = 5 (`L:RZ-09`; the ledger: "no ℚ(√5)-specific result found"); the element φ² as an element of 𝓞 K (integrality of φ, from φ² = φ + 1).

5. **Intended Lean statement**

   ```lean
   open IntermediateField NumberField in
   /-- L:RZ-64c · RZ §9.5, served p25: on X(1) the two writings agree, √(3² − 4) = √d_K with
   K = ℚ(√5), and the systolic element's multiplier φ² generates 𝓞_K (conductor 1).
   OUT-OF-Q5 (pending the wall); rides L:RZ-09. -/
   theorem rz_64c_conductor_one [NumberField ℚ⟮(√5 : ℝ)⟯]
       (phiSq : 𝓞 ℚ⟮(√5 : ℝ)⟯)
       (hphiSq : ((phiSq : ℚ⟮(√5 : ℝ)⟯) : ℝ) = Real.goldenRatio ^ 2) :
       √((3 : ℝ) ^ 2 - 4) = √(NumberField.discr ℚ⟮(√5 : ℝ)⟯ : ℝ) ∧
       conductor ℤ phiSq = ⊤ := by
     sorry
   ```

   (Shape only: L constructs φ² in 𝓞 K inside `Challenge.lean` rather than taking it as a hypothesis; the hypothesis form above only pins which element is meant.)

6. **What the row does not claim**
   - Not "only because": that the agreement *holds because of* conductor 1 is an explanation; a formal reading would be the general identity t² − 4 = f²·d_K, which the print does not state.
   - Not anything about Γ(2)'s conductor (2), which the print does not state.
   - Not the [D]/[I] grading content of the paragraph.

7. **Status line**
   - `SPEC-DRAFT 2026-10-28T17:15:27Z`

V1: V1-GREEN 2026-10-28T17:29:27Z (as a proposed OUT-OF-Q5 statement) — 'agree on X(1)' = √(3² − 4) = √d_K with d_K(ℚ(√5)) = 5; 'conductor 1' = mathlib conductor ℤ φ² = ⊤ in 𝓞_K (checked the def at the pin: the largest ideal of S inside ℤ[x], so ⊤ ⇔ ℤ[φ²] = 𝓞_K, the index-1 statement); true (φ² = φ + 1). Declining 'only because' as a formal claim is right — the print states no general identity. Separation honest: rides RZ-09 (𝓞(ℚ(√5)), E3).

V2: V2-GREEN 2026-10-28T17:50:42Z (OUT-OF-Q5, pending the wall) — rz_64c_conductor_one: √(3² − 4) = √d_K with K = ℚ⟮√5⟯ ('agree on X(1)'), and conductor ℤ φ² = ⊤ in 𝓞 K (the conductor def at the pin, RingTheory/Conductor.lean: the largest ideal of 𝓞 K inside ℤ[φ²], so ⊤ ⇔ ℤ[φ²] = 𝓞 K, conductor 1); 'only because' not taken. Departures ruled: the NumberField binder replaced by numberField_Q_sqrt5 (Prop-valued class, ACCEPTED); the binders (phiSq, hphiSq) replaced by the constructed RZ.phiSq := ⟨⟨φ², _⟩, _⟩ with the pin kept as the first conjunct — the coercion 𝓞 K → ℝ is injective, so the spec's '∀ phiSq with value φ²' and this statement about the one such element say the same, and the Lean form also carries existence, so it cannot hold vacuously (ACCEPTED).
