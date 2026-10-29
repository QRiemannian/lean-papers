# MS-35 — implementation B

**Paper.** *The Invariant Structure of the Modular Surface* (2026, revised October 2026), served PDF
`https://qriemannian.ai/pdfs/modular-surface-characterization.pdf`, sha256
`b4841489ec6bea619f8d5525ce4c788b86e0109e51d6e9d2cb252690f5b13af5` (checked with `shasum -a 256`, 2026-10-28T20:21Z).
Page numbers are PDF page indices, cover = p01.

## The printed claim (verbatim from `pdftotext -layout`, p14, §4.1; displays linearised)

"λ = 1/4 + r², (4.1) with r real: for X(1) every cusp-form eigenvalue exceeds 1/4 … The arithmetic content of the
spectrum — which values r₁ ≈ 9.5337, r₂ ≈ 12.173, … (4.2) actually appear on X(1), with what multiplicities — is
determined not by the Casimir but by the lattice SL(2, ℤ) together with its Hecke operators (the arithmetic side)."

## The quantity, defined

r₁ < r₂ are the two smallest r > 0 for which λ = 1/4 + r² is an eigenvalue of the hyperbolic Laplacian on Maass cusp
forms for SL(2, ℤ).

## Method, and why it is independent of the obvious one

The obvious route — and the one the ledger names — is **Hejhal's method**: collocation on the Fourier expansion of a
Maass form in K-Bessel functions.  This program uses **no Bessel function, no Fourier expansion and no collocation**.
It uses the **Mayer transfer operator** of the Gauss map (Mayer 1991; the paper's own §4.2),

  (L_s f)(z) = ∑_{n≥1} (z + n)^{−2s} f(1/(z + n)),  on functions holomorphic on the disc |z − 1| < 3/2,

whose Fredholm determinants satisfy det(1 − L_s) det(1 + L_s) = Z_Selberg(s) (the paper's (4.3)).  On the line
s = ½ + ir their zeros are exactly the cusp-form parameters (det(1 + L_s) the odd forms, det(1 − L_s) the even ones,
by the Lewis–Zagier parity split), while the scattering resonances s = ρ/2 sit off the line at Re s = ¼.

- **Discretisation.** Taylor basis (z − 1)^k, k < K.  With z = 1 + w, L_s(z − 1)^k = ∑_{j≤k} C(k,j)(−1)^{k−j}
  ζ_H(2s + j, 2 + w), and ζ_H(σ, 2 + w) = ∑_m (−1)^m (σ)_m/m! ζ_H(σ + m, 2) w^m, so the K × K matrix is
  M[m][k] = (−1)^m ∑_j C(k,j)(−1)^{k−j} (2s + j)_m/m! ζ_H(2s + j + m, 2).  The Hurwitz zeta at a = 2
  (`mpmath.zeta(σ, 2)`) is the only special function used.
- **Scan.** |det(1 ∓ M)| along s = ½ + ir, 0.5 ≤ r ≤ 12.6, step 0.1, K = 40, for local minima.
- **Refinement at two truncations.** A complex secant in s from each minimum, at K = 60 and at K = 80 (50 digits).  The
  real part is not imposed: a zero with Re s = ½ is a cusp form, Re s = ¼ a resonance; a secant that leaves the line's
  neighbourhood marks a shallow minimum with no zero.
- **Completeness.** The argument principle on the thin rectangle 0.4 ≤ Re s ≤ 0.6, 0.5 ≤ Im s ≤ 12.6 counts the zeros
  of each determinant near the line; the count must equal the number of cusp-form zeros found.

## Comparison rule

r, rounded half-even to the printed number of decimals, must equal the printed numeral.  Convergence: the K = 60 and
K = 80 zeros must agree to 1e−10.

## How to run

```
cd <repo>/computations/MS-35/impl-b
/opt/homebrew/bin/python3 -I compute.py
```

Self-contained, no input, no network; needs `mpmath` (1.3.0 used).  Single core, about five minutes.

## Pinned output (full text in `output.txt`)

| numeral | printed | computed (K = 80) | K = 60 vs K = 80 | verdict |
|---|---|---|---|---|
| r₁ | 9.5337 | 9.5336952613535575543… (odd: det(1 + L_s)) | 2e−20 | PASS |
| r₂ | 12.173 | 12.17300832467967785… (odd: det(1 + L_s)) | 5e−16 | PASS |

Completeness: two zeros of det(1 + L_s) and none of det(1 − L_s) in the thin rectangle around the line up to
Im s = 12.6, matching the two found.  Both r₁ and r₂ are odd forms; the first even form lies above 12.6.

Incidental cross-check: the scan's minima of det(1 − L_s) refine to the resonances s = ρ/2 at
¼ + 7.067362570867346895…i, ¼ + 10.511019819385777…i and ¼ + 12.505428790072844…i — half the first three
nontrivial zeros of ζ.  The first equals the pole printed at RZ-48 (0.25 + 7.0673625708673469i) to all printed digits,
by a route that shares nothing with that row's program.

**Row verdict: PASS** — both printed values reproduce, at two truncations, with the completeness count matching.
