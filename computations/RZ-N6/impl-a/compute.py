#!/usr/bin/env python3
"""L:RZ-N6, implementation A.

Recomputes the two numerals printed at the end of section 8.2 of
"The Tetrahedral Structure of the Riemann Zeta Function" (revised edition,
October 2026; PDF sha256 2d5287e7...0f533e54), page p21 (cover = p01), folio 20:

  "The equation det(1 - L_s) = Z(s)/Z(s + 1) is not an identity -- at s = 3/2
   the two sides are 0.663 and 0.835"

Quantity A = det(1 - L_{3/2}), the Fredholm determinant of the Mayer-Gauss
transfer operator (8.3)  L_s f(x) = sum_{n>=1} (x+n)^{-2s} f(1/(x+n)).
Quantity B = Z(3/2)/Z(5/2), Z the Selberg zeta function (8.5) of PSL(2,Z);
by (8.5) Z(s)/Z(s+1) = prod_p (1 - N(p)^{-s}) over primitive hyperbolic classes.

Method (floating-point reproduction, not a certified enclosure):
  A  -- the operator is represented in the Taylor basis e_k(z) = (z - c)^k at a
        centre c on the real axis; the matrix elements are closed forms in the
        Hurwitz zeta function zeta(2s + m, 1 + c); A = det(I - M_N) for the
        N x N truncation. Run at (c = 1, N = 40, dps 60), (c = 1, N = 60, dps 90)
        and, as a change of basis, (c = 5/4, N = 60, dps 90).
        Internal check: trace(M_N) against the exact fixed-point trace
        tr L_s = sum_n x_n^{2s}/(1 + x_n^2), x_n = (sqrt(n^2+4) - n)/2.
  B  -- two independent routes:
        (i)  Mayer's identity (8.4): Z(s) = det(1 - L_s^2), so
             B = det(I - M(3/2)^2) / det(I - M(5/2)^2) from the same matrices;
        (ii) the Euler product (8.5) directly: every primitive hyperbolic class
             of PSL(2,Z) is enumerated by trace t <= T as a primitive cyclic word
             in the continued-fraction generators M_a = [[0,1],[1,a]] (an even
             word gives two classes, its products of even and of odd rotation;
             an odd word gives one class, the square of its product), with
             N(p) = lambda^2, lambda = (t + sqrt(t^2 - 4))/2; the tail t > T is
             estimated by the prime geodesic theorem density 1/log x.
        The class counts for t = 3..8 are printed beside the narrow class
        numbers they must equal (1, 2, 2, 3, 2, 4).
No network, no input.
"""
import sys
import time
import math
from collections import defaultdict
import mpmath
from mpmath import mp, mpf, binomial, zeta, matrix, det, eye, sqrt, log, exp, quad, inf, nsum, nint, floor, log10, nstr

T0 = time.time()


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


def mayer_matrix(s, c, N):
    """N x N matrix of L_s in the basis e_k(z) = (z - c)^k.

    (L_s e_k)(z) = sum_n (z+n)^{-2s} (1/(z+n) - c)^k.  With w = n + c + u, u = z - c:
    (1/w - c)^k w^{-2s} = sum_i C(k,i) (-c)^i w^{-(2s+k-i)}, and
    w^{-b} = sum_j C(-b, j) (n+c)^{-b-j} u^j; the sum over n is zeta(b + j, 1 + c).
    """
    H = [zeta(2 * s + m, 1 + c) for m in range(2 * N + 1)]
    M = matrix(N, N)
    for k in range(N):
        for j in range(N):
            acc = mpf(0)
            for i in range(k + 1):
                b = 2 * s + k - i
                acc += binomial(k, i) * (-c) ** i * binomial(-b, j) * H[k - i + j]
            M[j, k] = acc
    return M


def trace_exact(s):
    def term(n):
        x = (sqrt(n * n + 4) - n) / 2
        return x ** (2 * s) / (1 + x * x)
    return nsum(term, [1, inf])


def fredholm_run(c, N, dps):
    mp.dps = dps
    s = mpf(3) / 2
    M3 = mayer_matrix(s, c, N)
    M5 = mayer_matrix(s + 1, c, N)
    I = eye(N)
    A = det(I - M3)
    Z3 = det(I - M3 * M3)
    Z5 = det(I - M5 * M5)
    tr = sum(M3[i, i] for i in range(N))
    return A, Z3, Z5, Z3 / Z5, tr


def is_primitive(w):
    n = len(w)
    for d in range(1, n):
        if n % d == 0 and w == w[d:] + w[:d]:
            return False
    return True


def class_counts(T):
    """c[t] = number of primitive hyperbolic conjugacy classes of PSL(2,Z) of trace t, 3 <= t <= T."""
    res = defaultdict(int)  # (t, word length) -> number of primitive words (all rotations)
    stack = [((x,), 0, 1, 1, x) for x in range(1, T + 1)]  # word, product [[a,b],[c,d]]
    while stack:
        w, a, b, c, d = stack.pop()
        n = len(w)
        tr = a + d
        if n % 2 == 0:
            if tr <= T and is_primitive(w):
                res[(tr, n)] += 1
        else:
            t2 = tr * tr + 2  # trace of the square of a determinant -1 matrix
            if t2 <= T and is_primitive(w):
                res[(t2, n)] += 1
        y = 1
        while True:  # P * M_y = [[b, a + y b], [d, c + y d]]; the continuant d never decreases
            nd = c + y * d
            if nd > T:
                break
            stack.append((w + (y,), b, a + y * b, d, nd))
            y += 1
    ct = defaultdict(int)
    for (t, n), k in res.items():
        assert k % n == 0
        ct[t] += (2 if n % 2 == 0 else 1) * (k // n)
    return ct


def euler_B(ct, T, s):
    lg = mpf(0)
    for t, k in ct.items():
        lam = (t + sqrt(mpf(t) ** 2 - 4)) / 2
        lg += k * log(1 - lam ** (-2 * s))
    X = ((T + sqrt(mpf(T) ** 2 - 4)) / 2) ** 2
    tail = quad(lambda x: x ** (-s) / log(x), [X, inf])
    return exp(lg), exp(lg - tail), tail


print("L:RZ-N6 implementation A  (mpmath %s)" % mpmath.__version__)
print("python %s" % sys.version.split()[0])
print()

print("A and B by the Fredholm determinant (Taylor basis at centre c, N x N truncation):")
runs = {}
for (c, N, dps) in ((mpf(1), 40, 60), (mpf(1), 60, 90), (mpf(5) / 4, 60, 90)):
    t0 = time.time()
    A, Z3, Z5, B, tr = fredholm_run(c, N, dps)
    runs[(float(c), N)] = (A, Z3, Z5, B, tr)
    print("  c = %-4s N = %2d dps = %d : A = %s   Z(3/2) = %s   Z(5/2) = %s   B = %s   (%.1f s)"
          % (nstr(c, 3), N, dps, nstr(A, 22), nstr(Z3, 22), nstr(Z5, 22), nstr(B, 22), time.time() - t0))
mp.dps = 90
Aref, Z3ref, Z5ref, Bref, trref = runs[(1.0, 60)]
A40, _, _, B40, _ = runs[(1.0, 40)]
Ac, _, _, Bc, _ = runs[(1.25, 60)]
print("  |A(c=1,N=40) - A(c=1,N=60)|   = %s" % nstr(abs(A40 - Aref), 3))
print("  |A(c=5/4,N=60) - A(c=1,N=60)| = %s" % nstr(abs(Ac - Aref), 3))
print("  |B(c=1,N=40) - B(c=1,N=60)|   = %s" % nstr(abs(B40 - Bref), 3))
print("  |B(c=5/4,N=60) - B(c=1,N=60)| = %s" % nstr(abs(Bc - Bref), 3))
mp.dps = 40
te = trace_exact(mpf(3) / 2)
print("  trace check: tr M (c=1,N=60) = %s ; exact fixed-point trace = %s ; |diff| = %s"
      % (nstr(trref, 25), nstr(te, 25), nstr(abs(trref - te), 3)))
print()

print("B by the Euler product (8.5) over enumerated primitive hyperbolic classes:")
mp.dps = 30
sB = mpf(3) / 2
for T in (1000, 2000, 4000):
    t0 = time.time()
    ct = class_counts(T)
    if T == 1000:
        print("  class counts t = 3..8: %s  (narrow class-number sums: [1, 2, 2, 3, 2, 4])"
              % [ct[t] for t in range(3, 9)])
    b, bc, tail = euler_B(ct, T, sB)
    print("  trace <= %4d: %7d classes; partial product = %s ; tail estimate %s ; tail-corrected B = %s  (%.1f s)"
          % (T, sum(ct.values()), nstr(b, 12), nstr(tail, 4), nstr(bc, 12), time.time() - t0))
    Beuler = bc
print("  |B(Euler, trace<=4000, tail-corrected) - B(Fredholm)| = %s" % nstr(abs(Beuler - Bref), 3))
print()

mp.dps = 90
print("Result (reference: c = 1, N = 60, dps 90):")
print("  A = det(1 - L_{3/2})          = %s" % nstr(Aref, 30))
print("  B = Z(3/2)/Z(5/2)              = %s" % nstr(Bref, 30))
print("  B - A                          = %s" % nstr(Bref - Aref, 30))
print()
print("Printed numerals (rule: round at the printed number's last significant digit, compare integers):")
items = [
    ("A = det(1 - L_s) at s = 3/2", Aref, "0.663"),
    ("B = Z(s)/Z(s+1) at s = 3/2 (Fredholm route)", Bref, "0.835"),
    ("B = Z(s)/Z(s+1) at s = 3/2 (Euler route)", Beuler, "0.835"),
]
npass = 0
for name, val, pr in items:
    ok = agrees(val, pr)
    npass += ok
    print("  %-46s computed %26s | printed %6s (%d s.d.) | %s"
          % (name, nstr(val, 20), pr, sig_digits(pr), "PASS" if ok else "FAIL"))
gap_ok = (Bref - Aref) > 100 * (abs(A40 - Aref) + abs(B40 - Bref) + abs(Ac - Aref) + abs(Bc - Bref)) and Bref > Aref
npass += gap_ok
print("  %-46s computed B - A = %s (> 100 x the spread of the runs) | %s"
      % ("inequality A != B (the non-identity)", nstr(Bref - Aref, 12), "PASS" if gap_ok else "FAIL"))
print()
print("%d of %d PASS" % (npass, len(items) + 1))
print("runtime %.1f s" % (time.time() - T0))
