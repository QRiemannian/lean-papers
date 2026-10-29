# L:RZ-33a — the functional equation (5.2): ζ(s) = χ(s) ζ(1 − s)

**Split of L:RZ-33 (for V₁'s sign-off):** L:RZ-33a (this file) is the displayed functional equation (5.2), read with the standard factor χ; L:RZ-33b is the clause "has reflection symmetry s ↔ 1 − s with fixed locus Re(s) = 1/2", which is stopped as a `CC-CANDIDATE` (see `RZ-33b.md`).

## 1 · Header
- row: L:RZ-33a (sub-row of L:RZ-33)
- unit: U3 (`RiemannZeta/ZetaL`)
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
- locus: §5.4, display (5.2), PDF p14 (printed folio 13). Re-key: (5.3) → (5.2), UNCHANGED.
- spec_clock: 2026-10-28T17:08:33Z

## 2 · Printed statement, verbatim
§5.4 (p14): "The functional equation ⟦ζ(s) = χ(s) ζ(1 − s) (5.2)⟧ has reflection symmetry s ↔ 1 − s with fixed locus Re(s) = 1/2 [CV], read here as exchanging the inward and outward channels [I]."

## 3 · Formal reading
- **χ(s) is not defined anywhere in the served text** (`pdftotext -layout` of the whole served PDF: the string χ(s) occurs exactly once, in (5.2) itself; the paper defines Λ(s) and ξ(s) at §7.4 but never χ). The display is introduced as "The functional equation", which in the standard literature is the asymmetric form ζ(s) = χ(s) ζ(1 − s) with the standard factor
  **χ(s) = 2^s π^{s−1} sin(πs/2) Γ(1 − s).**
  The spec reads the display with that χ. Read with χ unconstrained, the display would be vacuous (χ(s) := ζ(s)/ζ(1 − s) satisfies it wherever ζ(1 − s) ≠ 0); the words "The functional equation" are what make it definite. This reading is a convention supplied by the spec and is recorded in §6; V₁ decides whether the naming suffices or whether the undefined χ goes to the correction track.
- ζ is `riemannZeta`; π = `Real.pi` cast to ℂ; Γ = `Complex.Gamma`; sin = `Complex.sin`; powers are `Complex.cpow`.
- **Domain.** The identity is one of meromorphic functions on ℂ. Pointwise, mathlib's values at poles are junk values, so the Lean statement excludes the discrete set where one side is a pole or a removable point: s ∈ {0, 1, 2, 3, …} (s = 1: pole of ζ(s); s = 2, 3, …: poles of Γ(1 − s), cancelled by sin at even s and by the trivial zeros of ζ(1 − s) at odd s; s = 0: pole of ζ(1 − s) cancelled by the zero of sin). Off ℕ the identity holds pointwise, and equality on ℂ ∖ ℕ is equivalent to the meromorphic identity — no weaker than the print.
- Bridge (for L, not a claim): mathlib states the equation in the other direction, `riemannZeta_one_sub (hs : ∀ n : ℕ, s ≠ -n) (hs' : s ≠ 1) : riemannZeta (1 - s) = 2 * (2 * π) ^ (-s) * Gamma s * cos (π * s / 2) * riemannZeta s`. Applied at 1 − s (hypotheses become s ≠ n + 1 and s ≠ 0, i.e. s ∉ ℕ) it gives ζ(s) = 2 (2π)^{s−1} Γ(1 − s) cos(π(1 − s)/2) ζ(1 − s), and 2(2π)^{s−1} cos(π/2 − πs/2) = 2^s π^{s−1} sin(πs/2) by `Complex.mul_cpow_ofReal_nonneg` and `Complex.cos_pi_div_two_sub`.

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`; `/usr/bin/grep -rn` under `.lake/packages/mathlib/Mathlib/`)
| declaration | kind | module (file:line) |
|---|---|---|
| `riemannZeta` | def | Mathlib.NumberTheory.LSeries.RiemannZeta (RiemannZeta.lean:121) |
| `riemannZeta_one_sub` | theorem | Mathlib.NumberTheory.LSeries.RiemannZeta (RiemannZeta.lean:178) |
| `completedRiemannZeta_one_sub` | theorem | Mathlib.NumberTheory.LSeries.RiemannZeta (RiemannZeta.lean:106) — the symmetric form Λ(1 − s) = Λ(s); alternative route, not the target |
| `Complex.Gamma` | def | Mathlib.Analysis.SpecialFunctions.Gamma.Basic (Basic.lean:287) |
| `Complex.sin` | def | Mathlib.Analysis.Complex.Trigonometric (Trigonometric.lean:30) |
| `Complex.cos_pi_div_two_sub` | theorem | Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic (Basic.lean:1159) |
| `Complex.mul_cpow_ofReal_nonneg` | theorem | Mathlib.Analysis.SpecialFunctions.Pow.Complex (Complex.lean:186) |
No gap.

## 5 · Intended Lean statement
Prose: with χ(s) := 2^s π^{s−1} sin(πs/2) Γ(1 − s), for every complex s that is not a natural number, ζ(s) = χ(s) ζ(1 − s).

```lean
/-- The standard factor of the asymmetric functional equation, χ(s) = 2^s π^(s−1) sin(πs/2) Γ(1−s).
    Supplied by the spec: the served text does not define χ (L:RZ-33a §3). -/
noncomputable def zetaChi (s : ℂ) : ℂ :=
  2 ^ s * (Real.pi : ℂ) ^ (s - 1) * Complex.sin (Real.pi * s / 2) * Complex.Gamma (1 - s)

/-- L:RZ-33a — RZ (5.2) p14: "The functional equation ζ(s) = χ(s) ζ(1 − s)". -/
theorem rz_33a_functional_equation (s : ℂ) (hs : ∀ n : ℕ, s ≠ n) :
    riemannZeta s = zetaChi s * riemannZeta (1 - s) := by sorry
```

## 6 · What the row does not claim
- **χ is the spec's convention, not the paper's text**: the served edition prints χ(s) without defining it; the row claims the equation only for the standard χ named in §3.
- Not the clause "with fixed locus Re(s) = 1/2" (L:RZ-33b, CC-CANDIDATE).
- Not "exchanging the inward and outward channels" ([I]), nor anything about RH or the location of zeros (§5.4's own words: "forces nothing about RH").
- Not the scattering-determinant remarks of §5.4 (L:RZ-46a/46b/47).

## 7 · Status
SPEC-DRAFT 2026-10-28T17:08:33Z

V1: V1-SPLIT-OK + V1-GREEN 2026-10-28T17:18:31Z — (5.2) p14 read; the string χ(s) occurs once in the served text (confirmed). RULING on χ: definite enough, NOT to the correction track. (1) "ζ(s) = χ(s) ζ(1 − s)" introduced as "The functional equation … [CV]" is the classical asymmetric functional equation in its classical notation; (2) more decisively, as an identity of meromorphic functions χ is forced — χ = ζ(s)/ζ(1 − s) (ζ(1 − s) ≢ 0) — so no rival convention can exist: every correct closed form (2^s π^{s−1} sin(πs/2) Γ(1 − s), or π^{s−1/2} Γ((1 − s)/2)/Γ(s/2)) is the same function, and the printed display read as "the functional equation" asserts precisely that this ratio is the standard elementary Γ-factor. The spec's χ is that factor (checked). Domain s ∉ ℕ confirmed necessary and sufficient pointwise at the pin (mathlib Γ(−n) = 0 makes the RHS 0 at s = 1, 2, …; χ(0) = 0 against ζ(0) = −1/2) and equivalent to the meromorphic identity. Wording note only: the served text should print χ's definition at its next edit (non-blocking, not counted).

V2: V2-GREEN 2026-10-28T17:28:31Z — p14 (5.2) "The functional equation ζ(s) = χ(s) ζ(1 − s)" read; χ undefined in print, `zetaChi` = 2^s π^{s−1} sin(πs/2) Γ(1 − s) is the classical χ (and forced: χ = ζ(s)/ζ(1−s) meromorphically, V1's ruling stands); domain s ∉ ℕ is exactly the junk set (s = 0: χ(0) = 0 vs ζ(0) = −1/2; s = 1, 2, …: ζ pole / Γ(1−s) poles), so the pointwise statement is equivalent to the meromorphic identity. Numerical check at s = 0.3 + 2.1i: residual 1e−31. The "fixed locus Re(s) = 1/2" clause (L:RZ-33b) is correctly absent.
