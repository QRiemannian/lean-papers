#!/usr/bin/env python3
"""MS-33, implementation A.

The printed sentence (§3.4 of "The Invariant Structure of the Modular Surface",
modular-surface-characterization.pdf, revised October 2026, PDF sha256
b4841489...6e0109e51d6e9d2cb252690f5b13af5, page p13, cover = p01):

  "... it does not distinguish X(1): nine of the curves Gamma_0(N) with N <= 60
   return the same value exactly."

The printed text does not define the per-curve rule; it is PINNED here from the
investigation record (see README.md): the value a curve "returns" is the field
certificate g(Gamma) = 1 / (pi sqrt(d_K)), where K = Q(sqrt(t_min^2 - 4)) is the
marked field of Gamma -- the quadratic field of its systolic (minimal |trace|)
hyperbolic class -- and d_K is the fundamental discriminant of K. X(1) =
Gamma_0(1) has t_min = 3, K = Q(sqrt 5), d_K = 5, g = 1/(pi sqrt 5).
"The same value exactly" = d_K(N) = 5, an exact integer equality.

Method (exact integer arithmetic only):
  Gamma_0(N) contains an element of trace t  <=>  a^2 - t a + 1 = 0 (mod N) is
  solvable  (witness [[a, -(a^2 - t a + 1)/N], [N, t - a]]; conversely N | c and
  ad - bc = 1 give a(t - a) = 1 mod N). For each N the smallest t >= 3 with a
  solution is t_min (|t| = 3 is the smallest hyperbolic trace in SL(2, Z), and
  -I in Gamma_0(N) makes the sign irrelevant). Every witness is built and its
  determinant and lower-left entry are checked. No network, no input.
"""
import sys
import time
from math import isqrt

T0 = time.time()
NMAX = 60
PRINTED_COUNT = 9


def squarefree_part(n):
    m, p = 1, 2
    while p * p <= n:
        e = 0
        while n % p == 0:
            n //= p
            e += 1
        if e % 2:
            m *= p
        p += 1
    return m * n


def fundamental_discriminant(D):
    m = squarefree_part(D)
    return m if m % 4 == 1 else 4 * m


def trace_witness(N, t):
    for a in range(N):
        if (a * a - t * a + 1) % N == 0:
            b = -(a * a - t * a + 1) // N
            c, d = N, t - a
            assert a * d - b * c == 1 and c % N == 0 and a + d == t
            return (a, b, c, d)
    return None


print("MS-33 implementation A  (exact integer arithmetic)")
print("python", sys.version.split()[0])
print()
print(f"{'N':>3} {'t_min':>5} {'t^2-4':>6} {'d_K':>5}  witness [[a,b],[c,d]] in Gamma_0(N)")
rows = []
for N in range(1, NMAX + 1):
    t = 3
    while True:
        w = trace_witness(N, t)
        if w:
            break
        t += 1
    dK = fundamental_discriminant(t * t - 4)
    rows.append((N, t, dK, w))
    a, b, c, d = w
    mark = "  <- d_K = 5" if dK == 5 else ""
    print(f"{N:>3} {t:>5} {t * t - 4:>6} {dK:>5}  [[{a},{b}],[{c},{d}]]{mark}")

same = [N for (N, t, dK, w) in rows if dK == 5]
trace3 = [N for (N, t, dK, w) in rows if t == 3]
print()
print(f"N <= {NMAX} with marked field Q(sqrt 5) (d_K = 5, value 1/(pi sqrt 5) exactly): {same}")
print(f"  count = {len(same)}  (includes N = 1, i.e. X(1) itself; N != 1: {len(same) - 1})")
print(f"N <= {NMAX} containing a trace-3 element: {trace3}  (count {len(trace3)})")
print(f"  marked field Q(sqrt 5) reached with t_min > 3 for any N <= {NMAX}: "
      f"{sorted(set(same) - set(trace3)) or 'none'}")
print()
ok = len(same) == PRINTED_COUNT
ok_t3 = len(trace3) == PRINTED_COUNT
print("Reading R1 (the record's stated rule, the PRIMARY reading): value = 1/(pi sqrt d_K) of the")
print("  marked field Q(sqrt(t_min^2 - 4)); 'same value exactly' <=> d_K = 5.")
print(f"  printed: nine (= {PRINTED_COUNT}, counting N = 1)   computed: {len(same)}   "
      f"rule: exact integer equality -> {'PASS' if ok else 'FAIL'}")
print("Reading R2 (the record's enumeration criterion, SECONDARY): Gamma_0(N) contains a trace-3")
print("  element, i.e. t_min = 3 and systole = 2 arccosh(3/2) = 4 log phi, the same as X(1).")
print(f"  printed: nine   computed: {len(trace3)}   rule: exact integer equality -> "
      f"{'PASS' if ok_t3 else 'FAIL'}")
print("  (R2 implies R1 but not conversely: t_min = 7 gives 7^2 - 4 = 45 = 9 * 5, field Q(sqrt 5).)")
print()
print(f"SUMMARY: {'ROW PASS' if ok else 'ROW FAIL'} under the primary reading R1 "
      f"(computed {len(same)}, printed 9); R2 reproduces nine. See README.")
print(f"runtime: {time.time() - T0:.3f} s")
