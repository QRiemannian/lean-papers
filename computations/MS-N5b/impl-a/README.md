# L:MS-N5b · implementation A

**Paper.** *The Invariant Structure of the Modular Surface*, revised October 2026 —
`modular-surface-characterization.pdf` (served copy, `qriemannian-site/public/pdfs/`), sha256
`b4841489ec6bea619f8d5525ce4c788b86e0109e51d6e9d2cb252690f5b13af5` — MATCH, taken with `shasum -a 256` before any code
was written and taken again at 2026-10-28T22:40:00Z (`date -u`). Pages counted with the cover as p01.

## The printed claim (quoted exactly, `pdftotext -layout`)

**p19 (folio 18), Figure 1 caption**:

> "Plotted is the modulus of (5.2a), |∫𝐶 𝐸(𝑧, 𝑠) 𝑑𝑠| = |5𝑠/2 Γ(𝑠/2)2 Γ(𝑠)−1 𝜁(𝑠) 𝐿(𝑠, 𝜒5 )/𝜁(2𝑠)|, at 𝑠 = 1/2 + 𝑖𝑡
> for 0 ≤ 𝑡 ≤ 40, on a logarithmic scale; […] The right panel resolves the closest pair, 𝑡 ≈ 32.935 (𝜁) and
> 𝑡 ≈ 33.000 (𝐿)."

(`1/2` is set as a stacked fraction in the PDF; `pdftotext` renders it on the line above.)

## The quantities

- **γ_ζ**: the ordinate of the zero of ζ(1/2 + it) near t = 32.9 (printed 32.935).
- **γ_L**: the ordinate of the zero of L(1/2 + it, χ₅) near t = 33.0 (printed 33.000), χ₅ the real character mod 5
  (χ(1), χ(2), χ(3), χ(4) = 1, −1, −1, 1; even, primitive).
- **Closest pair**: (γ_ζ, γ_L) minimises |γ − δ| over ζ-zero ordinates γ and L-zero ordinates δ in the figure's
  window 0 ≤ t ≤ 40.

## Method (floating-point reproduction, not a certified enclosure)

- **ζ.** Sign changes of the Riemann–Siegel function Z(t) (`mpmath.siegelz`) on a grid over [0, 40], each refined by
  `mpmath.findroot`; cross-checked against `mpmath.zetazero(k)` (agreement 2 × 10⁻⁵⁰) and the count
  `mpmath.nzeros(40)` = 6.
- **L.** The Hardy function Z_χ(t) = e^{iθ(t)} L(1/2 + it, χ₅), θ(t) = (t/2) log(5/π) + Im log Γ(1/4 + it/2), real on
  the line for an even primitive real character (the residual imaginary part is printed: ≤ 1.0 × 10⁻⁴⁹ relative);
  L from `mpmath.dirichlet`. Sign changes on a grid, refined by `findroot`; |L| at the refined zeros ≤ 1.4 × 10⁻⁴⁹.
- **Completeness of the window (no zero missed between grid points).** The L-zero count with 0 < γ ≤ 40 is computed
  independently by the argument principle, N(40) = θ(40)/π + (1/π) arg L(1/2 + 40i), the argument followed
  continuously along Im s = 40 from σ = 8 to σ = 1/2 (4000 steps): 15.5388… + 0.4612… = 16.0, equal to the sixteen
  sign changes found. For ζ, `nzeros(40)` = 6 equals the six found.
- **Convergence.** Two runs, (30 digits, grid step 0.02) and (50 digits, grid step 0.01); every zero agrees across
  them to < 3 × 10⁻³⁶.

## Comparison rule

Round the computed value at the decimal position of the printed number's last significant digit and compare integers
(32.935 and 33.000: three decimals). The closest-pair claim is checked as an ordering: the printed pair is the argmin
over all ζ/L pairs in the window, strictly below the next pair. The completeness check (scan counts = independent
counts) is a fourth item, since the closest-pair claim depends on it.

## How to run

```
cd <repo>/computations/MS-N5b/impl-a
/opt/homebrew/bin/python3 -I compute.py
```

No network, no input; Python 3 with `mpmath`. Runtime ≈ 60–70 s on the principal's machine.

## Pinned output (`output.txt`) — the result: 4 of 4 PASS

| item | printed | computed | verdict |
|---|---|---|---|
| γ_ζ (zero of ζ near 32.9) | 32.935 | 32.93506158773918969066 | PASS |
| γ_L (zero of L(·, χ₅) near 33.0) | 33.000 | 33.00045600687051436795 | PASS |
| closest ζ/L pair in 0 ≤ t ≤ 40 | (32.935, 33.000) | gap 0.06539441913; next pair 0.4223913627 (25.0109 / 24.5885) | PASS |
| completeness of the scanned window | — | ζ: 6 found = nzeros 6; L: 16 found = argument principle 16.0 | PASS |

The window holds 6 ζ-zeros (14.1347 … 37.5862) and 16 L-zeros (6.6485, 9.8314, 11.9588, … 39.5606), all listed in
`output.txt`. For reference, the least ζ/ζ gap is 2.510 and the least L/L gap 1.140, so the printed pair is the closest
pair of any two plotted nodes in the window, whichever pairing is read.

## Notes for the record

- Both ordinates are roundings and also truncations (32.93506… and 33.00046… both read the same either way).
- "Closest pair" is read over the printed window 0 ≤ t ≤ 40 (the caption's own range); outside it the claim is not
  printed and not computed.
