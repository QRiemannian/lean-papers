# MS-17 — implementation B

**Paper.** *The Invariant Structure of the Modular Surface* (2026, revised October 2026), served PDF
`https://qriemannian.ai/pdfs/modular-surface-characterization.pdf`, sha256
`b4841489ec6bea619f8d5525ce4c788b86e0109e51d6e9d2cb252690f5b13af5` (checked with `shasum -a 256`, 2026-10-28T20:21Z).
Page numbers are PDF page indices, cover = p01.

## The printed claim (verbatim from `pdftotext -layout`, p08, §2.5)

"The golden ratio wins exactly its degree-2, closed-geodesic orderings, and loses the degree-unrestricted ones: the
smallest known Salem number (Lehmer's number, ≈ 1.17628) and the plastic number (≈ 1.32472, the smallest Pisot
number) both lie below φ."

## The quantities, defined

- Lehmer's number: the unique root > 1 of L(x) = x¹⁰ + x⁹ − x⁷ − x⁶ − x⁵ − x⁴ − x³ + x + 1.
- The plastic number: the unique real root of P(x) = x³ − x − 1.
- φ = (1 + √5)/2, the positive root of x² − x − 1.
- Computed: both values to the printed five decimals, and "both lie below φ".
- Not computed: "smallest known Salem" and "smallest Pisot" (Siegel 1944) are literature statements.  As a
  supplement the program checks the **class shapes**: L is reciprocal and its trace polynomial T(y), x⁻⁵L(x) = T(x + 1/x),
  has exactly one root in (2, ∞) and four in (−2, 2) (one root of L outside the unit circle, one inside, eight on it —
  the Salem shape); P has one real root θ > 1, no rational root (so P is irreducible over ℚ), and its two complex roots
  have |z|² = 1/θ < 1 (the Pisot shape).

## Method, and why it is independent of the obvious one

The obvious route is a floating-point root finder (`mpmath.polyroots`, `numpy.roots`, `mpmath.findroot`).  This
program uses **exact rational arithmetic only** (`fractions.Fraction`, standard library): Sturm sequences count real
roots in an interval exactly; bisection with exact sign evaluation brackets each root in a rational interval.  "Below
φ" is decided exactly: the rational upper end h of the bracket satisfies h < φ iff h² − h − 1 < 0.  No floating-point
number enters any decision.

**Convergence.** Two settings — bracket width < 10⁻²⁰ and < 10⁻⁴⁰ — both printed; the second bracket must lie inside
the first (it does).

## Comparison rule

Both ends of the rational bracket, rounded half-even to the printed five decimals, must equal the printed numeral (so
the rounding is certain, not merely likely).

## How to run

```
cd <repo>/computations/MS-17/impl-b
/opt/homebrew/bin/python3 -I compute.py
```

Self-contained, no input, no network, standard library only.  Runtime well under a second.

## Pinned output (full text in `output.txt`)

| numeral | printed | computed (bracket of width < 10⁻⁴⁰) | verdict |
|---|---|---|---|
| Lehmer's number | 1.17628 | [1.176280818259917506544070338474035050693386…, …0693477…] | PASS |
| plastic number | 1.32472 | [1.324717957244746025960908854478097340734312…, …0734404…] | PASS |
| Lehmer's number < φ | — | exact: h² − h − 1 = −0.7926… < 0 | PASS |
| plastic number < φ | — | exact: h² − h − 1 = −0.5698… < 0 | PASS |
| Salem shape (supplement) | — | T(y) = y⁵ + y⁴ − 5y³ − 5y² + 4y + 3: 4 roots in (−2, 2), 1 in (2, ∞) | holds |
| Pisot shape (supplement) | — | one real root, no rational root, |conjugates|² = 0.75487766624669276… | holds |

**Row verdict: PASS** — both printed values reproduce and both lie below φ (exactly decided).  The two "smallest"
qualifiers are literature, not computed here.
