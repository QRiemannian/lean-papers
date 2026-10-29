#!/usr/bin/env python3
"""MS-35, implementation A.

Recomputes the two numerals printed at (4.2) of "The Invariant Structure of the
Modular Surface" (modular-surface-characterization.pdf, revised October 2026;
PDF sha256 b4841489...6e0109e51d6e9d2cb252690f5b13af5), page p14 (cover = p01):

    r_1 ≈ 9.5337,   r_2 ≈ 12.173

i.e. the spectral parameters (lambda = 1/4 + r^2, (4.1)) of the first two Maass
cusp forms on X(1) = SL(2, Z)\\H, ordered by r.

Method: Hejhal's collocation method (Hejhal 1999), non-rigorous floating
arithmetic in mpmath at 50 digits. A Maass cusp form of parity e (even: cos,
odd: sin) is f(z) = sum_{n>=1} c_n sqrt(y) K_{ir}(2 pi n y) cs(2 pi n x).
Q points z_j = x_j + iY, x_j = (j - 1/2)/(2Q), j = 1..Q, on a horocycle below
the fundamental domain are pulled back to z_j* in the fundamental domain; the
truncated expansion (M terms) and automorphy f(z_j) = f(z_j*) give
    c_m sqrt(Y) K_{ir}(2 pi m Y) = (2/Q) sum_j f(z_j*) cs(2 pi m x_j),  m = 1..M.
With c_1 = 1 the equations m = 2..M are solved for c_2..c_M. At a true
eigenvalue the solution does not depend on Y; the test function is
H(r) = c_2(Y_1) - c_2(Y_2). Roots of H are located by a scan ((M, Q) = (8, 12)) with sign-change
detection on r in [R_LO, R_HI] for both parities, refined by the secant
method (mpmath.findroot), and accepted only if the Hecke relations
c_2 c_3 = c_6 and c_4 = c_2^2 - 1 hold (this rejects poles of H).
Convergence check: every accepted root is recomputed at two truncations
(M, Q) = (14, 22) and (20, 30), both shown.
This is NOT a certified enclosure (interval arithmetic would be needed for
that); it is a floating reproduction of the printed digits. No network, no input.
"""
import sys
import time
import mpmath
from mpmath import mp, mpf, mpc, pi, sqrt, sin, cos, nint, floor, log10, nstr

mp.dps = 50
T0 = time.time()

R_LO, R_HI, R_STEP = mpf(1), mpf("13.5"), mpf("0.1")
Y1, Y2 = mpf("0.80"), mpf("0.70")


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


def pullback(x, y):
    """Map x + iy into the standard fundamental domain of SL(2, Z)."""
    z = mpc(x, y)
    for _ in range(1000):
        z = z - nint(z.real)
        if abs(z) < 1:
            z = -1 / z
        else:
            break
    return z.real, z.imag


def K(r, x):
    return mp.besselk(mpc(0, r), x).real


def coefficients(r, Y, M, Q, parity):
    cs = sin if parity == "odd" else cos
    xs = [(mpf(j) - mpf(1) / 2) / (2 * Q) for j in range(1, Q + 1)]
    pts = [pullback(x, Y) for x in xs]
    # W[j][n] = sqrt(y_j*) K(2 pi n y_j*) cs(2 pi n x_j*)
    W = [[sqrt(ys) * K(r, 2 * pi * n * ys) * cs(2 * pi * n * xs_) for n in range(1, M + 1)]
         for (xs_, ys) in pts]
    C = [[cs(2 * pi * m * x) for x in xs] for m in range(1, M + 1)]
    V = mp.matrix(M, M)
    for m in range(M):
        for n in range(M):
            V[m, n] = 2 * sum(C[m][j] * W[j][n] for j in range(Q)) / Q
        V[m, m] -= sqrt(Y) * K(r, 2 * pi * (m + 1) * Y)
    # c_1 = 1: rows m = 2..M, unknowns c_2..c_M
    A = mp.matrix(M - 1, M - 1)
    b = mp.matrix(M - 1, 1)
    for i in range(1, M):
        b[i - 1] = -V[i, 0]
        for k in range(1, M):
            A[i - 1, k - 1] = V[i, k]
    sol = mp.lu_solve(A, b)
    return [mpf(1)] + [sol[i] for i in range(M - 1)]


def H(r, M, Q, parity):
    return coefficients(r, Y1, M, Q, parity)[1] - coefficients(r, Y2, M, Q, parity)[1]


def hecke(r, M, Q, parity):
    c = coefficients(r, Y1, M, Q, parity)
    return abs(c[1] * c[2] - c[5]), abs(c[3] - (c[1] ** 2 - 1)), c


print("MS-35 implementation A  (Hejhal's method; mpmath %s, mp.dps = %d)" % (mpmath.__version__, mp.dps))
print("python", sys.version.split()[0])
print(f"Y_1 = {Y1}, Y_2 = {Y2}; scan r in [{R_LO}, {R_HI}] step {R_STEP}, both parities, (M, Q) = (8, 12)")
print()

found = []
for parity in ("even", "odd"):
    r = R_LO
    prev_r, prev_h = None, None
    while r <= R_HI + mpf("1e-30"):
        h = H(r, 8, 12, parity)
        if prev_h is not None and (h < 0) != (prev_h < 0):
            try:
                root = mpmath.findroot(lambda t: H(t, 14, 22, parity), (prev_r, r),
                                       solver="secant", tol=mpf("1e-24"), maxsteps=60)
            except Exception as exc:  # no convergence: a pole, recorded as rejected
                print(f"  {parity:4s} sign change in ({nstr(prev_r, 4)}, {nstr(r, 4)}): "
                      f"refinement did not converge ({type(exc).__name__}) -> rejected")
                root = None
            if root is not None:
                h1, h2, _ = hecke(root, 14, 22, parity)
                in_bracket = prev_r - R_STEP <= root <= r + R_STEP
                hecke_ok = h1 < mpf("1e-8") and h2 < mpf("1e-8")
                good = in_bracket and hecke_ok
                why = ("ACCEPTED" if good else
                       "rejected (Hecke relations fail: a pole or spurious zero of H)" if not hecke_ok else
                       "rejected (secant left the bracket: no root here, converged to one found elsewhere)")
                print(f"  {parity:4s} sign change in ({nstr(prev_r, 4)}, {nstr(r, 4)}): root {nstr(root, 15)}, "
                      f"|c2c3-c6| = {nstr(h1, 3)}, |c4-c2^2+1| = {nstr(h2, 3)} -> {why}")
                if good:
                    found.append((root, parity))
        prev_r, prev_h = r, h
        r += R_STEP

found.sort()
print()
print(f"Accepted cusp-form spectral parameters with r <= {R_HI}: "
      + ", ".join(f"{nstr(x, 12)} ({p})" for x, p in found))
print()
print("Convergence check: each accepted root refined at two truncations")
final = []
for (r0, parity) in found:
    vals = []
    for (M, Q) in ((14, 22), (20, 30)):
        rr = mpmath.findroot(lambda t: H(t, M, Q, parity), (r0 - mpf("1e-6"), r0 + mpf("1e-6")),
                             solver="secant", tol=mpf("1e-30"), maxsteps=60)
        h1, h2, c = hecke(rr, M, Q, parity)
        vals.append(rr)
        print(f"  {parity:4s} (M, Q) = ({M}, {Q}): r = {nstr(rr, 20)}  c_2 = {nstr(c[1], 12)}  "
              f"|c2c3-c6| = {nstr(h1, 3)}")
    print(f"       |difference between truncations| = {nstr(abs(vals[0] - vals[1]), 3)}")
    final.append(vals[1])

results = []
print()
print("Printed numerals (rule: rounding at the printed number of significant digits):")
for idx, printed in ((0, "9.5337"), (1, "12.173")):
    if idx < len(final):
        ok = agrees(final[idx], printed)
        print(f"  r_{idx + 1}: computed {nstr(final[idx], 15)} | printed {printed} "
              f"({sig_digits(printed)} s.d.) | {'PASS' if ok else 'FAIL'}")
    else:
        ok = False
        print(f"  r_{idx + 1}: not found by the scan | printed {printed} | FAIL")
    results.append(ok)
print()
print(f"SUMMARY: {sum(results)}/{len(results)} items PASS; " + ("ROW PASS" if all(results) else "ROW FAIL"))
print(f"runtime: {time.time() - T0:.1f} s")
