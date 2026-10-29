# RZ-48 · implementation A

**Paper.** *The Tetrahedral Structure of the Riemann Zeta Function*, revised edition, October 2026 —
`riemann-zeta-tetrahedral.pdf`, sha256 `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
(checked before this program was written). Pages counted with the cover as p01.

## The printed claim (quoted exactly, `pdftotext -layout`)

**p19, §7.4, the paragraph after (7.5)**, where (7.5) is
`𝜙(𝑠) = Λ(2𝑠 − 1)/Λ(2𝑠) = 𝜋^{−𝑠+1/2} Γ(𝑠 − 1/2) 𝜁(2𝑠 − 1) / (𝜋^{−𝑠} Γ(𝑠) 𝜁(2𝑠))` and `Λ(𝑠) ∶= 𝜋^{−𝑠/2} Γ(𝑠/2) 𝜁(𝑠)`:

> "The numerical values used in this convention are 𝜙(𝜌1) = 0.537602 − 0.843199𝑖, with the first pole at
> 𝑠 = 0.25 + 7.0673625708673469𝑖; with the 𝜉 of (12.4) in place of Λ the same point gives
> 𝜙(𝜌1) = 0.595838 − 0.803105𝑖."

## The quantities

- `ρ₁ = 1/2 + iγ₁`, the first nontrivial zero of ζ (γ₁ ≈ 14.1347). This is the reading under which the printed values
  sit on the unitary line: `|0.537602 − 0.843199i| = 1` to the printed digits, as the same paragraph says (`|φ| = 1` on
  `Re s = 1/2`).
- `Λ(s) = π^{−s/2} Γ(s/2) ζ(s)`; `φ_Λ(s) = Λ(2s − 1)/Λ(2s)` (7.5).
- `ξ(s) = ½ s(s − 1) Λ(s)` (the paper's (12.4)); `φ_ξ(s) = ξ(2s − 1)/ξ(2s)`.
- The first pole of `φ_Λ`: `s = ρ₁/2` (a zero of `Λ(2s)`), printed as `0.25 + 7.0673625708673469i`.

## Method

Direct evaluation with `mpmath.gamma` and `mpmath.zeta` (complex arguments). γ₁ is located by `mpmath.findroot` on the
Riemann–Siegel function `Z(t)` (`mpmath.siegelz`) from the seed t = 14, and cross-checked against `mpmath.zetazero(1)`.
Convergence check: the whole computation is run at 50 and at 80 significant digits; the two agree to < 4 × 10⁻⁵¹.
Internal checks printed: `|ζ(ρ₁)|` ≈ 4 × 10⁻⁵¹; `|φ_Λ(ρ₁)| = |φ_ξ(ρ₁)| = 1`; `φ_ξ/φ_Λ = (s − 1)/s` at ρ₁ to 5 × 10⁻⁵²
(the paper's convention factor); `|1/φ_Λ(ρ₁/2)| = |Λ(ρ₁)/Λ(ρ₁ − 1)|` ≈ 5 × 10⁻⁵¹ (the pole).

## Comparison rule

Agreement at the printed number of significant digits after rounding, real and imaginary parts compared separately
(round the computed value at the decimal position of the printed number's last significant digit; compare integers).

## How to run

```
cd <repo>/computations/RZ-48/impl-a
/opt/homebrew/bin/python3 -I compute.py
```

No network, no input; Python 3 with `mpmath`.

## Pinned output (`output.txt`) — the result: 6 of 6 PASS

| item | printed | computed | verdict |
|---|---|---|---|
| φ_Λ(ρ₁), real | 0.537602 | 0.537601911401362344 | PASS |
| φ_Λ(ρ₁), imag | −0.843199 | −0.843198781342573901 | PASS |
| first pole, real | 0.25 | 0.25 | PASS |
| first pole, imag | 7.0673625708673469 | 7.06736257086734689523 | PASS |
| φ_ξ(ρ₁), real | 0.595838 | 0.595838042028956615 | PASS |
| φ_ξ(ρ₁), imag | −0.803105 | −0.803104618135831249 | PASS |
