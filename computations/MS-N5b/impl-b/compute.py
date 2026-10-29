#!/usr/bin/env python3
"""MS-N5b, implementation B.

Recomputes the closest-pair numerals of the Figure 1 caption (PDF page p19, folio 18) of
"The Modular Surface ..." characterization paper (revised October 2026; served PDF sha256
b4841489...5f13af5):
    "The right panel resolves the closest pair, t ~ 32.935 (zeta) and t ~ 33.000 (L)."
over the plotted window 0 <= t <= 40, s = 1/2 + it, chi_5 the real character mod 5.

Method (independent of the obvious route mpmath.zetazero / Dirichlet-series or Hurwitz
evaluation of L): both functions are evaluated through Riemann's theta-function (Mellin)
representation of the COMPLETED function, split at x = 1 and summed with upper
incomplete gamma functions (mpmath used for gammainc, powers and arithmetic):
    Lambda_zeta(s) = pi^(-s/2) Gamma(s/2) zeta(s)
                   = 1/(s-1) - 1/s + sum_{n>=1} [ (pi n^2)^(-s/2) Gamma(s/2, pi n^2)
                                                + (pi n^2)^(-(1-s)/2) Gamma((1-s)/2, pi n^2) ]
    Lambda_chi(s)  = (5/pi)^(s/2) Gamma(s/2) L(s, chi_5)          (chi_5 even, primitive,
                   = sum_{n>=1} chi_5(n) [ x_n^(-s/2) Gamma(s/2, x_n)      root number 1)
                                         + x_n^(-(1-s)/2) Gamma((1-s)/2, x_n) ],  x_n = pi n^2/5.
  Both are real on Re s = 1/2, so the zeros on the line are sign changes of a real function.
  * Representation checks against closed forms (no library zeta/L used):
      zeta(2) = pi^2/6, L(2, chi_5) = 4 pi^2/(25 sqrt 5), L(1, chi_5) = 2 log(phi)/sqrt 5.
  * Completeness: the argument principle, by adaptive tracking of arg around the box
      -1 <= Re s <= 2, -40 <= Im s <= 40, applied to xi(s) = s(s-1)Lambda_zeta(s)/2 and to
      Lambda_chi(s) (both entire, conjugate-symmetric) counts every zero in the box; the
      count is compared with the number of sign changes found on the line, 0 < t <= 40.
  * Zero-finder: a sign-change scan with step 0.02, then the Illinois variant of regula
      falsi on each bracket to |bracket| < 1e-28.
  * Convergence: the refinement is run at 40 and at 60 digits; both printed.
  * The closest pair is the minimum of |gamma_zeta - gamma_L| over all pairs in the window.

Floating-point reproduction, not a certified enclosure.
Comparison rule: each ordinate rounded half-even at the printed third decimal must equal
the printed numeral; "closest pair" is checked as an inequality against every other pair.
"""
import sys
import time
from decimal import Decimal, ROUND_HALF_EVEN
import mpmath as mp

CHI5 = {0: 0, 1: 1, 2: -1, 3: -1, 4: 1}
T_MAX = 40


def lam_zeta(s):
    tot = 1 / (s - 1) - 1 / s
    cut = mp.mp.dps * 2.4 + 30
    n = 1
    while True:
        x = mp.pi * n * n
        if x > cut:
            break
        tot += x ** (-s / 2) * mp.gammainc(s / 2, x) + x ** (-(1 - s) / 2) * mp.gammainc((1 - s) / 2, x)
        n += 1
    return tot


def lam_chi(s):
    tot = mp.mpc(0)
    cut = mp.mp.dps * 2.4 + 30
    n = 1
    while True:
        x = mp.pi * n * n / 5
        if x > cut:
            break
        c = CHI5[n % 5]
        if c:
            tot += c * (x ** (-s / 2) * mp.gammainc(s / 2, x) + x ** (-(1 - s) / 2) * mp.gammainc((1 - s) / 2, x))
        n += 1
    return tot


def xi(s):
    return s * (s - 1) * lam_zeta(s) / 2


def on_line(f, t):
    return mp.re(f(mp.mpc(mp.mpf(1) / 2, t)))


# ---------------------------------------------------------------- argument principle
def winding(f, corners, maxdepth=12):
    """Total change of arg f along the closed polygon, divided by 2 pi, by adaptive steps."""
    total = mp.mpf(0)
    minabs = None
    nevals = 0
    for a, b in zip(corners, corners[1:] + corners[:1]):
        npts = int(abs(b - a) / mp.mpf("0.5")) + 1
        pts = [a + (b - a) * k / npts for k in range(npts + 1)]
        fa = f(pts[0])
        nevals += 1
        for k in range(npts):
            z0, z1 = pts[k], pts[k + 1]
            fz1 = f(z1)
            nevals += 1
            out_end = fz1
            # adaptive subdivision until each step turns arg by less than pi/4
            segs = [(z0, z1, fa, fz1, 0)]
            while segs:
                p, q, fp, fq, dep = segs.pop()
                d = mp.arg(fq / fp)
                if abs(d) < mp.pi / 4 or dep >= maxdepth:
                    total += d
                    for v in (fp, fq):
                        av = abs(v)
                        minabs = av if minabs is None or av < minabs else minabs
                else:
                    m = (p + q) / 2
                    fm = f(m)
                    nevals += 1
                    segs.append((m, q, fm, fq, dep + 1))
                    segs.append((p, m, fp, fm, dep + 1))
            fa = out_end
    return total / (2 * mp.pi), minabs, nevals


# ---------------------------------------------------------------- zeros on the line
def scan(f, step):
    brackets = []
    t = mp.mpf(0)
    ft = on_line(f, t)
    vals = 1
    while t < T_MAX:
        t2 = min(t + step, mp.mpf(T_MAX))
        f2 = on_line(f, t2)
        vals += 1
        if ft == 0:
            brackets.append((t, t))
        elif ft * f2 < 0:
            brackets.append((t, t2))
        t, ft = t2, f2
    return brackets, ft, vals


def illinois(f, a, b, tol):
    fa, fb = on_line(f, a), on_line(f, b)
    for _ in range(400):
        c = (a * fb - b * fa) / (fb - fa)
        fc = on_line(f, c)
        if fc == 0:
            return c
        if fc * fb < 0:
            a, fa = b, fb
            b, fb = c, fc
        else:
            b, fb = c, fc
            fa = fa / 2
        if abs(b - a) < tol:
            return (a + b) / 2
    raise RuntimeError("Illinois did not converge")


def rounded(x, places):
    q = Decimal(1).scaleb(-places)
    return Decimal(mp.nstr(x, 40, strip_zeros=False)).quantize(q, rounding=ROUND_HALF_EVEN)


def main():
    t0 = time.time()
    print("MS-N5b implementation B (theta/incomplete-gamma completed functions; argument-principle count; Illinois refinement)")
    print("python %s, mpmath %s" % (sys.version.split()[0], mp.__version__))
    print("Floating-point reproduction, not a certified enclosure.")
    print()

    # -------- representation checks
    mp.mp.dps = 40
    phi = (1 + mp.sqrt(5)) / 2
    z2 = lam_zeta(mp.mpf(2)) * mp.pi                         # Lambda(2) = pi^-1 Gamma(1) zeta(2)
    l2 = mp.re(lam_chi(mp.mpf(2))) * mp.pi / 5               # Lambda_chi(2) = (5/pi) Gamma(1) L(2)
    l1 = mp.re(lam_chi(mp.mpf(1))) / (mp.sqrt(5 / mp.pi) * mp.sqrt(mp.pi))   # (5/pi)^(1/2) Gamma(1/2) L(1)
    print("Representation checks (40 digits):")
    for name, v, ref in [("zeta(2) vs pi^2/6", z2, mp.pi ** 2 / 6),
                         ("L(2,chi5) vs 4 pi^2/(25 sqrt5)", l2, 4 * mp.pi ** 2 / (25 * mp.sqrt(5))),
                         ("L(1,chi5) vs 2 log(phi)/sqrt5", l1, 2 * mp.log(phi) / mp.sqrt(5))]:
        print("  %-32s %s   %s   |diff| = %s" % (name, mp.nstr(v, 25), mp.nstr(ref, 25), mp.nstr(abs(v - ref), 3)))
    print("  Lambda_zeta(1/2) = %s, Lambda_chi(1/2) = %s (nonzero: t = 0 is not a zero ordinate)"
          % (mp.nstr(on_line(lam_zeta, 0), 12), mp.nstr(on_line(lam_chi, 0), 12)))
    print("  max |Im Lambda| on the line at t = 10, 25, 40 (should be 0): %s"
          % mp.nstr(max(abs(mp.im(f(mp.mpc(0.5, tt)))) for f in (lam_zeta, lam_chi) for tt in (10, 25, 40)), 3))
    print()

    # -------- argument principle
    mp.mp.dps = 30
    box = [mp.mpc(-1, -T_MAX), mp.mpc(2, -T_MAX), mp.mpc(2, T_MAX), mp.mpc(-1, T_MAX)]
    print("Argument principle on the box -1 <= Re s <= 2, -40 <= Im s <= 40 (30 digits):")
    counts = {}
    for name, f in (("xi (zeta)", xi), ("Lambda_chi (L)", lam_chi)):
        t = time.time()
        w, mn, ne = winding(f, box)
        counts[name] = int(mp.nint(w))
        print("  %-15s winding = %s -> %d zeros in the box -> %d with 0 < Im s <= 40 (conjugate symmetry);"
              " min |f| on boundary %s; %d evaluations; %.1f s"
              % (name, mp.nstr(w, 12), counts[name], counts[name] // 2, mp.nstr(mn, 3), ne, time.time() - t))
    print()

    # -------- scan
    print("Sign-change scan on s = 1/2 + it, 0 <= t <= 40, step 0.02 (30 digits):")
    brk = {}
    for name, f in (("xi (zeta)", lam_zeta), ("Lambda_chi (L)", lam_chi)):
        t = time.time()
        b, fend, nv = scan(f, mp.mpf("0.02"))
        brk[name] = b
        match = (2 * len(b) == counts[name])
        print("  %-15s %d sign changes (box count / 2 = %d): %s; f(40) = %s; %.1f s"
              % (name, len(b), counts[name] // 2, "complete" if match else "INCOMPLETE", mp.nstr(fend, 3), time.time() - t))
    complete = all(2 * len(brk[k]) == counts[k] for k in counts)
    print()

    # -------- refinement at two precisions
    zeros = {}
    for dps, tol in ((40, mp.mpf("1e-28")), (60, mp.mpf("1e-28"))):
        mp.mp.dps = dps
        zeros[dps] = {}
        for name, f in (("xi (zeta)", lam_zeta), ("Lambda_chi (L)", lam_chi)):
            zeros[dps][name] = [illinois(f, mp.mpf(a), mp.mpf(b), tol) for a, b in brk[name]]
    mp.mp.dps = 60
    spread = max(abs(x - y) for k in zeros[40] for x, y in zip(zeros[40][k], zeros[60][k]))
    print("Zero ordinates in 0 < t <= 40 (Illinois at 40 and 60 digits; max spread over all zeros = %s):" % mp.nstr(spread, 3))
    for name in ("xi (zeta)", "Lambda_chi (L)"):
        print("  %s:" % name)
        for x40, x60 in zip(zeros[40][name], zeros[60][name]):
            print("    %s   (40-digit run: %s)" % (mp.nstr(x60, 22), mp.nstr(x40, 22)))
    print()

    # -------- closest pair
    Z = zeros[60]["xi (zeta)"]
    L = zeros[60]["Lambda_chi (L)"]
    pairs = sorted(((abs(a - b), a, b) for a in Z for b in L), key=lambda p: p[0])
    print("Closest zeta/L pairs in the window (all %d pairs ranked; first five):" % len(pairs))
    for g, a, b in pairs[:5]:
        print("  gap %s   zeta %s   L %s" % (mp.nstr(g, 12), mp.nstr(a, 15), mp.nstr(b, 15)))
    gmin, gz, gl = pairs[0]
    print()

    print("Comparison with the printed numerals (rule: round half-even at the printed third decimal):")
    verdicts = []
    for name, val, printed in [("closest-pair zeta ordinate", gz, "32.935"), ("closest-pair L ordinate", gl, "33.000")]:
        r = rounded(val, 3)
        ok = (r == Decimal(printed))
        verdicts.append(ok)
        print("  %-28s printed %s   computed %s   rounded %s   %s" % (name, printed, mp.nstr(val, 15), r, "PASS" if ok else "FAIL"))
    closest_ok = complete and (pairs[1][0] - gmin > 10 * spread) and abs(gz - mp.mpf("32.935")) < 1 and abs(gl - mp.mpf("33.0")) < 1
    verdicts.append(closest_ok)
    print("  %-28s gap %s < next gap %s, zero lists complete by the argument principle   %s"
          % ("closest pair over 0<=t<=40", mp.nstr(gmin, 8), mp.nstr(pairs[1][0], 8), "PASS" if closest_ok else "FAIL"))
    print()
    print("Row verdict: %s" % ("PASS" if all(verdicts) else "FAIL"))
    print("total runtime %.1f s" % (time.time() - t0))


if __name__ == "__main__":
    main()
