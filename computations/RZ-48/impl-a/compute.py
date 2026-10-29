#!/usr/bin/env python3
"""RZ-48, implementation A.

Recomputes the three numerals printed in §7.4 (the paragraph after (7.5)) of
"The Tetrahedral Structure of the Riemann Zeta Function" (revised edition,
October 2026; PDF sha256 2d5287e7...0f533e54), page p19 (cover = p01):

  phi(rho_1) = 0.537602 - 0.843199 i                (Lambda convention, (7.5))
  first pole at s = 0.25 + 7.0673625708673469 i
  phi(rho_1) = 0.595838 - 0.803105 i                (xi of (12.4) in place of Lambda)

Method: direct evaluation with mpmath's gamma() and zeta() at 50 and at 80
significant digits (the two must agree); rho_1 = 1/2 + i gamma_1 located by
mpmath.findroot on the Riemann-Siegel function Z(t) from the seed t = 14,
and cross-checked against mpmath.zetazero(1). No network, no input.
"""
import sys
import time
import mpmath
from mpmath import mp, mpf, mpc, pi, gamma, zeta, nint, floor, log10, nstr

T0 = time.time()


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


def Lam(s):
    """Lambda(s) = pi^{-s/2} Gamma(s/2) zeta(s): completed zeta WITHOUT s(s-1)/2."""
    return pi ** (-s / 2) * gamma(s / 2) * zeta(s)


def xi(s):
    """xi(s) = (1/2) s (s-1) Lambda(s), the entire function of (12.4)."""
    return s * (s - 1) / 2 * Lam(s)


def phi_Lambda(s):
    return Lam(2 * s - 1) / Lam(2 * s)


def phi_xi(s):
    return xi(2 * s - 1) / xi(2 * s)


def run(dps):
    mp.dps = dps
    g1 = mpmath.findroot(mpmath.siegelz, mpf(14))
    g1_ref = mpmath.zetazero(1).imag
    rho1 = mpc(mpf(1) / 2, g1)
    return {
        "gamma1": g1,
        "gamma1_ref": g1_ref,
        "rho1": rho1,
        "pole": rho1 / 2,
        "phiL": phi_Lambda(rho1),
        "phiX": phi_xi(rho1),
        "ratio": phi_xi(rho1) / phi_Lambda(rho1),
        "conv": (rho1 - 1) / rho1,
        "zeta_at_rho1": abs(zeta(rho1)),
        "inv_phi_at_pole": abs(Lam(rho1) / Lam(rho1 - 1)),  # = |1/phi_Lambda(rho1/2)|
    }


print("RZ-48 implementation A  (mpmath %s)" % mpmath.__version__)
print("python", sys.version.split()[0])
print()
R50 = run(50)
R80 = run(80)
mp.dps = 50
print("Precision check (dps 50 vs dps 80):")
for k in ("gamma1", "phiL", "phiX"):
    print(f"  {k:7s}: |dps50 - dps80| = {nstr(abs(R50[k] - R80[k]), 5)}")
print()
R = R50
print(f"gamma_1 (findroot on Z(t), seed 14) = {nstr(R['gamma1'], 40)}")
print(f"gamma_1 (mpmath.zetazero(1))        = {nstr(R['gamma1_ref'], 40)}")
print(f"  |zeta(rho_1)| = {nstr(R['zeta_at_rho1'], 5)}")
print(f"phi_Lambda(rho_1)  = {nstr(R['phiL'], 30)}")
print(f"  |phi_Lambda(rho_1)| = {nstr(abs(R['phiL']), 30)}  (unitarity on Re s = 1/2)")
print(f"phi_xi(rho_1)      = {nstr(R['phiX'], 30)}")
print(f"  |phi_xi(rho_1)|     = {nstr(abs(R['phiX']), 30)}")
print(f"phi_xi/phi_Lambda at rho_1 = {nstr(R['ratio'], 25)};  (s-1)/s at rho_1 = {nstr(R['conv'], 25)}")
print(f"  |difference| = {nstr(abs(R['ratio'] - R['conv']), 5)}")
print(f"first pole s = rho_1/2 = {nstr(R['pole'], 30)}")
print(f"  1/phi_Lambda(rho_1/2) = Lambda(rho_1)/Lambda(rho_1 - 1): |.| = {nstr(R['inv_phi_at_pole'], 5)}")
print()

results = []


def check(label, value, printed):
    ok = agrees(value, printed)
    results.append(ok)
    print(f"  {label:45s} computed {nstr(value, 22):>26s} | printed {printed:>20s}"
          f" ({sig_digits(printed)} s.d.) | {'PASS' if ok else 'FAIL'}")


print("Printed numerals (rule: rounding at the printed number of significant digits):")
check("phi(rho_1), Lambda convention, real part", R["phiL"].real, "0.537602")
check("phi(rho_1), Lambda convention, imag part", R["phiL"].imag, "-0.843199")
check("first pole, real part", R["pole"].real, "0.25")
check("first pole, imag part", R["pole"].imag, "7.0673625708673469")
check("phi(rho_1), xi convention, real part", R["phiX"].real, "0.595838")
check("phi(rho_1), xi convention, imag part", R["phiX"].imag, "-0.803105")
print()
print(f"SUMMARY: {sum(results)}/{len(results)} items PASS; " +
      ("ROW PASS" if all(results) else "ROW FAIL"))
print(f"runtime: {time.time() - T0:.3f} s")
