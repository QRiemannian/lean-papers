#!/usr/bin/env python3
"""RZ-27, implementation A.

Recomputes the numerals printed at (4.4), (4.5), the term table after (4.5),
and §4.5 of "The Tetrahedral Structure of the Riemann Zeta Function"
(revised edition, October 2026; PDF sha256 2d5287e7...0f533e54), pages p11-p12
(cover = p01).

Method: direct summation of the Ramanujan correction series in mpmath at
60 significant digits, truncated where the next term is below 10^-70, with
zeta(3) taken from mpmath's own zeta() as an independent reference.
No network, no input.
"""
import sys
import time
import mpmath
from mpmath import mp, mpf, pi, exp, zeta, nint, floor, log10, nstr

mp.dps = 60
T0 = time.time()


def sig_digits(s):
    mant = s.lower().split("e")[0].lstrip("+-")
    return len(mant.replace(".", "").lstrip("0"))


def agrees(x, s):
    """Agreement at the printed number of significant digits after rounding:
    round x at the decimal position of the printed number's last significant
    digit and compare the integers."""
    p = mpf(s)
    n = sig_digits(s)
    e = int(floor(log10(abs(p))))
    scale = mpf(10) ** (n - 1 - e)
    return nint(x * scale) == nint(p * scale)


def term(k):
    """t_k = 1 / (k^3 (e^{2 pi k} - 1)), the k-th term of the series in (4.5)
    WITHOUT the prefactor -2 (the table prints these magnitudes)."""
    k = mpf(k)
    return 1 / (k ** 3 * (exp(2 * pi * k) - 1))


def series(K):
    return sum(term(k) for k in range(1, K + 1))


# --- the series, at two truncations (convergence check) -------------------
K_lo, K_hi = 20, 40
S_lo, S_hi = series(K_lo), series(K_hi)
S = S_hi
A = 7 * pi ** 3 / 180            # (4.4): zeta(3)|_H
C = -2 * S                       # (4.5): the correction
Z3 = zeta(3)                     # independent reference value

results = []


def check(label, value, printed, unit=""):
    ok = agrees(value, printed)
    results.append(ok)
    print(f"  {label}")
    print(f"      computed : {nstr(value, 20)}{unit}")
    print(f"      printed  : {printed}{unit}   ({sig_digits(printed)} sig. digits)")
    print(f"      verdict  : {'PASS' if ok else 'FAIL'}")


print("RZ-27 implementation A  (mpmath %s, mp.dps = %d)" % (mpmath.__version__, mp.dps))
print("python", sys.version.split()[0])
print()
print("Convergence of the series S = sum_{k>=1} 1/(k^3 (e^{2 pi k} - 1)):")
print(f"  S(K={K_lo}) = {nstr(S_lo, 50)}")
print(f"  S(K={K_hi}) = {nstr(S_hi, 50)}")
print(f"  |S(K={K_hi}) - S(K={K_lo})| = {nstr(abs(S_hi - S_lo), 5)}")
print(f"  term t_{K_lo + 1} = {nstr(term(K_lo + 1), 5)}  (bounds the K={K_lo} tail by geometric decay)")
print()
print("Identity check (Ramanujan, (4.3)):  7 pi^3/180 - 2 S  vs  mpmath zeta(3)")
print(f"  7pi^3/180 - 2S = {nstr(A + C, 50)}")
print(f"  zeta(3)        = {nstr(Z3, 50)}")
print(f"  difference     = {nstr(abs(A + C - Z3), 5)}")
print()
print("Printed numerals:")
check("(4.4)  7 pi^3 / 180", A, "1.2058")
check("§4.3  'overshoots the true value by approximately 0.31%' = (7pi^3/180 - zeta(3)) / zeta(3) x 100",
      (A - Z3) / Z3 * 100, "0.31", " %")
print(f"      (alternative reading, excess relative to 7pi^3/180: {nstr((A - Z3) / A * 100, 10)} %"
      f" -> {'PASS' if agrees((A - Z3) / A * 100, '0.31') else 'FAIL'} at the same rule)")
check("(4.5)  correction  -2 sum 1/(k^3 (e^{2 pi k} - 1))", C, "-0.003743")
check("§4.3  nome q = e^{-2 pi}", exp(-2 * pi), "1.87e-3")
check("table k=1  term magnitude t_1", term(1), "1.871e-3")
check("table k=2  term magnitude t_2", term(2), "4.359e-7")
check("table k=3  term magnitude t_3", term(3), "2.412e-10")
check("table k=1  cumulative fraction t_1/S  (= §4.3 'k = 1 term accounts for 99.977%')",
      term(1) / S * 100, "99.977", " %")
cum2 = (term(1) + term(2)) / S * 100
check("table k=2  cumulative fraction (t_1+t_2)/S", cum2, "99.9999", " %")
print(f"      note     : rounded to 6 sig. digits the computed value is {nstr(cum2, 6)} %; the printed")
print(f"                 99.9999 % agrees with it only as a TRUNCATION (computed >= 99.9999 %:"
      f" {cum2 >= mpf('99.9999')}). The verdict above stands under the rounding rule.")
cum3 = (term(1) + term(2) + term(3)) / S
ok3 = abs(1 - cum3) < mpf("1e-9")
results.append(ok3)
print("  table k=3  cumulative fraction (t_1+t_2+t_3)/S, printed '≈1'")
print(f"      computed : {nstr(cum3, 20)}   (1 - value = {nstr(1 - cum3, 5)})")
print(f"      rule     : printed '≈1' read as |1 - value| < 1e-9")
print(f"      verdict  : {'PASS' if ok3 else 'FAIL'}")
check("§4.5  zeta(3) / (7 pi^3/180)  ('zeta(3) is ≈ 99.69% of it')", Z3 / A * 100, "99.69", " %")
check("§4.5  leading term exceeds zeta(3) by ≈ 0.31%", (A - Z3) / Z3 * 100, "0.31", " %")

print()
print("§4.3 'each term below the last by more than the factor e^{-2 pi}': ratios t_{k+1}/t_k")
q = exp(-2 * pi)
ratio_ok = True
for k in range(1, 21):
    r = term(k + 1) / term(k)
    ratio_ok = ratio_ok and (r < q)
    if k <= 5 or k == 20:
        print(f"  k={k:2d}: t_{k+1}/t_{k} = {nstr(r, 6)}   < e^(-2pi) = {nstr(q, 6)} : {r < q}")
print("  (k = 1..20 all checked; for every k the exact bound holds:")
print("   t_{k+1}/t_k = (k/(k+1))^3 (e^{2pi k}-1)/(e^{2pi(k+1)}-1) < e^{-2pi},")
print("   since (e^{2pi k}-1) e^{2pi} = e^{2pi(k+1)} - e^{2pi} < e^{2pi(k+1)} - 1)")
results.append(ratio_ok)
print(f"      verdict  : {'PASS' if ratio_ok else 'FAIL'}")

print()
n_pass = sum(results)
print(f"SUMMARY: {n_pass}/{len(results)} items PASS; " +
      ("ROW PASS" if all(results) else "ROW FAIL (see the FAIL items above)"))
print(f"runtime: {time.time() - T0:.3f} s")
