#!/usr/bin/env python3
"""MS-17, implementation A.

Recomputes the two numerals printed in §2.5 of "The Invariant Structure of the
Modular Surface" (modular-surface-characterization.pdf, revised October 2026;
PDF sha256 b4841489...6e0109e51d6e9d2cb252690f5b13af5), page p08 (cover = p01):

  Lehmer's number ≈ 1.17628   (the smallest known Salem number)
  plastic number  ≈ 1.32472   (the smallest Pisot number)
  "both lie below phi"

Quantities: Lehmer's number = the largest real root of
  L(x) = x^10 + x^9 - x^7 - x^6 - x^5 - x^4 - x^3 + x + 1;
the plastic number = the real root of P(x) = x^3 - x - 1; phi = (1 + sqrt 5)/2.

Method: the real root > 1 of each polynomial by bisection on exact-integer
coefficients evaluated in mpmath at 60 digits (200 halvings), cross-checked
against mpmath.polyroots (all roots, 60 digits, extraprec). Supplementary
(not part of the printed digits): the Salem / Pisot root configuration and the
absence of cyclotomic factors in L, by exact integer polynomial division.
"Smallest known" (Salem) and "smallest" (Pisot; Siegel 1944) are literature
statements and are NOT computed here. No network, no input.
"""
import sys
import time
import mpmath
from mpmath import mp, mpf, sqrt, nint, floor, log10, nstr, polyroots

mp.dps = 60
T0 = time.time()

L = [1, 1, 0, -1, -1, -1, -1, -1, 0, 1, 1]      # x^10 ... x^0
P = [1, 0, -1, -1]                               # x^3 - x - 1


def sig_digits(s):
    mant = s.lower().split("e")[0].lstrip("+-")
    return len(mant.replace(".", "").lstrip("0"))


def agrees(x, s):
    """Agreement at the printed number of significant digits after rounding."""
    p = mpf(s)
    n = sig_digits(s)
    e = int(floor(log10(abs(p))))
    scale = mpf(10) ** (n - 1 - e)
    return nint(x * scale) == nint(p * scale)


def horner(c, x):
    v = mpf(0)
    for a in c:
        v = v * x + a
    return v


def bisect(c, lo, hi, n=200):
    flo = horner(c, lo)
    assert flo * horner(c, hi) < 0, "no sign change on the bracket"
    for _ in range(n):
        mid = (lo + hi) / 2
        fm = horner(c, mid)
        if (fm < 0) == (flo < 0):
            lo, flo = mid, fm
        else:
            hi = mid
    return (lo + hi) / 2


# --- exact integer polynomial helpers (coefficients highest degree first) ---
def pdivmod(a, b):
    a = list(a)
    q = []
    while len(a) >= len(b):
        f = a[0] // b[0]
        assert f * b[0] == a[0]  # b monic here
        q.append(f)
        for i in range(len(b)):
            a[i] -= f * b[i]
        a.pop(0)
    while a and a[0] == 0:
        a.pop(0)
    return q, a


def cyclotomic(n, memo={}):
    if n in memo:
        return memo[n]
    poly = [1] + [0] * (n - 1) + [-1]          # x^n - 1
    for d in range(1, n):
        if n % d == 0:
            poly, r = pdivmod(poly, cyclotomic(d))
            assert not r
    memo[n] = poly
    return poly


print("MS-17 implementation A  (mpmath %s, mp.dps = %d)" % (mpmath.__version__, mp.dps))
print("python", sys.version.split()[0])
print()

lehmer = bisect(L, mpf(1), mpf(2))
plastic = bisect(P, mpf(1), mpf(2))
phi = (1 + sqrt(5)) / 2

rL = polyroots(L, maxsteps=500, extraprec=200)
rP = polyroots(P, maxsteps=500, extraprec=200)
lehmer_pr = max((r.real for r in rL if abs(r.imag) < mpf("1e-40")), default=None)
plastic_pr = max((r.real for r in rP if abs(r.imag) < mpf("1e-40")), default=None)

print("Two methods per number (bisection vs polyroots):")
print(f"  Lehmer : bisection {nstr(lehmer, 45)}")
print(f"           polyroots {nstr(lehmer_pr, 45)}   |diff| = {nstr(abs(lehmer - lehmer_pr), 5)}")
print(f"  plastic: bisection {nstr(plastic, 45)}")
print(f"           polyroots {nstr(plastic_pr, 45)}   |diff| = {nstr(abs(plastic - plastic_pr), 5)}")
print(f"  phi    : {nstr(phi, 45)}")
print()

results = []


def check(label, value, printed):
    ok = agrees(value, printed)
    results.append(ok)
    print(f"  {label:40s} computed {nstr(value, 20):>24s} | printed {printed:>8s}"
          f" ({sig_digits(printed)} s.d.) | {'PASS' if ok else 'FAIL'}")


print("Printed numerals (rule: rounding at the printed number of significant digits):")
check("Lehmer's number", lehmer, "1.17628")
check("plastic number", plastic, "1.32472")
both_below = (lehmer < phi) and (plastic < phi)
results.append(both_below)
print(f"  {'both < phi':40s} {nstr(lehmer, 8)} < {nstr(phi, 8)} and {nstr(plastic, 8)} < {nstr(phi, 8)}"
      f" | {'PASS' if both_below else 'FAIL'}")
print()

print("Supplementary (configuration of the roots; not printed digits):")
mods = sorted(abs(r) for r in rL)
n_out = sum(1 for m in mods if m > 1 + mpf("1e-40"))
n_in = sum(1 for m in mods if m < 1 - mpf("1e-40"))
n_on = len(mods) - n_out - n_in
print(f"  L: roots outside / on / inside the unit circle = {n_out} / {n_on} / {n_in}"
      f"  (Salem configuration is 1 / 8 / 1)")
cyc_hits = [n for n in range(1, 31) if not pdivmod(L, cyclotomic(n))[1]]
print(f"  L: cyclotomic factors Phi_n, n = 1..30 (every n with Euler phi(n) <= 10 is in range): "
      f"{cyc_hits if cyc_hits else 'none'}")
print("     (one root outside, one inside, the rest on the circle, and no cyclotomic factor:")
print("      by Kronecker's theorem L is then irreducible, so Lehmer's number is a Salem number)")
mP = sorted(abs(r) for r in rP)
print(f"  P: |conjugates| = {nstr(mP[0], 12)}, {nstr(mP[1], 12)}  (< 1: Pisot); "
      f"P(+1) = {horner(P, 1)}, P(-1) = {horner(P, -1)} (no rational root: P irreducible)")
print()
print(f"SUMMARY: {sum(results)}/{len(results)} items PASS; " +
      ("ROW PASS" if all(results) else "ROW FAIL"))
print(f"runtime: {time.time() - T0:.3f} s")
