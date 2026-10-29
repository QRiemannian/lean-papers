# L:RZ-82b — §13.4: the general (semisimple) Cartan decomposition and (13.6) — OUT-OF-Q5 (pending the wall)

## 1 · Header
- row: L:RZ-82b (split of L:RZ-82; the general leg — **OUT-OF-Q5 (pending the wall)**, uncounted; L:RZ-82a keeps the ledger figure)
- unit: U5 (`RiemannZeta/NoGo`)
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
- locus: §13.4, the sentence introducing display (13.6), PDF p32 (printed folio 31). Re-key change class: UNCHANGED.
- spec_clock: 2026-10-28T17:21:38Z

## 2 · Printed statement, verbatim
§13.4 (p32): "In semisimple Lie theory the Cartan decomposition splits the algebra into a compact part 𝔨 (rotations) and a non-compact part 𝔭 (boosts/dilations), satisfying
[𝔨, 𝔨] ⊂ 𝔨,   [𝔨, 𝔭] ⊂ 𝔭,   [𝔭, 𝔭] ⊂ 𝔨.   (13.6)"

## 3 · Formal reading
- A cited standard fact about real semisimple Lie algebras: every real semisimple 𝔤 has a Cartan involution θ (an involutive Lie-algebra automorphism with B_θ(X, Y) = −B(X, θY) positive definite, B the Killing form); its +1 and −1 eigenspaces 𝔨, 𝔭 give 𝔤 = 𝔨 ⊕ 𝔭 and satisfy (13.6); "compact part" means the Killing form is negative definite on 𝔨 (positive definite on 𝔭).
- Two layers: (i) for ANY involutive automorphism θ of a real Lie algebra, the eigenspace splitting 𝔤 = 𝔨 ⊕ 𝔭 satisfies (13.6) — elementary; (ii) the EXISTENCE of a Cartan involution for every real semisimple 𝔤, with the definiteness that makes 𝔨 "compact" — the substantive cited theorem.

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`; `/usr/bin/grep -rn` under `.lake/packages/mathlib/Mathlib/`)
| declaration | kind | module (file:line) |
|---|---|---|
| `LieAlgebra.IsSemisimple` | class | Mathlib.Algebra.Lie.Semisimple.Defs (Defs.lean:105) |
| `killingForm` | abbrev (noncomputable) | Mathlib.Algebra.Lie.TraceForm (TraceForm.lean:373) |
| `LieAlgebra.IsKilling` | class | Mathlib.Algebra.Lie.Killing (Killing.lean:51) |
| `LieEquiv` | structure | Mathlib.Algebra.Lie.Basic (Basic.lean:505) |
**NEEDS-DEVELOPMENT** for layer (ii): no Cartan involution and no Cartan decomposition exist at the pin (`/usr/bin/grep -rli "cartan decomposition\|CartanDecomposition\|cartanInvolution\|Cartan involution"` under `Mathlib/` returns nothing; mathlib's `LieSubalgebra.IsCartanSubalgebra` is the unrelated Cartan *subalgebra*). Layer (i) is buildable from `LieEquiv` alone.

## 5 · Intended Lean statement
Prose: every finite-dimensional real semisimple Lie algebra 𝔤 admits an involutive automorphism θ whose +1-eigenspace 𝔨 and −1-eigenspace 𝔭 satisfy 𝔤 = 𝔨 ⊕ 𝔭 and (13.6), with the Killing form negative definite on 𝔨 and positive definite on 𝔭.

Proposed shape (indicative only; the row is OUT-OF-Q5 and is not built in this wave):
```lean
theorem rz_82b_cartan_decomposition
    {L : Type*} [LieRing L] [LieAlgebra ℝ L] [FiniteDimensional ℝ L] [LieAlgebra.IsSemisimple ℝ L] :
    ∃ θ : L ≃ₗ⁅ℝ⁆ L, (∀ x, θ (θ x) = x) ∧
      (let 𝔨 := {x : L | θ x = x}; let 𝔭 := {x : L | θ x = -x}
       (∀ x, ∃ k ∈ 𝔨, ∃ p ∈ 𝔭, x = k + p) ∧
       (∀ x ∈ 𝔨, ∀ y ∈ 𝔨, ⁅x, y⁆ ∈ 𝔨) ∧ (∀ x ∈ 𝔨, ∀ y ∈ 𝔭, ⁅x, y⁆ ∈ 𝔭) ∧ (∀ x ∈ 𝔭, ∀ y ∈ 𝔭, ⁅x, y⁆ ∈ 𝔨) ∧
       (∀ x ∈ 𝔨, x ≠ 0 → killingForm ℝ L x x < 0) ∧ (∀ x ∈ 𝔭, x ≠ 0 → 0 < killingForm ℝ L x x)) := by sorry
```

## 6 · What the row does not claim
- Not the SL(2, ℝ) instance (L:RZ-82a), nor any link between 𝔨/𝔭 and the operators Ĥ, Ê, Ŝ, D̂ (Q7; CONCEPT, L:RZ-84).
- Not a classification of Cartan involutions (uniqueness up to inner automorphism).
- Not the labels "rotations", "boosts/dilations" as formal content.

## 7 · Status
SPEC-DRAFT 2026-10-28T17:21:38Z — OUT-OF-Q5 (pending the wall); NEEDS-DEVELOPMENT (Cartan involution existence)

V1: V1-SPLIT-OK + V1-GREEN (as a statement; OUT-OF-Q5, uncounted) 2026-10-28T17:26:45Z — the general §13.4 sentence (p32) is a standard cited fact; "compact part"/"non-compact part" read as Killing negative-/positive-definite on 𝔨/𝔭 is the standard meaning of the Cartan decomposition's labels, not a strengthening. NEEDS-DEVELOPMENT confirmed at the pin (/usr/bin/grep -rliE for Cartan decomposition/involution under Mathlib/: no hits). The split (concrete SL(2, ℝ) instance in scope / general existence theorem out) follows buildability and both halves are printed; nothing is lost between them.

V2: V2-GREEN (as a statement; OUT-OF-Q5 pending the wall, NEEDS-DEVELOPMENT, uncounted) 2026-10-28T17:37:11Z — p32 §13.4 sentence introducing (13.6) read by pdftotext (served sha256 2d5287e7… verified) before spec and theorem: `rz_82b_cartan_decomposition` — every finite-dimensional real semisimple L has an involutive Lie automorphism θ with 𝔨 = Fix θ, 𝔭 = (−1)-eigenset, L = 𝔨 + 𝔭, (13.6) with the Lie bracket, Killing negative definite on 𝔨 ("compact part") and positive definite on 𝔭 ("non-compact part"). The definiteness is the standard meaning of the printed labels and is what keeps the statement from a definitional accident (without it θ = id, 𝔭 = 0 would satisfy everything); real is the domain the print's compact/non-compact/boosts and the SL(2, ℝ) instance fix. True as stated (existence of a Cartan involution). Q7 untouched (an arbitrary Lie algebra under mathlib classes, not the operator algebra).
