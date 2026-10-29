# L:MS-N5a — Figure 1 caption: every zero of ζ(s)L(s, χ5) on the critical line is a node of the period's closed form; the one further node is t = 0, where the pole of ζ(2s) sends it to zero

## 1 · Header
- row: L:MS-N5a — split leg of NEW row L:MS-N5 (re-keyed ledger §"MS — NEW rows"). Split stated in `_NEW-ROWS-2026-10-28.md` for V₁'s sign-off: **N5a** the node statements (this spec; the ledger's "the node statements ride MS-N2", made explicit) · **N5b** the closest pair t ≈ 32.935 (ζ), t ≈ 33.000 (L) — COMP, for seat C, no spec.
- unit: — (NEW row; suggested home: U8 `ModularSurface/Now`, sharing `chi5` and `heckePeriodClosedForm` with L:MS-N2a)
- paper: MS — *The Invariant Structure of the Modular Surface* (2026, revised October 2026)
- pdf_sha256: `b4841489ec6bea619f8d5525ce4c788b86e0109e51d6e9d2cb252690f5b13af5`
- locus: §5.2, Figure 1 and its caption, served PDF p19 (printed folio 18)
- spec_clock: 2026-10-28T20:35:25Z

## 2 · Printed statement, verbatim
Figure 1 caption (p19): "Hecke's period of the Eisenstein series along the golden geodesic, on the critical line. Plotted is the modulus of (5.2a), |∫_C E(z, s) ds| = |5^{s/2} Γ(s/2)² Γ(s)^{−1} ζ(s) L(s, χ5)/ζ(2s)|, at s = 1/2 + it for 0 ≤ t ≤ 40, on a logarithmic scale; … Filled circles mark the zeros of ζ(s), open triangles the zeros of L(s, χ5); the cross at t = 0 marks the one further node, where the pole of ζ(2s) at s = 1/2 sends the period to zero. The right panel resolves the closest pair, t ≈ 32.935 (ζ) and t ≈ 33.000 (L). Every zero of ζ_ℚ(√5)(s) = ζ(s)L(s, χ5) is a node; the vanishing is inherited from ζ(s) and L(s, χ5), and the golden data constrains none of them."

## 3 · Formal reading
- F = `heckePeriodClosedForm` (defined in `MS-N2a.md`), the plotted closed form. A **node** is a vanishing of F, read as in L:MS-N2a: F(s′) → 0 as s′ → s, s′ ≠ s (the pointwise value is empty in Lean).
- **"Every zero of ζ_ℚ(√5)(s) = ζ(s)L(s, χ5) is a node":** on the plotted line Re s = 1/2 (the figure's domain), ζ(s)·L(s, χ5) = 0 implies a node at s. The sentence is general in t; it is stated for the whole critical line. ζ_ℚ(√5) enters as the printed product ζ·L(·, χ5); the Dedekind factorization (5.2) is not stated (it is not at the pin as a theorem; `NumberField.dedekindZeta` exists as a definition, `Mathlib/NumberTheory/NumberField/DedekindZeta.lean:47`).
- **"the cross at t = 0 marks the one further node, where the pole of ζ(2s) at s = 1/2 sends the period to zero":** (i) F → 0 at s = 1/2; (ii) "the one further node" — in the plotted window, every node at 0 < t ≤ 40 is a zero of ζ·L. (ii) is stated on the printed window (0, 40]; the whole-line form is equally provable, and V₁ may prefer it.
- Why it is true, for L: on Re s = 1/2, s ≠ 1/2: Γ(s/2) ≠ 0 and finite, 5^{s/2} ≠ 0, Γ(s) finite and nonzero, and ζ(2s) finite and nonzero (Re 2s = 1, 2s ≠ 1); so F is continuous at s with F(s) = 0 ⇔ ζ(s)L(s, χ5) = 0. At s = 1/2 the numerator is bounded near 1/2 and ‖ζ(2s)‖ → ∞.

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
As `MS-N2a.md` §4 (the same toolkit), plus:
| declaration | kind | file:line | namespace |
|---|---|---|---|
| `Complex.Gamma_ne_zero_of_re_pos` | theorem | Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean:454 | `Complex` (opened :372) |
| `Complex.I` | def | (as used throughout U3/U5) | `Complex` |
No gap.

## 5 · Intended Lean statement
Prose: on the critical line every zero of ζ·L(·, χ5) is a node of F; F → 0 at s = 1/2; and every node at s = 1/2 + it with 0 < t ≤ 40 is a zero of ζ·L(·, χ5).

```lean
/-- L:MS-N5a — MS Figure 1 caption, served p19 (sha256 b4841489…): "Every zero of
ζ_ℚ(√5)(s) = ζ(s)L(s, χ5) is a node"; "the cross at t = 0 marks the one further node, where the
pole of ζ(2s) at s = 1/2 sends the period to zero". Nodes read as limits 0 of the closed form. -/
theorem ms_N5a_figure1_nodes :
    (∀ s : ℂ, s.re = 1 / 2 →
        riemannZeta s * DirichletCharacter.LFunction chi5 s = 0 →
        Filter.Tendsto heckePeriodClosedForm (nhdsWithin s {s}ᶜ) (nhds 0)) ∧
    Filter.Tendsto heckePeriodClosedForm (nhdsWithin (1 / 2 : ℂ) {(1 / 2 : ℂ)}ᶜ) (nhds 0) ∧
    (∀ t : ℝ, 0 < t → t ≤ 40 →
        Filter.Tendsto heckePeriodClosedForm
          (nhdsWithin (1 / 2 + (t : ℂ) * Complex.I) {1 / 2 + (t : ℂ) * Complex.I}ᶜ) (nhds 0) →
        riemannZeta (1 / 2 + (t : ℂ) * Complex.I) *
          DirichletCharacter.LFunction chi5 (1 / 2 + (t : ℂ) * Complex.I) = 0) := by
  sorry
```

Cost class: E2 on top of L:MS-N2a's toolkit; the converse (third conjunct) adds the nonvanishing of Γ(s/2), 5^{s/2}, 1/Γ(s), ζ(2s) on the line and the uniqueness of limits. ≈ 1–2 pd beyond MS-N2a, unmeasured.

## 6 · What the row does not claim
- Not Hecke's formula (L:MS-N1) — the nodes are of the closed form, not of the integral.
- Not the numerals t ≈ 32.935, t ≈ 33.000, nor that they are the closest ζ/L pair in the window (N5b, COMP).
- Not (5.2) ζ_ℚ(√5) = ζ·L(·, χ5); not "the golden data constrains none of them" (reading); not the plot's method note (mpmath, 30 digits, grid step 0.005; agreement with the direct integral at the points checked).
- Nothing off the critical line (L:MS-N2a carries the ζ-zeros with Re ρ ≥ 1/2).
- Not "further" in "the one further node": that t = 0 is not itself a zero of ζ·L(·, χ5), i.e. ζ(1/2)·L(1/2, χ5) ≠ 0 — neither ζ(1/2) ≠ 0 nor L(1/2, χ5) ≠ 0 is at the pin. The statement carries the node at t = 0 as the limit-zero of the closed form through the pole of ζ(2s) (conjunct (ii)) and "one" on the window (conjunct (iii)); the "one further" uniqueness is a declared gap.

## 7 · Status
SPEC-DRAFT 2026-10-28T20:35:25Z

V1: V1-DRIFT 2026-10-28T20:50:09Z — p19 caption read first. Weaker by one word: "the cross at t = 0 marks the one FURTHER node". Conjuncts (ii) and (iii) carry "node" and "one" (every other node in (0, 40] is a zero of ζ·L(·, χ5)), but not "further" — that t = 0 is not itself a zero of ζ·L(·, χ5), i.e. ζ(1/2)·L(1/2, χ5) ≠ 0 (true: ζ(1/2) = −1.4603545…, L(1/2, χ5) = 0.2317509…). Back to M, either fix closes it: (a) declare it in §6 as not claimed (neither nonvanishing is at the pin) — recommended, zero cost, then GREEN; or (b) add the conjunct, ≈ 2–4 pd unmeasured. Confirmed: nodes as limits (as MS-N2a); conjunct (iii) on the printed window (0, 40] is the print's — keep it; the whole-line form would be stronger than the caption. Scope note, not a CC (concurring with M): "Every zero of ζ_ℚ(√5)(s) … is a node" is true on the plotted line and false read globally — at s = 0, −2, −4, … the closed form is finite and nonzero (1.92484…, 3.69306…, 4.78832…); optional precision note for the correction track, uncounted. Keep MS-N5a and MS-N2a as separate rows (different printed sentences). Split N5a / N5b V1-SPLIT-OK.

M-amend: 2026-10-28T20:53:08Z — §6 gains the "further" declaration (ζ(1/2) ≠ 0 and L(1/2, χ5) ≠ 0 not at the pin; the t = 0 node carried as the limit-zero through the pole of ζ(2s); the "one further" uniqueness a declared gap), V₁'s fix (a) per `_V1-NEW-ROWS.md` §Drifts; no conjunct added; the Lean statement is unchanged.

V2: V2-GREEN 2026-10-28T22:54:12Z (with the declared gap) — U13 statement freeze, fresh seat: the p19 caption read first. A node is the limit 0 of the plotted closed form. The three conjuncts carry the printed content. (i) Every ζ·L(·, χ5) zero on the critical line is a node; "node" is a feature of the plotted line, so this is the scope. (ii) The t = 0 node is the limit at 1/2 on 𝓝[≠] (1/2), the only honest encoding: the pointwise Lean value uses the junk ζ(1) = (γ − log 4π)/2 and is ≈ 3.842, not 0. (iii) "One" holds on the printed window (0, 40]. The only printed content not carried is "further" (ζ(1/2)·L(1/2, χ5) ≠ 0), exactly as §6 declares and `statements_not_checked` records. Byte-equal to §5. Guards: |F(1/2 + ε)| ≈ 7.507ε. Unit SIGNED, statement_sha256 d7307749…3af. Sheet `_V2-U13.md`.
