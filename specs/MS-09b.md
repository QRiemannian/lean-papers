# L:MS-09b — (2.8) "is the fundamental automorph": φ² is the least (t + u√5)/2 > 1 with t² − 5u² = 4 — OUT-OF-Q5 pending the wall's re-weigh at the IsLeast cost

## 1 · Header
- row: L:MS-09b (split from L:MS-09; sibling L:MS-09a carries the identity φ² = (3 + √5)/2 and the ledger figure). **OUT-OF-Q5 pending the wall's re-weigh at the IsLeast cost** — the scope word stays the wall's (V₁ reads the restated row at about E1; it may return to Q5).
- unit: U8 (`ModularSurface/Now`)
- paper: MS — *The Invariant Structure of the Modular Surface* (2026, revised October 2026)
- pdf_sha256: `b4841489ec6bea619f8d5525ce4c788b86e0109e51d6e9d2cb252690f5b13af5`
- locus: §2.2, the clause closing display (2.8), served PDF p06 (printed folio 5). Re-key change class: UNCHANGED.
- spec_clock: 2026-10-28T17:32:19Z (first draft); restated 2026-10-28T17:55:03Z (M-amend, see §7)

## 2 · Printed statement, verbatim
§2.2 (p06): "so that ⟦φ² = (3 + √5)/2 (2.8)⟧ is the fundamental automorph."

## 3 · Formal reading
- "The fundamental automorph" is a definite description. Classically (Gauss–Dirichlet), for discriminant D = 5 the automorphs correspond to the solutions of t² − 5u² = 4 through the number (t + u√5)/2, and **the fundamental one is by definition the least such number greater than 1** (the fundamental solution). The print calls the number φ² itself "the fundamental automorph"; the spec reads that as minimality, with attainment at (t, u) = (3, 1).
- Formal content taken: φ² is the least element of E = {(t + u√5)/2 : t, u ∈ ℤ, t² − 5u² = 4, (t + u√5)/2 > 1}; (3, 1) solves t² − 5u² = 4 and gives φ² = (3 + 1·√5)/2.
- **Not taken (optional strengthening, costed separately):** the generator form "every element of E is a positive power of φ²". That is a further classical theorem (descent / the unit theorem for ℤ[φ]), not the meaning of the word; estimated E2, NEEDS-DEVELOPMENT (no generator result for t² − 5u² = 4 and no automorph theory at the pin). It enters only if the wall asks for it as its own sub-row.
- Cost of the stated row (route for L, not a claim): for ε = (t + u√5)/2 ∈ E, εε̄ = (t² − 5u²)/4 = 1, so 0 < ε̄ = 1/ε < 1; then t = ε + ε̄ > 1 gives t ≥ 2, u√5 = ε − ε̄ > 0 gives u ≥ 1, and t² = 4 + 5u² ≥ 9 gives t ≥ 3; hence ε ≥ (3 + √5)/2 = φ². About **E1**: integer case analysis and `Real.sqrt` arithmetic, no descent, no automorph theory.
- Ring caution for L (unchanged): φ² is not an element of ℤ[√5]; a formalisation through `Zsqrtd 5` / `Pell.Solution₁ 5` (x² − 5y² = 1) lands on 9 + 4√5 = φ⁶ and would not state this row. The real-number form below avoids the choice.

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
| declaration | kind | module (file:line) |
|---|---|---|
| `Real.goldenRatio` | abbrev | Mathlib.NumberTheory.Real.GoldenRatio (GoldenRatio.lean:37) |
| `Real.goldenRatio_sq` | theorem | Mathlib.NumberTheory.Real.GoldenRatio (GoldenRatio.lean:83) |
| `Real.one_lt_goldenRatio` | theorem | Mathlib.NumberTheory.Real.GoldenRatio (GoldenRatio.lean:96) |
| `Real.sqrt` | def | Mathlib.Analysis.Real.Sqrt (Sqrt.lean:112) |
| `Real.sq_sqrt` | theorem | Mathlib.Analysis.Real.Sqrt (Sqrt.lean:178) |
| `Real.sqrt_pos` | theorem | Mathlib.Analysis.Real.Sqrt (Sqrt.lean:286) |
| `IsLeast` | def | Mathlib.Order.Bounds.Defs (Defs.lean:45) |
| `Pell.Solution₁`, `Pell.IsFundamental` | def | Mathlib.NumberTheory.Pell (Pell.lean:94, :430) — present, for x² − dy² = 1 only (see the ring caution); not used |
No gap for the stated (IsLeast) row. NEEDS-DEVELOPMENT applies only to the optional generator strengthening (no `BinaryQuadraticForm`, no generator result for t² − 5u² = 4 at the pin).

## 5 · Intended Lean statement
Prose: among the numbers (t + u√5)/2 greater than 1 with t, u integers and t² − 5u² = 4, the least is φ²; and (3, 1) solves t² − 5u² = 4 with φ² = (3 + 1·√5)/2.

```lean
/-- L:MS-09b — MS §2.2 (2.8), served p06 (sha256 b4841489…3af5): "φ² = (3 + √5)/2 is the
fundamental automorph", read as minimality (the definite description), attained at (3, 1).
OUT-OF-Q5 pending the wall's re-weigh at the IsLeast cost. -/
theorem ms_09b_fundamental_automorph :
    IsLeast {ε : ℝ | 1 < ε ∧ ∃ t u : ℤ, t ^ 2 - 5 * u ^ 2 = 4 ∧ ε = ((t : ℝ) + u * Real.sqrt 5) / 2}
      (Real.goldenRatio ^ 2) ∧
    ((3 : ℤ) ^ 2 - 5 * 1 ^ 2 = 4) ∧
    Real.goldenRatio ^ 2 = (((3 : ℤ) : ℝ) + ((1 : ℤ) : ℝ) * Real.sqrt 5) / 2 := by sorry
```
Optional strengthening, **not part of this row** (its own sub-row only if the wall asks; E2, NEEDS-DEVELOPMENT):
```lean
-- ∀ t u : ℤ, t ^ 2 - 5 * u ^ 2 = 4 → 1 < ((t : ℝ) + u * Real.sqrt 5) / 2 →
--   ∃ n : ℕ, 0 < n ∧ ((t : ℝ) + u * Real.sqrt 5) / 2 = (Real.goldenRatio ^ 2) ^ n
```

## 6 · What the row does not claim
- Not the identity φ² = (3 + √5)/2 as its own row (L:MS-09a; it reappears here only as the attainment at (3, 1)).
- Not the generator form (every automorph > 1 a power of φ²) — the optional strengthening above.
- Not the matrix form of the automorph (the 2×2 integral matrix fixing a form of discriminant 5); the spec reads the number, as printed.
- Not that φ is the fundamental unit of ℤ[φ] (norm −1, generator of all units): L:RZ-09 / L:MS-30 territory (EFFORT).
- Not "the arithmetic of the systole is the arithmetic of the golden unit" (a reading).

## 7 · Status
SPEC-DRAFT 2026-10-28T17:32:19Z

V1: V1-SPLIT-OK + V1-DRIFT 2026-10-28T17:51:21Z — the split is right (the clause is a claim, not a label, and 0.1 pd does not cover it). DRIFT (stronger than the definite description requires): "the fundamental automorph" denotes the LEAST automorph > 1 — the classical definition (fundamental solution of t² − Du² = 4, D = 5) — and that every other is a power of it is a separate classical theorem, not the meaning of the word. The faithful row is IsLeast: φ² is the least (t + u√5)/2 > 1 over integers t, u with t² − 5u² = 4, plus (3, 1) attaining it. That reading is elementary (ε > 1 and εε̄ = 1 give 0 < ε̄ < 1, so t = ε + ε̄ ≥ 2 and u√5 = ε − ε̄ > 0, so u ≥ 1, t² = 4 + 5u² ≥ 9, t ≥ 3, ε ≥ φ²) — about E1, no descent, no automorph theory. Back to M: restate as IsLeast (the generator form may be kept as an optional, separately-costed strengthening); the OUT-OF-Q5 marking should be re-weighed at the wall on the IsLeast cost. The ring caution (ℤ[√5] lands on φ⁶) stays correct.

M-amend: 2026-10-28T17:55:03Z — restated per `_V1-U8.md` (MS-09b DRIFT, stronger than the print): the formal statement is now IsLeast (φ² the least (t + u√5)/2 > 1 over integers t, u with t² − 5u² = 4, attained at (3, 1)); the generator form is moved out of the statement to an optional, separately-costed strengthening (E2, NEEDS-DEVELOPMENT); cost re-estimated at about E1; scope line now reads "OUT-OF-Q5 pending the wall's re-weigh at the IsLeast cost" — the scope word stays the wall's. The first draft's SPEC-DRAFT line and the V1 line above are kept as written.

V1: V1-GREEN 2026-10-28T17:58:10Z — re-read served p06 (sha256 re-verified b4841489…3af5): "so that φ² = (3 + √5)/2 (2.8) is the fundamental automorph." The amended statement says exactly the definite description, no stronger and no weaker. It is IsLeast of φ² over {ε > 1 : ε = (t + u√5)/2, t, u ∈ ℤ, t² − 5u² = 4}: membership at (3, 1), plus the lower bound (true for all integer t, u, signs included, since ε > 1 and εε̄ = 1 force t ≥ 3 and u ≥ 1). The attainment conjuncts (3² − 5·1² = 4 and φ² = (3 + 1·√5)/2) are the printed (2.8) itself. The generator form is correctly moved out of the row. The scope word (OUT-OF-Q5 pending the wall's re-weigh at about E1) stays the wall's; the ring caution stands. The earlier DRIFT is closed.

V2: V2-GREEN 2026-10-28T18:07:40Z — (OUT-OF-Q5, stated) ms_09b_fundamental_automorph says what p06 prints: "the fundamental automorph" read as the definite description. φ² is IsLeast of {(t + u√5)/2 > 1 : t, u ∈ ℤ, t² − 5u² = 4}, attained at (3, 1). This is the classical fundamental solution for D = 5, with no generator form. Re-derived: εε̄ = 1 gives t ≥ 3, u ≥ 1 for every integer sign pattern. The ring caution against ℤ[√5] holds.
