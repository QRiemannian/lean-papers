# RZ-27 — implementation B

**Paper.** *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026), served PDF
`https://qriemannian.ai/pdfs/riemann-zeta-tetrahedral.pdf`, sha256
`2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54` (checked with `shasum -a 256`, 2026-10-28T20:21Z).
Page numbers are PDF page indices, cover = p01.

## The printed claim (verbatim from `pdftotext -layout`; two-dimensional displays linearised)

- p11, §4.3, display (4.4): "ζ(3)|_H = 7π³/180 ≈ 1.2058 (4.4) … It overshoots the true value by approximately 0.31%."
- p11, §4.3, display (4.5): "ζ(3)|_{T aniso} = −2 ∑_{k=1}^∞ 1/(k³(e^{2πk} − 1)) ≈ −0.003743 (4.5)"
- p11, §4.3: "the nome q = e^{−2π} ≈ 1.87 × 10^{−3} is the standard modular parameter; the k-sum converges geometrically,
  each term below the last by more than the factor e^{−2π} ≈ 1.87×10^{−3} (the k = 1 term accounts for 99.977% of the
  total correction)"
- p12, the table: "k · Term magnitude · Cumulative fraction — 1 · 1.871 × 10^{−3} · 99.977% — 2 · 4.359 × 10^{−7} ·
  99.9999% — 3 · 2.412 × 10^{−10} · ≈1"
- p13, §4.5: "Ramanujan's leading term 7π³/180 exceeds ζ(3) by ≈ 0.31% (ζ(3) is ≈ 99.69% of it)"

## The quantities, defined

- A = 7π³/180.  C = −2 S with S = ∑_{k≥1} t_k, t_k = 1/(k³(e^{2πk} − 1)).  q = e^{−2π}.  ζ(3) = ∑ n^{−3}.
- "overshoot" / "exceeds ζ(3) by": (A − ζ(3))/ζ(3) in percent. The other base, (A − ζ(3))/A, is also computed; both
  round to 0.31.
- "Term magnitude" for row k: the summand t_k (without the prefactor −2 — the reading under which the printed digits
  are the summands; the cumulative fraction does not depend on the prefactor).  "Cumulative fraction" for row k:
  (t_1 + … + t_k)/S.  "the k = 1 term accounts for … of the total correction": t_1/S.
- "ζ(3) is ≈ 99.69% of it": ζ(3)/A in percent.
- The ratio sentence: t_{k+1}/t_k < e^{−2π} for every k ≥ 1.

## Method, and why it is independent of the obvious one

The obvious route is `mpmath` (`mp.zeta(3)`, `mp.pi`, `mp.exp`, `nsum`).  This program uses **none of mpmath or
sympy**: the Python standard library only.

- π by Machin's formula, π = 16 atan(1/5) − 4 atan(1/239), in scaled-integer fixed point.
- ζ(3) by **Apéry's series** ζ(3) = (5/2) ∑_{n≥1} (−1)^{n+1}/(n³ C(2n,n)), summed **exactly** in `fractions.Fraction`.
  It never uses Ramanujan's formula (4.3), so the program checks (4.3) against an independent ζ(3) instead of assuming
  it (the identity A + C − ζ(3) is printed: 3e−89).
- e^{2πk} by `decimal.Decimal.exp` at the working precision.
- The ratio sentence is checked numerically for k = 1…29, and holds for all k exactly:
  t_{k+1}/t_k = (k/(k+1))³ (e^{2πk} − 1)/(e^{2π(k+1)} − 1), and (e^{2πk} − 1)/(e^{2π(k+1)} − 1) < e^{−2π} ⇔ 1 < e^{2π}.

**Convergence.** Everything is computed at two settings — (60 digits, k ≤ 20, 110 Apéry terms) and (90 digits,
k ≤ 30, 160 Apéry terms) — and both are printed; they must agree to 1e−45 (they agree to 5e−60).

## Comparison rule

The computed value, rounded half-even to the last decimal place of the printed mantissa (for "1.871 × 10^{−3}": four
significant digits of the mantissa), must equal the printed numeral.  Whether truncation would also agree is printed
beside it for information; it never changes PASS/FAIL.

## How to run

```
cd <repo>/computations/RZ-27/impl-b
/opt/homebrew/bin/python3 -I compute.py
```

Self-contained, no input, no network, standard library only.  Runtime well under a second.

## Pinned output (full text in `output.txt`)

| numeral | printed | computed | verdict |
|---|---|---|---|
| (4.4) 7π³/180 | 1.2058 | 1.20579964867832634… | PASS |
| (4.4) overshoot, % of ζ(3) | 0.31 | 0.31136175907… | PASS |
| (4.4) overshoot, % of 7π³/180 (other base) | 0.31 | 0.31039530678… | PASS |
| (4.5) −2∑ | −0.003743 | −0.0037427455187320547… | PASS |
| nome e^{−2π} | 1.87 × 10^{−3} | 1.86744273170798… × 10^{−3} | PASS |
| k = 1 share of the correction | 99.977% | 99.97669300767… % | PASS |
| table t_1 | 1.871 × 10^{−3} | 1.87093659866… × 10^{−3} | PASS |
| table t_2 | 4.359 × 10^{−7} | 4.35919314726… × 10^{−7} | PASS |
| table t_3 | 2.412 × 10^{−10} | 2.41200451055… × 10^{−10} | PASS |
| table cumulative, k = 1 | 99.977% | 99.97669300767… % | PASS |
| **table cumulative, k = 2** | **99.9999%** | **99.99998710087… %** | **FAIL** (rounds to 100.0000%; agrees under truncation only) |
| table cumulative, k = 3 | ≈1 | 0.99999999989836… | PASS |
| §4.5 ζ(3) as % of 7π³/180 | 99.69% | 99.68960469321… % | PASS |
| §4.5 excess over ζ(3) | 0.31% | 0.31136175907… % | PASS |
| ratio sentence t_{k+1}/t_k < e^{−2π} | — | holds (max ratio 1.687e−3 < 1.867e−3) | PASS |

**Row verdict: FAIL** on one of fourteen numerals under the stated rounding rule — the table's k = 2 cumulative
fraction printed "99.9999%" is 99.999987%, which rounds to 100.0000% at the printed four decimals.  The printed digits
are a truncation of the value, not a rounding.  Thirteen numerals and the ratio sentence reproduce.  Nothing was
adjusted to fit.
