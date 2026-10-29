# MS-33 — implementation B

**Paper.** *The Invariant Structure of the Modular Surface* (2026, revised October 2026), served PDF
`https://qriemannian.ai/pdfs/modular-surface-characterization.pdf`, sha256
`b4841489ec6bea619f8d5525ce4c788b86e0109e51d6e9d2cb252690f5b13af5` (checked with `shasum -a 256`, 2026-10-28T20:21Z).
Page numbers are PDF page indices, cover = p01.

## The printed claim (verbatim from `pdftotext -layout`, p13, §3.4)

"Written form-independently, g_c = 1/(π√d_K) is a field certificate, and ℚ(√5) has the smallest discriminant of any
real quadratic field — the ladder runs 5, 8, 12, 13, 17, 21, … [CV]. … The content is upstream — a fact about the
ordering of number fields, not about the modular surface — and it does not distinguish X(1): nine of the curves
Γ0(N) with N ≤ 60 return the same value exactly."

## The quantity, defined

The printed text does not say how a curve "returns" a value.  This program uses the rule of the lab's own
investigation record behind the sentence (an internal working record of 2026-08-16): a curve's **marked field** is
the field of its **systolic** hyperbolic element, and its value is 1/(π√d_K) with d_K the fundamental discriminant of
that field.  For Γ0(N):

- t_min(N) = the least |trace| > 2 over the hyperbolic elements of Γ0(N) (the systole is 2 arccosh(t_min/2));
- d_K(N) = the fundamental discriminant of ℚ(√(t_min² − 4));
- value(N) = 1/(π√d_K(N)); it equals X(1)'s value g_c = 1/(π√5) exactly iff d_K(N) = 5.

**The count** is #{N ≤ 60 : d_K(N) = 5}; Γ0(1) = SL(2, ℤ), i.e. X(1) itself, is included, as in the record.  The
record's own census used the narrower test "Γ0(N) contains an element of trace 3"; the program prints both counts.

## Method, and why it is independent of the obvious one

Exact integer arithmetic.  The key fact: Γ0(N) contains an element of trace t iff x² − t x + 1 ≡ 0 (mod N) is
solvable (an element (a b; c d) with N | c has ad ≡ 1, so x = a solves it; conversely a = x, d = t − x, c = N,
b = (ad − 1)/N is an element).  The obvious route is to search x mod N (or small matrices) directly.  This program
decides t_min **two ways that share only that fact**:

- **(A) local criterion, no search:** solvability is decided prime power by prime power from the factorisation of
  N — for odd p by whether t² − 4 is a square mod p^e (Euler's criterion on the unit part, parity of the p-adic
  valuation); for p = 2 by parity of t and the 2-adic square classes (mod 2, 4, 8) of (t/2)² − 1.
- **(B) witness and exclusion:** an explicit matrix in Γ0(N) with trace t_min is built and its determinant, lower-left
  divisibility and trace are asserted; every smaller trace 3 ≤ t < t_min is excluded by exhausting x mod N.

The two derivations must give the same t_min for all 60 levels (they do).  d_K is the fundamental discriminant of the
squarefree kernel of t_min² − 4.

## Comparison rule

The count is an exact integer; PASS iff it equals the printed nine.

## How to run

```
cd <repo>/computations/MS-33/impl-b
/opt/homebrew/bin/python3 -I compute.py
```

Self-contained, no input, no network, standard library only.  Runtime well under a second.  The output lists, for
every N ≤ 60, t_min, the witness matrix, t_min² − 4, d_K and the value.

## Pinned output (full text in `output.txt`)

| quantity | printed | computed | verdict |
|---|---|---|---|
| #{N ≤ 60 : d_K(N) = 5} — the value rule | nine | **12**: N = 1, 5, 9, 11, 19, 29, 31, 41, 45, 55, 57, 59 | **FAIL** |
| #{N ≤ 60 : Γ0(N) contains a trace-3 element} — the record's census test | (nine) | 9: N = 1, 5, 11, 19, 29, 31, 41, 55, 59 | equals the print |

**Row verdict: FAIL** under the value rule.  Γ0(9), Γ0(45) and Γ0(57) contain no element of trace 3 (or 4, 5, 6);
their systolic trace is 7, and 7² − 4 = 45 = 9·5, so their marked field is ℚ(√5) and they return g_c exactly as well
(witnesses: (2 1; 9 5), (11 −1; 45 −4), (17 −3; 57 −10)).  The printed "nine" equals the count of levels containing a
trace-3 element — a sufficient condition for d_K = 5, not a necessary one.  Read as "at least nine", the sentence is
true; read as "exactly nine return the same value", the computed count is twelve.  Nothing was adjusted to fit.
