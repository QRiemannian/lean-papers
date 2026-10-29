# MS-33 · implementation A

**Paper.** *The Invariant Structure of the Modular Surface* (`modular-surface-characterization.pdf`), revised October
2026, sha256 `b4841489ec6bea619f8d5525ce4c788b86e0109e51d6e9d2cb252690f5b13af5` (checked before this program was
written). Pages counted with the cover as p01.

## The printed claim (quoted exactly, `pdftotext -layout`)

**p13, §3.4**, after the maximality statement for `𝑔𝑐 = 1/(𝜋√𝑑𝐾)` over real quadratic fields:

> "The content is upstream — a fact about the ordering of number fields, not about the modular surface — and it does
> not distinguish 𝑋(1): nine of the curves Γ0(𝑁) with 𝑁 ≤ 60 return the same value exactly."

## The quantity — pinned from the record, because the print does not define it

The printed sentence does not say what rule a curve Γ₀(N)\ℍ "returns" a value under. The rule is pinned from the
lab's investigation record that produced the sentence (the GC-GEOMETRY-DIG session of 2026-08-16: seat 1 §2.6
"R-6 — non-uniqueness", the synthesis row C-3, the rigorous-grounding seat §3.2):

> "Under the χ-reading the composite is 1/(π·√d_K) — a function of the marked field alone. So every object with the
> same marked field has the identical value." The marked field is "the field of the shortest geodesic"; the record
> applies it to Γ(3) as "t_min = 7, 7² − 4 = 45 = 9·5", i.e. field ℚ(√5).

So, for each N ≤ 60:

- `t_min(N)` = the smallest |trace| of a hyperbolic element of Γ₀(N) (the systolic class; the systole is
  `2 arccosh(t_min/2)`);
- the marked field `K_N = ℚ(√(t_min² − 4))`, `d_K` its fundamental discriminant;
- the returned value `1/(π√d_K)`; "the same value exactly" as X(1) = Γ₀(1) (t_min = 3, d_K = 5) ⇔ `d_K(N) = 5`,
  an exact integer equality.

This is **reading R1** (the record's stated rule) and it carries the row's verdict. The record's own enumeration used a
narrower criterion — "which Γ₀(N) contain a trace-3 hyperbolic element (hence d_K = 5)" — which is **reading R2**
(equivalently: the curve's systole equals X(1)'s, 4 log φ). R2 implies R1; the converse fails. The program reports
both.

## Method

Exact integer arithmetic only. Γ₀(N) contains an element of trace t if and only if `a² − ta + 1 ≡ 0 (mod N)` has a
solution: the witness is `[[a, −(a² − ta + 1)/N], [N, t − a]]`, and conversely `N | c` with `ad − bc = 1`, `d = t − a`,
gives `a(t − a) ≡ 1 (mod N)`. Since 3 is the smallest hyperbolic |trace| in SL(2, ℤ) and −I ∈ Γ₀(N), `t_min(N)` is the
first t = 3, 4, 5, … with a solution. Every witness matrix is constructed and its determinant, trace and lower-left
divisibility are asserted. The fundamental discriminant is computed from the squarefree part of `t² − 4`. The full
per-N table (t_min, t² − 4, d_K, witness) is printed. No convergence question arises (finite exact computation).

## Comparison rule

The printed "nine" is an exact count (the record's nine include N = 1, i.e. X(1) itself); agreement is integer equality.

## How to run

```
cd <repo>/computations/MS-33/impl-a
/opt/homebrew/bin/python3 -I compute.py
```

No network, no input; Python 3, standard library only.

## Pinned output (`output.txt`) — the result: FAIL under R1, nine under R2

| reading | the set of N ≤ 60 | count | printed | verdict |
|---|---|---|---|---|
| **R1** (record's rule: marked field ℚ(√5), d_K = 5) | {1, 5, **9**, 11, 19, 29, 31, 41, **45**, 55, **57**, 59} | **12** | nine | **FAIL** |
| R2 (record's criterion: a trace-3 element, systole 4 log φ) | {1, 5, 11, 19, 29, 31, 41, 55, 59} | 9 | nine | PASS |

The three extra curves under R1 are Γ₀(9), Γ₀(45), Γ₀(57): each has no hyperbolic element of trace 3, 4, 5 or 6 and has
one of trace 7 (witnesses `[[2,1],[9,5]]`, `[[11,−1],[45,−4]]`, `[[17,−3],[57,−10]]`, as printed in `output.txt`), so t_min = 7, `7² − 4 = 45 = 9·5`, and
the marked field is ℚ(√5) — the same mechanism the record itself names for Γ(3). The printed "nine" therefore holds
only under R2; under the rule the record states for the value, twelve curves with N ≤ 60 (eleven besides X(1)) return
`1/(π√5)` exactly. Reported as computed; the choice between R1 and R2 is the statement-pinning question this row
already carried, and it is not resolved by this program.
