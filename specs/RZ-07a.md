# L:RZ-07a — φ·φ̄ = −1 and φ²·φ̄² = +1 (the conjugate products, in ℝ)

**Split note.** L:RZ-07 is split (FAN-OUT-PLAN-v1 §4 step 8). RZ-07a is the in-scope leg and keeps the ledger figure (NOW, 0.25 pd, E0, target `Real.goldenRatio_mul_goldenConj`): the two products of φ and φ² with their Galois conjugates, as real numbers. RZ-07b carries the clause the served edition added — "N is the field norm" — as a statement about the field norm of ℚ(√5); it is marked OUT-OF-Q5 (pending the wall).

## 1 · Header
- row: L:RZ-07a (split from L:RZ-07)
- unit: U1 (`RiemannZeta/Pilot`)
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
- locus: §2.2, eq. (2.4) and the closing parenthesis of §2.2, PDF p07 (printed folio 6). Re-key change class: REWORDED (the field-norm sentence added; (2.4) unchanged).
- spec_clock: 2026-10-28T17:06:30Z

## 2 · Printed statement, verbatim
§2.2, p07 (two sentences; the display (2.4) linearised inside ⟦ ⟧, mathematical-italic letters written plain):
> The golden ratio φ is thus read off the systole datum; it is the fundamental unit of the ring of integers ℤ[φ] of the field ℚ(√5), with ⟦N(φ) = φφ̄ = −1, N(φ²) = +1. (2.4)⟧ Its continued-fraction expansion [1; 1, 1, 1, …] is the slowest-converging (φ is the worst-approximable number) [CV]. (N is the field norm in (2.4); the Selberg norm of the element F² is φ⁴.)

The row's content is display (2.4) together with the closing parenthesis that names N as the field norm (the re-key's REWORDED class: the clarifying sentence is new in the served edition; (2.4) itself is unchanged).

## 3 · Formal reading
- **φ** is `Real.goldenRatio` = (1 + √5)/2 (the paper fixes φ = (1 + √5)/2 in (2.1)'s sentence, p07).
- **φ̄** is the Galois conjugate of φ in ℚ(√5), i.e. (1 − √5)/2, which is mathlib's `Real.goldenConj`. The bar is not complex conjugation (φ is real; complex conjugation would make φφ̄ = φ² > 0). The paper does not define the bar on p07; it is read as the nontrivial automorphism of ℚ(√5) because N is declared the field norm in the same paragraph — which forces N(x) = x·x̄ with x̄ the Galois conjugate.
- **N(φ²) = +1** is read on this leg as φ²·φ̄² = 1, the conjugate of φ² being φ̄² (the automorphism is a ring map).
- The printed chain "N(φ) = φφ̄ = −1" has two equalities. This leg checks the second (φφ̄ = −1) and the analogous one for φ²; the first equality (N(φ) = φφ̄, i.e. that the field norm is the conjugate product) is RZ-07b.
- No hypotheses; closed computation in ℝ.

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
| declaration | kind | module (file:line) |
|---|---|---|
| `Real.goldenRatio` | abbrev | Mathlib.NumberTheory.Real.GoldenRatio (GoldenRatio.lean:37) — `(1 + √5) / 2` |
| `Real.goldenConj` | abbrev | Mathlib.NumberTheory.Real.GoldenRatio (:40) — `(1 - √5) / 2` |
| `Real.goldenRatio_mul_goldenConj` | theorem | Mathlib.NumberTheory.Real.GoldenRatio (:57) — `φ * ψ = -1` (`@[simp]`) |

(`φ`, `ψ` are scoped notations in namespace `goldenRatio`, GoldenRatio.lean:42–43; the signature below writes the full names.)

## 5 · Intended Lean statement
**Prose.** The golden ratio times its conjugate is −1, and the square of the golden ratio times the square of its conjugate is +1.

**Proposed signature.**
```lean
theorem rz_07a_golden_conj_products :
    Real.goldenRatio * Real.goldenConj = -1 ∧
    Real.goldenRatio ^ 2 * Real.goldenConj ^ 2 = 1 := by
  sorry
```
First conjunct is `Real.goldenRatio_mul_goldenConj`; the second follows by `mul_pow` and the first ((−1)² = 1). E0.

## 6 · What the row does not claim
- That N is the field norm of ℚ(√5) and equals the conjugate product — RZ-07b.
- That φ is the fundamental unit of ℤ[φ], that ℤ[φ] is the ring of integers of ℚ(√5) — L:RZ-09.
- The continued fraction [1; 1, 1, …] and "worst-approximable" — L:RZ-08.
- "The Selberg norm of the element F² is φ⁴" and "the norm of the systolic element is N = φ⁴" — a different norm, outside this row (the served edition's added sentence exists precisely to keep the two norms apart).
- "φ is thus read off the systole datum" — the paper's reading, CONCEPT.

## 7 · Status
SPEC-DRAFT 2026-10-28T17:06:30Z

V1: V1-SPLIT-OK 2026-10-28T17:15:49Z — leg fidelity V1-GREEN. Printed (2.4) p07: "N(φ) = φφ̄ = −1, N(φ²) = +1" + "(N is the field norm in (2.4); …)". This leg states exactly the conjugate-product equalities φ·φ̄ = −1 and φ²·φ̄² = 1 in ℝ with φ̄ = `Real.goldenConj` = (1 − √5)/2 — the bar confirmed as the Galois conjugate (the same paragraph declares N the field norm; complex conjugation would give φ² > 0). Alone it is WEAKER than the print (the field-norm identification N(x) = x·x̄ is dropped) — which is exactly what RZ-07b carries; 07a ∪ 07b = the printed claim, no more. Condition on the count: the ledger figure kept here must be labelled "the conjugate products of (2.4)", not "(2.4) with N the field norm". MS-08 (MS (2.7), p06, overbar confirmed by a 150-dpi render — pdftotext drops it) prints the same mathematics with the field-norm clause inline ("with N the field norm of ℚ(√5)").
V2: V2-GREEN 2026-10-28T17:25:09Z — read served p07 (2.4) + "(N is the field norm in (2.4); …)". `rz_07a_golden_conj_products`: `Real.goldenRatio` = (1 + √5)/2, `Real.goldenConj` = (1 − √5)/2 at the pin (GoldenRatio.lean:37/40); φ·φ̄ = −1 ∧ φ²·φ̄² = 1 in ℝ — the conjugate products of (2.4), the bar as the Galois conjugate (forced by the field-norm sentence). As a leg it is weaker than the printed chain by exactly the N(x) = x·x̄ identification, which RZ-07b carries; labelled as the split leg in the docstring. Faithful as a leg.
