# L:RZ-14a — the hyperbolic area of the standard fundamental domain 𝒟 of SL(2, ℤ) is π/3

## 1 · Header
- row: L:RZ-14a (the ledger's own a/b split of RZ-14: **a** = the area of the standard fundamental domain as a computed integral; **b** = that area as vol(X(1)), the area of the quotient, L:RZ-14b)
- unit: U9 (`RiemannZeta/Provenance`)
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: 2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54 (re-read with `shasum -a 256` at the seat's start, 2026-10-28T20:21Z; matches)
- locus: §2.4 "𝜋 from the area", display (2.8) and its introducing sentence; PDF page p08 (printed folio 7). Re-key: v0.1 tag (2.8) → served tag (2.8), change class UNCHANGED.
- spec_clock: 2026-10-28T20:30:47Z

## 2 · Printed statement, verbatim (served edition, `pdftotext -layout`, p08)
> The hyperbolic area of the modular surface is
>
> vol(𝑋(1)) = 𝜋/3,  (2.8)
>
> the Gauss–Bonnet value for the (2, 3, ∞) orbifold; equivalently
>
> 𝜋 = 3 ⋅ vol(𝑋(1))  [CV].  (2.9)

This sub-row takes the number π/3 as the hyperbolic area of the standard fundamental domain 𝒟 ("the modular surface" realised as 𝒟, which is how the area is computed). That this area IS vol(X(1)) — the area of the quotient SL(2, ℤ)\ℍ, independent of the chosen domain — and the Gauss–Bonnet clause are L:RZ-14b. (2.9) is L:RZ-15's ("3 · vol = π exactly", `rz_15_geometryConstant_writings`, CHECKED).

## 3 · Formal reading
- **ℍ and its hyperbolic area.** mathlib's `MeasureSpace ℍ` instance (`UpperHalfPlane.volume_def`): the restriction of Lebesgue measure on ℂ weighted by 1/(im z)², i.e. dx dy / y² — the area form of the curvature −1 metric (the same metric `UpperHalfPlane.dist_eq` / `cosh_dist` carry). The value is an `ℝ≥0∞`; π/3 enters as `ENNReal.ofReal (Real.pi / 3)`.
- **The standard fundamental domain.** `ModularGroup.fd` (notation 𝒟): {z ∈ ℍ : 1 ≤ ‖z‖, |re z| ≤ 1/2} (`ModularGroup.coe_fd` gives its image in ℂ as {0 < im z, 1 ≤ ‖z‖, |re z| ≤ 1/2}). The closed domain; its boundary is null, so the open `ModularGroup.fdo` has the same area (not stated).
- **The computation the row asks for** (the ledger's E2 note): ∫_{|x| ≤ 1/2} ∫_{y ≥ √(1 − x²)} y⁻² dy dx = ∫_{−1/2}^{1/2} (1 − x²)^{−1/2} dx = 2 arcsin(1/2) = π/3.
- **No hypotheses; no domain.**

## 4 · Target mathlib declarations (pin db584cd6d46c92f209a44c0f1c829460d327499d; each found by the governor-71 grep of the short name over every declaration keyword, namespace read from the file's `namespace`/`end` lines)
| declaration | kind | file:line · namespace |
|---|---|---|
| `UpperHalfPlane` measure instance, `UpperHalfPlane.volume_def` | instance; theorem | Analysis/Complex/UpperHalfPlane/Measure.lean:45, :49 · `UpperHalfPlane`; the GL(2, ℝ)-invariance instance `SMulInvariantMeasure (GL (Fin 2) ℝ) ℍ volume` at :89 (used by L:RZ-14b) |
| `UpperHalfPlane.volume_eq_lintegral` | lemma — `volume s = ∫⁻ z : ℂ in (↑) '' s, ↑((1 / ‖z.im‖₊) ^ 2)` | Measure.lean:77 · `UpperHalfPlane` |
| `ModularGroup.fd` | def | NumberTheory/Modular.lean:367 · `ModularGroup` |
| `ModularGroup.coe_fd` | lemma | Modular.lean:828 · `ModularGroup` |
| `ModularGroup.fdo`, `ModularGroup.fd_eq_closure_fdo` (proof aid) | def; lemma | Modular.lean:371, :909 · `ModularGroup` |
| `Complex.measurableEquivRealProd`, `Complex.volume_preserving_equiv_real_prod` (proof aid: ℂ ≃ ℝ × ℝ) | def; theorem | MeasureTheory/Measure/Lebesgue/Complex.lean:43, :60 · `Complex` |
| `MeasureTheory.lintegral_prod` (Tonelli; proof aid) | theorem | MeasureTheory/Measure/Prod.lean:1006 · `MeasureTheory` |
| `integral_Ioi_rpow_of_lt` (∫_c^∞ y^a, a < −1; proof aid) | theorem | Analysis/SpecialFunctions/ImproperIntegrals.lean:172 |
| `Real.deriv_arcsin`, `Real.hasDerivAt_arcsin` (proof aid) | theorems | Analysis/SpecialFunctions/Trigonometric/InverseDeriv.lean:97, :53 · `Real` |
| `Real.arcsin_sin`, `Real.sin_pi_div_six` (arcsin(1/2) = π/6; proof aid) | theorems | Trigonometric/Inverse.lean:67 · `Real`; Trigonometric/Basic.lean:799 · `Real` |
| `ENNReal.ofReal`, `Real.pi` | def; def | standard |

No ledger-cited name is missing (`volume_def`, `volume_eq_lintegral`, `coe_fd` all present). Name check, pasted: `Mathlib/Analysis/Complex/UpperHalfPlane/Measure.lean:77:lemma volume_eq_lintegral (s : Set ℍ) :` inside `namespace UpperHalfPlane` (opened :31, closed :116).

## 5 · Intended Lean statement
**Prose.** The standard fundamental domain 𝒟 of SL(2, ℤ) has hyperbolic area (measure dx dy / y² on ℍ) equal to π/3.

**Proposed signature.**
```lean
/-- **L:RZ-14a** — RZ §2.4, (2.8): the hyperbolic area (dx dy / y²) of the standard fundamental
domain 𝒟 = {‖z‖ ≥ 1, |re z| ≤ 1/2} of SL(2, ℤ) is π/3. That this is vol(X(1)) is L:RZ-14b. -/
theorem rz_14a_area_fd :
    (MeasureTheory.volume : MeasureTheory.Measure ℍ) ModularGroup.fd
      = ENNReal.ofReal (Real.pi / 3) := by
  sorry
```

## 6 · What the row does not claim
- **That π/3 is vol(X(1))** — the area of the quotient, independent of the fundamental domain chosen; and "the Gauss–Bonnet value for the (2, 3, ∞) orbifold". Both are L:RZ-14b.
- **(2.9) π = 3 · vol(X(1)) [CV]** — carried by L:RZ-15 (`rz_15_geometryConstant_writings`, CHECKED; vol enters there as a hypothesis, "L:RZ-14 … not imported"). Once 14b lands, rz_15's hypothesis is discharged by it; no restatement here.
- The paper's reading after (2.9) — π "read off the area of the home surface", "object-intrinsic … exactly generic", "the least field-distinctive of the four provenances" — interpretive; not claimed.
- The open domain `fdo` and the boundary's nullity are proof steps, not stated.

## 7 · Status
SPEC-DRAFT 2026-10-28T20:30:47Z

V1: V1-GREEN + V1-SPLIT-OK 2026-10-28T20:46:10Z — read against served p08 (digest 2d5287e7…3e54 matches, 20:41Z) before the spec. As the ledger's a-leg, the statement says exactly the computed half of (2.8): the area of 𝒟 = ModularGroup.fd for mathlib's dx dy / y² (Measure.lean:45, "defined by dx dy / y ^ 2"), which is the paper's own measure dμ = y⁻² dx dy (7.2, p18), equals ENNReal.ofReal (π/3). It claims nothing about the quotient; a ∪ b covers (2.8). Guard recomputed: ∫_{−1/2}^{1/2} (1 − x²)^{−1/2} dx = 2 arcsin(1/2) = 1.0471975511965977… = π/3. Closed 𝒟 vs open 𝒟ᵒ makes no difference to the value, since the boundary is null.

V2: V2-GREEN 2026-10-28T21:03:32Z — rz_14a_area_fd says the computed half of (2.8) at p08 (folio 7): volume on ℍ (Measure.lean:45, withDensity (1/im)² of Lebesgue, the paper's dμ = y⁻² dx dy of (7.2)) of ModularGroup.fd (Modular.lean:367, normSq ≥ 1 ∧ |re| ≤ 1/2) = ENNReal.ofReal (π/3); no hypotheses, the value is not a default (≠ 0, ≠ ⊤). The quotient reading is 14b's; a ∪ b covers (2.8). Theorem text = spec §5 (normalized). Guard: 1-D and 2-D integrals = π/3 to 40 digits. Signed digest b2552d65.

L-proofs: PROVED 2026-10-28T21:35:28Z — `rz_14a_area_fd` in `RiemannZeta/Provenance/Solution.lean` (the spec's route: volume_eq_lintegral, ℂ ≅ ℝ², Tonelli, ∫ y⁻² over the ray, arcsin FTC); axioms [propext, Classical.choice, Quot.sound]; BUILD-LOG §Proofs phase.

V3: V3-CLEAN 2026-10-28T21:42:04Z — rz_14a_area_fd is true for the paper's reason. π/3 is the integral of y⁻² over 𝒟 (volume_eq_lintegral, ℂ ≅ ℝ², Tonelli, arcsin FTC) in the pin's withDensity (1/im)² measure, which is (7.2) dμ = y⁻² dx dy (rfl probe). No default, no rescaling. Axioms standard. Sheet `specs/_V3-U9.md`.
