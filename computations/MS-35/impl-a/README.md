# MS-35 · implementation A

**Paper.** *The Invariant Structure of the Modular Surface* (`modular-surface-characterization.pdf`), revised October
2026, sha256 `b4841489ec6bea619f8d5525ce4c788b86e0109e51d6e9d2cb252690f5b13af5` (checked before this program was
written). Pages counted with the cover as p01.

## The printed claim (quoted exactly, `pdftotext -layout`)

**p14, §4.1, (4.2):** "The arithmetic content of the spectrum — which values

    𝑟1 ≈ 9.5337,   𝑟2 ≈ 12.173,   …   (4.2)

actually appear on 𝑋(1), with what multiplicities — is determined not by the Casimir but by the lattice SL(2, ℤ)
together with its Hecke operators"

with (4.1) `𝜆 = 1/4 + 𝑟²` the Laplace eigenvalue of a Maass cusp form on X(1).

## The quantity

`r₁ < r₂` are the spectral parameters of the first two Maass cusp forms on X(1) = SL(2, ℤ)\ℍ, ordered by r
(eigenvalue `λ = 1/4 + r²` of the hyperbolic Laplacian). A Maass cusp form of parity even/odd has the expansion
`f(z) = Σ_{n≥1} c_n √y K_{ir}(2πny) cos(2πnx)` / `… sin(2πnx)`, normalised `c_1 = 1`.

## Method — Hejhal's collocation method (one method; not a certified enclosure)

Floating arithmetic in `mpmath` at 50 significant digits (`K_{ir}` = `mpmath.besselk` of imaginary order).

1. Q points `z_j = x_j + iY`, `x_j = (j − ½)/(2Q)`, j = 1 … Q, on a horocycle below the fundamental domain are pulled
   back to `z_j*` in the standard fundamental domain. Automorphy `f(z_j) = f(z_j*)` and discrete orthogonality give, for
   m = 1 … M, `c_m √Y K_{ir}(2πmY) = (2/Q) Σ_j f(z_j*) cs(2πm x_j)`, with f truncated at M terms. With `c_1 = 1`, the
   equations m = 2 … M are solved for `c_2 … c_M`.
2. At a true eigenvalue the solution does not depend on Y. The test function is `H(r) = c_2(Y₁) − c_2(Y₂)`,
   Y₁ = 0.80, Y₂ = 0.70 (both below √3/2).
3. **Scan:** r from 1.0 to 13.5 in steps of 0.1, both parities, at (M, Q) = (8, 12); every sign change of H is refined
   by the secant method at (M, Q) = (14, 22). A root is **accepted** only if it stays in its bracket and the Hecke
   relations `c_2 c_3 = c_6` and `c_4 = c_2² − 1` hold to 10⁻⁸. Poles and spurious zeros of H fail the Hecke relations
   and are rejected. A secant run that leaves its bracket and lands on a root already found is rejected as well.
   All rejections are printed. The scan finds no even form below 13.5. It finds exactly two odd forms, and these are
   r₁ and r₂. That fixes the indexing, and it agrees with the standard tables (the first even form is at r ≈ 13.78; that is a literature value, not computed here).
4. **Convergence check:** each accepted root is refined again at two truncations, (M, Q) = (14, 22) and (20, 30). Both
   values are printed, with their difference and the Hecke residuals.

The neglected tail at the pulled-back points (y* ≥ √3/2) is of relative size about `e^{−2π M √3/2} / e^{−πr/2}`,
below 10⁻¹⁵ even in the scan. This is a non-rigorous reproduction of the printed digits. A certified enclosure would
need interval arithmetic, which is outside this program.

## Comparison rule

Agreement at the printed number of significant digits after rounding: round at the decimal position of the printed
number's last significant digit, then compare integers.

## How to run

```
cd <repo>/computations/MS-35/impl-a
/opt/homebrew/bin/python3 -I compute.py
```

No network, no input. Python 3 with `mpmath`. The run takes about 16 minutes on one core, almost all of it in the scan.
The pinned run added `-u` (unbuffered stdout) only.

## Pinned output (`output.txt`): 2 of 2 PASS

| item | printed | computed, (M, Q) = (20, 30) | (14, 22) vs (20, 30) | verdict |
|---|---|---|---|---|
| r₁ (odd) | 9.5337 | 9.5336952613535575543 | 2.4 × 10⁻³⁴ | PASS |
| r₂ (odd) | 12.173 | 12.17300832467967785 | 1.7 × 10⁻³⁴ | PASS |

The Hecke residuals at the accepted roots are below 10⁻⁴⁰ at (20, 30). For the first form, c₂ = −1.06833355122; for
the second, c₂ = 0.289251871462.
