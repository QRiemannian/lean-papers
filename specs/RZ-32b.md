# L:RZ-32b — display (5.1) as a statement about ζ(3) — OUT-OF-Q5 (pending the wall)

**OUT-OF-Q5 (pending the wall).** This is the general leg of the L:RZ-32 split: (5.1) asserts Ramanujan's ζ(3) formula in q-form. Its content is L:RZ-26 (Ramanujan's formula (4.3), EFFORT, ≈30 pd, out of Q5) composed with L:RZ-32a. It is specced so the statement is fixed; it is not counted in Q5.

## 1 · Header
- row: L:RZ-32b (sub-row of L:RZ-32)
- unit: U3 (`RiemannZeta/ZetaL`)
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
- locus: §5.3, display (5.1), PDF p14 (printed folio 13). Re-key: (5.2) → (5.1), UNCHANGED.
- spec_clock: 2026-10-28T17:07:24Z

## 2 · Printed statement, verbatim
§5.3 (p14): "Ramanujan's formula decomposes as ⟦ζ(3) = [7π³/180]_(tangential, rotational) − [2 Σ_k q^k/(k³(1 − q^k))]_(radial correction), (5.1)⟧ the leading term the pure rotation, the correction (governed by q = e^{−2π}) the radial structure."

## 3 · Formal reading
- ζ(3) is `riemannZeta 3` (complex); q = e^{−2π} as in L:RZ-32a; Σ_k over k ≥ 1 (the range of (4.3)).
- Claim: ζ(3) = 7π³/180 − 2 Σ_{k≥1} q^k/(k³(1 − q^k)), the right side a real number cast to ℂ.
- The series converges absolutely (terms ≤ q^k/(1 − q)), so `tsum` is the honest sum; no summability hypothesis is read.

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
| declaration | kind | module (file:line) |
|---|---|---|
| `riemannZeta` | def | Mathlib.NumberTheory.LSeries.RiemannZeta (RiemannZeta.lean:121) |
| `Real.exp`, `Real.pi` | def | as L:RZ-32a |
| `cot_series_rep` | theorem | Mathlib.Analysis.SpecialFunctions.Trigonometric.Cotangent (Cotangent.lean:231) — an ingredient of the RZ-26 route |
**NEEDS-DEVELOPMENT:** Ramanujan's ζ(3) formula is not at the pin (the ledger's L:RZ-26 search); the gap is the partial-fraction (cot · coth) proof of (4.3).

## 5 · Intended Lean statement
```lean
/-- L:RZ-32b — RZ (5.1) p14, OUT-OF-Q5: Ramanujan's ζ(3) formula in q-form, q = e^{−2π}. -/
theorem rz_32b_zeta_three_q_form :
    let q : ℝ := Real.exp (-(2 * Real.pi))
    riemannZeta 3 = ((7 * Real.pi ^ 3 / 180 -
      2 * ∑' k : ℕ, q ^ (k + 1) / (((k : ℝ) + 1) ^ 3 * (1 - q ^ (k + 1))) : ℝ) : ℂ) := by sorry
```

## 6 · What the row does not claim
- Not the bracket labels or the "pure rotation / radial structure" reading ([C]/[I]).
- Nothing about ζ(2n+1) for n ≥ 2 (L:RZ-28, L:RZ-N3).

## 7 · Status
SPEC-DRAFT 2026-10-28T17:07:24Z — OUT-OF-Q5 (pending the wall)

V1: V1-SPLIT-OK + V1-GREEN 2026-10-28T17:18:16Z — (5.1) p14 read: as printed it IS a ζ(3) statement (Ramanujan's formula, q-form), so its content is L:RZ-26 composed with 32a, and OUT-OF-Q5 (pending the wall) is the right placement. Statement faithful: ζ(3) = 7π³/180 − 2 Σ_{k≥1} q^k/(k³(1 − q^k)), q = e^{−2π}; the bracket labels are not read. Independently checked true to 25 digits (mpmath). NEEDS-DEVELOPMENT stands (no Ramanujan ζ(3) formula at the pin per the spec; not re-searched here).

V2: V2-GREEN 2026-10-28T17:28:31Z (OUT-OF-Q5, pending the wall — fidelity only) — p14 (5.1) read: `riemannZeta 3 = ↑(7π³/180 − 2 Σ_{k≥1} q^k/(k³(1 − q^k)))`, q = e^{−2π}, is the printed formula with the bracket labels dropped; true (agrees with ζ(3) to 40 digits, mpmath).
