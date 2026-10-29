# L:RZ-61a — the systolic spectral weight at N = φ⁴: log N/(N^{1/2} − N^{−1/2}) = log(φ⁴)/(φ² − φ⁻²) = 4 log φ/√5 ≈ 0.8608

## 1 · Header
- row: L:RZ-61a (split of L:RZ-61; see §6 and the unit summary: **a** = the real-number chain of (9.7) and its numeral, NOW; **b** = "the 2 being log ε₊/log ε", NOW; **c** = "= 2 · L(1, χ5)", gated on L:RZ-58)
- unit: U2 (`RiemannZeta/Bridge`)
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: 2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54
- locus: §9.5 ("The Fibonacci geodesic spectral weight, the 𝐿-value, and the factor of two"), display (9.7) and the sentence introducing it; PDF page p24 (printed folio 23). Re-key: v0.1 tag (9.9) → served tag (9.7); change class REWORDED (display unchanged; the justification sentence after it now names φ² − φ⁻² = φ + 1/φ — that sentence is L:RZ-60's row).
- spec_clock: 2026-10-28T17:11:40Z

## 2 · Printed statement, verbatim (served edition, `pdftotext -layout`, p24)
> The systolic element is 𝐹 2 = [[2, 1], [1, 1]] with multiplier 𝜆 = 𝜑2 and norm 𝑁 = 𝜆2 = 𝜑4 . Its Selberg spectral weight is
>
> log 𝑁 / (𝑁 1/2 − 𝑁 −1/2) = log(𝜑4 ) / (𝜑2 − 𝜑−2) = 4 log 𝜑 / √5 = 2 ⋅ 𝐿(1, 𝜒5 ) ≈ 0.8608,  (9.7)

(Display linearised: stacked fractions as a/b. `pdftotext` writes superscripts inline: "𝑁 1/2" = N^{1/2}, "𝑁 −1/2" = N^{−1/2}, "𝜑4" = φ⁴, "𝜑−2" = φ⁻².)

This sub-row is the chain up to "4 log 𝜑/√5" with the numeral "≈ 0.8608", plus the printed definitions "𝜆 = 𝜑2" and "𝑁 = 𝜆2 = 𝜑4". The link "= 2 ⋅ 𝐿(1, 𝜒5)" is L:RZ-61c.

## 3 · Formal reading
- **φ.** `Real.goldenRatio` = (1 + √5)/2. **√5.** `Real.sqrt 5` (`√5` notation, as used in GoldenRatio.lean).
- **λ, N.** Real numbers λ := φ², N := λ² = φ⁴, as printed. The conjunct (φ²)² = φ⁴ records "𝑁 = 𝜆2 = 𝜑4"; the words "multiplier" and "norm" (Selberg norm of the element, cf. the §2.2 note "the Selberg norm of the element 𝐹 2 is 𝜑4") are names, not formal content.
- **N^{1/2}, N^{−1/2} (convention named).** Real powers `N ^ ((1 : ℝ) / 2)` and `N ^ (-(1 : ℝ) / 2)` (`Real.rpow`), N > 0. They equal φ² and φ⁻² (`Real.rpow_natCast`, `Real.rpow_mul`, `Real.rpow_neg`; or `Real.sqrt_eq_rpow` and `Real.sqrt_sq`).
- **φ⁻².** Read literally as the integer power `goldenRatio ^ (-2 : ℤ)` (= `(goldenRatio ^ 2)⁻¹` by `zpow_neg`, `zpow_natCast`).
- **log.** `Real.log` (natural log; the numeral fixes the base).
- **The chain (three equalities).** E₁ = log N/(N^{1/2} − N^{−1/2}); E₂ = log(φ⁴)/(φ² − φ⁻²); E₃ = 4 log φ/√5. E₁ = E₂ is substitution plus the rpow evaluation; E₂ = E₃ uses log(φ⁴) = 4 log φ (`Real.log_pow`) and φ² − φ⁻² = √5 (the identity printed in the next sentence, which is L:RZ-60's row; here it is a proof step, not a stated claim).
- **"≈ 0.8608" (precision named).** Four printed decimals → correct rounding: 0.86075 ≤ 4 log φ/√5 < 0.86085, explicit rationals 86075/100000, 86085/100000. Value (40-digit Python `decimal`, a check on the reading, not a proof): 4 log φ/√5 = 0.86081788192800807…; margins 6.79 × 10⁻⁵ below, 3.21 × 10⁻⁵ above. In the print the numeral sits after "= 2 ⋅ 𝐿(1, 𝜒5)", i.e. it is the value of the whole chain; since the chain is a chain of equalities the numeral is attached here to E₃, the last member this sub-row reaches.
- **No hypotheses; no domain.**

## 4 · Target mathlib declarations (pin db584cd6d46c92f209a44c0f1c829460d327499d; each found by `/usr/bin/grep -rn` under `.lake/packages/mathlib/Mathlib/`)
| declaration | kind | module (file:line) |
|---|---|---|
| `Real.goldenRatio` | abbrev (:37) | Mathlib.NumberTheory.Real.GoldenRatio |
| `Real.goldenRatio_sub_goldenConj` | theorem (:77) — `φ - ψ = √5` | Mathlib.NumberTheory.Real.GoldenRatio |
| `Real.goldenRatio_add_goldenConj` | theorem (:66) — `φ + ψ = 1` | Mathlib.NumberTheory.Real.GoldenRatio |
| `Real.inv_goldenRatio` | theorem (:48) — `φ⁻¹ = -ψ` | Mathlib.NumberTheory.Real.GoldenRatio |
| `Real.goldenRatio_sq`, `Real.goldenRatio_pos`, `Real.goldenRatio_ne_zero` | theorems (:83, :90, :93) | Mathlib.NumberTheory.Real.GoldenRatio |
| `Real.log_pow` | theorem (:288) | Mathlib.Analysis.SpecialFunctions.Log.Basic |
| `Real.rpow_natCast` | theorem (:62) | Mathlib.Analysis.SpecialFunctions.Pow.Real |
| `Real.rpow_mul` | theorem (:414) — needs `0 ≤ x` | Mathlib.Analysis.SpecialFunctions.Pow.Real |
| `Real.rpow_neg` | theorem (:259) — needs `0 ≤ x` | Mathlib.Analysis.SpecialFunctions.Pow.Real |
| `Real.sqrt_eq_rpow` | theorem (:984) | Mathlib.Analysis.SpecialFunctions.Pow.Real |
| `Real.sqrt_sq` | theorem (:181) | Mathlib.Analysis.Real.Sqrt |
| `zpow_neg` | lemma (:422) | Mathlib.Algebra.Group.Basic |
| `zpow_natCast` | theorem (:1079) | Mathlib.Algebra.Group.Defs |
| `Real.exp_bound`, `Real.exp_bound'`; `Real.sqrt_lt'`, `Real.lt_sqrt` | theorems (Exponential.lean:517/:523; Sqrt.lean:235/:395) — for the numeral | Mathlib.Analysis.Complex.Exponential; Mathlib.Analysis.Real.Sqrt |

The ledger cites `Real.goldenRatio_sub_goldenConj` and `Real.inv_goldenRatio` for this row; both exist. No name is missing. The numeral shares its log φ bounds with L:RZ-06a (a 7-digit enclosure of log φ serves both: 4 log φ/√5 needs ≈ 3 × 10⁻⁵ absolute, looser than RZ-06a's upper margin).

## 5 · Intended Lean statement
**Prose.** With φ = (1 + √5)/2, λ = φ² and N = λ² = φ⁴: log N/(N^{1/2} − N^{−1/2}) = log(φ⁴)/(φ² − φ⁻²) = 4 log φ/√5, and this value lies in [0.86075, 0.86085), i.e. is 0.8608 to four decimals.

**Proposed signature.**
```lean
open Real in
theorem rz_61a_weight_chain :
    (goldenRatio ^ 2) ^ 2 = goldenRatio ^ 4 ∧
    (let N : ℝ := goldenRatio ^ 4
     Real.log N / (N ^ ((1 : ℝ) / 2) - N ^ (-(1 : ℝ) / 2))
        = Real.log (goldenRatio ^ 4) / (goldenRatio ^ 2 - goldenRatio ^ (-2 : ℤ))) ∧
    Real.log (goldenRatio ^ 4) / (goldenRatio ^ 2 - goldenRatio ^ (-2 : ℤ))
        = 4 * Real.log goldenRatio / √5 := by
  sorry

open Real in
theorem rz_61a_weight_approx :
    (86075 : ℝ) / 100000 ≤ 4 * Real.log goldenRatio / √5 ∧
    4 * Real.log goldenRatio / √5 < (86085 : ℝ) / 100000 := by
  sorry
```

## 6 · What the row does not claim
- **"= 2 ⋅ 𝐿(1, 𝜒5)"** — the identification with the Dirichlet L-value is L:RZ-61c, gated on L:RZ-58 (the closed form L(1, χ5) = 2 log φ/√5, EFFORT, standalone finite-formula route). Not claimed here.
- **"Selberg spectral weight"** — that this expression is the weight of the systolic class in the Selberg trace formula is a name inherited from the trace formula (L:RZ-52, EFFORT-FAR). Here the expression is a real number defined by its formula; nothing about the trace formula is stated.
- **"The systolic element is 𝐹 2"** and "multiplier" / "norm" as properties of a group element — F² as an element is L:RZ-02, its eigenvalue φ² is L:RZ-04, its systolic minimality L:RZ-03 / L:RZ-06b. The row uses λ, N only as the numbers φ², φ⁴.
- The justification sentence after (9.7) — φ² − φ⁻² = φ + 1/φ = √5, "the difference φ − 1/φ is 1, not √5", and the norm-vs-multiplier caution — is L:RZ-60's row (its own spec, outside this unit's list). It is used here only as a proof step.
- "the 2 being log ε₊/log ε" and the regulator chain — L:RZ-61b.
- The [CV] layer of §9.5 and the paper's reading of the two √5 slots (the "(i)→(ii) gap", graded [I]) — not claimed.

## 7 · Status
SPEC-DRAFT 2026-10-28T17:11:40Z

V1: V1-GREEN 2026-10-28T17:18:56Z · V1-SPLIT-OK — faithful to (9.7) p24 and its introducing sentence: λ = φ², N = λ² = φ⁴ as printed; the chain log N/(N^{1/2} − N^{−1/2}) = log(φ⁴)/(φ² − φ⁻²) = 4 log φ/√5 as three real equalities. Conventions confirmed: N^{±1/2} as `Real.rpow` on N > 0 (the print's exponent notation on a positive real; equal to φ^{±2}); φ⁻² as `zpow` (literal); natural log. Numeral: the printed "≈ 0.8608" closes the whole equality chain, so attaching it to E₃ is faithful; rounding reading [0.86075, 0.86085) consistent with the paper's practice (see RZ-06a's V1 line; value 0.860817881928…, recomputed). The identity φ² − φ⁻² = √5 used only as a proof step (L:RZ-60) — correct; "Selberg spectral weight", "systolic", "multiplier/norm" as element properties correctly not claimed. Nothing stronger or weaker than the (9.7) leg up to "4 log φ/√5"; the printed link "= 2 ⋅ L(1, χ5)" is carried by RZ-61c, so the union a ∪ c covers every printed equality of (9.7).

V2: V2-GREEN 2026-10-28T17:27:17Z (leg) — (9.7) p24 up to "4 log φ/√5": with the `let N := φ⁴` substituted, log(φ⁴)/((φ⁴)^{1/2} − (φ⁴)^{−1/2}) = log(φ⁴)/(φ² − φ^(−2:ℤ)) = 4 log φ/√5 (rpow on N > 0; `-(1:ℝ)/2` = −1/2), plus (φ²)² = φ⁴ for "N = λ² = φ⁴"; "≈ 0.8608" as [0.86075, 0.86085) on E₃ — legitimate since the printed chain is all equalities (value 0.8608178819280…, recomputed). The last link "= 2·L(1, χ5)" is L:RZ-61c.
