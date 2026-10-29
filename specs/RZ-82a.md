# L:RZ-82a — §13.4: the Cartan decomposition of 𝔰𝔩(2, ℝ): 𝔨 = 𝔰𝔬(2), 𝔭 = symmetric traceless, (13.6), dim 𝔭 = 2

## 1 · Header
- row: L:RZ-82a (split of L:RZ-82; this is the in-scope leg and keeps the ledger figure — NOW, 2 pd, E1–E2)
- unit: U5 (`RiemannZeta/NoGo`)
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
- locus: §13.4 "What replaces the grading: the Cartan decomposition", display (13.6) on PDF p32 (printed folio 31), the SL(2, ℝ) sentences and the dimension sentence on PDF p33 (printed folio 32). Re-key change class: UNCHANGED.
- spec_clock: 2026-10-28T17:21:12Z

## 2 · Printed statement, verbatim
§13.4 (p32–p33), read by `pdftotext -layout`:

(p32) "The correct algebraic structure is Cartan-like. In semisimple Lie theory the Cartan decomposition splits the algebra into a compact part 𝔨 (rotations) and a non-compact part 𝔭 (boosts/dilations), satisfying
[𝔨, 𝔨] ⊂ 𝔨,   [𝔨, 𝔭] ⊂ 𝔭,   [𝔭, 𝔭] ⊂ 𝔨.   (13.6)"

(p33) "For SL(2, ℝ) the decomposition has 𝔨 = 𝔰𝔬(2) (rotations — Harmonic) and 𝔭 = symmetric traceless matrices (boosts/dilations — Spiral + Eigenform + Dimensional). The key property [𝔭, 𝔭] ⊂ 𝔨 holds at the SL(2, ℝ) level: the commutator of two boosts is a rotation — the Lie-algebra version of “two radial projections compose into a tangential one.”"

(p33, same subsection) "The 4-dimensional structure of the algebra versus the 3-dimensional Cartan decomposition of SL(2, ℝ) (where dim 𝔭 = 2, not 3) is tied to the commutator-completion problem of §13.3 …"

This sub-row carries the SL(2, ℝ) instance; the general semisimple sentence is L:RZ-82b.

## 3 · Formal reading
- **The algebra.** "The decomposition … for SL(2, ℝ)" is the decomposition of its Lie algebra 𝔰𝔩(2, ℝ) = traceless real 2 × 2 matrices: `LieAlgebra.SpecialLinear.sl (Fin 2) ℝ`, a `LieSubalgebra ℝ (Matrix (Fin 2) (Fin 2) ℝ)` (defined as the kernel of `Matrix.traceLinearMap`). The bracket is the matrix commutator [X, Y] = XY − YX (`LieAlgebra.SpecialLinear.sl_bracket`).
- **𝔨 = 𝔰𝔬(2).** `(LieAlgebra.Orthogonal.so (Fin 2) ℝ).toSubmodule` — real 2 × 2 matrices with Xᵀ = −X (`LieAlgebra.Orthogonal.mem_so`). "Compact part" / "rotations" name it; compactness of the group SO(2) is not part of the formal content.
- **𝔭 = symmetric traceless matrices.** `selfAdjointMatricesSubmodule (1 : Matrix (Fin 2) (Fin 2) ℝ) ⊓ LinearMap.ker (Matrix.traceLinearMap (Fin 2) ℝ ℝ)` — Xᵀ = X (`Matrix.IsSelfAdjoint 1 X` unfolds to Xᵀ * 1 = 1 * X) and trace X = 0. A local `def` of this submodule is allowed (it is not the operator algebra; Q7 is untouched).
- **"The decomposition has 𝔨 … and 𝔭 …"**: 𝔰𝔩(2, ℝ) = 𝔨 ⊕ 𝔭 as real vector spaces — `𝔨 ⊔ 𝔭 = sl` and `𝔨 ⊓ 𝔭 = ⊥` as submodules of the matrix space.
- **(13.6) for SL(2, ℝ)**, element-wise: X, Y ∈ 𝔨 ⇒ [X, Y] ∈ 𝔨; X ∈ 𝔨, Y ∈ 𝔭 ⇒ [X, Y] ∈ 𝔭; X, Y ∈ 𝔭 ⇒ [X, Y] ∈ 𝔨 ("the commutator of two boosts is a rotation"). Inclusions, as printed (for 𝔰𝔩(2, ℝ), [𝔭, 𝔭] = 𝔨 actually holds; the print says ⊂ and the spec keeps ⊂).
- **Dimensions.** "3-dimensional Cartan decomposition of SL(2, ℝ) (where dim 𝔭 = 2, not 3)": `Module.finrank ℝ sl = 3` and `Module.finrank ℝ 𝔭 = 2`.

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`; `/usr/bin/grep -rn` under `.lake/packages/mathlib/Mathlib/`)
| declaration | kind | module (file:line) |
|---|---|---|
| `LieAlgebra.SpecialLinear.sl` | def | Mathlib.Algebra.Lie.Classical (Classical.lean:94) |
| `LieAlgebra.SpecialLinear.sl_bracket` | theorem | Mathlib.Algebra.Lie.Classical (Classical.lean:98) |
| `LieAlgebra.Orthogonal.so` | def | Mathlib.Algebra.Lie.Classical (Classical.lean:168) |
| `LieAlgebra.Orthogonal.mem_so` | theorem (simp) | Mathlib.Algebra.Lie.Classical (Classical.lean:172) |
| `LieAlgebra.matrix_trace_commutator_zero` | theorem | Mathlib.Algebra.Lie.Classical (Classical.lean:81) |
| `LieSubalgebra` (field `toSubmodule`, from `extends Submodule R L`) | structure | Mathlib.Algebra.Lie.Subalgebra (Subalgebra.lean:45) |
| `selfAdjointMatricesSubmodule` | def | Mathlib.LinearAlgebra.Matrix.SesquilinearForm (SesquilinearForm.lean:639) |
| `mem_selfAdjointMatricesSubmodule` | theorem (simp) | Mathlib.LinearAlgebra.Matrix.SesquilinearForm (SesquilinearForm.lean:643) |
| `Matrix.IsSelfAdjoint` / `Matrix.IsAdjointPair` | def | Mathlib.LinearAlgebra.Matrix.SesquilinearForm (SesquilinearForm.lean:557 / :552) |
| `skewAdjointMatricesSubmodule`, `mem_skewAdjointMatricesSubmodule` | def / theorem | Mathlib.LinearAlgebra.Matrix.SesquilinearForm (SesquilinearForm.lean:649 / :653) |
| `Matrix.traceLinearMap` | def | Mathlib.LinearAlgebra.Matrix.Trace (Trace.lean:91) |
| `Matrix.trace` | def | Mathlib.LinearAlgebra.Matrix.Trace (Trace.lean:45) |
| `Matrix.trace_transpose` | theorem | Mathlib.LinearAlgebra.Matrix.Trace (Trace.lean:73) |
| `Matrix.transpose` | def | Mathlib.LinearAlgebra.Matrix.Defs (Defs.lean:172) |
| `Matrix.transpose_mul` | theorem | Mathlib.Data.Matrix.Mul (Mul.lean:1164) |
| `Matrix.transpose_sub` | theorem | Mathlib.LinearAlgebra.Matrix.Defs (Defs.lean:455) |
| `LinearMap.ker`, `LinearMap.mem_ker` | def / theorem | Mathlib.Algebra.Module.Submodule.Ker (Ker.lean:60 / :64) |
| `Module.finrank` | def | Mathlib.LinearAlgebra.Dimension.Finrank (Finrank.lean:62) |
| `Module.finrank_eq_card_basis` | theorem | Mathlib.LinearAlgebra.Dimension.StrongRankCondition (StrongRankCondition.lean:451) |
| `Disjoint` (for `𝔨 ⊓ 𝔭 = ⊥`, alternative form) | def | Mathlib.Order.Disjoint (Disjoint.lean:48) |
The dimension conjuncts have no ready-made lemma (no `finrank` of `sl` at the pin): L builds explicit bases (𝔭: diag(1, −1) and the symmetric off-diagonal; 𝔰𝔩: those two plus the skew generator) — local work, not NEEDS-DEVELOPMENT. No `native_decide`.

## 5 · Intended Lean statement
Prose: in the real 2 × 2 matrices, let 𝔨 be the skew-symmetric matrices (𝔰𝔬(2)) and 𝔭 the symmetric traceless matrices. Then 𝔰𝔩(2, ℝ) is the direct sum 𝔨 ⊕ 𝔭; the commutator of two elements of 𝔨 lies in 𝔨, of an element of 𝔨 with one of 𝔭 lies in 𝔭, and of two elements of 𝔭 lies in 𝔨; and dim 𝔰𝔩(2, ℝ) = 3, dim 𝔭 = 2.

```lean
/-- The symmetric traceless real 2 × 2 matrices (the paper's 𝔭 for SL(2, ℝ)). Local def; not the operator algebra. -/
def symmTraceless2 : Submodule ℝ (Matrix (Fin 2) (Fin 2) ℝ) :=
  selfAdjointMatricesSubmodule (1 : Matrix (Fin 2) (Fin 2) ℝ) ⊓
    LinearMap.ker (Matrix.traceLinearMap (Fin 2) ℝ ℝ)

/-- L:RZ-82a — RZ §13.4, (13.6) PDF p32 and the SL(2, ℝ) sentences PDF p33:
𝔰𝔩(2, ℝ) = 𝔰𝔬(2) ⊕ 𝔭 with 𝔭 the symmetric traceless matrices, the inclusions (13.6), and
dim 𝔰𝔩(2, ℝ) = 3, dim 𝔭 = 2. -/
theorem rz_82a_cartan_sl2 :
    let 𝔨 := (LieAlgebra.Orthogonal.so (Fin 2) ℝ).toSubmodule
    let 𝔭 := symmTraceless2
    let 𝔰𝔩 := (LieAlgebra.SpecialLinear.sl (Fin 2) ℝ).toSubmodule
    (𝔨 ⊔ 𝔭 = 𝔰𝔩 ∧ 𝔨 ⊓ 𝔭 = ⊥) ∧
    (∀ X ∈ 𝔨, ∀ Y ∈ 𝔨, X * Y - Y * X ∈ 𝔨) ∧
    (∀ X ∈ 𝔨, ∀ Y ∈ 𝔭, X * Y - Y * X ∈ 𝔭) ∧
    (∀ X ∈ 𝔭, ∀ Y ∈ 𝔭, X * Y - Y * X ∈ 𝔨) ∧
    Module.finrank ℝ 𝔰𝔩 = 3 ∧ Module.finrank ℝ 𝔭 = 2 := by sorry
```
(If `let` in the statement is unwelcome to V₂, L may inline the three submodules; the content does not change.)

## 6 · What the row does not claim
- Not the general semisimple statement (that is L:RZ-82b, OUT-OF-Q5).
- Not compactness / non-compactness (of SO(2), of the boost directions), only the named subspaces of 𝔰𝔩(2, ℝ).
- Not the operator labels "Harmonic", "Spiral + Eigenform + Dimensional", nor "the Lie-algebra version of 'two radial projections compose into a tangential one'" — readings.
- Not the comparison with "the 4-dimensional structure of the algebra", dim T_iso = 1, dim T_aniso = 3, nor that the missing commutators "would determine whether the algebra closes as an extension of 𝔰𝔩(2, ℝ)" — all about the operator algebra (Q7) or CONCEPT (L:RZ-84).
- Not §13.5's "correct statement" (the trace formula's spectral separation and its relation to conjugacy classes).

## 7 · Status
SPEC-DRAFT 2026-10-28T17:21:12Z

V1: V1-SPLIT-OK + V1-GREEN 2026-10-28T17:26:45Z — faithful to §13.4 (p32–p33). "Splits the algebra" licenses 𝔰𝔩 = 𝔨 ⊕ 𝔭 (𝔨 ⊔ 𝔭 = 𝔰𝔩 ∧ 𝔨 ⊓ 𝔭 = ⊥); "the 3-dimensional Cartan decomposition of SL(2, ℝ) (where dim 𝔭 = 2, not 3)" licenses both finrank 𝔰𝔩 = 3 and finrank 𝔭 = 2; (13.6) kept as ⊂ as printed. Conventions confirmed: 𝔨 = so (Fin 2) ℝ (mem_so: Aᵀ = −A, the +1 eigenspace of θX = −Xᵀ), 𝔭 = symmetric traceless (selfAdjointMatricesSubmodule 1 ⊓ ker trace), bracket = matrix commutator. Re-checked: [J,A], [J,B] symmetric traceless, [A,B] skew, {J,A,B} rank 3. Excluding dim T_iso = 1 / dim T_aniso = 3 and the operator labels is right (operator algebra, Q7 / CONCEPT RZ-84). The local def is a mathlib-level submodule, not the algebra (Q7 held).

V2: V2-GREEN 2026-10-28T17:37:11Z — p32 (13.6) and p33 SL(2, ℝ) + dimension sentences read by pdftotext (served sha256 2d5287e7… verified) before spec and theorem: `rz_82a_cartan_sl2` — 𝔨 = `so (Fin 2) ℝ` (pin: `mem_so` ↔ Aᵀ = −A), 𝔭 = `symmTraceless2` (pin: `IsAdjointPair 1 1 X X` is Xᵀ·1 = 1·X, ⊓ ker trace — the symmetric traceless matrices), 𝔰𝔩 = `sl (Fin 2) ℝ` (ker trace); 𝔰𝔩 = 𝔨 ⊕ 𝔭, the three inclusions of (13.6) element-wise with the explicit commutator X*Y − Y*X (kept ⊂ as printed), dim 𝔰𝔩 = 3, dim 𝔭 = 2 — every printed SL(2, ℝ) clause, nothing more. The local-instance line `attribute [local instance 100] LieRing.ofAssociativeRing in` is mathlib's own line in `Mathlib.Algebra.Lie.Classical` (pin: `ofAssociativeRing` is a `def`), scoped to this one declaration by `in`: it is not a hypothesis, adds no assumption, exports nothing (Q7 held), and the conjuncts never use ⁅·,·⁆ — it only lets `sl`/`so` elaborate; it weakens nothing. Independent check: [J,A], [J,B] symmetric traceless, [A,B] skew.
