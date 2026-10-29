# MS-17 · implementation A

**Paper.** *The Invariant Structure of the Modular Surface* (`modular-surface-characterization.pdf`), revised October
2026, sha256 `b4841489ec6bea619f8d5525ce4c788b86e0109e51d6e9d2cb252690f5b13af5` (checked before this program was
written). Pages counted with the cover as p01.

## The printed claim (quoted exactly, `pdftotext -layout`)

**p08, §2.5:**

> "the smallest known Salem number (Lehmer's number, ≈ 1.17628) and the plastic number (≈ 1.32472, the smallest Pisot
> number) both lie below 𝜑."

## The quantities

- Lehmer's number: the largest real root of `L(x) = x¹⁰ + x⁹ − x⁷ − x⁶ − x⁵ − x⁴ − x³ + x + 1`.
- The plastic number: the real root of `P(x) = x³ − x − 1`.
- `φ = (1 + √5)/2`.

"Smallest known Salem" and "smallest Pisot" (Siegel 1944) are literature statements; this program does not compute
them and makes no claim about them.

## Method

The root of each polynomial in (1, 2) by bisection (200 halvings) on the integer coefficients, evaluated in `mpmath` at
60 significant digits; cross-checked against `mpmath.polyroots` (all roots, 60 digits, extra precision 200 bits). The two
methods agree to < 2 × 10⁻⁶¹. Supplementary output (not printed digits): `L` has 1 / 8 / 1 roots outside / on / inside
the unit circle and no cyclotomic factor Φₙ (n = 1 … 30, exact integer division), so by Kronecker's theorem `L` is
irreducible and its root is a Salem number; `P` has conjugates of modulus 0.8688 < 1 and no rational root, so the
plastic number is a Pisot number.

## Comparison rule

Agreement at the printed number of significant digits after rounding (round at the decimal position of the printed
number's last significant digit; compare integers). "Both lie below φ" is an inequality, checked as one.

## How to run

```
cd <repo>/computations/MS-17/impl-a
/opt/homebrew/bin/python3 -I compute.py
```

No network, no input; Python 3 with `mpmath`.

## Pinned output (`output.txt`) — the result: 3 of 3 PASS

| item | printed | computed | verdict |
|---|---|---|---|
| Lehmer's number | 1.17628 | 1.17628081825991750654 | PASS |
| plastic number | 1.32472 | 1.32471795724474602596 | PASS |
| both < φ = 1.6180339887 | inequality | 1.1763 < φ and 1.3247 < φ | PASS |
