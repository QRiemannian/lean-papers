#!/usr/bin/env python3
"""L:MS-N5b, implementation A.

Recomputes the two ordinates printed in the caption of Figure 1 of
"The Invariant Structure of the Modular Surface" (revised edition, October 2026;
PDF sha256 b4841489...f5b13af5), page p19 (cover = p01), folio 18:

  "The right panel resolves the closest pair, t ~ 32.935 (zeta) and t ~ 33.000 (L)."

with the figure's window 0 <= t <= 40 on s = 1/2 + it.

Quantities: gamma_zeta, the ordinate of the zero of zeta(1/2 + it) near t = 32.9;
gamma_L, the ordinate of the zero of L(1/2 + it, chi_5) near t = 33.0, chi_5 the
real (even, primitive) character mod 5: chi(1), chi(2), chi(3), chi(4) = 1, -1, -1, 1;
and the claim that (gamma_zeta, gamma_L) is the closest zeta/L pair in 0 <= t <= 40.

Method (floating-point reproduction, not a certified enclosure):
  zeta -- sign changes of the Riemann-Siegel function Z(t) (mpmath.siegelz) on a
          grid, each refined by mpmath.findroot; cross-checked against
          mpmath.zetazero(k) and the count mpmath.nzeros(40).
  L    -- the Hardy function Z_chi(t) = exp(i theta(t)) L(1/2 + it, chi_5),
          theta(t) = (t/2) log(5/pi) + Im log Gamma(1/4 + it/2), which is real for
          an even primitive real character (its imaginary part is printed as a
          check); L from mpmath.dirichlet. Sign changes on a grid, refined by
          findroot. Completeness: the number of zeros with 0 < gamma <= 40 is
          computed independently by the argument principle,
          N(40) = theta(40)/pi + (1/pi) arg L(1/2 + 40i), the argument followed
          continuously along the horizontal segment from sigma = 8 to sigma = 1/2,
          and must equal the number of sign changes found.
  Two runs: (dps 30, grid step 0.02) and (dps 50, grid step 0.01); every zero is
  compared across them.
No network, no input.
"""
import sys
import time
import mpmath
from mpmath import (mp, mpf, mpc, siegelz, dirichlet, loggamma, log, pi, exp, findroot,
                    zetazero, nzeros, arg, im, re, nint, floor, log10, nstr)

T0 = time.time()
CHI5 = [0, 1, -1, -1, 1]
TMAX = 40


def sig_digits(s):
    mant = s.lower().split("e")[0].lstrip("+-")
    return len(mant.replace(".", "").lstrip("0"))


def agrees(x, s):
    """Round x at the position of the printed number's last significant digit; compare integers."""
    p = mpf(s)
    n = sig_digits(s)
    e = int(floor(log10(abs(p))))
    scale = mpf(10) ** (n - 1 - e)
    return nint(x * scale) == nint(p * scale)


def theta_chi(t):
    return t / 2 * log(mpf(5) / pi) + im(loggamma(mpf(1) / 4 + mpc(0, t) / 2))


def Zchi_complex(t):
    return exp(mpc(0, theta_chi(t))) * dirichlet(mpc(mpf(1) / 2, t), CHI5)


def Zchi(t):
    return re(Zchi_complex(t))


def scan(f, a, b, h):
    roots = []
    n = int(nint((b - a) / h))
    fa = f(a)
    for i in range(1, n + 1):
        t2 = a + i * h
        fb = f(t2)
        if fa * fb < 0:
            roots.append(findroot(f, (t2 - h, t2), solver="anderson"))
        fa = fb
    return roots


def arg_count_L(T):
    """theta(T)/pi + (1/pi) arg L(1/2 + iT), arg continued from sigma = 8 along Im s = T."""
    sig0 = mpf(8)
    a0 = arg(dirichlet(mpc(sig0, T), CHI5))
    tot = a0
    steps = 4000
    for i in range(1, steps + 1):
        sg = sig0 - (sig0 - mpf(1) / 2) * i / steps
        a1 = arg(dirichlet(mpc(sg, T), CHI5))
        d = a1 - a0
        while d > pi:
            d -= 2 * pi
        while d < -pi:
            d += 2 * pi
        tot += d
        a0 = a1
    return theta_chi(T) / pi, tot / pi


def run(dps, h):
    mp.dps = dps
    hh = mpf(h)
    zz = scan(lambda t: siegelz(t), mpf(0), mpf(TMAX), hh)
    lz = scan(Zchi, mpf(0), mpf(TMAX), hh)
    return zz, lz


print("L:MS-N5b implementation A  (mpmath %s)" % mpmath.__version__)
print("python %s" % sys.version.split()[0])
print()

results = {}
for dps, h in ((30, "0.02"), (50, "0.01")):
    t0 = time.time()
    results[dps] = run(dps, h)
    print("run dps %d, grid step %s: %d zeta zeros, %d L zeros in (0, %d]  (%.1f s)"
          % (dps, h, len(results[dps][0]), len(results[dps][1]), TMAX, time.time() - t0))
mp.dps = 50
zz30, lz30 = results[30]
zz, lz = results[50]
assert len(zz30) == len(zz) and len(lz30) == len(lz)
print("  max |zero(dps30) - zero(dps50)|: zeta %s, L %s"
      % (nstr(max(abs(a - b) for a, b in zip(zz30, zz)), 3), nstr(max(abs(a - b) for a, b in zip(lz30, lz)), 3)))
print()

print("Checks:")
nz = nzeros(TMAX)
print("  zeta: mpmath.nzeros(40) = %d ; zeros found = %d" % (nz, len(zz)))
dz = max(abs(zz[k] - im(zetazero(k + 1))) for k in range(len(zz)))
print("  zeta: max |found - mpmath.zetazero(k)| over k = 1..%d : %s" % (len(zz), nstr(dz, 3)))
mxim = mpf(0)
for k in range(0, 4001, 50):
    v = Zchi_complex(mpf(k) / 100)
    mxim = max(mxim, abs(im(v)) / abs(v))
print("  L: max |Im Z_chi(t)|/|Z_chi(t)| on t = 0, 0.5, ..., 40 : %s (real on the line)" % nstr(mxim, 3))
th, S = arg_count_L(mpf(TMAX))
NL = th + S
print("  L: argument principle N(40) = theta(40)/pi + S(40) = %s + %s = %s ; zeros found = %d"
      % (nstr(th, 12), nstr(S, 12), nstr(NL, 12), len(lz)))
print("  L: max |L(1/2 + i gamma, chi_5)| at the refined zeros: %s"
      % nstr(max(abs(dirichlet(mpc(mpf(1) / 2, g), CHI5)) for g in lz), 3))
print()

print("zeta zeros in (0, 40]: " + ", ".join(nstr(g, 12) for g in zz))
print("L(s, chi_5) zeros in (0, 40]: " + ", ".join(nstr(g, 12) for g in lz))
print()

pairs = sorted(((abs(a - b), a, b) for a in zz for b in lz), key=lambda x: x[0])
gap, gz, gl = pairs[0]
print("Closest zeta/L pairs in 0 <= t <= 40:")
for d, a, b in pairs[:3]:
    print("  |%s - %s| = %s" % (nstr(a, 14), nstr(b, 14), nstr(d, 10)))
mzz = min(zz[i + 1] - zz[i] for i in range(len(zz) - 1))
mll = min(lz[i + 1] - lz[i] for i in range(len(lz) - 1))
print("  (for reference: least zeta/zeta gap %s, least L/L gap %s)" % (nstr(mzz, 6), nstr(mll, 6)))
print()

gamma_zeta = min(zz, key=lambda g: abs(g - mpf("32.9")))
gamma_L = min(lz, key=lambda g: abs(g - mpf("33.0")))
print("gamma_zeta (near 32.9) = %s" % nstr(gamma_zeta, 25))
print("gamma_L    (near 33.0) = %s" % nstr(gamma_L, 25))
print()
print("Printed numerals and claims (rule: round at the printed number's last significant digit, compare integers):")
npass = 0
for name, val, pr in (("gamma_zeta", gamma_zeta, "32.935"), ("gamma_L", gamma_L, "33.000")):
    ok = agrees(val, pr)
    npass += ok
    print("  %-44s computed %22s | printed %7s (%d s.d.) | %s"
          % (name, nstr(val, 16), pr, sig_digits(pr), "PASS" if ok else "FAIL"))
ok_pair = (gz == gamma_zeta and gl == gamma_L and pairs[1][0] > gap)
npass += ok_pair
print("  %-44s closest pair (%s, %s), gap %s; next %s | %s"
      % ("closest zeta/L pair in 0 <= t <= 40", nstr(gz, 8), nstr(gl, 8), nstr(gap, 6), nstr(pairs[1][0], 6),
         "PASS" if ok_pair else "FAIL"))
ok_count = (len(zz) == nz) and (abs(NL - len(lz)) < mpf("1e-6"))
npass += ok_count
print("  %-44s zeta %d = nzeros %d ; L %d = argument-principle %s | %s"
      % ("scan completeness on the window", len(zz), nz, len(lz), nstr(NL, 8), "PASS" if ok_count else "FAIL"))
print()
print("%d of 4 PASS" % npass)
print("runtime %.1f s" % (time.time() - T0))
