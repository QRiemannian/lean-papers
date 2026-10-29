# RZ-N6 — implementation B

**Paper.** *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026), served PDF
`https://qriemannian.ai/pdfs/riemann-zeta-tetrahedral.pdf`, sha256
`2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54` (checked with `shasum -a 256` as the seat's first act, before any code was
written (first `date -u` of the seat 2026-10-28T22:36:00Z came just after it), and again at 2026-10-28T22:41:42Z — MATCH both times). Page numbers are PDF page indices,
cover = p01.

## The printed claim (verbatim from `pdftotext -layout`, p21, folio 20, end of §8.2)

"(Ratio forms are a different matter: the Gauss map's own dynamical zeta function is a ratio of Fredholm determinants
of ℒ at shifted arguments, a distinct object. The equation det(1 − ℒ𝑠 ) = 𝑍(𝑠)/𝑍(𝑠 + 1) is not an identity — at
𝑠 = 3/2 the two sides are 0.663 and 0.835 — and is not used here.)"

with, on the same page, (8.3) "ℒ𝑠 𝑓(𝑥) = ∑_{𝑛=1}^∞ (𝑥 + 𝑛)^{−2𝑠} 𝑓(1/(𝑥 + 𝑛))", (8.4) "𝑍Selberg(𝑠) = det(1 − ℒ𝑠²) =
det(1 − ℒ𝑠) ⋅ det(1 + ℒ𝑠)", and (8.5) "𝑍(𝑠) = ∏_𝑝 ∏_{𝑘=0}^∞ (1 − 𝑁(𝑝)^{−𝑠−𝑘})", "the outer product over primitive
hyperbolic conjugacy classes {𝑝} with norms 𝑁(𝑝)".

## The quantities, defined

- **A** = det(1 − ℒ_{3/2}), the Fredholm determinant of the Mayer–Gauss transfer operator (8.3) at s = 3/2. Printed 0.663.
- **B** = Z(3/2)/Z(5/2), Z the Selberg zeta (8.5) of PSL(2, ℤ). Telescoping in k gives B = ∏_p (1 − N(p)^{−3/2}),
  N(p) = λ_p², λ_p the larger eigenvalue of a primitive hyperbolic element. Printed 0.835.
- The claim: A rounds to 0.663, B rounds to 0.835, and A ≠ B.

## Method, and why it is a second route

**Primary (A and B): Mayer's Bessel-kernel form, discretised by Nyström on Gauss–Laguerre nodes.** The obvious route
truncates ℒ_s as a matrix in a power or Chebyshev basis on the disc. Here the operator is moved to the Laplace side
instead: for f(z) = ∫₀^∞ e^{−zt} φ(t) dt, the identity w^{−2s} e^{−t/w} = ∫₀^∞ e^{−wu} (u/t)^{s−1/2} J_{2s−1}(2√(tu)) du
and ∑_n e^{−(z+n)u} = e^{−zu}/(e^u − 1) turn ℒ_s into an integral operator on (0, ∞), similar to the symmetric kernel
K_s(u, t) = J_{2s−1}(2√(ut)) / √((e^u − 1)(e^t − 1)). After the similarity that strips the (ut)^{s−1} factor, the
Fredholm determinant is the Nyström (Bornemann) determinant det(I ∓ M), M_ij = √(w_i w_j) g(x_i) g(x_j) E(x_i x_j), on
generalized Gauss–Laguerre nodes with weight t^{2s−2}e^{−t}; E(y) = J_{2s−1}(2√y) y^{−(s−1/2)} (entire),
g(t) = √(t/(1 − e^{−t})). A = det(I − M) at s = 3/2. B comes from Mayer's factorisation (8.4):
B = [det(I − M) det(I + M)]_{3/2} / [det(I − M) det(I + M)]_{5/2}.
Representation check: trace(M) equals the fixed-point sum tr ℒ_s = ∑_n x_n^{2s}/(1 + x_n²), x_n = (√(n² + 4) − n)/2, to
8 × 10⁻²⁰ (s = 3/2) and 1.5 × 10⁻²¹ (s = 5/2).

**Cross-check (independent of the Bessel form and of Mayer's factorisation): Euler products over the prime cycles of the
Gauss map.** Prime cycles are enumerated as Lyndon words of continued-fraction digits with product-matrix trace ≤ T; the
composition-operator trace formula gives det(1 − ℒ_s) = ∏_w ∏_{j≥0}(1 − det_w^j λ_w^{−2(s+j)}), and the primitive
hyperbolic classes of PSL(2, ℤ) are the prime cycles of the even map T² (an even-length prime word gives two classes with
N = λ_w², an odd-length one gives one class with N = λ_w⁴). Every omitted factor of B lies in (0, 1), so each truncated
B product is an upper bound. T = 1000, 2000, 4000, 8000; double precision with `math.fsum` over `log1p` terms, traces
exact integers. Its slow tail (≈ 1/(T log T)) is why it is the check and not the primary.

**Convergence.** Primary at two settings — (N = 40 nodes, 30 digits) and (N = 64 nodes, 45 digits) — both printed;
threshold 10⁻¹⁰ on A and B (spreads: A 3.7 × 10⁻¹³, B 3.3 × 10⁻¹⁹). Cross-check at T = 8000 within 10⁻⁴ of the primary
(A +8.4 × 10⁻⁶, B +1.05 × 10⁻⁵, from above, approaching monotonically over the four T).

**Standing.** Floating-point reproduction, not a certified enclosure. mpmath supplies multiprecision arithmetic,
`besselj`, `gauss_quadrature` and `det`; no library Fredholm, Selberg or class-number routine is used.

## Comparison rule

Each primary value, rounded half-even at the printed third decimal, must equal the printed numeral. The inequality
A ≠ B is checked as an inequality: |A − B| must exceed the sum of both convergence spreads and the 10⁻⁴ cross-check band.

## How to run

```
cd <repo>/computations/RZ-N6/impl-b
/opt/homebrew/bin/python3 -I compute.py
```

Self-contained, no input, no network; needs `mpmath` (1.3.0 used). Runtime ≈ 25 s (primary ≈ 2 s; the T = 8000 cycle
enumeration ≈ 18 s).

## Pinned output (full text in `output.txt`)

| item | printed | computed (N = 64, 45 digits) | N = 40 vs N = 64 | cycle product, T = 8000 | verdict |
|---|---|---|---|---|---|
| A = det(1 − ℒ_{3/2}) | 0.663 | 0.66295226265739486963… | 3.7e−13 | 0.662960630 | PASS |
| B = Z(3/2)/Z(5/2) | 0.835 | 0.83492297363061071054… | 3.3e−19 | 0.834933512 (≥ B) | PASS |
| A ≠ B | not an identity | A − B = −0.17197071097… | — | — | PASS |

Also shown: det(1 + ℒ_{3/2}) = 1.2415431070752…, Z(3/2) = 0.82308381202221…, det(1 ∓ ℒ_{5/2}) = 0.91692135557298… /
1.07514134041269…, Z(5/2) = 0.98582005528376….

**Row verdict: PASS** — both printed numerals reproduce, and the two sides differ by 0.172, far outside every error band.
