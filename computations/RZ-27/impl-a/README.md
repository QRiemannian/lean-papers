# RZ-27 · implementation A

**Paper.** *The Tetrahedral Structure of the Riemann Zeta Function*, revised edition, October 2026 —
`riemann-zeta-tetrahedral.pdf`, sha256 `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
(checked before this program was written). Pages counted with the cover as p01.

## The printed claim (quoted exactly, `pdftotext -layout`)

**p11, §4.3, (4.4):** "𝜁(3)|𝐻 = 7𝜋³/180 ≈ 1.2058 … It overshoots the true value by approximately 0.31%."

**p11, §4.3, (4.5):** "𝜁(3)|𝑇aniso = −2 ∑_{𝑘=1}^∞ 1/(𝑘³(𝑒^{2𝜋𝑘} − 1)) ≈ −0.003743"

**p11, §4.3:** "the nome 𝑞 = 𝑒^{−2𝜋} ≈ 1.87 × 10⁻³ … the 𝑘-sum converges geometrically, each term below the last
by more than the factor 𝑒^{−2𝜋} ≈ 1.87×10⁻³ (the 𝑘 = 1 term accounts for 99.977% of the total correction)"

**p12, the table after (4.5):**

| 𝑘 | Term magnitude | Cumulative fraction |
|---|---|---|
| 1 | 1.871 × 10⁻³ | 99.977% |
| 2 | 4.359 × 10⁻⁷ | 99.9999% |
| 3 | 2.412 × 10⁻¹⁰ | ≈1 |

**p13, §4.5:** "Ramanujan's leading term 7𝜋³/180 exceeds 𝜁(3) by ≈ 0.31% (𝜁(3) is ≈ 99.69% of it)"

## The quantities

- `A = 7π³/180`; `ζ(3)` from `mpmath.zeta(3)`.
- `t_k = 1/(k³(e^{2πk} − 1))` — the table's "term magnitude" (without the prefactor −2); `S = Σ_{k≥1} t_k`.
- Correction `C = −2S`.
- Overshoot `(A − ζ(3))/ζ(3) × 100 %` ("overshoots the true value by", "exceeds ζ(3) by"). The reading relative to `A`
  (`(A − ζ(3))/A`) is also printed; both round to 0.31 %.
- Cumulative fraction at row k: `(t_1 + … + t_k)/S × 100 %`.
- `ζ(3)/A × 100 %`; the nome `q = e^{−2π}`; the ratios `t_{k+1}/t_k` against `q`.

## Method

Direct summation in `mpmath` at 60 significant digits. Convergence check: the series is summed to K = 20 and to K = 40
terms; the two sums agree to 5 × 10⁻⁶² (the K = 20 tail is below `t_21` ≈ 5 × 10⁻⁶² by the geometric decay). As an
independent check of the series, `A − 2S` is compared with `mpmath.zeta(3)` (Ramanujan's identity (4.3)); the difference
is 0 at 60 digits. The ratio claim is checked numerically for k = 1 … 20 and holds for every k by the exact bound
`t_{k+1}/t_k = (k/(k+1))³ (e^{2πk} − 1)/(e^{2π(k+1)} − 1) < e^{−2π}`, since `(e^{2πk} − 1)e^{2π} = e^{2π(k+1)} − e^{2π} < e^{2π(k+1)} − 1`.

## Comparison rule

Agreement at the printed number of significant digits after rounding: the computed value is rounded at the decimal
position of the printed number's last significant digit, and the two integers are compared. The printed "≈1" (table,
k = 3) is read as `|1 − value| < 10⁻⁹`; the ratio claim is an inequality and is checked as one.

## How to run

```
cd <repo>/computations/RZ-27/impl-a
/opt/homebrew/bin/python3 -I compute.py
```

No network, no input; Python 3 with `mpmath`.

## Pinned output (`output.txt`) — the result

12 of 13 items PASS; one item FAILS under the rounding rule:

| item | printed | computed | verdict |
|---|---|---|---|
| (4.4) 7π³/180 | 1.2058 | 1.20579964867832634 | PASS |
| overshoot, relative to ζ(3) | 0.31 % | 0.311361759 % | PASS |
| (4.5) correction | −0.003743 | −0.00374274551873205 | PASS |
| nome e^{−2π} | 1.87 × 10⁻³ | 1.86744273 × 10⁻³ | PASS |
| t_1 | 1.871 × 10⁻³ | 1.87093660 × 10⁻³ | PASS |
| t_2 | 4.359 × 10⁻⁷ | 4.35919315 × 10⁻⁷ | PASS |
| t_3 | 2.412 × 10⁻¹⁰ | 2.41200451 × 10⁻¹⁰ | PASS |
| cumulative, k = 1 (= "99.977% of the total correction") | 99.977 % | 99.9766930 % | PASS |
| **cumulative, k = 2** | **99.9999 %** | **99.9999871 %** | **FAIL** (rounds to 100.000 % at 6 significant digits) |
| cumulative, k = 3 | ≈1 | 1 − 1.0 × 10⁻¹⁰ | PASS |
| ζ(3)/(7π³/180) | 99.69 % | 99.6896047 % | PASS |
| §4.5 excess over ζ(3) | 0.31 % | 0.311361759 % | PASS |
| t_{k+1}/t_k < e^{−2π}, all k | inequality | 2.33 × 10⁻⁴ … 1.61 × 10⁻³ (k = 1 … 20) | PASS |

The one FAIL is a display question in the table, not a wrong number: the true cumulative fraction at k = 2 is
99.99998710 %, which the printed 99.9999 % matches as a truncation but not as a rounding (rounding gives 100.000 %).
It is reported as computed and not adjusted. Every numeral the ledger row lists (1.2058, 0.31 %, −0.003743, 99.977 %,
99.69 %) reproduces.
