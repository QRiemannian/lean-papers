# L:RZ-N4b — §7.4 after (7.5): |φ(s)| = 1 on the line Re(s) = 1/2 (φ the scattering determinant Λ(2s − 1)/Λ(2s))

## 1 · Header
- row: L:RZ-N4b — split leg of NEW row L:RZ-N4 (re-keyed ledger §"RZ — NEW rows"). Split stated in `_NEW-ROWS-2026-10-28.md` for V₁'s sign-off: **N4a** "The Riemann zeros are poles of φ(s) … lying off the line Re(s) = 1/2" — ALREADY CARRIED by `rz_47_zero_gives_pole` (U3, CHECKED) · **N4b** |φ| = 1 on Re(s) = 1/2 (this spec) · **N4c** "resonances of the cusp scattering problem … (there every incoming wave is reflected with unit modulus)" — CITED, NOT CHECKED (scattering theory; no Eisenstein-series / Lax–Phillips objects at the pin).
- unit: — (NEW row; suggested home: U3 `RiemannZeta/ZetaL`, beside L:RZ-47 and L:RZ-49, reusing `scatteringRatio`)
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
- locus: §7.4, the sentence after display (7.5) and the paragraph following it, served PDF p19 (printed folio 18)
- spec_clock: 2026-10-28T20:33:48Z

## 2 · Printed statement, verbatim
§7.4 (p19): "The Riemann zeros are poles of φ(s) [CV] — resonances of the cusp scattering problem, lying off the line Re(s) = 1/2 on which |φ| = 1 (there every incoming wave is reflected with unit modulus) [CV]."

Context on the same page (the convention): "φ(s) = Λ(2s − 1)/Λ(2s) = π^{−s+1/2} Γ(s − 1/2) ζ(2s − 1) / (π^{−s} Γ(s) ζ(2s)). (7.5)" with "Λ(s) := π^{−s/2} Γ(s/2) ζ(s) for the completed zeta without the s(s − 1) factor"; and "Since |(s − 1)/s| = 1 on Re(s) = 1/2, the unitarity reading is convention-independent" (that factor is L:RZ-49).

## 3 · Formal reading
- φ is U3's `scatteringRatio s := completedRiemannZeta (2s − 1) / completedRiemannZeta (2s)` (L:RZ-46a's convention: mathlib's `completedRiemannZeta` is the paper's Λ off the poles, `rz_46a_o_lambda_convention`). |·| is mathlib's norm on ℂ.
- **"on the line Re(s) = 1/2":** every s with Re s = 1/2, s ≠ 1/2. At s = 1/2 φ is a removable singularity (Λ has poles at 0 and 1; the limit is −1, modulus 1); mathlib's Λ carries junk values at 0 and 1, so the point is excluded rather than proved through junk (the house's "pointwise shadow" rule of L:RZ-33a).
- The mathematics: for s = 1/2 + it, t ≠ 0: Λ(2s − 1) = Λ(2it) = Λ(1 − 2it) (functional equation) = conj Λ(1 + 2it) (conjugate symmetry: Λ = Γ_ℝ·ζ off 0, with ζ(s̄) = conj ζ(s) and Γ_ℝ(s̄) = conj Γ_ℝ(s)), and Λ(1 + 2it) ≠ 0 (Γ_ℝ ≠ 0 on Re > 0; ζ ≠ 0 on Re = 1). Hence |φ(s)| = |conj Λ(2s)| / |Λ(2s)| = 1. No completed-zeta conjugation lemma exists at the pin; it is assembled from the four lemmas below (E1).

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
| declaration | kind | file:line | namespace |
|---|---|---|---|
| `completedRiemannZeta` | def | Mathlib/NumberTheory/LSeries/RiemannZeta.lean:68 | root |
| `completedRiemannZeta_one_sub` (Λ(1 − s) = Λ(s)) | theorem | RiemannZeta.lean:106 | root |
| `riemannZeta_def_of_ne_zero` (ζ s = Λ s / Γ_ℝ s, s ≠ 0) | lemma | RiemannZeta.lean:154 | root |
| `riemannZeta_conj` (ζ(conj s) = conj ζ(s)) | theorem | Mathlib/NumberTheory/Harmonic/ZetaAsymp.lean:458 | root (after `end ZetaAsymptotics` :411) |
| `riemannZeta_ne_zero_of_one_le_re` | lemma (`_root_.`) | Mathlib/NumberTheory/LSeries/Nonvanishing.lean:411 | root |
| `Complex.Gammaℝ` | def | Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:43 | `Complex` (opened :37) |
| `Complex.Gammaℝ_ne_zero_of_re_pos` | lemma | Deligne.lean:66 | `Complex` |
| `Complex.Gamma_conj` | theorem | Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:356 | `Complex` (opened :141) |
| `Complex.cpow_conj` | theorem | Mathlib/Analysis/SpecialFunctions/Pow/Complex.lean:243 | `Complex` (opened :20) |
| `Complex.norm_conj` | theorem | Mathlib/Analysis/Complex/Norm.lean:96 | `Complex` (opened :22) |
Local definition reused: `scatteringRatio` (U3, `RiemannZeta/ZetaL/Challenge.lean:34`). No gap.

## 5 · Intended Lean statement
Prose: for every s on the line Re s = 1/2 other than s = 1/2, the scattering determinant has modulus one.

```lean
/-- L:RZ-N4b — RZ §7.4, the sentence after (7.5), served p19 (sha256 2d5287e7…): "the line
Re(s) = 1/2 on which |φ| = 1", φ = `scatteringRatio` = Λ(2s − 1)/Λ(2s). The point s = 1/2 (a
removable singularity of φ; mathlib's Λ is junk at 0 and 1) is excluded. -/
theorem rz_N4b_scatteringRatio_norm_one (s : ℂ) (hs : s.re = 1 / 2) (h₀ : s ≠ 1 / 2) :
    ‖scatteringRatio s‖ = 1 := by
  sorry
```

Cost class: E1–E2 — the conjugation of Γ_ℝ (via `Complex.Gamma_conj` and `Complex.cpow_conj` at the positive real base π) is the only assembly; ≈ 1–2 pd, unmeasured.

## 6 · What the row does not claim
- Not that the Riemann zeros are poles of φ, nor where those poles lie (N4a — carried by `rz_47_zero_gives_pole`: the pole at ρ/2, Re(ρ/2) ∈ (0, 1/2), Re(ρ/2) = 1/4 under RH, Re(ρ/2) ≠ 1/2).
- Not that φ is the Eisenstein scattering determinant of SL(2, ℤ)\ℍ (L:RZ-46b, CITED), nor the resonance / unit-reflection reading (N4c, CITED).
- Not the value or limit at s = 1/2, and nothing off the line.
- Not the ξ-convention version (the factor (s − 1)/s is L:RZ-49; together they give it, but this row states Λ's).

## 7 · Status
SPEC-DRAFT 2026-10-28T20:33:48Z

V1: V1-GREEN 2026-10-28T20:50:09Z — p19 read first. `scatteringRatio` = Λ(2s − 1)/Λ(2s) is (7.5)'s Λ-convention (the page fixes it, "the scattering determinant is a ratio of Λ's, not of ξ's"). The exclusion of s = 1/2 is equivalent to the print under the L:RZ-33a rule, not weaker: φ continues through the removable point along the line (limit −1), so |φ| = 1 on the line minus 1/2 already fixes |φ(1/2)| = 1 for the continued φ. Recomputed (mpmath, 50 digits): |φ(1/2 + it)| = 1 at t = 0.3, 1, 7.0673…, 10, 25; φ(1/2 ± 10⁻⁸) = −1 + O(10⁻⁸); the page's own φ(ρ₁) = 0.537602 − 0.843199i has modulus 1. ALREADY-CARRIED N4a confirmed: `rz_47_zero_gives_pole` (ZetaL/Challenge.lean:189) carries the pole at ρ/2 (Tendsto to cobounded) and (ρ/2).re ≠ 1/2; STATUS reads it CHECKED (5c6a9cd). N4c CITED concurred. Split V1-SPLIT-OK.

V2: V2-GREEN 2026-10-28T22:52:53Z — `rz_N4b_scatteringRatio_norm_one` (RiemannZeta/Accepted/Challenge.lean:93–94) says what p19 prints (§7.4, "the line Re(s) = 1/2 on which |φ| = 1", φ = Λ(2s − 1)/Λ(2s) of (7.5), Λ = π^(−s/2)Γ(s/2)ζ(s)), no stronger, no weaker: `scatteringRatio` byte-identical to ZetaL/Challenge.lean:32–35 by diff; mathlib's `completedRiemannZeta` (RiemannZeta.lean:68) is the paper's Λ off 0 and 1. Junk check: on Re s = 1/2, s ≠ 1/2, neither 2s − 1 = 2it nor 2s = 1 + 2it is 0 or 1, so both Λ values are genuine; Λ(1 + 2it) ≠ 0 is a consequence (ζ ≠ 0 on Re = 1, Nonvanishing.lean:411; Γ_ℝ ≠ 0 on Re > 0, Deligne.lean:66; ζ = Λ/Γ_ℝ, RiemannZeta.lean:154), not a hypothesis, and a zero denominator would make ‖x/0‖ = 0 ≠ 1, so junk can only falsify, never trivialize. The s = 1/2 exclusion stands under the L:RZ-33a rule (continued φ → −1 along the line). Theorem text = §5 byte for byte (130 B). Guards: |φ(1/2 + it)| − 1 ≤ 1.4 × 10⁻⁵¹ at t = ±10⁻⁶, 0.3, ±1, 3.5336, ±7.0673…, 10, 25, 100 (mpmath, 50 d); φ(1/2 + 10⁻⁸ i) = −1 − 3.9 × 10⁻⁸ i; min |ζ(1 + 2it)| = 0.326 on t ∈ [0.01, 60]. Signed: statement_sha256 43e639cca6e866ecb9ab68b4d46ee56a811a5f2443f091f05a83386fe448385a, v2_signed 2026-10-28T22:52:27Z. Full note: `specs/_V2-U12.md`.

L-proofs: PROVED 2026-10-28T23:03:04Z — `rz_N4b_scatteringRatio_norm_one` in `RiemannZeta/Accepted/Solution.lean` (sha256 f383d9d5…): on the line 2s − 1 = 1 − conj(2s), so Λ(2s − 1) = Λ(conj 2s) = conj Λ(2s) (functional equation + an Aux conjugation lemma for Re w = 1 assembled from ζ = Λ/Γ_ℝ, `riemannZeta_conj`, `Complex.Gamma_conj`, `Complex.cpow_conj`); Λ(2s) ≠ 0 from ζ ≠ 0 on Re = 1 (the rz_47 step). h₀ is not needed by the proof (set aside, binding kept). Build exit 0, no warning; axioms [propext, Classical.choice, Quot.sound]. Log: `RiemannZeta/Accepted/BUILD-LOG.md` §Proofs phase.

V3: V3-CLEAN 2026-10-28T23:07:56Z — rz_N4b_scatteringRatio_norm_one is true for the paper's reason: on the line 2s − 1 = 1 − conj(2s), the functional equation and Λ(conj w) = conj Λ(w) give Λ(2s − 1) = conj Λ(2s), and Λ(2s) ≠ 0 from ζ ≠ 0 on Re = 1. h₀ is unused because the route also runs at s = 1/2 — but only through mathlib's junk Λ(0) = Λ(1) (probe: scatteringRatio (1/2) = 1 in mathlib; the genuine continued value is −1); the frozen statement excludes that point, and on its domain (2s = 1 + 2it, t ≠ 0) every step rests on genuine values. The exclusion is the formalization's convention (L:RZ-33a), not the paper's, and harmless by continuity. Axioms standard. Sheet `specs/_V3-U12.md`.
