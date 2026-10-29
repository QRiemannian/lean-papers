#!/usr/bin/env python3
"""RZ-N6, implementation B.

Recomputes the two numerals of section 8.2 (end of the section, PDF page p21, folio 20) of
"The Tetrahedral Structure of the Riemann Zeta Function" (revised October 2026; served PDF
sha256 2d5287e7...0f533e54):
    "The equation det(1 - L_s) = Z(s)/Z(s + 1) is not an identity -- at s = 3/2 the two
     sides are 0.663 and 0.835".
  A = det(1 - L_{3/2}), L_s f(x) = sum_{n>=1} (x+n)^(-2s) f(1/(x+n))   (display (8.3))
  B = Z(3/2)/Z(5/2), Z(s) = prod_p prod_{k>=0} (1 - N(p)^(-s-k))         (display (8.5))
      = prod_p (1 - N(p)^(-3/2)) over the primitive hyperbolic classes p of PSL(2,Z).

Primary route (both A and B): Mayer's Bessel-kernel form of the transfer operator.
  For f(z) = int_0^oo e^(-zt) phi(t) dt, the Laplace identity
      w^(-2s) e^(-t/w) = int_0^oo e^(-wu) (u/t)^(s-1/2) J_{2s-1}(2 sqrt(tu)) du
  and sum_n e^(-(z+n)u) = e^(-zu)/(e^u - 1) turn L_s into the integral operator with kernel
      (u/t)^(s-1/2) J_{2s-1}(2 sqrt(ut)) / (e^u - 1),
  similar to the symmetric kernel K_s(u,t) = J_{2s-1}(2 sqrt(ut)) / sqrt((e^u-1)(e^t-1)).
  det(1 -/+ K_s) is computed as a Nystrom (Bornemann) determinant on generalized
  Gauss-Laguerre nodes, weight t^(2s-2) e^(-t), after the similarity that strips the
  (ut)^(s-1) factor, so the discretised kernel is analytic at 0:
      M_ij = sqrt(w_i w_j) g(x_i) g(x_j) E(x_i x_j),
      E(y) = J_{2s-1}(2 sqrt y) y^(-(s-1/2)),  g(t) = sqrt(t/(1 - e^(-t))).
  A = det(I - M) at s = 3/2.
  B by Mayer's factorisation (8.4), Z(s) = det(1 - L_s) det(1 + L_s):
      B = [det(I - M) det(I + M)]_{s=3/2} / [det(I - M) det(I + M)]_{s=5/2}.
  Check of the representation: trace(M) against the fixed-point sum
      tr L_s = sum_n x_n^(2s) / (1 + x_n^2),  x_n = (sqrt(n^2+4) - n)/2.
  Convergence: two settings (N = 40 nodes at 30 digits | N = 64 nodes at 45 digits).

Cross-check route (independent of the Bessel form): Euler products over the prime
  cycles of the Gauss map, enumerated as Lyndon words (n_1..n_k) of continued-fraction
  digits with product matrix M_w = prod [[0,1],[1,n_i]], trace tau, det (-1)^k,
  lambda_w = (tau + sqrt(tau^2 - 4 det))/2.  The trace formula for composition
  operators gives
      det(1 - L_s) = prod_w prod_{j>=0} (1 - det_w^j lambda_w^(-2(s+j))),
  and the classes p of PSL(2,Z) are the prime cycles of the even map T^2 (an even-length
  prime w gives two classes with N = lambda_w^2; an odd-length prime w gives one class
  with N = lambda_w^4), so
      B = prod_{w even} (1 - lambda_w^(-3))^2 * prod_{w odd} (1 - lambda_w^(-6)).
  Truncation: all words with tau <= T, T = 1000, 2000, 4000, 8000.  Every omitted factor
  of B lies in (0,1), so each truncated B product is an upper bound for B.  Double
  precision with math.fsum of log1p terms (traces are exact integers).

Floating-point reproduction, not a certified enclosure.
Comparison rule: the primary value rounded half-even at the printed third decimal must
equal the printed numeral; the inequality A != B is checked as an inequality.
"""
import sys
import math
import time
from decimal import Decimal, ROUND_HALF_EVEN
import mpmath as mp


# ---------------------------------------------------------------- primary route
def nystrom_dets(s, N):
    """Return det(I - M), det(I + M), trace(M) for the Bessel-kernel Nystrom matrix."""
    s = mp.mpf(s)
    nu = 2 * s - 1
    alpha = 2 * s - 2
    X, W = mp.gauss_quadrature(N, "glaguerre", alpha)
    g = [mp.sqrt(x / (1 - mp.exp(-x))) for x in X]
    sw = [mp.sqrt(w) for w in W]

    def E(y):
        return mp.besselj(nu, 2 * mp.sqrt(y)) / y ** (nu / 2)

    M = mp.matrix(N, N)
    for i in range(N):
        for j in range(i, N):
            v = sw[i] * sw[j] * g[i] * g[j] * E(X[i] * X[j])
            M[i, j] = v
            M[j, i] = v
    I = mp.eye(N)
    return mp.det(I - M), mp.det(I + M), sum(M[i, i] for i in range(N))


def fixed_point_trace(s):
    s = mp.mpf(s)

    def term(n):
        x = (mp.sqrt(n * n + 4) - n) / 2
        return x ** (2 * s) / (1 + x * x)
    return mp.nsum(term, [1, mp.inf])


def primary(N, dps):
    mp.mp.dps = dps
    m3, p3, tr3 = nystrom_dets(mp.mpf(3) / 2, N)
    m5, p5, tr5 = nystrom_dets(mp.mpf(5) / 2, N)
    A = m3
    Zs = m3 * p3
    Zs1 = m5 * p5
    B = Zs / Zs1
    return dict(A=A, B=B, detplus3=p3, det5m=m5, det5p=p5, Z32=Zs, Z52=Zs1, tr3=tr3, tr5=tr5)


# ---------------------------------------------------------------- cross-check route
def is_lyndon(w):
    k = len(w)
    for r in range(1, k):
        if w[r:] + w[:r] <= w:
            return False
    return True


def cycle_products(T):
    logsA = []
    logsB = []
    ncyc = 0
    nclass = 0
    stack = [((), 1, 0, 0, 1)]          # word, product matrix [[a,b],[c,d]] (identity)
    while stack:
        w, a, b, c, d = stack.pop()
        if w:
            tau = a + d
            if tau <= T and is_lyndon(w):
                k = len(w)
                det = 1 if k % 2 == 0 else -1
                lam = (tau + math.sqrt(tau * tau - 4 * det)) / 2
                ncyc += 1
                j = 0
                while True:
                    t = lam ** (-2 * (1.5 + j))
                    if t < 1e-30:
                        break
                    logsA.append(math.log1p(-(det ** j) * t))
                    j += 1
                if det == 1:
                    logsB.append(2 * math.log1p(-lam ** -3))
                    nclass += 2
                else:
                    logsB.append(math.log1p(-lam ** -6))
                    nclass += 1
        # append a digit n; the (2,2) entry d' = c + n d never decreases along a word and
        # never exceeds the trace of any cycle through it, so d' > T prunes safely
        n = 1
        while True:
            a2, b2, c2, d2 = b, a + n * b, d, c + n * d
            if d2 > T:
                break
            stack.append((w + (n,), a2, b2, c2, d2))
            n += 1
    return math.exp(math.fsum(logsA)), math.exp(math.fsum(logsB)), ncyc, nclass


# ---------------------------------------------------------------- comparison helpers
def rounded(x, places):
    q = Decimal(1).scaleb(-places)
    return Decimal(mp.nstr(x, 40, strip_zeros=False)).quantize(q, rounding=ROUND_HALF_EVEN)


def main():
    print("RZ-N6 implementation B (Mayer Bessel-kernel Nystrom determinant; Gauss-cycle Euler products as cross-check)")
    print("python %s, mpmath %s" % (sys.version.split()[0], mp.__version__))
    print("Floating-point reproduction, not a certified enclosure.")
    print()

    t0 = time.time()
    settings = [(40, 30), (64, 45)]
    res = []
    for N, dps in settings:
        t = time.time()
        r = primary(N, dps)
        r["time"] = time.time() - t
        res.append(r)
    mp.mp.dps = 45
    trfp3 = fixed_point_trace(mp.mpf(3) / 2)
    trfp5 = fixed_point_trace(mp.mpf(5) / 2)

    print("Primary route -- Nystrom on generalized Gauss-Laguerre nodes, two settings:")
    print("  setting 1: N = 40 nodes, 30 digits | setting 2: N = 64 nodes, 45 digits")
    for key, label in [("A", "A = det(1 - L_3/2)"), ("detplus3", "det(1 + L_3/2)"),
                       ("Z32", "Z(3/2) = det(1-L)det(1+L) at 3/2"), ("det5m", "det(1 - L_5/2)"),
                       ("det5p", "det(1 + L_5/2)"), ("Z52", "Z(5/2) = det(1-L)det(1+L) at 5/2"),
                       ("B", "B = Z(3/2)/Z(5/2)")]:
        v1, v2 = res[0][key], res[1][key]
        print("  %-36s s1 = %s" % (label, mp.nstr(v1, 25)))
        print("  %-36s s2 = %s   |s1-s2| = %s" % ("", mp.nstr(v2, 25), mp.nstr(abs(v1 - v2), 3)))
    print("  runtimes: setting 1 %.1f s, setting 2 %.1f s" % (res[0]["time"], res[1]["time"]))
    dA = abs(res[0]["A"] - res[1]["A"])
    dB = abs(res[0]["B"] - res[1]["B"])
    conv_ok = dA < mp.mpf("1e-10") and dB < mp.mpf("1e-10")
    print("  convergence (threshold 1e-10 on A and B): %s" % ("OK" if conv_ok else "NOT OK"))
    print()
    print("Representation check -- trace of the Nystrom matrix vs the fixed-point sum sum_n x_n^(2s)/(1+x_n^2):")
    print("  s = 3/2: trace(M) = %s   fixed-point sum = %s   |diff| = %s"
          % (mp.nstr(res[1]["tr3"], 20), mp.nstr(trfp3, 20), mp.nstr(abs(res[1]["tr3"] - trfp3), 3)))
    print("  s = 5/2: trace(M) = %s   fixed-point sum = %s   |diff| = %s"
          % (mp.nstr(res[1]["tr5"], 20), mp.nstr(trfp5, 20), mp.nstr(abs(res[1]["tr5"] - trfp5), 3)))
    print()

    print("Cross-check route -- Euler products over Gauss-map prime cycles with trace <= T (double precision):")
    print("  %6s %10s %10s %22s %22s %7s" % ("T", "cycles", "classes", "A (cycle product)", "B (cycle product, >= B)", "sec"))
    cyc = []
    for T in (1000, 2000, 4000, 8000):
        t = time.time()
        a, b, nc, ncl = cycle_products(T)
        cyc.append((T, a, b))
        print("  %6d %10d %10d %22.12f %22.12f %7.1f" % (T, nc, ncl, a, b, time.time() - t))
    A = res[1]["A"]
    B = res[1]["B"]
    aT, bT = cyc[-1][1], cyc[-1][2]
    print("  at T = 8000: A_cycle - A = %.2e ; B_cycle - B = %.2e (omitted factors < 1, so B_cycle >= B)"
          % (aT - float(A), bT - float(B)))
    cross_ok = abs(aT - float(A)) < 1e-4 and abs(bT - float(B)) < 1e-4 and bT >= float(B)
    print("  cross-check (both within 1e-4 of the primary value; B_cycle >= B): %s" % ("OK" if cross_ok else "NOT OK"))
    print()

    print("Values (setting 2):")
    print("  A = det(1 - L_{3/2})  = %s" % mp.nstr(A, 20))
    print("  B = Z(3/2)/Z(5/2)     = %s" % mp.nstr(B, 20))
    print("  A - B                 = %s" % mp.nstr(A - B, 20))
    print()

    print("Comparison with the printed numerals (rule: round half-even at the printed third decimal):")
    verdicts = []
    for name, val, printed in [("A = det(1 - L_s) at s = 3/2", A, "0.663"),
                               ("B = Z(s)/Z(s+1) at s = 3/2", B, "0.835")]:
        r = rounded(val, 3)
        ok = (r == Decimal(printed))
        verdicts.append(ok)
        print("  %-30s printed %s   computed %s   rounded %s   %s"
              % (name, printed, mp.nstr(val, 15), r, "PASS" if ok else "FAIL"))
    margin = abs(A - B) - dA - dB - mp.mpf("1e-4")
    ineq = margin > 0
    verdicts.append(ineq)
    print("  %-30s |A - B| = %s exceeds the convergence spreads and the 1e-4 cross-check band   %s"
          % ("A != B (not an identity)", mp.nstr(abs(A - B), 10), "PASS" if ineq else "FAIL"))
    print()
    allok = all(verdicts) and conv_ok and cross_ok
    print("Row verdict: %s" % ("PASS" if allok else "FAIL"))
    print("total runtime %.1f s" % (time.time() - t0))


if __name__ == "__main__":
    main()
