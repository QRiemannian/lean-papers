# MS-N5b — implementation B

**Paper.** *The Invariant Structure of the Modular Surface — The Tetrahedral Framework, the Selberg Spectrum, and the
Boundary at the Riemann Zeros* (2026, revised October 2026), served PDF
`https://qriemannian.ai/pdfs/modular-surface-characterization.pdf`, sha256
`b4841489ec6bea619f8d5525ce4c788b86e0109e51d6e9d2cb252690f5b13af5` (checked with `shasum -a 256` as the seat's first
act, before any code was written, and again at 2026-10-28T22:41:42Z — MATCH both times). Page numbers are PDF page
indices, cover = p01.

## The printed claim (verbatim from `pdftotext -layout`, p19, folio 18, Figure 1 caption)

"Plotted is the modulus of (5.2a), |∫𝐶 𝐸(𝑧, 𝑠) 𝑑𝑠| = |5^{𝑠/2} Γ(𝑠/2)² Γ(𝑠)^{−1} 𝜁(𝑠) 𝐿(𝑠, 𝜒5 )/𝜁(2𝑠)|, at 𝑠 = 1/2 + 𝑖𝑡
for 0 ≤ 𝑡 ≤ 40, on a logarithmic scale; … The right panel resolves the closest pair, 𝑡 ≈ 32.935 (𝜁) and
𝑡 ≈ 33.000 (𝐿)."

## The quantities, defined

- γ_ζ = the ordinate of the zero of ζ(1/2 + it) near t = 32.9. Printed 32.935.
- γ_L = the ordinate of the zero of L(1/2 + it, χ₅) near t = 33.0, χ₅ the real (Legendre) character mod 5 — values
  1, −1, −1, 1 at 1, 2, 3, 4; even, primitive. Printed 33.000.
- The claim: (γ_ζ, γ_L) minimises |γ_ζ′ − γ_L′| over all pairs of a ζ-zero ordinate and an L-zero ordinate in the
  plotted window 0 ≤ t ≤ 40.

## Method, and why it is a second route

The obvious route is `mpmath.zetazero` (Riemann–Siegel) for ζ and a Dirichlet-series or Hurwitz-zeta evaluation of
L(s, χ₅) with a scan. Here **neither the Dirichlet series nor any library ζ or L routine is used**. Both functions are
evaluated through Riemann's theta-function (Mellin) representation of the **completed** function, split at x = 1 and
summed with upper incomplete gamma functions:

- Λ_ζ(s) = π^{−s/2}Γ(s/2)ζ(s) = 1/(s − 1) − 1/s + ∑_{n≥1} [(πn²)^{−s/2} Γ(s/2, πn²) + (πn²)^{−(1−s)/2} Γ((1 − s)/2, πn²)];
- Λ_χ(s) = (5/π)^{s/2}Γ(s/2)L(s, χ₅) = ∑_{n≥1} χ₅(n) [x_n^{−s/2} Γ(s/2, x_n) + x_n^{−(1−s)/2} Γ((1 − s)/2, x_n)],
  x_n = πn²/5 (θ_χ(1/x) = x^{1/2} θ_χ(x), root number 1, no pole).

Both are real on Re s = 1/2, so zeros on the line are sign changes of a real function.

- **Representation checks** against closed forms: ζ(2) = π²/6 (diff 2 × 10⁻⁴¹), L(2, χ₅) = 4π²/(25√5) (diff 0),
  L(1, χ₅) = 2 log φ/√5 (diff 6 × 10⁻⁴²); Λ_ζ(1/2) and Λ_χ(1/2) are nonzero, so t = 0 is not an ordinate.
- **Completeness (what makes "closest" a claim about every pair):** the argument principle, by adaptive arg-tracking
  around the box −1 ≤ Re s ≤ 2, −40 ≤ Im s ≤ 40, for ξ(s) = s(s − 1)Λ_ζ(s)/2 and for Λ_χ(s) (entire, conjugate-symmetric),
  gives winding 12.0 and 32.0: 6 ζ-zeros and 16 L-zeros with 0 < Im s ≤ 40. The scan finds exactly 6 and 16 sign
  changes on the line, so every zero in the window is on the line, simple, and in the list.
- **Zero-finder:** sign-change scan, step 0.02, then the Illinois variant of regula falsi on each bracket to
  |bracket| < 10⁻²⁸ (the obvious finder is a secant/Newton `findroot`).
- **Convergence:** the refinement runs at 40 and at 60 digits; both printed; max spread over all 22 zeros 3.6 × 10⁻³⁰.
- **Closest pair:** all 6 × 16 = 96 pairs ranked by gap.

**Standing.** Floating-point reproduction, not a certified enclosure (the box count is a numerical winding, the scan a
sampled sign test). mpmath supplies multiprecision arithmetic and `gammainc`.

## Comparison rule

Each ordinate, rounded half-even at the printed third decimal, must equal the printed numeral. "Closest pair" is
checked as an inequality: the pair's gap must be smaller than every other pair's gap, with both zero lists complete by
the argument-principle count.

## How to run

```
cd <repo>/computations/MS-N5b/impl-b
/opt/homebrew/bin/python3 -I compute.py
```

Self-contained, no input, no network; needs `mpmath` (1.3.0 used). Runtime ≈ 75–90 s (the scan is most of it).

## Pinned output (full text in `output.txt`)

| item | printed | computed (60 digits) | 40 vs 60 digits | verdict |
|---|---|---|---|---|
| γ_ζ (closest-pair ζ ordinate) | 32.935 | 32.93506158773918969066… | < 4e−30 | PASS |
| γ_L (closest-pair L ordinate) | 33.000 | 33.00045600687051436795… | < 4e−30 | PASS |
| closest pair over 0 ≤ t ≤ 40 | (γ_ζ, γ_L) | gap 0.0653944191; next 0.4223913627 (ζ 25.0109 / L 24.5885) | — | PASS |

The window's zeros: ζ — 14.1347, 21.0220, 25.0109, 30.4249, 32.9351, 37.5862; L(·, χ₅) — 6.6485, 9.8314, 11.9588,
16.0338, 17.5670, 19.5407, 22.2274, 24.5885, 26.7761, 28.4610, 29.7079, 33.0005, 34.7288, 35.8686, 38.1292, 39.5606.

**Row verdict: PASS** — both printed ordinates reproduce, and the pair is the closest of all 96 in the window by a
factor of 6.5 over the runner-up.
