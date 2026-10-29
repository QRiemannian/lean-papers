# L:RZ-63b — the geometric readings of RZ-63: ℓ the translation length, σ the systole — OUT-OF-Q5 (pending the wall)

1. **Header**
   - row: `L:RZ-63b` (split from `L:RZ-63`; sibling `L:RZ-63a`, which keeps the ledger figure) — **OUT-OF-Q5 (pending the wall)**. The ledger's own note: "with ℓ the geometric length it inherits RZ-05". It inherits `L:RZ-05` (translation length, EFFORT, 15 pd) and `L:RZ-06b` (systole as a minimum, EFFORT, 3 pd).
   - unit: U4 `RiemannZeta/MatricesMobius`
   - paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
   - pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
   - locus: §9.5, paragraph "The metric twin, and what it does not buy.", display (9.9a); served PDF p25 (printed folio 24).
   - spec_clock: 2026-10-28T17:32:22Z (re-drafted after V1-DRIFT 2026-10-28T17:29:27Z: attainment made a mandatory conjunct; first drafted 2026-10-28T17:13:41Z)

2. **Printed statement, verbatim** (the same sentence as `L:RZ-63a`; this sub-row takes its two geometric nouns)

   > For every hyperbolic element of every Fuchsian group, √(t² − 4) = 2 sinh(ℓ/2), where t is the trace and ℓ = 2 log λ the translation length [CV]. At the systolic element of X(1) — t = 3, σ = 4 log φ — this returns √5 = 2 sinh(σ/2) exactly, so the geometry constant may equivalently be written
   > g_c = 1/(2π sinh(σ/2)),   σ = systole(X(1)) = 4 log φ,   (9.9a)

   Taken here: "ℓ … the translation length" and "σ = systole(X(1))".

3. **Formal reading**
   - **Translation length** of γ ∈ SL(2, ℝ) acting on ℍ (mathlib's `UpperHalfPlane.SLAction`, the hyperbolic metric `UpperHalfPlane` `MetricSpace` instance, `UpperHalfPlane.dist_eq`): τ(γ) := inf_{z ∈ ℍ} d(z, γ·z). The claim read: for hyperbolic γ with trace t, √(t² − 4) = 2 sinh(τ(γ)/2) — equivalently τ(γ) = 2 log |λ| (then `L:RZ-63a` (i) finishes it).
   - **"the systolic element of X(1)"** and **"σ = systole(X(1))"**: the systole is read as the minimal translation length over hyperbolic elements of SL(2, ℤ) (the brief's convention: minimal translation length over hyperbolic classes; conjugation does not change τ). The claim read: inf over hyperbolic γ ∈ SL(2, ℤ) of τ(γ) = 4 log φ, attained at F² = (2 1; 1 1).
   - Taken as an infimum over the set of hyperbolic elements (an `iInf` over a subtype), together with attainment: "the systolic element … t = 3, σ = 4 log φ" asserts some hyperbolic γ ∈ SL(2, ℤ) with tr γ = 3 and τ(γ) = 4 log φ (F² = (2 1; 1 1)). Both clauses are in the statement.

4. **Target mathlib declarations** (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
   - `UpperHalfPlane.dist_eq` (Metric.lean:42), the `MetricSpace ℍ` instance (Metric.lean:252) — Mathlib.Analysis.Complex.UpperHalfPlane.Metric
   - `UpperHalfPlane.SLAction` — Mathlib.Analysis.Complex.UpperHalfPlane.MoebiusAction
   - `Matrix.IsHyperbolic` — Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.FinTwo
   - `Matrix.SpecialLinearGroup.map` (SpecialLinearGroup.lean:225) — Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup; `Int.castRingHom` (Data/Int/Cast/Lemmas.lean:85) — Mathlib.Data.Int.Cast.Lemmas
   - `Real.sinh`, `Real.log`, `Real.goldenRatio`, `Real.sqrt` — as in `L:RZ-63a`
   - **NEEDS-DEVELOPMENT:** a translation-length lemma (inf_z d(z, γz) = 2 arcosh(|t|/2) for hyperbolic γ) — not at the pin (ledger `L:RZ-05`: "no translation-length lemma found"); the systole as a minimum over hyperbolic classes rides on it plus `L:RZ-03` (smallest hyperbolic |trace| on SL(2, ℤ) is 3) and monotonicity of 2 arcosh(|t|/2) in |t|.

5. **Intended Lean statement**

   ```lean
   /-- L:RZ-63b · RZ §9.5, (9.9a), served p25: with ℓ the hyperbolic translation length,
   √(t² − 4) = 2 sinh(ℓ/2); the systole of X(1) (minimal translation length over hyperbolic
   elements of SL(2, ℤ)) is 4 log φ, attained at F² = (2 1; 1 1). OUT-OF-Q5 (pending the wall). -/
   theorem rz_63b_geometric (τ : SL(2, ℝ) → ℝ)
       (hτ : ∀ γ, τ γ = ⨅ z : ℍ, dist z (γ • z)) :
       (∀ γ : SL(2, ℝ), (γ : Matrix (Fin 2) (Fin 2) ℝ).IsHyperbolic →
           √((γ : Matrix (Fin 2) (Fin 2) ℝ).trace ^ 2 - 4) = 2 * Real.sinh (τ γ / 2)) ∧
       (⨅ γ : {γ : SL(2, ℤ) // (γ : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic},
           τ (Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ) γ.1))
         = 4 * Real.log Real.goldenRatio ∧
       (∃ γ : SL(2, ℤ), (γ : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic ∧
           (γ : Matrix (Fin 2) (Fin 2) ℤ).trace = 3 ∧
           τ (Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ) γ) = 4 * Real.log Real.goldenRatio) := by
     sorry
   ```

   (The τ-as-hypothesis form is a shape choice so the statement carries the definition visibly; L may write τ as a `def`. The third conjunct, attainment, is mandatory: the print's "At the systolic element of X(1) — t = 3, σ = 4 log φ" asserts an element of trace 3 realising the systole. Witness for L (not printed as a matrix in this sentence; printed at (2.1)/§8.5): F² = (2 1; 1 1).)

6. **What the row does not claim**
   - Not the correspondence hyperbolic classes ↔ closed geodesics on the orbifold X(1) (`L:RZ-01`, EFFORT-FAR); "systole" here is the group-theoretic minimum, not a length of a closed geodesic on X(1) as a metric space.
   - Not the arithmetic reading of the systolic element (discriminant, field ℚ(√5)).
   - Not "a purely metric expression in which no discriminant appears [D]".

7. **Status line**
   - `SPEC-DRAFT 2026-10-28T17:32:22Z` (supersedes SPEC-DRAFT 2026-10-28T17:13:41Z; answers the V1-DRIFT line below)

V1: V1-DRIFT 2026-10-28T17:29:27Z — weaker than the print and than the spec's own §3. The print says 'At the systolic element of X(1) — t = 3, σ = 4 log φ': an element realising the systole, of trace 3. §3 says 'attainment is part of "the systolic element"' and the docstring says 'attained at F² = (2 1; 1 1)', but the Lean shape carries only the infimum (= 4 log φ) and leaves attainment to L as optional. Fix for M: make ∃ γ ∈ SL(2, ℤ) hyperbolic with tr γ = 3 (F²) and τ(map γ) = 4 log φ a mandatory third conjunct, so docstring, §3 and statement say the same thing. Otherwise faithful (τ := inf_z d(z, γz); systole := inf over hyperbolic elements of SL(2, ℤ)). Placement OUT-OF-Q5 honest (ledger: 'with ℓ the geometric length it inherits RZ-05').

V1: V1-GREEN 2026-10-28T17:34:26Z — re-read against served p25 (digest verified 17:24:55Z): the drift is closed. The third conjunct (∃ γ ∈ SL(2, ℤ), IsHyperbolic, tr γ = 3, τ(map γ) = 4 log φ) is the printed 'At the systolic element of X(1) — t = 3, σ = 4 log φ'; docstring ('attained at F²'), §3 ('Both clauses are in the statement') and §5 now say the same thing, and nothing else moved (τ := inf_z d(z, γz), systole := inf over hyperbolic elements of SL(2, ℤ), first two conjuncts unchanged). No stronger than the print: the conjunct names trace 3 and the value, not the matrix F², which stays a witness for L. Placement OUT-OF-Q5 (pending the wall) unchanged and honest.

V2: V2-GREEN 2026-10-28T17:50:42Z (OUT-OF-Q5, pending the wall) — rz_63b_geometric is the spec verbatim: τ γ = ⨅ z, dist z (γ • z) with mathlib's curvature −1 metric on ℍ (UpperHalfPlane.dist_eq); √(t² − 4) = 2 sinh(τ/2) for hyperbolic γ ∈ SL(2, ℝ); systole := inf of τ over hyperbolic elements of SL(2, ℤ) = 4 log φ; attainment at a trace-3 element (the printed 'At the systolic element of X(1) — t = 3'). The systole convention is the paper's: minimal translation length.
