# L:MS-N2a — §5.2 after (5.2a): the closed form of Hecke's period vanishes at every nontrivial zero ρ with Re ρ ≥ 1/2 — under RH, at all of them

## 1 · Header
- row: L:MS-N2a — split leg of NEW row L:MS-N2 (re-keyed ledger §"MS — NEW rows"). Split stated in `_NEW-ROWS-2026-10-28.md` for V₁'s sign-off: **N2a** the vanishing of the closed form (the right side of (5.2a)) — this spec · **N2b** the vanishing of the period ∫_C E(z, s) ds itself — inherits L:MS-N1 (Hecke's formula, CITED, NOT CHECKED), no spec.
- unit: — (NEW row; suggested home: U8 `ModularSurface/Now`)
- paper: MS — *The Invariant Structure of the Modular Surface* (2026, revised October 2026)
- pdf_sha256: `b4841489ec6bea619f8d5525ce4c788b86e0109e51d6e9d2cb252690f5b13af5`
- locus: §5.2, the sentence after display (5.2a), served PDF p19 (printed folio 18); echoes: abstract p02, §1 p03, §5.4 p21, Claim 6 table p26 ("which vanishes at every Riemann zero on the critical line")
- spec_clock: 2026-10-28T20:34:33Z

## 2 · Printed statement, verbatim
§5.2 (p18–p19): "By Hecke's period formula, the integral of the Eisenstein series E(z, s) = Σ_{Γ∞\Γ} Im(γz)^s of X(1) over one period C of the golden (systolic) geodesic, against hyperbolic arc length, is ⟦∫_C E(z, s) ds = 5^{s/2} Γ(s/2)² ζ(s) L(s, χ5) / (Γ(s) ζ(2s)) (5.2a)⟧ [CV] (Hecke 1917; Zagier 1981, §2, Example 2). The golden geodesic therefore registers the Riemann zeros on X(1), with no change of surface: its Eisenstein period vanishes at every nontrivial zero ρ with Re ρ ≥ 1/2 (Figure 1) — under RH, at all of them."

Echoes (same content, critical line only): abstract p02 "Hecke's period of the Eisenstein series along the golden geodesic, which vanishes at every Riemann zero on the critical line (§5.2)"; §1 p03 "that period vanishes at every Riemann zero on the critical line"; §5.4 p21 and the Claim 6 row p26 likewise.

## 3 · Formal reading
- **The closed form** F(s) := 5^{s/2} Γ(s/2)² ζ(s) L(s, χ5) / (Γ(s) ζ(2s)) — the right side of (5.2a), as a function of complex s. 5^{s/2} is `(5 : ℂ) ^ (s / 2)`; Γ is `Complex.Gamma`; ζ is `riemannZeta`; L(s, χ5) is `DirichletCharacter.LFunction chi5 s` with χ5 the quadratic character mod 5 (U2's `chi5 : DirichletCharacter ℂ 5`, restated identically — the Legendre symbol (·/5), which equals the Kronecker symbol (5/·) on every integer).
- **"vanishes at ρ"** for a meromorphic function is read as the limit: F(s) → 0 as s → ρ, s ≠ ρ (`Filter.Tendsto F (𝓝[≠] ρ) (𝓝 0)`). The pointwise value F(ρ) = 0 is NOT used: in Lean x·0/y = 0 for every y, so the pointwise form is empty and would hide exactly what the qualifier Re ρ ≥ 1/2 protects (ζ(2ρ) ≠ 0, so no cancellation from the denominator).
- **"nontrivial zero ρ"** in `RiemannHypothesis`'s vocabulary (as L:RZ-47): ζ(ρ) = 0, ρ not of the form −2(n + 1), ρ ≠ 1. With Re ρ ≥ 1/2 the last two are implied; they are kept for parity with `rz_47_zero_gives_pole`.
- **"— under RH, at all of them":** `RiemannHypothesis →` the same limit at every nontrivial zero.
- Why it is true, for L: at ρ ≠ 1/2, F is continuous at ρ (Γ(ρ/2) finite as Re ρ > 0; L entire as χ5 ≠ 1; Γ(ρ) finite and nonzero; ζ(2ρ) ≠ 0 since Re 2ρ ≥ 1 and 2ρ ≠ 1) and F(ρ) = 0 because ζ(ρ) = 0. At ρ = 1/2 (excluded by ζ(1/2) ≠ 0 in fact, but ζ(1/2) ≠ 0 is not at the pin) the pole of ζ(2s) at s = 1/2 gives F → 0 regardless — so the statement needs no ζ(1/2) ≠ 0 lemma. (Same limit as L:MS-N5a's t = 0 node.)

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
| declaration | kind | file:line | namespace |
|---|---|---|---|
| `riemannZeta` | def | Mathlib/NumberTheory/LSeries/RiemannZeta.lean:121 | root |
| `differentiableAt_riemannZeta` | theorem | RiemannZeta.lean:139 | root |
| `riemannZeta_residue_one` ((s − 1)ζ(s) → 1 at 1) | lemma | RiemannZeta.lean:242 | root |
| `RiemannHypothesis` | def | RiemannZeta.lean:185 | root |
| `riemannZeta_ne_zero_of_one_le_re` | lemma (`_root_.`) | Mathlib/NumberTheory/LSeries/Nonvanishing.lean:411 | root |
| `DirichletCharacter.LFunction` | def | Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:61 | `DirichletCharacter` (opened :49) |
| `DirichletCharacter.differentiable_LFunction` (χ ≠ 1) | lemma | DirichletContinuation.lean:98 | `DirichletCharacter` |
| `DirichletCharacter` | abbrev (= `MulChar (ZMod n) R`) | Mathlib/NumberTheory/DirichletCharacter/Basic.lean:40 | root |
| `quadraticChar` | def | Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:120 | root (sections only) |
| `MulChar.ringHomComp` | def | Mathlib/NumberTheory/MulChar/Basic.lean:453 | `MulChar` (opened :88) |
| `Complex.Gamma_ne_zero` | theorem | Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean:427 | `Complex` (opened :372) |
| `Complex.differentiableAt_Gamma` | theorem | Mathlib/Analysis/SpecialFunctions/Gamma/Deriv.lean:65 | `Complex` (opened :37) |
Local definitions: `chi5` (restated from `RiemannZeta/Bridge/Challenge.lean:188`), `heckePeriodClosedForm` (new, below). χ5 ≠ 1 is a proof obligation (χ5(2) = −1), not a hypothesis. No gap for the closed-form leg; the period itself (N2b) has no mathlib object (non-holomorphic Eisenstein series, geodesic periods: not at the pin).

## 5 · Intended Lean statement
Prose: at every nontrivial zero ρ of ζ with Re ρ ≥ 1/2, the closed form of (5.2a) tends to 0 as s → ρ; and under the Riemann Hypothesis it does so at every nontrivial zero.

```lean
/-- χ₅, restated identically to U2's `RiemannZeta.Bridge.chi5` (units do not import each other). -/
noncomputable def chi5 : DirichletCharacter ℂ 5 :=
  (quadraticChar (ZMod 5)).ringHomComp (Int.castRingHom ℂ)

/-- The right side of MS (5.2a): 5^{s/2} Γ(s/2)² ζ(s) L(s, χ₅) / (Γ(s) ζ(2s)). Shared by
L:MS-N2a and L:MS-N5a. -/
noncomputable def heckePeriodClosedForm (s : ℂ) : ℂ :=
  (5 : ℂ) ^ (s / 2) * Complex.Gamma (s / 2) ^ 2 * riemannZeta s *
      DirichletCharacter.LFunction chi5 s / (Complex.Gamma s * riemannZeta (2 * s))

/-- L:MS-N2a — MS §5.2, the sentence after (5.2a), served p19 (sha256 b4841489…): the closed
form of Hecke's period "vanishes at every nontrivial zero ρ with Re ρ ≥ 1/2 — under RH, at all
of them"; vanishing read as the limit 0 at ρ (the pointwise value is empty in Lean). -/
theorem ms_N2a_closedForm_vanishes :
    (∀ ρ : ℂ, riemannZeta ρ = 0 → (¬ ∃ n : ℕ, ρ = -2 * (n + 1)) → ρ ≠ 1 → 1 / 2 ≤ ρ.re →
        Filter.Tendsto heckePeriodClosedForm (nhdsWithin ρ {ρ}ᶜ) (nhds 0)) ∧
    (RiemannHypothesis →
      ∀ ρ : ℂ, riemannZeta ρ = 0 → (¬ ∃ n : ℕ, ρ = -2 * (n + 1)) → ρ ≠ 1 →
        Filter.Tendsto heckePeriodClosedForm (nhdsWithin ρ {ρ}ᶜ) (nhds 0)) := by
  sorry
```

Cost class: E2 — continuity of the quotient at ρ ≠ 1/2 from the differentiability lemmas and ζ ≠ 0 on Re ≥ 1; the ρ = 1/2 branch from `riemannZeta_residue_one` (‖ζ(2s)‖ → ∞) with a bounded numerator; χ5 ≠ 1 by evaluation at 2. ≈ 2–3 pd, unmeasured; shares its whole toolkit with L:MS-N5a (≈ 1–2 pd more there).

## 6 · What the row does not claim
- Not Hecke's formula (5.2a) itself, i.e. that the closed form IS the integral of E(z, s) over the golden geodesic (L:MS-N1, CITED), hence not the vanishing of the period as an integral (N2b inherits N1).
- Not the zeros with Re ρ < 1/2 (where ζ(2ρ) may vanish; the qualifier is printed and correct), nor RH.
- Not "the golden data constrains none of them" / "registers the Riemann zeros" (readings, [D]); not the factorization ζ_ℚ(√5) = ζ·L(·, χ5) ((5.2), MS-20's / RZ (9.4)'s class).
- Not the L(s, χ5)-zero nodes or the t = 0 node of Figure 1 (L:MS-N5a).

## 7 · Status
SPEC-DRAFT 2026-10-28T20:34:33Z

V1: V1-GREEN 2026-10-28T20:50:09Z — p18–p19 read first, and the echoes p02, p03, p21, p26. Weighed: the limit reading is the print's, not a repair. The printed subject is a function of s (the period, through its closed form), and "vanishes at ρ" for such a function means it has a zero there; at every ρ ≠ 1/2 with Re ρ ≥ 1/2 the closed form is holomorphic at ρ with nonzero denominator (ζ(2ρ) ≠ 0, Re 2ρ ≥ 1, 2ρ ≠ 1), so "→ 0 on the punctured neighbourhood" is exactly "continuous at ρ with value 0", the literal pointwise statement of the mathematics. The paper itself uses the limit sense in the same figure ("the pole of ζ(2s) at s = 1/2 sends the period to zero"). Lean's pointwise form would be empty (x·0/y = 0 for every y), so the limit is the faithful encoding. Recomputed: |F(1/2 ± 10⁻⁹)| ≈ 7.5 × 10⁻⁹ (the ρ = 1/2 branch rides the pole, no ζ(1/2) ≠ 0 lemma needed); F(2) = 5.3665631459995 (the re-key's arc-integral value); F is finite and nonzero at s = 0, −2, −4 (1.92484… = 4 log φ, 3.69306…, 4.78832…), so the Re ρ ≥ 1/2 qualifier is load-bearing and printed correctly. `chi5` byte-identical to Bridge/Challenge.lean:188; `RiemannHypothesis` vocabulary as `rz_47`. Split N2a / N2b V1-SPLIT-OK.

V2: V2-GREEN 2026-10-28T22:54:12Z — U13 statement freeze, fresh seat: p18–p19 read first. `ms_N2a_closedForm_vanishes` carries the printed zero set exactly: conjunct 1 every nontrivial zero (the pin's `RiemannHypothesis` vocabulary) with Re ρ ≥ 1/2, conjunct 2 all of them under RH. Vanishing is the limit 0 on 𝓝[≠] ρ, so no junk value enters: Γ(s/2) and Γ(s) are pole-free near ρ, ζ(2ρ) ≠ 0, and the junk ζ(1) at s = 1/2 is never evaluated. The closed form stands in for the period (N2b CITED via L:MS-N1). Byte-equal to §5. Guards: |F| ≈ 1e-40 at four ζ-zeros, |ζ(2ρ)| ≥ 0.53. Unit SIGNED, statement_sha256 d7307749…3af. Sheet `_V2-U13.md`.

L-proofs: PROVED 2026-10-28T23:01:37Z — `ms_N2a_closedForm_vanishes` in `ModularSurface/Accepted/Solution.lean`: closed form = N·Γ⁻¹·ζ(2s)⁻¹, N continuous at ρ with N(ρ) = 0, Γ⁻¹ entire, ζ(2s)⁻¹ → ζ(2ρ)⁻¹ (2ρ ≠ 1, Re 2ρ ≥ 1) or → 0 (2ρ = 1, via `riemannZeta_residue_one`; no ζ(1/2) ≠ 0 used); RH arm by Re ρ = 1/2. Build exit 0; axioms [propext, Classical.choice, Quot.sound]. Log: `ModularSurface/Accepted/BUILD-LOG.md` §Proofs phase.

V3: V3-CLEAN 2026-10-28T23:06:14Z: post-proof fidelity, fresh seat; p18 and p19 read first. Both conjuncts are true for the paper's reason. The closed form = N times 1/Gamma times 1/zeta(2s), with N(rho) = 0 because zeta(rho) = 0 is a factor; 1/Gamma is entire; 1/zeta(2s) tends to 1/zeta(2rho) (nonzero since Re 2rho >= 1, and the junk zeta(1) is never read). The limit is on the punctured neighbourhood, a NeBot filter, so no junk value carries it. The 2rho = 1 branch is unreachable (zeta(1/2) = -1.46035) and is proved honestly by riemannZeta_residue_one. The RH arm is mathlib's RiemannHypothesis feeding the same lemma. Axioms [propext, Classical.choice, Quot.sound]; 0 grep hits. Sheet `_V3-U13.md`.
