# L:MS-09a — (2.8): φ² = (3 + √5)/2

## 1 · Header
- row: L:MS-09a (split from L:MS-09; sibling L:MS-09b, "is the fundamental automorph", OUT-OF-Q5 pending the wall). This sub-row keeps the ledger figure (E0, 0.1 pd).
- unit: U8 (`ModularSurface/Now`)
- paper: MS — *The Invariant Structure of the Modular Surface* (2026, revised October 2026)
- pdf_sha256: `b4841489ec6bea619f8d5525ce4c788b86e0109e51d6e9d2cb252690f5b13af5` (served file `~/Claude/projects/qriemannian-site/public/pdfs/modular-surface-characterization.pdf`, re-hashed at the start of this seat)
- locus: §2.2, display (2.8), served PDF p06 (printed folio 5). Re-key change class: UNCHANGED.
- spec_clock: 2026-10-28T17:31:42Z

## 2 · Printed statement, verbatim (served edition; display linearised inside ⟦ ⟧)
§2.2 (p06): "The arithmetic of the systole is the arithmetic of the golden unit, with N the field norm of ℚ(√5): ⟦N(φ) = φφ̄ = −1, N(φ²) = +1, (2.7)⟧ so that ⟦φ² = (3 + √5)/2 (2.8)⟧ is the fundamental automorph."

φ is fixed by (2.3) on the same page: "⟦φ = (1 + √5)/2 (2.3)⟧ is the golden ratio."

## 3 · Formal reading
- φ is `Real.goldenRatio` (an `abbrev` for `(1 + √5) / 2`, matching (2.3) exactly); √ is `Real.sqrt`.
- The claim of this sub-row is the real identity φ² = (3 + √5)/2.
- "so that" ties (2.8) to (2.7) as a consequence; the identity itself holds outright and is stated outright (the norm statements (2.7) are L:MS-08 = L:RZ-07, shared, not this row).
- "is the fundamental automorph" is taken in L:MS-09b, not here.

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`; `/usr/bin/grep -rn` under `.lake/packages/mathlib/Mathlib/`)
| declaration | kind | module (file:line) |
|---|---|---|
| `Real.goldenRatio` | abbrev | Mathlib.NumberTheory.Real.GoldenRatio (GoldenRatio.lean:37) |
| `Real.goldenRatio_sq` | theorem — `φ ^ 2 = φ + 1` | Mathlib.NumberTheory.Real.GoldenRatio (GoldenRatio.lean:83) |
| `Real.sqrt` | def | Mathlib.Analysis.Real.Sqrt (Sqrt.lean:112) |
Notation `φ` is `scoped[goldenRatio]` (GoldenRatio.lean:42); the signature below writes `Real.goldenRatio` in full. No gap.

## 5 · Intended Lean statement
Prose: the square of the golden ratio equals (3 + √5)/2.

```lean
/-- L:MS-09a — MS §2.2 (2.8), served p06 (sha256 b4841489…3af5): φ² = (3 + √5)/2. -/
theorem ms_09a_goldenRatio_sq :
    Real.goldenRatio ^ 2 = (3 + Real.sqrt 5) / 2 := by sorry
```
(Route for L, not a claim: `Real.goldenRatio_sq` then unfold the abbrev, or `ring_nf` with `Real.sq_sqrt`.)

## 6 · What the row does not claim
- Not "is the fundamental automorph" (L:MS-09b).
- Not (2.7), the field-norm values N(φ) = −1, N(φ²) = +1 (L:MS-08, shared with L:RZ-07).
- Not "the arithmetic of the systole is the arithmetic of the golden unit" (a reading).
- Not the decomposition of the factor 4 (L:MS-10, CONCEPT).

## 7 · Status
SPEC-DRAFT 2026-10-28T17:31:42Z

V1: V1-SPLIT-OK + V1-GREEN 2026-10-28T17:51:21Z — p06 (2.8) read: φ² = (3 + √5)/2 exactly as printed, φ by (2.3); true. "is the fundamental automorph" is carried entirely by L:MS-09b; nothing printed in (2.7)–(2.8) falls between 09a, 09b and the shared L:MS-08. Keeps the ledger figure.

V2: V2-GREEN 2026-10-28T18:07:40Z — ms_09a_goldenRatio_sq is (2.8) at p06 exactly: φ² = (3 + √5)/2, with φ = Real.goldenRatio = (1 + √5)/2 as (2.3). The automorph clause belongs to 09b.
