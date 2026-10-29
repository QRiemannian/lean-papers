# L:RZ-07b — N(φ) = φφ̄ = −1 and N(φ²) = +1 with N the field norm of ℚ(√5)

**OUT-OF-Q5 (pending the wall).** Split leg of L:RZ-07 (see RZ-07a's split note). The ledger figure (0.25 pd, E0) stays with RZ-07a. This leg is what the served edition's added clause "N is the field norm in (2.4)" makes the printed (2.4) say; proposed bucket NOW, ≈ 0.5 pd, E1 (one bridge lemma between `Algebra.norm` and `QuadraticAlgebra.norm`, see §4). Counted only if the wall admits it.

## 1 · Header
- row: L:RZ-07b (split from L:RZ-07)
- unit: U1 (`RiemannZeta/Pilot`)
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
- locus: §2.2, eq. (2.4) and the closing parenthesis of §2.2, PDF p07 (printed folio 6). Re-key change class: REWORDED.
- spec_clock: 2026-10-28T17:06:30Z

## 2 · Printed statement, verbatim
§2.2, p07 (two sentences; the display (2.4) linearised inside ⟦ ⟧, mathematical-italic letters written plain):
> The golden ratio φ is thus read off the systole datum; it is the fundamental unit of the ring of integers ℤ[φ] of the field ℚ(√5), with ⟦N(φ) = φφ̄ = −1, N(φ²) = +1. (2.4)⟧ Its continued-fraction expansion [1; 1, 1, 1, …] is the slowest-converging (φ is the worst-approximable number) [CV]. (N is the field norm in (2.4); the Selberg norm of the element F² is φ⁴.)

The row's content is display (2.4) together with the closing parenthesis that names N as the field norm (the re-key's REWORDED class: the clarifying sentence is new in the served edition; (2.4) itself is unchanged).

## 3 · Formal reading
- **The field.** ℚ(√5) = ℚ(φ) is modelled as `QuadraticAlgebra ℚ 1 1`, the ℚ-algebra ℚ[ω]/(ω² = 1 + ω). Its generator `QuadraticAlgebra.omega` (scoped notation `ω`) satisfies ω² = 1 + ω (`QuadraticAlgebra.omega_mul_omega_eq_add`), the minimal polynomial of φ; so ω is the model of φ. Mathlib makes `QuadraticAlgebra K a b` a field when x² ≠ a + b·x has no root in K (Basic.lean:406), which holds here since √5 ∉ ℚ; the statement below does not need the field instance.
- **Which root.** ω models φ or φ̄ = (1 − √5)/2 depending on the embedding; the field norm is invariant under the Galois automorphism, so the printed values do not depend on that choice. The spec states nothing about embeddings.
- **N** is the field norm N_{ℚ(√5)/ℚ}, mathlib's `Algebra.norm ℚ` (the determinant of left multiplication, `Algebra.norm_apply`). On a quadratic algebra mathlib also has `QuadraticAlgebra.norm` (re² + b·re·im − a·im²) with `QuadraticAlgebra.det_toLinearMap_eq_norm` identifying it with the determinant of left multiplication; that is the bridge.
- **φ̄** is `star ω`, the quadratic involution (`QuadraticAlgebra` `Star` instance, Basic.lean:158), which is the nontrivial automorphism of ℚ(√5); `QuadraticAlgebra.algebraMap_norm_eq_mul_star` gives N(z) = z · star z inside the algebra — the printed "N(φ) = φφ̄".
- No hypotheses; closed computation.

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
| declaration | kind | module (file:line) |
|---|---|---|
| `QuadraticAlgebra` | structure | Mathlib.Algebra.QuadraticAlgebra.Defs (Defs.lean:38) |
| `QuadraticAlgebra.omega` | def | Mathlib.Algebra.QuadraticAlgebra.Basic (Basic.lean:49; notation `ω` :53) |
| `QuadraticAlgebra.omega_mul_omega_eq_add` | theorem | Mathlib.Algebra.QuadraticAlgebra.Basic (:70) |
| `QuadraticAlgebra.norm` | def | Mathlib.Algebra.QuadraticAlgebra.Basic (:201) |
| `QuadraticAlgebra.norm_def` | theorem | Mathlib.Algebra.QuadraticAlgebra.Basic (:205) |
| `QuadraticAlgebra.algebraMap_norm_eq_mul_star` | theorem | Mathlib.Algebra.QuadraticAlgebra.Basic (:228) |
| `QuadraticAlgebra.det_toLinearMap_eq_norm` | theorem | Mathlib.Algebra.QuadraticAlgebra.NormDeterminant (NormDeterminant.lean, first theorem) |
| `Algebra.norm` | def | Mathlib.RingTheory.Norm.Defs (Defs.lean:61) |
| `Algebra.norm_apply` | theorem | Mathlib.RingTheory.Norm.Defs (:64) — `norm R x = LinearMap.det (lmul R S x)` |

**Gap named (small):** no lemma at the pin states `Algebra.norm R z = QuadraticAlgebra.norm z` directly (`/usr/bin/grep -rn "Algebra.norm" Mathlib/Algebra/QuadraticAlgebra/` → 0 hits). It follows from `Algebra.norm_apply` + `QuadraticAlgebra.det_toLinearMap_eq_norm` once `Algebra.lmul R S z` and `DistribSMul.toLinearMap R S z` are identified (expected `rfl` or `ext`); L proves it locally. Not NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement
**Prose.** In the quadratic field ℚ(φ) (modelled as ℚ[ω] with ω² = 1 + ω), the field norm of φ equals φ times its conjugate, and equals −1; the field norm of φ² is +1.

**Proposed signature.**
```lean
open QuadraticAlgebra in
theorem rz_07b_field_norm :
    algebraMap ℚ (QuadraticAlgebra ℚ 1 1) (Algebra.norm ℚ (ω : QuadraticAlgebra ℚ 1 1))
        = (ω : QuadraticAlgebra ℚ 1 1) * star (ω : QuadraticAlgebra ℚ 1 1) ∧
    Algebra.norm ℚ (ω : QuadraticAlgebra ℚ 1 1) = -1 ∧
    Algebra.norm ℚ ((ω : QuadraticAlgebra ℚ 1 1) ^ 2) = 1 := by
  sorry
```
The three conjuncts are the printed N(φ) = φφ̄, φφ̄ = −1 (as N(φ) = −1), and N(φ²) = +1.

## 6 · What the row does not claim
- The real-number identities φ·φ̄ = −1, φ²·φ̄² = 1 — RZ-07a.
- That ℤ[φ] is the ring of integers or that φ is its fundamental unit — L:RZ-09.
- The Selberg norm φ⁴ of F² — a different norm, not this row.
- "the squaring lifts the norm-(−1) unit to the determinant-1 systolic element" (p07) — the paper's reading linking N(φ) = −1 to det F = −1; not claimed here.

## 7 · Status
SPEC-DRAFT 2026-10-28T17:06:30Z

V1: V1-SPLIT-OK 2026-10-28T17:15:49Z — leg fidelity V1-GREEN. States the printed chain with N the field norm: N(φ) = φφ̄ (as `algebraMap (Algebra.norm ℚ ω) = ω * star ω`), N(φ) = −1, N(φ²) = 1 in `QuadraticAlgebra ℚ 1 1`. Checked at the pin: ω = ⟨0, 1⟩ with ω·ω = 1 + ω (Defs/Basic: i² = a + b·i, a = b = 1 — the minimal polynomial of φ), star ⟨x, y⟩ = ⟨x + y, −y⟩ so star ω = 1 − ω (= φ̄ under ω ↦ φ), `QuadraticAlgebra.norm` ω = 0 + 0 − 1 = −1, ω² = ⟨1, 1⟩ has norm 1 + 1 − 1 = 1, and `det_toLinearMap_eq_norm` identifies it with det of left multiplication = `Algebra.norm`. The model is an honest stand-in for ℚ(√5) (ℚ(φ) = ℚ(√5); the norm is Galois-invariant so the choice of root is immaterial). True, not CC. Whether the leg is in Q5 scope is the wall's call, not a fidelity question; as a statement of the printed text it is the faithful one.
V2: V2-GREEN 2026-10-28T17:25:09Z — read served p07 (2.4) + "(N is the field norm in (2.4); …)". `rz_07b_field_norm` in `QuadraticAlgebra ℚ 1 1`: at the pin i² = a + b·i (Defs.lean), so ω² = 1 + ω, the minimal polynomial of φ; `star ⟨x, y⟩ = ⟨x + b·y, −y⟩` gives star ω = 1 − ω = φ̄; `Algebra.norm ℚ` = det of left multiplication — on basis {1, ω}: N(ω) = det[[0,1],[1,1]] = −1, N(ω²) = N(1 + ω) = det[[1,1],[1,2]] = 1. Definitional-accident check: `LinearMap.det` defaults to 1 only when no finite basis exists; `QuadraticAlgebra.basis` (Defs.lean:378) exists, so N(ω²) = 1 is not vacuous and N(ω) = −1 is genuine. The three conjuncts are the printed N(φ) = φφ̄, = −1, N(φ²) = +1 with N the field norm of ℚ(√5) — no stronger, no weaker. Statement fidelity green; Q5 scope remains the wall's call (OUT-OF-Q5 marking kept).
