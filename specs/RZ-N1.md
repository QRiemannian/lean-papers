# L:RZ-N1 — §2.3: 2 arcosh(t/2) is monotone in the trace, not in the discriminant (d = 12, t = 4 → 2.634; d = 8, t = 6 → 3.525)

## 1 · Header
- row: L:RZ-N1 — NEW row of the re-keyed ledger (`CLAIM-LEDGER-v0.2-rekeyed.md` §"RZ — NEW rows"; second-head fix SH-01). Proposed bucket there: NOW (E1) / numerals COMP. This spec states the numerals in Lean at their printed precision (the house convention of L:RZ-06a, L:MS-22, L:MS-24b), so no COMP leg remains.
- unit: — (NEW row; no unit assigned. Suggested home: U2 `RiemannZeta/Bridge`, beside L:RZ-12; the unit is the orchestrator's choice)
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
- locus: §2.3, the sentence after display (2.7), served PDF p08 (printed folio 7)
- spec_clock: 2026-10-28T20:31:54Z

## 2 · Printed statement, verbatim
§2.3 (p08): "that d = 5 is also the minimal real-quadratic discriminant is a separate fact [CV] (geodesic length 2 arccosh(t/2) is monotone in the trace, not in the discriminant: d = 12, t = 4, gives 2.634, shorter than d = 8, t = 6, at 3.525)."

(The row is the parenthesis. The clause before it, "d = 5 is also the minimal real-quadratic discriminant", is L:RZ-13, provenance lane — not restated here.)

## 3 · Formal reading
- "arccosh" is `Real.arcosh` (mathlib spells it `arcosh`; `arcosh x = log (x + √(x² − 1))`). The length function is ℓ(t) = 2·arcosh(t/2), read on hyperbolic traces t > 2.
- **"monotone in the trace":** ℓ is strictly increasing on (2, ∞) — `StrictMonoOn`.
- **"not in the discriminant":** witnessed by the printed pair: 12 > 8 while ℓ(4) < ℓ(6) ("shorter than").
- **The pairings "d = 12, t = 4" and "d = 8, t = 6":** read as (i) d a (positive) fundamental discriminant — 12 = 4·3 and 8 = 4·2, both fundamental (the local predicate `ms13IsFundDisc` of L:MS-13, restated); (ii) t the least trace t > 2 for which t² − 4 = d·u² has a solution u ≥ 1 (the trace of the shortest geodesic attached to discriminant d, the reading the sentence before (2.7) gives "t = 3 ↔ d = 5"): t² − 4 = 12·1² at t = 4; t² − 4 = 32 = 8·2² at t = 6.
- **"gives 2.634", "at 3.525":** three-decimal half-unit intervals |ℓ(4) − 2.634| < 5 × 10⁻⁴ and |ℓ(6) − 3.525| < 5 × 10⁻⁴.
- Numerics (recomputed here, mpmath, 40 digits): ℓ(4) = 2 arcosh 2 = 2.6339157938496334…, distance to 2.634 is 8.42 × 10⁻⁵; ℓ(6) = 2 arcosh 3 = 3.5254943480781721…, distance to 3.525 is 4.943 × 10⁻⁴ — **the upper margin is 5.65 × 10⁻⁶**, so L needs log bounds good to ≈ 10⁻⁶ (2 arcosh 3 = 4 log(1 + √2), 2 arcosh 2 = 2 log(2 + √3)).

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
Name check by the sitting-71 form (last component over every declaration keyword, namespace confirmed at the hit).
| declaration | kind | file:line | namespace |
|---|---|---|---|
| `Real.arcosh` | def | Mathlib/Analysis/SpecialFunctions/Arcosh.lean:61 | `Real` (opened :55) |
| `Real.strictMonoOn_arcosh` (StrictMonoOn arcosh (Ioi 0)) | theorem | Arcosh.lean:110 | `Real` |
| `Real.arcosh_lt_arcosh` | theorem | Arcosh.lean:119 | `Real` |
| `Real.exp_arcosh`, `Real.cosh_arcosh` | theorem | Arcosh.lean:64, :77 | `Real` |
| `Real.exp_log` | theorem | Mathlib/Analysis/SpecialFunctions/Log/Basic.lean:59 | `Real` (opened :35) |
Local definition reused: `ms13IsFundDisc` (L:MS-13, `ModularSurface/Now/Challenge.lean:150`), restated identically if the row sits in an RZ unit (units do not import each other). No gap.

## 5 · Intended Lean statement
Prose: ℓ(t) = 2 arcosh(t/2) is strictly increasing on t > 2; 12 and 8 are fundamental discriminants, 4 is the least trace t > 2 with t² − 4 ∈ 12·(ℕ⁺)², 6 the least with t² − 4 ∈ 8·(ℕ⁺)²; 12 > 8 yet ℓ(4) < ℓ(6); ℓ(4) is within 5 × 10⁻⁴ of 2.634 and ℓ(6) within 5 × 10⁻⁴ of 3.525.

```lean
/-- L:RZ-N1 — RZ §2.3, the parenthesis after (2.7), served p08 (sha256 2d5287e7…):
"geodesic length 2 arccosh(t/2) is monotone in the trace, not in the discriminant: d = 12,
t = 4, gives 2.634, shorter than d = 8, t = 6, at 3.525". -/
theorem rz_N1_length_monotone_in_trace :
    StrictMonoOn (fun t : ℝ => 2 * Real.arcosh (t / 2)) (Set.Ioi 2) ∧
    (ms13IsFundDisc 12 ∧ ms13IsFundDisc 8) ∧
    IsLeast {t : ℕ | 2 < t ∧ ∃ u : ℕ, 0 < u ∧ t ^ 2 = 12 * u ^ 2 + 4} 4 ∧
    IsLeast {t : ℕ | 2 < t ∧ ∃ u : ℕ, 0 < u ∧ t ^ 2 = 8 * u ^ 2 + 4} 6 ∧
    ((8 : ℕ) < 12 ∧ 2 * Real.arcosh (4 / 2) < 2 * Real.arcosh (6 / 2)) ∧
    |2 * Real.arcosh (4 / 2) - 2.634| < 0.0005 ∧
    |2 * Real.arcosh (6 / 2) - 3.525| < 0.0005 := by
  sorry
```

Cost class: E1 — monotonicity from `Real.strictMonoOn_arcosh`; the two `IsLeast` by `decide`/`interval_cases` below the bound; the intervals by log bounds (the U8 route for log φ: `Real.exp_bound'`, `Real.sum_le_exp_of_nonneg`, rational brackets on √2, √3). ≈ 0.5–1 pd, unmeasured; the 5.65 × 10⁻⁶ margin at 3.525 is the cost driver.

## 6 · What the row does not claim
- Not that 2 arcosh(t/2) IS the hyperbolic length of the closed geodesic of trace t (the geometric identification, L:RZ-63b's class, out of Q5); ℓ is stated as the printed function of t.
- Not that d = 5 is the minimal real-quadratic discriminant (L:RZ-13, provenance lane), nor the systole statement (L:RZ-06b).
- Not that the pairs are the field discriminants of ℚ(√3), ℚ(√2) as number fields (`NumberField.discr`; L:RZ-64b carries d = 8 for ℚ(√2) out of Q5); the fundamental-discriminant predicate is the arithmetic stand-in.
- No precision beyond three decimals.

## 7 · Status
SPEC-DRAFT 2026-10-28T20:31:54Z

V1: V1-GREEN 2026-10-28T20:50:09Z — p08 read first: "geodesic length 2 arccosh(t/2) is monotone in the trace, not in the discriminant: d = 12, t = 4, gives 2.634, shorter than d = 8, t = 6, at 3.525". Conventions confirmed: `Real.arcosh` (Arcosh.lean:61; `strictMonoOn_arcosh` :110); three-decimal half-unit intervals; "monotone" as StrictMonoOn on (2, ∞), the hyperbolic traces (the printed "shorter than" is strict, and strict implies the word). The pairing reading (d fundamental; t the least trace > 2 with t² − 4 = d·u², u ≥ 1) is the print's, not a step beyond it: only with t a function of d does "not [monotone] in the discriminant" say anything, and the sentence before (2.7) uses the same trace↔discriminant link ("the smallest hyperbolic trace … t = 3, produces exactly the discriminant of ℚ(√5)"); with d fundamental, d is forced as the fundamental discriminant of t² − 4, so both directions ride. The bare Pell identities would be weaker than the parenthesis. Recomputed (mpmath, 50 digits): ℓ(4) = 2 log(2 + √3) = 2.6339157938…, distance 8.42 × 10⁻⁵; ℓ(6) = 4 log(1 + √2) = 3.5254943480…, distance 4.943 × 10⁻⁴, margin 5.65 × 10⁻⁶; least traces d = 12 → 4 (u = 1), d = 8 → 6 (u = 2), d = 5 → 3. `ms13IsFundDisc` 12 (m = 3) and 8 (m = 2) hold. Recommend NOW-class, ≈ 0.5–1.5 pd (the 5.65 × 10⁻⁶ margin may set the upper end).

V2: V2-GREEN 2026-10-28T22:52:53Z — `rz_N1_length_monotone_in_trace` (RiemannZeta/Accepted/Challenge.lean:55–62) says what p08 prints (sha256 2d5287e7… matched first; §2.3 parenthesis after (2.7)), no stronger, no weaker: StrictMonoOn of 2·Real.arcosh(t/2) on (2, ∞) (no junk there: t/2 > 1; Arcosh.lean:61, :110); the pairings bound, not quantified away — 12 and 8 fundamental (`ms13IsFundDisc`, byte-identical to ModularSurface/Now/Challenge.lean:148–152 by diff) and 4, 6 the IsLeast traces > 2 with t² = d·u² + 4, u ≥ 1, so d is forced as the fundamental discriminant of t² − 4 (32 = 8·2² only; 12 = 12·1² only); 8 < 12 with ℓ(4) < ℓ(6) strict ("shorter than"); three-decimal half-units over ℝ. Theorem text = §5 byte for byte (517 B). Guards: 2 arcosh 2 = 2.6339157938…, 8.42 × 10⁻⁵ from 2.634; 2 arcosh 3 = 3.5254943480…, margin 5.65 × 10⁻⁶ inside the half-unit; least traces 4 (u = 1), 6 (u = 2). Signed: statement_sha256 43e639cca6e866ecb9ab68b4d46ee56a811a5f2443f091f05a83386fe448385a, v2_signed 2026-10-28T22:52:27Z. Full note: `specs/_V2-U12.md`.

L-proofs: PROVED 2026-10-28T23:03:04Z — `rz_N1_length_monotone_in_trace` in `RiemannZeta/Accepted/Solution.lean` (sha256 f383d9d5…): StrictMonoOn from `Real.strictMonoOn_arcosh` at t/2; 12 = 4·3, 8 = 4·2 with 3, 2 prime; least traces by `interval_cases`; ℓ(4) < ℓ(6) from the monotonicity; the intervals through log(2 + √3), log(3 + √8) with rational √-brackets and exp Taylor bounds (the rz_06a form; the 3.525 upper edge by an order-18 sum). Build exit 0, no warning; axioms [propext, Classical.choice, Quot.sound]. Log: `RiemannZeta/Accepted/BUILD-LOG.md` §Proofs phase.

V3: V3-CLEAN 2026-10-28T23:07:56Z — rz_N1_length_monotone_in_trace is true for the paper's reason: strict monotonicity of the paper's own 2 arcosh(t/2) on (2, ∞) (Real.strictMonoOn_arcosh at t/2 > 1, no junk), the pairings bound as the paper's (both d fundamental, t the least trace with t² = d·u² + 4, honest IsLeast case splits on an additive ℕ equation), ℓ(4) < ℓ(6) derived from the monotonicity, and the two half-unit intervals proved over exact OfScientific rationals (no Float) by rational √-brackets and exp Taylor bounds with explicit remainder (Real.exp_bound', Real.sum_le_exp_of_nonneg). Axioms standard. Sheet `specs/_V3-U12.md`.
