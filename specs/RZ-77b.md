# L:RZ-77b — the Casimir operator of SL(2, ℝ) has eigenvalue λ = s(1 − s) on the principal-series representation with parameter s (12.8) — OUT-OF-Q5 (pending the wall) · NEEDS-DEVELOPMENT

## 1 · Header
- row: `L:RZ-77b` (split from `L:RZ-77`; sibling `L:RZ-77a` keeps the arithmetic and the ledger figure). **OUT-OF-Q5 (pending the wall)**; **NEEDS-DEVELOPMENT** (gap named in §4). Uncounted until the wall rules.
- unit: U7 `RiemannZeta/SmallArith`
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
- locus: §12.4 "The Casimir connection", the sentence carrying display (12.8) — served PDF page p30 (printed folio 29).
- spec_clock: 2026-10-28T17:27:09Z

## 2 · Printed statement, verbatim
Served p30, `pdftotext -layout`, mathematical-italic letters written plain:

> This is half the Casimir eigenvalue of SL(2, ℝ): the Casimir operator C has eigenvalue
>
> λ = s(1 − s)        (12.8)
>
> on the principal-series representation with parameter s.

(No grade tag on this sentence; §12.5 grades "the constant-curvature and Casimir steps" as established [CV].)

## 3 · Formal reading
- **Objects the sentence needs:** the Lie algebra 𝔰𝔩(2, ℝ); its Casimir element C in the centre of the universal enveloping algebra (normalisation not printed — the eigenvalue s(1 − s) fixes it: the normalisation under which C acts on functions on ℍ as the hyperbolic Laplacian Δ = −y²(∂²ₓ + ∂²ᵧ)); the principal-series representation of SL(2, ℝ) with parameter s (induced from the character of the upper-triangular Borel subgroup given by |a|^{2s} — parameter convention not printed; the spec takes the one under which the eigenvalue is s(1 − s) — written with s = 1/2 + it it is 1/4 + t²); the derived action of U(𝔰𝔩(2, ℝ)) on its smooth vectors.
- **Claim:** C acts on that representation as the scalar s(1 − s).
- A smaller proxy exists — Δ(yˢ) = s(1 − s)·yˢ for the hyperbolic Laplacian on ℍ — but it is a different statement (no representation, no Casimir) and is not what the sentence prints; it is recorded here only as an option for the wall, not as this row's spec.

## 4 · Target mathlib declarations, and the gap (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
Present (ingredients only): `UniversalEnvelopingAlgebra` (def, Algebra/Lie/UniversalEnveloping.lean:65), `LieAlgebra.SpecialLinear.sl` (def, Algebra/Lie/Classical.lean:94), `IsSl2Triple` (structure, Algebra/Lie/Sl2.lean:41), `Matrix.SpecialLinearGroup`.
**Absent (the gap):** any Casimir element (`/usr/bin/grep -rli casimir` over Mathlib/ → 0 files); principal-series / parabolically induced representations of real Lie groups (no declaration; the only induction file is RepresentationTheory/Coinduced.lean, for group representations without topology); the derived action of a Lie group's representation on smooth vectors; a hyperbolic Laplacian on `UpperHalfPlane` (the Laplacian files under Analysis/InnerProductSpace are Euclidean). **NEEDS-DEVELOPMENT.**

## 5 · Intended Lean statement
Prose only (no signature can be written against the pin without inventing the missing objects): for every s ∈ ℂ, the Casimir element of U(𝔰𝔩(2, ℝ)) (normalised so that it acts on functions on ℍ as Δ = −y²(∂²ₓ + ∂²ᵧ)) acts on the principal-series representation of SL(2, ℝ) with parameter s (induced from |a|^{2s} on the Borel) as multiplication by s(1 − s).

## 6 · What the row does not claim
- Not the arithmetic λ(1/2) = 1/4, λ/2 = 1/8 (`L:RZ-77a`).
- Not that the Maslov 1/8 "is" half the Casimir eigenvalue in any derivational sense (§12.5 prints the 1/4 → 1/8 step as "an equality of numbers, not a derivation" [I]).
- Not the spin-statistics reading ([I]).

## 7 · Status line
- `SPEC-DRAFT 2026-10-28T17:27:09Z` — OUT-OF-Q5 (pending the wall); NEEDS-DEVELOPMENT.
- V1: V1-SPLIT-OK 2026-10-28T17:32:07Z — the split is right: the sentence carrying (12.8) is a representation-theory theorem (Casimir of 𝔰𝔩(2, ℝ) acting on the principal series) that the 0.25 pd arithmetic row cannot carry, and nothing printed falls between 77a and 77b. As a statement the spec is faithful: the print fixes neither the Casimir normalisation nor the parameter convention, and the spec names the ones under which the printed eigenvalue s(1 − s) holds (C ↦ Δ = −y²(∂²ₓ + ∂²ᵧ), induced from |a|^{2s}; checked: Δyˢ = s(1 − s)yˢ). OUT-OF-Q5 (pending the wall) and NEEDS-DEVELOPMENT confirmed; uncounted.
- V2: no statement — OUT-OF-Q5 (pending the wall), NEEDS-DEVELOPMENT; Challenge.lean carries no theorem for this row (checked 2026-10-28T17:44:42Z); nothing to verify for fidelity; uncounted.
