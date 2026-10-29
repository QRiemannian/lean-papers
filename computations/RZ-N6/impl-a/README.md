# L:RZ-N6 · implementation A

**Paper.** *The Tetrahedral Structure of the Riemann Zeta Function*, revised October 2026 —
`riemann-zeta-tetrahedral.pdf` (served copy, `qriemannian-site/public/pdfs/`), sha256
`2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54` — MATCH, taken with `shasum -a 256` before any code
was written and taken again at 2026-10-28T22:40:00Z (`date -u`). Pages counted with the cover as p01.

## The printed claim (quoted exactly, `pdftotext -layout`)

**p21 (folio 20), §8.2, the end of the section**, after (8.3)–(8.5):

> "(Ratio forms are a different matter: the Gauss map’s own dynamical zeta function is a ratio of Fredholm
> determinants of ℒ at shifted arguments, a distinct object. The equation det(1 − ℒ𝑠 ) = 𝑍(𝑠)/𝑍(𝑠 + 1) is not an
> identity — at 𝑠 = 3/2 the two sides are 0.663 and 0.835 — and is not used here.)"

The definitions it rests on, same section: (8.3) `ℒ𝑠 𝑓(𝑥) = ∑_{𝑛=1}^∞ (𝑥 + 𝑛)^{−2𝑠} 𝑓(1/(𝑥 + 𝑛))`;
(8.4) `𝑍Selberg(𝑠) = det(1 − ℒ𝑠²) = det(1 − ℒ𝑠) ⋅ det(1 + ℒ𝑠)` [CV, Mayer 1991];
(8.5) `𝑍(𝑠) = ∏_𝑝 ∏_{𝑘=0}^∞ (1 − 𝑁(𝑝)^{−𝑠−𝑘})`, the outer product over primitive hyperbolic conjugacy classes of PSL(2, ℤ).

## The quantities

- **A** = det(1 − ℒ_{3/2}), the Fredholm determinant of (8.3) on Mayer's space of functions holomorphic on the disc
  |z − 1| < 3/2 (the card's reading).
- **B** = Z(3/2)/Z(5/2). By (8.5) the k-products telescope: Z(s)/Z(s + 1) = ∏_p (1 − N(p)^{−s}), with
  N(p) = λ², λ = (t + √(t² − 4))/2 for a class of trace t.
- The claim: A rounds to 0.663, B rounds to 0.835, and A ≠ B.

## Method (floating-point reproduction, not a certified enclosure)

**A.** ℒ_s is represented in the Taylor basis e_k(z) = (z − c)^k at a real centre c. Writing w = n + c + u, u = z − c,
(1/w − c)^k w^{−2s} = Σ_i C(k, i)(−c)^i w^{−(2s+k−i)} and w^{−b} = Σ_j C(−b, j)(n + c)^{−b−j} u^j, so every matrix
element is a finite sum of Hurwitz zeta values ζ(2s + m, 1 + c) (mpmath `zeta(·, ·)`); A = det(I − M_N) for the N × N
truncation. Three runs: (c = 1, N = 40, 60 digits), (c = 1, N = 60, 90 digits), and a change of basis
(c = 5/4, N = 60, 90 digits). Internal check: the matrix trace against the exact fixed-point trace
tr ℒ_s = Σ_n x_n^{2s}/(1 + x_n²), x_n = (√(n² + 4) − n)/2 (the fixed point of the n-th branch).

**B, two independent routes.** (i) Mayer's identity (8.4): B = det(I − M(3/2)²)/det(I − M(5/2)²), from the same
matrices. (ii) The Euler product (8.5) directly, with no transfer operator: every primitive hyperbolic class of
PSL(2, ℤ) with trace t ≤ T is enumerated as a primitive cyclic word in the continued-fraction generators
M_a = [[0, 1], [1, a]] — an even word gives two classes (its even and odd rotations, conjugate only in GL(2, ℤ)), an odd
word gives one (the square of its determinant −1 product). The counts for t = 3..8 are printed against the narrow
class-number sums they must equal (1, 2, 2, 3, 2, 4); trace ≤ 1000 gives 78,441 classes. The tail t > T is estimated
from the prime geodesic theorem density 1/log x: Σ_{N > X} N^{−3/2} ≈ ∫_X^∞ x^{−3/2}/log x dx, X = λ_T². Cutoffs
T = 1000, 2000, 4000 are printed; the tail-corrected values close on the Fredholm value (difference 1.0 × 10⁻⁸ at
T = 4000). The tail correction is an estimate, so route (ii) is a cross-check at the 10⁻⁸ level, not the reference.

**Convergence.** A: |N = 40 − N = 60| = 8.4 × 10⁻¹⁴; |c = 5/4 − c = 1| at N = 60 = 5.8 × 10⁻¹⁷. B: 1.7 × 10⁻¹³ and
1.1 × 10⁻¹⁶. Trace check: |tr M − exact| = 9.1 × 10⁻²¹. The reference values are (c = 1, N = 60, 90 digits).

## Comparison rule

Round the computed value at the decimal position of the printed number's last significant digit and compare
integers (0.663 and 0.835: three decimals). The non-identity is checked as an inequality: B − A must exceed 100 times
the spread between the three Fredholm runs, with B > A.

## How to run

```
cd <repo>/computations/RZ-N6/impl-a
/opt/homebrew/bin/python3 -I compute.py
```

No network, no input; Python 3 with `mpmath`. Runtime ≈ 20 s on the principal's machine.

## Pinned output (`output.txt`) — the result: 4 of 4 PASS

| item | printed | computed | verdict |
|---|---|---|---|
| A = det(1 − ℒ_s), s = 3/2 | 0.663 | 0.66295226265739486965 | PASS |
| B = Z(s)/Z(s + 1), s = 3/2, Fredholm route (8.4) | 0.835 | 0.83492297363061071069 | PASS |
| B, Euler-product route (8.5), trace ≤ 4000, tail-corrected | 0.835 | 0.834922963479 | PASS |
| A ≠ B (the printed non-identity) | "not an identity" | B − A = 0.171970710973 | PASS |

Also printed: Z(3/2) = det(1 − ℒ²_{3/2}) = 0.8230838120222122…, Z(5/2) = 0.9858200552837627….

## Notes for the record

- Both numerals are roundings, not truncations: A = 0.66295… truncates to 0.662 and B = 0.83492… truncates to 0.834.
  Margins to the rounding boundary: A sits 4.5 × 10⁻⁴ above 0.6625, B 4.2 × 10⁻⁴ above 0.8345.
- The printed sentence leaves the function space of the Fredholm determinant implicit; the value is basis-independent
  across the two centres run here, as it must be for a nuclear operator, so the reading is not load-bearing.
