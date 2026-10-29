#!/usr/bin/env python3
"""MS-35, implementation B.

Recomputes display (4.2) of "The Invariant Structure of the Modular Surface" (revised
October 2026; served PDF sha256 b4841489...0b13af5), PDF page p14:
      r_1 ~ 9.5337,   r_2 ~ 12.173,   ...
the spectral parameters of the first two Maass cusp forms on X(1) = SL(2,Z)\\H,
Laplace eigenvalue lambda = 1/4 + r^2 (display (4.1)).

Quantity: the two smallest r > 0 such that lambda = 1/4 + r^2 is a cusp-form eigenvalue of
the hyperbolic Laplacian on SL(2,Z)\\H.

Method (independent of the obvious one, Hejhal's collocation method with K-Bessel functions):
  the MAYER TRANSFER OPERATOR of the Gauss map (Mayer 1991; the paper's own section 4.2),
      (L_s f)(z) = sum_{n>=1} (z+n)^(-2s) f(1/(z+n)),
  acting on functions holomorphic on the disc |z - 1| < 3/2.  Its Fredholm determinants
  det(1 - L_s) det(1 + L_s) = Z_Selberg(s) (display (4.3)); on the line s = 1/2 + i r their zeros
  are exactly the cusp-form parameters (det(1 + L_s): odd forms, det(1 - L_s): even forms, by
  the Lewis-Zagier parity split), while the scattering resonances s = rho/2 sit OFF the line
  (Re s = 1/4).  No Bessel function, no Fourier expansion of a Maass form, no collocation.
  Discretisation: the Taylor basis (z - 1)^k, k < K.  With z = 1 + w,
      L_s (z-1)^k = sum_{j<=k} C(k,j) (-1)^(k-j) zeta_H(2s + j, 2 + w),
      zeta_H(sigma, 2 + w) = sum_m (-1)^m (sigma)_m / m! zeta_H(sigma + m, 2) w^m,
  so the K x K matrix is M[m][k] = (-1)^m sum_j C(k,j)(-1)^(k-j) (2s+j)_m/m! zeta_H(2s+j+m, 2)
  (Hurwitz zeta at a = 2 from mpmath -- the only special function used).
  Steps: (1) scan |det(1 -/+ M)| along s = 1/2 + i r, 0.5 <= r <= 12.6 (step 0.1, K = 40) for
  local minima; (2) refine each by a complex secant in s at TWO truncations (K = 60 and K = 80,
  dps 50), the real part NOT imposed -- a zero with Re s = 1/2 is a cusp form, Re s = 1/4 a
  resonance; (3) completeness: the argument principle on the thin rectangle
  0.4 <= Re s <= 0.6, 0.5 <= Im s <= 12.6 counts the zeros of each determinant near the line,
  which must equal the number of cusp-form zeros found.
Comparison rule: r rounded half-even to the printed number of decimals must equal the print.
"""
import sys
import time
from math import comb
import mpmath
from mpmath import mp, mpf, mpc


def transfer_matrix(s, K):
    Z = [mpmath.zeta(2 * s + i, 2) for i in range(2 * K)]
    a = []
    for j in range(K):
        row, p = [], mpc(1)
        for m in range(K):
            row.append(p * Z[j + m])
            p = p * (2 * s + j + m) / (m + 1)
        a.append(row)
    M = [[None] * K for _ in range(K)]
    for k in range(K):
        coefs = [comb(k, j) * (-1) ** (k - j) for j in range(k + 1)]
        for m in range(K):
            acc = mpc(0)
            for j in range(k + 1):
                acc += coefs[j] * a[j][m]
            M[m][k] = acc if m % 2 == 0 else -acc
    return M


def fredholm(s, K, sign):
    """det(1 + sign * M_K(s)); sign = -1 -> det(1 - L_s) (even), +1 -> det(1 + L_s) (odd)."""
    M = transfer_matrix(s, K)
    A = mpmath.matrix(K, K)
    for i in range(K):
        for j in range(K):
            A[i, j] = (1 if i == j else 0) + sign * M[i][j]
    return mpmath.det(A)


def secant(f, x0, x1, tol, maxit=60):
    f0, f1 = f(x0), f(x1)
    for _ in range(maxit):
        x2 = x1 - f1 * (x1 - x0) / (f1 - f0)
        if abs(x2 - x1) < tol:
            return x2, abs(f(x2))
        x0, f0, x1, f1 = x1, f1, x2, f(x2)
    return None, None


def winding(f, corners):
    total = mpf(0)
    pts = corners + [corners[0]]
    for a, b in zip(pts[:-1], pts[1:]):
        stack = [(a, b, f(a), f(b))]
        while stack:
            x, y, fx, fy = stack.pop()
            d = mpmath.arg(fy / fx)
            if abs(d) < mp.pi / 4 or abs(y - x) < mpf('1e-4'):
                total += d
            else:
                mid = (x + y) / 2
                fm = f(mid)
                stack.append((mid, y, fm, fy))
                stack.append((x, mid, fx, fm))
    return total / (2 * mp.pi)


def check(label, printed, value):
    from decimal import Decimal, ROUND_HALF_EVEN
    v = Decimal(mpmath.nstr(value, 30, strip_zeros=False))
    d = len(printed.split('.')[1])
    r = v.quantize(Decimal(1).scaleb(-d), rounding=ROUND_HALF_EVEN)
    ok = r == Decimal(printed)
    print(f"  {label:<4} printed {printed:>8}   computed {mpmath.nstr(value, 16)}   rounded {r}   {'PASS' if ok else 'FAIL'}")
    return ok


def main():
    t_start = time.time()
    print("MS-35 implementation B (Mayer transfer operator, Fredholm determinants on Re s = 1/2)")
    print(f"python {sys.version.split()[0]}, mpmath {mpmath.__version__}")
    print()
    # (1) scan
    mp.dps = 30
    K0 = 40
    rs = [mpf(5 + i) / 10 for i in range(0, 122)]          # 0.5 .. 12.6
    cands = []
    for sign, name in ((+1, "det(1+L_s) [odd]"), (-1, "det(1-L_s) [even]")):
        vals = [abs(fredholm(mpc('0.5', r), K0, sign)) for r in rs]
        mins = [rs[i] for i in range(1, len(rs) - 1) if vals[i] < vals[i - 1] and vals[i] < vals[i + 1]]
        print(f"scan {name}: local minima of |det| on the line at r = {[mpmath.nstr(x, 3) for x in mins]}")
        cands += [(sign, name, x) for x in mins]
    print(f"  (scan: K = {K0}, dps 30, step 0.1; {time.time() - t_start:.0f} s so far)")
    print()
    # (2) refine at two truncations
    mp.dps = 50
    found = []
    for sign, name, r0 in cands:
        res = []
        for K in (60, 80):
            f = lambda s, K=K, sign=sign: fredholm(s, K, sign)
            z, fz = secant(f, mpc('0.5', r0 - mpf('0.02')), mpc('0.5', r0 + mpf('0.02')), mpf('1e-25'))
            res.append((K, z, fz))
        (K1, z1, f1), (K2, z2, f2) = res
        if z1 is None or z2 is None:
            print(f"  {name} from r = {mpmath.nstr(r0, 3)}: secant did not converge (not a zero)")
            continue
        kind = "CUSP FORM (Re s = 1/2)" if abs(z2.real - mpf('0.5')) < mpf('1e-10') else (
            "resonance (Re s = 1/4)" if abs(z2.real - mpf('0.25')) < mpf('1e-10') else
            "secant left the line's neighbourhood: no zero at this shallow minimum")
        print(f"  {name} from r = {mpmath.nstr(r0, 3)}:")
        print(f"     K = {K1}: s = {mpmath.nstr(z1, 22)}   |det| = {mpmath.nstr(f1, 2)}")
        print(f"     K = {K2}: s = {mpmath.nstr(z2, 22)}   |det| = {mpmath.nstr(f2, 2)}   |s_60 - s_80| = {mpmath.nstr(abs(z1 - z2), 2)}   -> {kind}")
        found.append((sign, name, z1, z2, kind))
    print(f"  ({time.time() - t_start:.0f} s so far)")
    print()
    cusp = sorted([(z2.imag, z1, z2, name) for sign, name, z1, z2, kind in found if kind.startswith("CUSP")],
                  key=lambda x: x[0])
    # de-duplicate (two scan minima can refine to one zero)
    uniq = []
    for item in cusp:
        if not uniq or abs(item[0] - uniq[-1][0]) > mpf('1e-8'):
            uniq.append(item)
    # (3) completeness by the argument principle
    mp.dps = 30
    corners = [mpc('0.4', '0.5'), mpc('0.6', '0.5'), mpc('0.6', '12.6'), mpc('0.4', '12.6')]
    counts = {}
    for sign, name in ((+1, "det(1+L_s) [odd]"), (-1, "det(1-L_s) [even]")):
        w = winding(lambda s, sign=sign: fredholm(s, K0, sign), corners)
        counts[sign] = w
        print(f"argument principle, {name}, zeros in 0.4 <= Re s <= 0.6, 0.5 <= Im s <= 12.6: {mpmath.nstr(w, 6)}")
    total_zeros = int(mpmath.nint(counts[+1] + counts[-1]))
    complete = total_zeros == len(uniq)
    print(f"  cusp-form zeros found by scan + refinement: {len(uniq)}; counted by the argument principle: {total_zeros} -> "
          f"{'complete' if complete else 'MISMATCH'}")
    print()
    print("Cusp-form parameters with r <= 12.6 (ascending):")
    for i, (im, z1, z2, name) in enumerate(uniq, start=1):
        print(f"  r_{i} = {mpmath.nstr(z2.imag, 20)}   ({name}; lambda = 1/4 + r^2 = {mpmath.nstr(mpf('0.25') + z2.imag ** 2, 15)};"
              f" K=60 vs K=80 differ by {mpmath.nstr(abs(z1 - z2), 2)})")
    print()
    print("Comparison with the printed numerals (rule: round half-even at the printed last place):")
    res = []
    conv_ok = all(abs(z1 - z2) < mpf('1e-10') for _, z1, z2, _ in uniq[:2])
    if len(uniq) >= 2:
        res.append(check("r_1", "9.5337", uniq[0][2].imag))
        res.append(check("r_2", "12.173", uniq[1][2].imag))
    else:
        print("  fewer than two cusp-form zeros found -> FAIL")
        res = [False]
    print(f"  convergence (K = 60 vs 80 agree to 1e-10 on r_1, r_2): {'OK' if conv_ok else 'NOT OK'}")
    print()
    print(f"runtime {time.time() - t_start:.0f} s")
    print(f"ROW VERDICT: {'PASS' if (all(res) and conv_ok and complete) else 'FAIL (see above)'}")


if __name__ == "__main__":
    main()
