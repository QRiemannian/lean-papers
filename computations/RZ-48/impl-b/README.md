# RZ-48 — implementation B

**Paper.** *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026), served PDF
`https://qriemannian.ai/pdfs/riemann-zeta-tetrahedral.pdf`, sha256
`2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54` (checked with `shasum -a 256`, 2026-10-28T20:21Z).
Page numbers are PDF page indices, cover = p01.

## The printed claim (verbatim from `pdftotext -layout`, p19, §7.4, the paragraph after display (7.5))

"Write Λ(s) ∶= π^{−s/2} Γ(s/2) ζ(s) for the completed zeta without the ½s(s − 1) factor; the entire function
ξ(s) = ½ s(s − 1) Λ(s) of (12.4) is used elsewhere in this paper … φ(s) = Λ(2s − 1)/Λ(2s) =
π^{−s+1/2} Γ(s − 1/2) ζ(2s − 1) / (π^{−s} Γ(s) ζ(2s)). (7.5)
The numerical values used in this convention are φ(ρ₁) = 0.537602 − 0.843199i, with the first pole at
s = 0.25 + 7.0673625708673469i; with the ξ of (12.4) in place of Λ the same point gives φ(ρ₁) = 0.595838 − 0.803105i."

## The quantities, defined

- ρ₁ = the nontrivial zero of ζ with the smallest positive imaginary part.
- φ(ρ₁) = Λ(2ρ₁ − 1)/Λ(2ρ₁), Λ(s) = π^{−s/2} Γ(s/2) ζ(s) — display (7.5) evaluated at s = ρ₁.
- "the first pole": φ has a pole at s = ρ/2 for each nontrivial zero ρ (the paper's next paragraph: "a zero ρ
  contributes a pole at s = ρ/2"); the first is ρ₁/2.
- the ξ-convention value: ξ(2ρ₁ − 1)/ξ(2ρ₁), ξ(s) = ½ s(s − 1) Λ(s).

## Method, and why it is independent of the obvious one

The obvious route is `mpmath.zetazero(1)`, `mpmath.zeta`, `mpmath.gamma`.  Here `mpmath` is used **only as a
multiprecision number type** (mpf/mpc arithmetic, exp, log, pi, powers); every special function is written in the
program:

- **ζ(s)** by P. Borwein's algorithm 2 (Borwein 2000, *An efficient algorithm for the Riemann zeta function*): η(s)
  from the weights d_k = n ∑_{i≤k} (n+i−1)! 4^i/((n−i)!(2i)!), held as exact integers, then ζ = η/(1 − 2^{1−s}).
- **log Γ(z)** by Stirling's series with exact Bernoulli numbers (computed in the program as Fractions by the
  Akiyama–Tanigawa recurrence) after an upward shift z → z + N.
- **ρ₁** by a complex secant iteration on this ζ from 0.5 + 14.1i and 0.5 + 14.2i; the real part is **not imposed**,
  it is read back (Re ρ₁ − ½ = 1e−91).
- **ρ₁ is the first zero**: the argument principle with this ζ on the rectangle −0.5 ≤ Re s ≤ 1.5, |Im s| ≤ 14.5 gives
  winding number 1 = (#zeros) − 1 (the pole at s = 1); zeros come in conjugate pairs, so ρ₁ and its conjugate are the
  only zeros there.
- φ(ρ₁) is evaluated **two ways**: literally as printed, Λ(2s − 1)/Λ(2s), and through Λ(z) = Λ(1 − z) as
  Λ(2 − 2s)/Λ(2s), which keeps every ζ argument on Re = 1.  They agree to 6e−89.

**Convergence.** Two settings — (60 digits, Borwein n = 120, Stirling shift 40, 30 Bernoulli terms) and (90 digits,
n = 200, shift 70, 50 terms) — both printed; they must agree to 1e−40 (they agree to 2e−59).

## Comparison rule

Each real and imaginary part, rounded half-even to the printed number of decimal places, must equal the printed
numeral.

## How to run

```
cd <repo>/computations/RZ-48/impl-b
/opt/homebrew/bin/python3 -I compute.py
```

Self-contained, no input, no network; needs `mpmath` (1.3.0 used, as a number type only).  Runtime under a second.

## Pinned output (full text in `output.txt`)

| numeral | printed | computed | verdict |
|---|---|---|---|
| Re φ(ρ₁) | 0.537602 | 0.537601911401362343808987… | PASS |
| Im φ(ρ₁) | −0.843199 | −0.843198781342573901118608… | PASS |
| first pole, real part | 0.25 | 0.25 (Re ρ₁/2; Re ρ₁ − ½ = 1e−91) | PASS |
| first pole, imaginary part | 7.0673625708673469 | 7.06736257086734689522863… | PASS |
| Re, ξ-convention | 0.595838 | 0.595838042028956614867076… | PASS |
| Im, ξ-convention | −0.803105 | −0.80310461813583124893077… | PASS |

Also shown: ρ₁ = ½ + 14.134725141734693790457251983562470270784…i; |φ(ρ₁)| = 1 and |(ρ₁ − 1)/ρ₁| = 1 (the paper's
unitarity remark), and φ_ξ/φ = (s − 1)/s at ρ₁ (the paper's conversion factor).

**Row verdict: PASS** — all six printed numerals reproduce.
