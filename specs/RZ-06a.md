# L:RZ-06a — 2 log(φ²) = 4 log φ ≈ 1.9248 (the numerical leg of (2.3))

## 1 · Header
- row: L:RZ-06a (the ledger's own split of RZ-06: "a" is the computation; "b", the systole identification, is L:RZ-06b, EFFORT, not this unit's NOW leg)
- unit: U2 (`RiemannZeta/Bridge`)
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: 2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54
- locus: §2.2, display (2.3); PDF page p07 (printed folio 6). Re-key change class: UNCHANGED.
- spec_clock: 2026-10-28T17:09:40Z

## 2 · Printed statement, verbatim (served edition, `pdftotext -layout`, p07)
> The translation length of a hyperbolic element with eigenvalue 𝜆 is
>
> ℓ = 2 log 𝜆,  (2.2)
>
> and with 𝜆 = 𝜑2 this gives the systole
>
> systole(𝑋(1)) = 2 log(𝜑2 ) = 4 log 𝜑 ≈ 1.9248  [CV].  (2.3)

("𝜑2" is φ² in `pdftotext`'s inline rendering. The row is the part of (2.3) after "systole(𝑋(1)) =": the chain 2 log(φ²) = 4 log φ ≈ 1.9248.)

## 3 · Formal reading
- **φ.** `Real.goldenRatio` = (1 + √5)/2 (printed at (2.1), p07).
- **log.** `Real.log`, the natural logarithm (the paper's "log" throughout; the systole value 1.9248 is the natural-log value, which fixes the base).
- **The equality.** 2·log(φ²) = 4·log φ, from `Real.log_pow` (`log (x ^ n) = n * log x`, no positivity hypothesis needed at the pin).
- **"≈ 1.9248" (precision named).** The paper prints four decimal places, so the reading is "4 log φ rounds to 1.9248 at four decimals": 1.92475 ≤ 4 log φ < 1.92485, stated with explicit rationals 192475/100000 and 192485/100000. The value (computed here at 40-digit precision with Python `decimal`, as a check on the reading, not a proof) is 4 log φ = 1.9248473002384137899…, so the printed rounding is correct. **Margins:** 9.73 × 10⁻⁵ to the lower bound, **2.70 × 10⁻⁶ to the upper bound** — the upper bound needs log φ to within ≈ 6.7 × 10⁻⁷, i.e. about seven correct digits of log φ.
- A weaker reading (|4 log φ − 1.9248| ≤ 10⁻⁴, "agrees to the printed digits") is noted for V₁ and not adopted: four printed decimals of a [CV] value read most faithfully as correct rounding.
- **No hypotheses; no domain.**

## 4 · Target mathlib declarations (pin db584cd6d46c92f209a44c0f1c829460d327499d; each found by `/usr/bin/grep -rn` under `.lake/packages/mathlib/Mathlib/`)
| declaration | kind | module (file:line) |
|---|---|---|
| `Real.goldenRatio` | abbrev (:37) | Mathlib.NumberTheory.Real.GoldenRatio |
| `Real.log` | def (:44) | Mathlib.Analysis.SpecialFunctions.Log.Basic |
| `Real.log_pow` | theorem (:288) — `log (x ^ n) = n * log x` | Mathlib.Analysis.SpecialFunctions.Log.Basic |
| `Real.log_lt_log`, `Real.log_le_log` | theorem (:155) / lemma (:151) | Mathlib.Analysis.SpecialFunctions.Log.Basic |
| `Real.exp_log`, `Real.log_exp` | theorems (:59, :75) | Mathlib.Analysis.SpecialFunctions.Log.Basic |
| `Real.exp_bound`, `Real.exp_bound'` | theorems (:517, :523) — Taylor remainder bounds for `Real.exp` | Mathlib.Analysis.Complex.Exponential |
| `Real.add_one_le_exp` | theorem (:633) | Mathlib.Analysis.Complex.Exponential |
| `Real.exp_one_gt_d9`, `Real.exp_one_lt_d9` | theorems (:35, :38) (precedent for decimal bounds by this route) | Mathlib.Analysis.Complex.ExponentialBounds |
| `Real.one_lt_goldenRatio`, `Real.goldenRatio_pos` | theorems (:96, :90) | Mathlib.NumberTheory.Real.GoldenRatio |
| `Real.sqrt_lt'`, `Real.lt_sqrt` | theorems (:235, :395) — rational bounds on √5 | Mathlib.Analysis.Real.Sqrt |

No name is missing. **No log-of-φ bound exists at the pin** (no lemma pairs `Real.log` with `goldenRatio`); the interval is built by L, e.g. log φ ∈ (a, b) ⇔ exp a < φ < exp b (`Real.log_lt_log`/`exp_log` direction), with `exp` of the rational endpoints bounded by `Real.exp_bound`/`exp_bound'` to ≈ 10⁻⁷ and φ bounded through √5 rationally (`Real.lt_sqrt`, `Real.sqrt_lt'`). This is E1 by the ledger, but the upper-bound margin makes it the precision-heaviest NOW row in the unit.

## 5 · Intended Lean statement
**Prose.** With φ = (1 + √5)/2: 2·log(φ²) = 4·log φ, and 4·log φ lies in [1.92475, 1.92485), i.e. equals 1.9248 to four decimal places.

**Proposed signature.**
```lean
open Real in
theorem rz_06a_two_log_sq_eq : 2 * Real.log (goldenRatio ^ 2) = 4 * Real.log goldenRatio := by
  sorry

open Real in
theorem rz_06a_four_log_phi_approx :
    (192475 : ℝ) / 100000 ≤ 4 * Real.log goldenRatio ∧
    4 * Real.log goldenRatio < (192485 : ℝ) / 100000 := by
  sorry
```

## 6 · What the row does not claim
- **"systole(X(1)) = …"** — that 4 log φ *is* the systole of the modular surface (the minimum translation length / shortest closed geodesic) is L:RZ-06b (EFFORT; depends on L:RZ-03 and on L:RZ-05's translation-length formula (2.2)). Not claimed here.
- **(2.2), ℓ = 2 log λ** — the translation-length formula is L:RZ-05 (EFFORT). Not claimed here; the row's "2 log(φ²)" is read as a real number, not as a length.
- "with λ = φ²" — that φ² is the eigenvalue of the systolic element is L:RZ-04 (eigenvalues of F²) together with L:RZ-06b; here φ² is only the argument of the log.
- The [CV] grade is the paper's; the row asserts only the arithmetic.
- "The norm of the systolic element is N = φ⁴, consistent with ℓ = 4 log φ" (the sentence after (2.3)) and the reading "φ … read off the systole datum" — not claimed.

## 7 · Status
SPEC-DRAFT 2026-10-28T17:09:40Z

V1: V1-GREEN 2026-10-28T17:18:35Z — faithful to (2.3) p07 after "systole(𝑋(1)) =": 2 log(φ²) = 4 log φ ≈ 1.9248, natural log (fixed by the numeral). Precision reading CONFIRMED as correct four-decimal rounding, [1.92475, 1.92485): the paper's own convention on its neighbouring numerals is rounding, not truncation — witness p08: 𝑔𝑐 = 1/(√5·π) = 0.1423525… printed "≈ 0.1424" (truncation would print 0.1423) and 2 arccosh 2 = 2.6339158… printed "2.634" (truncation 2.633); 4 log φ = 1.92484730023841… lies inside (upper margin 2.70 × 10⁻⁶, independently recomputed here with mpmath at 30 digits). The looser "|·| ≤ 10⁻⁴" reading is correctly not adopted — it would be weaker than the paper's practice. "systole(𝑋(1)) =" is left wholly to L:RZ-06b and (2.2) to L:RZ-05 (§6) — confirmed; nothing stronger. Re-key MS-06: MS (2.5) p06 prints "systole(𝑋(1)) = 2 log(𝜑2 ) = 4 log 𝜑 ≈ 1.9248" — identical chain and numeral (no [CV] tag), same mathematics for this leg.

V2: V2-GREEN 2026-10-28T17:27:17Z — (2.3) p07 after "systole(X(1)) =": 2·log(φ²) = 4·log φ (natural log) and "≈ 1.9248" as [1.92475, 1.92485); 4 log φ = 1.92484730023841… recomputed (mpmath, 30 digits), inside. Systole identification and (2.2) not claimed (L:RZ-06b, L:RZ-05).
