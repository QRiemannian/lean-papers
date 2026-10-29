# Unit U5 (`RiemannZeta/NoGo`) — seat M summary

- seat: M (statement author), FAN-OUT-PLAN-v1 §4 step 2; brief `Orchestrator/Chat-Design/cc-handoff/projects/reputation-play/lean-scoping/seats/M-U5-2026-10-28.md`
- authority: RZ served PDF, sha256 `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54` (re-checked with `shasum -a 256` at the seat's opening); loci read by `pdftotext -layout` at PDF pages p09 (§3, relations (3.2)–(3.5)) and p31–p33 (§13 read whole: §13.1–§13.5)
- mathlib pin: `db584cd6d46c92f209a44c0f1c829460d327499d` (lake-manifest `rev`); every name below found by `/usr/bin/grep -rn` under `~/Claude/projects/lean-papers/.lake/packages/mathlib/Mathlib/`
- seat opened 2026-10-28T17:12:29Z; first artefact (`RZ-80.md`) 17:19:51Z; summary clock 2026-10-28T17:22:26Z
- no git, no web, no Lean compiled, nothing under the lab's non-public research trees read
- **Q7 held:** no spec exports the operator algebra as a `structure` or `class`; the relations appear only as hypotheses (RZ-80: (3.2) alone; RZ-81: all six). RZ-18 is NOT A TARGET and has no spec. The one local `def` (RZ-82a's `symmTraceless2`, the symmetric traceless 2 × 2 matrices) is a mathlib-level submodule, not the algebra.

## Rows: 3 ledger rows → 4 spec files

| ledger row | spec file(s) | disposition | bucket |
|---|---|---|---|
| L:RZ-80 | `RZ-80.md` | SPECCED — in a ZMod 2-graded ℂ-algebra with Ĥ even, Ê, Ŝ, D̂ odd, ℏ ≠ 0, relation (3.2) forces [Ê, Ŝ] = 0 ∧ ĤD̂ = 0 | NOW (ledger figure, E1) |
| L:RZ-81 | `RZ-81.md` | SPECCED (CHANGED row; CC-3 landed, printed text true) — six relations ⇒ D̂ÊĤ = 0, and D̂, Ê, Ĥ not all units in a nontrivial algebra; plus the printed "not an outright contradiction" leg as a nonzero 2 × 2 witness | NOW (ledger figure, E1) |
| L:RZ-82 | `RZ-82a.md`, `RZ-82b.md` | **SPLIT** — 82a the SL(2, ℝ) instance: 𝔰𝔩(2, ℝ) = 𝔰𝔬(2) ⊕ (symmetric traceless), (13.6) element-wise, dim 𝔰𝔩 = 3, dim 𝔭 = 2 (in scope, keeps the ledger figure); 82b the general semisimple Cartan decomposition — **OUT-OF-Q5 (pending the wall)**, NEEDS-DEVELOPMENT | 82a NOW (2 pd, E1–E2) · 82b proposed only, uncounted |

**CC-CANDIDATES: none.** Every printed statement in this unit is true in the served edition under the reading each spec names. One reading note, not a CC (V₁ to confirm): RZ-80's "A multiplicative ℤ2 grading is therefore incompatible with the commutation relations" is true as "the relation is not homogeneous, so under the grading it holds only with both sides zero"; it would be false if read as "no graded realization by nonzero operators exists" (degenerate nonzero graded realizations of all four relations exist — `RZ-80.md` §6 gives one). The spec takes the first reading, which is exactly what the printed parity argument establishes.

**Splits for V₁'s sign-off:** RZ-82 → 82a (SL(2, ℝ) instance, in scope) / 82b (general semisimple, OUT-OF-Q5).

**Spec notes carried as instructed:**
- RZ-81: the derivation uses BOTH relations of (13.3) — the print names only [Ê, Ĥ] = iℏ ŜD̂ — and also all four of (3.2)–(3.5); all six are hypotheses, and the spec says so with the term-by-term expansion: [[Ê, Ĥ], D̂] = c²ÊĤD̂ (13.3 both), [[Ĥ, D̂], Ê] = −c²ÊĤD̂ (3.4, 3.2), [[D̂, Ê], Ĥ] = c²D̂ÊĤ (3.5, 3.3); sum c²D̂ÊĤ, c = iℏ.
- RZ-80 and RZ-81 both add `ħ ≠ 0` (ℏ's non-vanishing is implicit in print) — needed only to strip the scalar.

## Mathlib names not found at the pin (and what replaced them)
- **Cartan involution / Cartan decomposition** (RZ-82b): nothing at the pin (`/usr/bin/grep -rli "cartan decomposition\|CartanDecomposition\|cartanInvolution\|Cartan involution"` → no hits; `LieSubalgebra.IsCartanSubalgebra` is the unrelated Cartan subalgebra). RZ-82b → NEEDS-DEVELOPMENT; its elementary layer (eigenspaces of an involutive `LieEquiv` satisfy (13.6)) is buildable.
- **No `finrank` lemma for `sl n R` / for the symmetric traceless matrices** (RZ-82a): L builds explicit bases and uses `Module.finrank_eq_card_basis` — local work, not NEEDS-DEVELOPMENT.
- `DirectSum.Decomposition` is declared as `class Decomposition` inside `namespace DirectSum` (Decomposition.lean:56); a literal `class DirectSum.Decomposition` grep misses it. Likewise `GradedAlgebra` and `killingForm` are `abbrev`s (an abbrev-blind grep misses them).
- No `Fact (Nat.Prime …)` is needed anywhere in U5.

## Declarations each row targets
- **RZ-80:** `GradedAlgebra` (RingTheory/GradedAlgebra/Basic.lean:170, abbrev), `GradedRing` (:67), `SetLike.GradedMul` (Algebra/GradedMonoid.lean:503), `SetLike.mul_mem_graded` (:507), `SetLike.GradedMonoid` (:522), `DirectSum.Decomposition` (Algebra/DirectSum/Decomposition.lean:56), `DirectSum.decompose` (:93), `DirectSum.decompose_of_mem_same` (:138), `DirectSum.decompose_of_mem_ne` (:141), `Submodule.smul_mem` (Algebra/Module/Submodule/Defs.lean:214), `Submodule.sub_mem` (:342), `Complex.I` (Data/Complex/Basic.lean:240), `Complex.I_ne_zero` (:258), `Complex.ofReal_ne_zero` (:141), `smul_eq_zero` (Algebra/Module/Torsion/Free.lean:111), `Ring.lie_def` (Algebra/Ring/Commute.lean:257).
- **RZ-81:** `noncomm_ring` (Tactic/NoncommRing.lean:66), `lie_jacobi` (Algebra/Lie/Basic.lean:229), `LieRing.ofAssociativeRing` (Algebra/Lie/OfAssociative.lean:50), `Ring.lie_def`, `smul_mul_assoc` (Algebra/Group/Action/Defs.lean:354), `mul_smul_comm` (:349), `smul_smul` (:413), `smul_eq_zero`, `Complex.I`, `Complex.I_ne_zero`, `Complex.ofReal_ne_zero`, `IsUnit.mul` (Algebra/Group/Units/Defs.lean:414), `IsUnit.ne_zero` (Algebra/GroupWithZero/Units/Basic.lean:53); witness in `Matrix (Fin 2) (Fin 2) ℂ`.
- **RZ-82a:** `LieAlgebra.SpecialLinear.sl` (Algebra/Lie/Classical.lean:94), `LieAlgebra.SpecialLinear.sl_bracket` (:98), `LieAlgebra.Orthogonal.so` (:168), `LieAlgebra.Orthogonal.mem_so` (:172), `LieAlgebra.matrix_trace_commutator_zero` (:81), `LieSubalgebra` / `toSubmodule` (Algebra/Lie/Subalgebra.lean:45), `selfAdjointMatricesSubmodule` (LinearAlgebra/Matrix/SesquilinearForm.lean:639), `mem_selfAdjointMatricesSubmodule` (:643), `Matrix.IsSelfAdjoint` (:557), `Matrix.IsAdjointPair` (:552), `skewAdjointMatricesSubmodule` / `mem_skewAdjointMatricesSubmodule` (:649/:653), `Matrix.traceLinearMap` (LinearAlgebra/Matrix/Trace.lean:91), `Matrix.trace` (:45), `Matrix.trace_transpose` (:73), `Matrix.transpose` (LinearAlgebra/Matrix/Defs.lean:172), `Matrix.transpose_sub` (:455), `Matrix.transpose_mul` (Data/Matrix/Mul.lean:1164), `LinearMap.ker` / `LinearMap.mem_ker` (Algebra/Module/Submodule/Ker.lean:60/:64), `Module.finrank` (LinearAlgebra/Dimension/Finrank.lean:62), `Module.finrank_eq_card_basis` (LinearAlgebra/Dimension/StrongRankCondition.lean:451), `Disjoint` (Order/Disjoint.lean:48).
- **RZ-82b:** `LieAlgebra.IsSemisimple` (Algebra/Lie/Semisimple/Defs.lean:105), `killingForm` (Algebra/Lie/TraceForm.lean:373, abbrev), `LieAlgebra.IsKilling` (Algebra/Lie/Killing.lean:51), `LieEquiv` (Algebra/Lie/Basic.lean:505); Cartan involution NEEDS-DEVELOPMENT.

## Conventions fixed in this unit
- Operators = elements of an arbitrary `[Ring A] [Algebra ℂ A]`; commutator [X, Y] = XY − YX; iℏ = `Complex.I * (ħ : ℂ)`, `ħ : ℝ`, `ħ ≠ 0` where a scalar must be cancelled.
- Multiplicative ℤ₂ parity ε = ±1 ↔ ZMod 2 degree d by ε = (−1)^d; (13.2) ↔ `SetLike.GradedMul.mul_mem`; "ε(X) = ±1" ↔ X homogeneous of that degree.
- 𝔨 = 𝔰𝔬(2) = `LieAlgebra.Orthogonal.so (Fin 2) ℝ` (Xᵀ = −X); 𝔭 = symmetric traceless = `selfAdjointMatricesSubmodule 1 ⊓ ker traceLinearMap`; 𝔰𝔩(2, ℝ) = `LieAlgebra.SpecialLinear.sl (Fin 2) ℝ`.

## The one thing V₁ should look at hardest, per row
- **RZ-80:** whether "incompatible with the commutation relations" is rightly formalized as "under the grading, (3.2) holds only with both sides zero" (true; what the parity argument proves) rather than "no nonzero graded realization exists" (false — `RZ-80.md` §6 has a nonzero realization of all four relations) — if V₁ reads the print the second way, the row becomes a CC-candidate, not a repair. Also that taking (3.2) alone as hypothesis is right (the print's argument uses only (3.2); "the commutation relations" in the conclusion is plural).
- **RZ-81:** leg (b) — whether "though not for arbitrary nonzero operators; … rather than an outright contradiction" is rightly formalized as "the six relations have a realization by nonzero operators" (my reading; witness N = !![0,1;0,0] for all four) rather than the weaker "D̂ÊĤ = 0 is possible with D̂, Ê, Ĥ nonzero" or left out; and that the units leg's `Nontrivial A` is the honest form of "operators".
- **RZ-82a/82b:** the split itself and the dimension conjuncts — whether "the 3-dimensional Cartan decomposition of SL(2, ℝ) (where dim 𝔭 = 2, not 3)" licenses `finrank 𝔰𝔩 = 3` as well as `finrank 𝔭 = 2`, and whether "the decomposition has 𝔨 = … and 𝔭 = …" carries the direct-sum claim 𝔰𝔩 = 𝔨 ⊕ 𝔭 (my reading: yes, "splits the algebra").
