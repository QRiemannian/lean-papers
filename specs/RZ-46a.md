# L:RZ-46a — the Λ-ratio (7.5) and its expansion; the ξ-ratio differs by (s − 1)/s

## 1 · Header
- row: L:RZ-46a
- unit: U3 (`RiemannZeta/ZetaL`)
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
- locus: §7.4, display (7.5) and the definition paragraph before it, PDF p19 (printed folio 18). Re-key change class: REWORDED (the dated bracket is now a plain paragraph; (7.5) and the (s − 1)/s statement unchanged).
- spec_clock: 2026-10-28T17:09:47Z

## 2 · Printed statement, verbatim
§7.4 (p19): "Write Λ(s) := π^{−s/2} Γ(s/2) ζ(s) for the completed zeta without the ½s(s − 1) factor; the entire function ξ(s) = ½s(s − 1) Λ(s) of (12.4) is used elsewhere in this paper, and the scattering determinant is a ratio of Λ's, not of ξ's (the ½s(s − 1) prefactors do not cancel between numerator and denominator here — they contribute a factor (2s − 2)(2s − 1)/[(2s)(2s − 1)] = (s − 1)/s): ⟦φ(s) = Λ(2s − 1)/Λ(2s) = π^{−s+1/2} Γ(s − 1/2) ζ(2s − 1) / (π^{−s} Γ(s) ζ(2s)). (7.5)⟧"

## 3 · Formal reading
- **Λ is `completedRiemannZeta`.** The paper's definition Λ(s) := π^{−s/2} Γ(s/2) ζ(s) is mathlib's object: `riemannZeta_def_of_ne_zero` gives ζ(s) = Λ(s)/Γ_ℝ(s) for s ≠ 0 with `Gammaℝ s = π ^ (-s / 2) * Gamma (s / 2)`, so Λ(s) = π^{−s/2} Γ(s/2) ζ(s) wherever Γ_ℝ(s) ≠ 0, i.e. s ∉ {0, −2, −4, …} (`Gammaℝ_eq_zero_iff`). At those points the paper's formula is a removable/pole expression and mathlib's junk values for Γ do not reproduce it; the convention conjunct (o) below is stated off that set. (This is the completed-zeta Λ(s), not the argument-less product Λ of (3.1) — the paper's own notation note, p19.)
- **ξ** is the paper's ξ(s) = ½ s(s − 1) Λ(s); mathlib has no ξ at the pin (`/usr/bin/grep` for `riemannXi`/`RiemannXi`: 0 hits), so the statement carries a local definition. Not a gap: one line.
- **φ(s)** (the paper's name; collides with the golden ratio φ — the Lean name must differ) is *defined* by the first "=" of (7.5): φ(s) := Λ(2s − 1)/Λ(2s). The identification of this ratio with the Eisenstein scattering determinant is L:RZ-46b (EFFORT-FAR, out of scope) and is not read here.
- **Claims:**
  (o) convention: Λ(s) = π^{−s/2} Γ(s/2) ζ(s) for s ∉ {0, −2, −4, …};
  (i) the expansion (7.5): Λ(2s − 1)/Λ(2s) = π^{−s+1/2} Γ(s − 1/2) ζ(2s − 1) / (π^{−s} Γ(s) ζ(2s));
  (ii) the factor arithmetic: (2s − 2)(2s − 1)/[(2s)(2s − 1)] = (s − 1)/s;
  (iii) the ξ-ratio differs by that factor: ξ(2s − 1)/ξ(2s) = ((s − 1)/s) · Λ(2s − 1)/Λ(2s).
- **Domains.** (7.5) is an identity of meromorphic functions. Pointwise, (i) is stated for s with 2s ∉ {0, −2, −4, …} and 2s − 1 ∉ {0, −2, −4, …}, i.e. s ∉ {0, −1, −2, …} and s ∉ {1/2, −1/2, −3/2, …} — exactly where Γ(s) or Γ(s − 1/2) has a pole. Off that discrete set the pointwise identity holds in Lean including where ζ(2s) = 0 (both sides then divide by 0), so it is equivalent to the meromorphic identity — no weaker than the print. (ii) and (iii) need s ≠ 0 and s ≠ 1/2 (the cancelled factors 2s and 2s − 1), and the theorem also carries s ≠ 1: there φ has its pole and the local ξ takes 0 at 2s − 1 = 1 where the paper's ξ(1) = 1/2, so the pointwise conjunct would hold only by the local definition's deviation (M-amend 2026-10-28, §7).
- Exponent bookkeeping (for L): −(2s − 1)/2 = −s + 1/2, (2s − 1)/2 = s − 1/2, −(2s)/2 = −s, (2s)/2 = s — ring identities in ℂ inside `Complex.cpow` and `Complex.Gamma`.

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`; `/usr/bin/grep -rn` under `.lake/packages/mathlib/Mathlib/`)
| declaration | kind | module (file:line) |
|---|---|---|
| `completedRiemannZeta` | def | Mathlib.NumberTheory.LSeries.RiemannZeta (RiemannZeta.lean:68) |
| `riemannZeta_def_of_ne_zero` | lemma | Mathlib.NumberTheory.LSeries.RiemannZeta (RiemannZeta.lean:154) — `riemannZeta s = completedRiemannZeta s / Gammaℝ s` for `s ≠ 0` |
| `Complex.Gammaℝ` | def | Mathlib.Analysis.SpecialFunctions.Gamma.Deligne (Deligne.lean:43) |
| `Complex.Gammaℝ_def` | lemma | Deligne.lean:45 — `Gammaℝ s = π ^ (-s / 2) * Gamma (s / 2)` |
| `Complex.Gammaℝ_eq_zero_iff` | lemma | Deligne.lean:73 — `Gammaℝ s = 0 ↔ ∃ n : ℕ, s = -(2 * n)` |
| `Complex.Gamma` | def | Mathlib.Analysis.SpecialFunctions.Gamma.Basic (Basic.lean:287) |
| `riemannZeta` | def | Mathlib.NumberTheory.LSeries.RiemannZeta (RiemannZeta.lean:121) |
| `riemannZeta_eq_completedRiemannZeta₀`, `completedRiemannZeta_eq` | lemma | RiemannZeta.lean (the ledger's cites; present, not needed for this route) |
No gap (ξ is a one-line local definition).

## 5 · Intended Lean statement
Prose: define φ(s) := Λ(2s − 1)/Λ(2s) and ξ(s) := s(s − 1)/2 · Λ(s) with Λ = `completedRiemannZeta`. Then (o) off the even non-positive integers Λ(s) = π^{−s/2}Γ(s/2)ζ(s); (i) for s not a non-positive integer and not a half-integer ≤ 1/2, φ(s) equals π^{−s+1/2}Γ(s − 1/2)ζ(2s − 1)/(π^{−s}Γ(s)ζ(2s)); (ii)–(iii) for s ≠ 0, 1/2, 1, the factor equals (s − 1)/s and ξ(2s − 1)/ξ(2s) = ((s − 1)/s)·φ(s).

```lean
/-- The paper's φ(s) := Λ(2s−1)/Λ(2s), Λ = `completedRiemannZeta` (RZ (7.5)). Named apart from the golden ratio. -/
noncomputable def scatteringRatio (s : ℂ) : ℂ :=
  completedRiemannZeta (2 * s - 1) / completedRiemannZeta (2 * s)

/-- The paper's ξ(s) = ½ s(s−1) Λ(s) (RZ §7.4, (12.4)); not at the pin. -/
noncomputable def riemannXiRZ (s : ℂ) : ℂ := s * (s - 1) / 2 * completedRiemannZeta s

/-- L:RZ-46a (o) — RZ §7.4 p19: the paper's Λ is `completedRiemannZeta`. -/
theorem rz_46a_o_lambda_convention (s : ℂ) (hs : ∀ n : ℕ, s ≠ -(2 * n)) :
    completedRiemannZeta s = (Real.pi : ℂ) ^ (-s / 2) * Complex.Gamma (s / 2) * riemannZeta s := by sorry

/-- L:RZ-46a (i) — RZ (7.5) p19: the expansion of the Λ-ratio. -/
theorem rz_46a_i_expansion (s : ℂ) (h₁ : ∀ n : ℕ, s ≠ -n) (h₂ : ∀ n : ℕ, s ≠ 1 / 2 - n) :
    scatteringRatio s =
      (Real.pi : ℂ) ^ (-s + 1 / 2) * Complex.Gamma (s - 1 / 2) * riemannZeta (2 * s - 1) /
        ((Real.pi : ℂ) ^ (-s) * Complex.Gamma s * riemannZeta (2 * s)) := by sorry

/-- L:RZ-46a (ii)–(iii) — RZ §7.4 p19: the ½s(s−1) prefactors contribute (s−1)/s. -/
theorem rz_46a_ii_iii_xi_factor (s : ℂ) (h₀ : s ≠ 0) (h₁ : s ≠ 1 / 2) (hs1 : s ≠ 1) :
    (2 * s - 2) * (2 * s - 1) / ((2 * s) * (2 * s - 1)) = (s - 1) / s ∧
    riemannXiRZ (2 * s - 1) / riemannXiRZ (2 * s) = (s - 1) / s * scatteringRatio s := by sorry
```

## 6 · What the row does not claim
- Not that φ(s) is the Eisenstein scattering determinant of SL(2, ℤ)\ℍ (L:RZ-46b, EFFORT-FAR; "(Iwaniec, §3.4; Sarnak 2003) [CV]/[E]").
- Not |φ| = 1 on Re(s) = 1/2 (L:RZ-N4, NEW, out of Q5), nor the location of poles (L:RZ-47), nor the numerals φ(ρ₁) = 0.537602 − 0.843199i etc. (L:RZ-48, COMP).
- Not that ξ is entire (stated in passing; not this row), nor anything about (12.4) beyond the definition used.
- Not "the unitarity reading", the Lax–Phillips remarks, or any Hilbert–Pólya content.

## 7 · Status
SPEC-DRAFT 2026-10-28T17:09:47Z

V1: V1-GREEN 2026-10-28T17:18:52Z — p19 definition paragraph and (7.5) read before the spec; quoted exactly. Conventions confirmed: Λ(s) := π^{−s/2}Γ(s/2)ζ(s) is `completedRiemannZeta` off s ∈ {0, −2, −4, …} (checked `riemannZeta_def_of_ne_zero`, `Gammaℝ_def`, `Gammaℝ_eq_zero_iff` at the pin); the exclusions for (i) (s ∉ −ℕ, s ∉ 1/2 − ℕ) are exactly the Γ(s)/Γ(s − 1/2) poles and suffice pointwise (s = 1 is junk-consistent via (o)); the direction ξ-ratio = ((s − 1)/s)·Λ-ratio is the only arithmetic reading of "they contribute a factor (2s − 2)(2s − 1)/[(2s)(2s − 1)] = (s − 1)/s". Non-blocking note for L: the local `riemannXiRZ` equals the paper's entire ξ only off {0, 1} (Lean gives 0 there, ξ(0) = ξ(1) = 1/2); harmless for (iii) as a meromorphic identity, but if a downstream row uses ξ's values, the entire form ξ(s) = s(s − 1)/2 · Λ₀(s) + 1/2 (from `completedRiemannZeta_eq`, RiemannZeta.lean:85) is the faithful definition. MS (4.5) p15, (5.1) p18 and §4.4 p16 state the same mathematics (re-key MS-41/MS-44 confirmed).

V2: V2-GREEN 2026-10-28T17:28:31Z (three theorems) — p19 definition paragraph and (7.5) read. (o) `completedRiemannZeta s = π^{−s/2} Γ(s/2) ζ(s)` off s ∈ {0, −2, −4, …} pins the paper's Λ to mathlib's object (checked `riemannZeta_def_of_ne_zero` + `Gammaℝ_eq_zero_iff` at the pin: true there, s = 1 included). (i) `scatteringRatio` = Λ(2s−1)/Λ(2s) and its expansion π^{−s+1/2}Γ(s−1/2)ζ(2s−1)/(π^{−s}Γ(s)ζ(2s)) — exclusions s ∉ −ℕ, s ∉ 1/2 − ℕ are exactly (o) at 2s and 2s−1. (ii)–(iii) the printed factor (2s−2)(2s−1)/[(2s)(2s−1)] = (s−1)/s and ξ(2s−1)/ξ(2s) = ((s−1)/s)·φ(s) with `riemannXiRZ` = s(s−1)/2·Λ(s), s ≠ 0, 1/2 — the paper's ξ off {0,1}; the only discrepancy point inside the domain is s = 1, where the paper's identity is meromorphic only and the Lean side is 0 = 0, so the statement on ℂ∖{0,1/2} is equivalent to the printed meromorphic identity. Numerics at s = 0.3 + 2.1i: (i) and (iii) residual 0.

M-amend: 2026-10-28T17:54:00Z — the formal statement of (ii)–(iii), `rz_46a_ii_iii_xi_factor`, gains the hypothesis `(hs1 : s ≠ 1)`; §3 Domains and §5 (prose and Lean block) carry it. Source: the V₃ pass `specs/_V3-U3.md` (V3-FINDING rz_46a_ii_iii_xi_factor). Reason: ξ is evaluated at 2s − 1 and 2s, so the local `riemannXiRZ`'s deviation points {0, 1} are reached at s ∈ {0, 1/2, 1}; s = 1 was not excluded, and there the conjunct held as 0 = 0 only because `riemannXiRZ 1 = 0`, where the paper's ξ(1) = 1/2 and the meromorphic identity's value is ξ(1)/ξ(2) = 3/π ≠ 0. The print's identity is meromorphic and s = 1 is φ's pole, so excluding it is the smallest honest form; the entire ξ was not adopted (it would change the definition four units share). Repair decided by the orchestrator under the 2026-09-03 lifted-bar ruling; the row returns through V₂.

V1: V1-GREEN (amended statement) 2026-10-28T17:54:00Z — fresh reader of this spec. Read the served PDF p19 (sha256 `2d5287e7…` MATCH): the definition paragraph and (7.5), including the parenthesis "they contribute a factor (2s − 2)(2s − 1)/[(2s)(2s − 1)] = (s − 1)/s". With s ∉ {0, 1/2, 1}, neither 2s − 1 nor 2s lies in {0, 1}, so `riemannXiRZ` equals the paper's entire ξ at both arguments and Λ = `completedRiemannZeta` is finite there; the conjunct is then the printed identity at every point where both sides are defined, and where Λ(2s) = 0 both sides divide by 0 together. The three excluded points are exactly where an argument of ξ or Λ meets {0, 1}, i.e. where the printed identity is meromorphic only (s = 1 is φ's pole; s = 0, 1/2 are the cancelled factors), and a meromorphic identity is fixed by its values off any discrete set — so the amended statement says no more and no less than the print. (ii) is untouched by the new hypothesis (it needs only s ≠ 0, 1/2). Numerics (mpmath, 30 digits, with the paper's entire ξ): at s = 0.3 + 2.1i both sides 1.00016040196 − 0.202441963224i; at s = 1 + 10⁻¹² both sides 0.954929658551 = ξ(1)/ξ(2) = 3/π, so the unamended Lean conjunct's 0 = 0 at s = 1 was a value the print does not give.

V2: V2-GREEN (amended statement, re-sign) 2026-10-28T17:57:38Z — fresh V₂ seat (not V₁'s, not L's, not the earlier V₂). Served PDF sha256 `2d5287e7…` match; p19 definition paragraph, the parenthesis and (7.5) read by pdftotext before this spec and the theorem. `rz_46a_ii_iii_xi_factor` with `(hs1 : s ≠ 1)`: (ii) is the printed factor arithmetic, a rational-function identity that the extra point s = 1 does not thin; (iii) on s ∉ {0, 1/2, 1} keeps 2s − 1 and 2s off {0, 1}, so `riemannXiRZ` is the paper's ξ at both arguments and Λ is finite there; where Λ(2s) = 0 both sides read x/0 = 0 together. The three excluded points are exactly where an argument of ξ or Λ meets {0, 1}, the print's identity is meromorphic, and a meromorphic identity is fixed by its values off a discrete set: no stronger, no weaker. Challenge.lean diff against the signed text (git 356e8a2, blob sha256 `0e7e6ca9…`) is the new hypothesis, the hypothesis-restating docstring lines and the `riemannXiRZ` note only. Independent mpmath check at s = 0.3 + 2.1i, −0.7 + 0.4i, 2.2 − 5i: both sides agree to 29–30 digits. Signed digest `7200988ea94a50a995e69adf8e7d44c480cd72423c24fd00da215bf1e9301a27`; record `specs/_V2-U3-resign.md`.
