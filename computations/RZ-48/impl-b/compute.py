#!/usr/bin/env python3
"""RZ-48, implementation B.

Recomputes the three numerals of section 7.4 (the paragraph after display (7.5)) of
"The Tetrahedral Structure of the Riemann Zeta Function" (revised October 2026; served
PDF sha256 2d5287e7...0f533e54), PDF page p19:
    phi(rho_1) = 0.537602 - 0.843199i,
    first pole at s = 0.25 + 7.0673625708673469i,
    xi-convention value 0.595838 - 0.803105i.

Method (independent of the obvious route mpmath.zeta / mpmath.gamma / mpmath.zetazero):
  mpmath is used ONLY as a multiprecision number type (mpf/mpc, +,-,*,/, exp, log, pi,
  powers).  Every special function is written here:
  * zeta(s): P. Borwein's algorithm 2 (Borwein 2000, "An efficient algorithm for the
    Riemann zeta function"): eta(s) by the weights d_k = n sum_{i<=k} (n+i-1)! 4^i /
    ((n-i)! (2i)!), with the d_k as exact integers, then zeta = eta / (1 - 2^(1-s)).
  * log Gamma(z): Stirling's series with exact Bernoulli numbers (computed here as
    Fractions from the Akiyama-Tanigawa recurrence) after an upward shift by N.
  * rho_1: complex secant iteration on this zeta from 0.5+14.1i, 0.5+14.2i; the
    real part is NOT imposed, it is read back.
  * phi(s) evaluated two ways: (a) literally as printed, Lambda(2s-1)/Lambda(2s) with
    Lambda(s) = pi^(-s/2) Gamma(s/2) zeta(s); (b) through Lambda(z) = Lambda(1-z), as
    Lambda(2-2s)/Lambda(2s), which keeps every zeta argument on Re = 1.
  Convergence: everything at two settings (dps 60, Borwein n 120, Stirling shift 40,
  30 Bernoulli terms | dps 90, n 200, shift 70, 50 terms), both shown.
Comparison rule: each real/imaginary part, rounded half-even to the printed number of
decimal places, must equal the printed numeral.
"""
import sys
from fractions import Fraction
from math import comb
import mpmath
from mpmath import mp, mpf, mpc


def bernoulli_even(K):
    """B_2, B_4, ..., B_2K as Fractions (Akiyama-Tanigawa; B_1 = +1/2 convention unused)."""
    out = []
    M = 2 * K
    a = [Fraction(0)] * (M + 1)
    Bs = []
    for m in range(M + 1):
        a[m] = Fraction(1, m + 1)
        for j in range(m, 0, -1):
            a[j - 1] = j * (a[j - 1] - a[j])
        Bs.append(a[0])
    for k in range(1, K + 1):
        out.append(Bs[2 * k])
    return out


class Setting:
    def __init__(self, dps, n, shift, nbern):
        self.dps, self.n, self.shift, self.nbern = dps, n, shift, nbern
        # Borwein integer weights d_0..d_n
        n_ = n
        partial = Fraction(0)
        self.d = []
        from math import factorial
        for i in range(n_ + 1):
            partial += Fraction(factorial(n_ + i - 1) * 4 ** i, factorial(n_ - i) * factorial(2 * i))
            self.d.append(n_ * partial)
        assert all(x.denominator == 1 for x in self.d)
        self.d = [int(x) for x in self.d]
        self.bern = bernoulli_even(nbern)

    def zeta(self, s):
        n, d = self.n, self.d
        dn = mpf(d[n])
        acc = mpc(0)
        for k in range(n):
            term = mpf(d[k] - d[n]) / mpmath.power(k + 1, s)
            acc += term if k % 2 == 0 else -term
        return -acc / (dn * (1 - mpmath.power(2, 1 - s)))

    def loggamma(self, z):
        N = self.shift
        w = z + N
        acc = (w - mpf('0.5')) * mpmath.log(w) - w + mpmath.log(2 * mp.pi) / 2
        wp = w
        w2 = w * w
        for k, B in enumerate(self.bern, start=1):
            acc += mpf(B.numerator) / mpf(B.denominator) / (2 * k * (2 * k - 1) * wp)
            wp *= w2
        for j in range(N):
            acc -= mpmath.log(z + j)
        return acc

    def Lambda(self, z):
        return mpmath.exp(-z / 2 * mpmath.log(mp.pi) + self.loggamma(z / 2)) * self.zeta(z)


def secant_zero(f, x0, x1, tol, maxit=200):
    f0, f1 = f(x0), f(x1)
    for _ in range(maxit):
        x2 = x1 - f1 * (x1 - x0) / (f1 - f0)
        if abs(x2 - x1) < tol:
            return x2
        x0, f0, x1, f1 = x1, f1, x2, f(x2)
    raise RuntimeError("secant did not converge")


def zero_count(st, sig_l, sig_r, t_lo, t_hi):
    """Argument principle on the rectangle [sig_l, sig_r] x [t_lo, t_hi] with this zeta:
    the winding number of zeta along the boundary, by adaptive subdivision so that
    every step turns the argument by less than pi/4."""
    mp.dps = 30
    corners = [mpc(sig_l, t_lo), mpc(sig_r, t_lo), mpc(sig_r, t_hi), mpc(sig_l, t_hi), mpc(sig_l, t_lo)]
    total = mpf(0)
    for a, b in zip(corners[:-1], corners[1:]):
        stack = [(a, b, st.zeta(a), st.zeta(b))]
        while stack:
            x, y, fx, fy = stack.pop()
            dphi = mpmath.arg(fy / fx)
            if abs(dphi) < mp.pi / 4 or abs(y - x) < mpf('1e-6'):
                total += dphi
            else:
                m = (x + y) / 2
                fm = st.zeta(m)
                stack.append((m, y, fm, fy))
                stack.append((x, m, fx, fm))
    return total / (2 * mp.pi)


def run(st):
    mp.dps = st.dps
    rho = secant_zero(st.zeta, mpc('0.5', '14.1'), mpc('0.5', '14.2'), tol=mpf(10) ** (-(st.dps - 12)))
    s = rho
    phi_lit = st.Lambda(2 * s - 1) / st.Lambda(2 * s)
    phi_fe = st.Lambda(2 - 2 * s) / st.Lambda(2 * s)

    def xi(z):
        return z * (z - 1) / 2 * st.Lambda(z)
    phi_xi = xi(2 * s - 1) / xi(2 * s)
    pole = rho / 2
    return dict(rho=rho, pole=pole, phi_lit=phi_lit, phi_fe=phi_fe, phi_xi=phi_xi,
                zeta_at_rho=abs(st.zeta(rho)))


def check(label, printed, value):
    from decimal import Decimal, ROUND_HALF_EVEN, ROUND_DOWN
    v = Decimal(mpmath.nstr(value, 40, strip_zeros=False, min_fixed=-50, max_fixed=50))
    d = len(printed.split('.')[1]) if '.' in printed else 0
    q = Decimal(1).scaleb(-d)
    r = v.quantize(q, rounding=ROUND_HALF_EVEN)
    ok = r == Decimal(printed)
    print(f"  {label:<36} printed {printed:>22}   computed {mpmath.nstr(value, 24):>28}   rounded {str(r):>22}   {'PASS' if ok else 'FAIL'}")
    return ok


def main():
    print("RZ-48 implementation B (own Borwein zeta, own Stirling log-Gamma, own secant; mpmath as number type only)")
    print(f"python {sys.version.split()[0]}, mpmath {mpmath.__version__} (arithmetic only)")
    print()
    s1 = Setting(dps=60, n=120, shift=40, nbern=30)
    s2 = Setting(dps=90, n=200, shift=70, nbern=50)
    r1 = run(s1)
    r2 = run(s2)
    nz = zero_count(Setting(dps=30, n=60, shift=30, nbern=20), -0.5, 1.5, -14.5, 14.5)
    mp.dps = 90
    print(f"Winding number of zeta around the rectangle -0.5 <= Re s <= 1.5, |Im s| <= 14.5 (argument principle, own zeta):"
          f" {mpmath.nstr(nz, 8)}")
    print("  = (#zeros inside) - 1 (the pole at s = 1).  zeta(conj s) = conj zeta(s), so #zeros = 2*(#zeros with Im s > 0) + (#real zeros);")
    print("  with rho_1 found in the upper half-plane, a winding of 1 means rho_1 and its conjugate are the ONLY zeros there:")
    print(f"  rho_1 is the first zero above the real axis: {'yes' if abs(nz - 1) < mpf('0.01') else 'NO'}")
    first_ok = abs(nz - 1) < mpf('0.01')
    print()
    print("Convergence (setting 1: dps 60, n 120, shift 40, 30 Bernoulli | setting 2: dps 90, n 200, shift 70, 50 Bernoulli)")
    worst = mpf(0)
    for key in ("rho", "phi_lit", "phi_fe", "phi_xi"):
        a, b = r1[key], r2[key]
        diff = abs(a - b)
        worst = max(worst, diff)
        print(f"  {key:<8} s1 = {mpmath.nstr(a, 45)}")
        print(f"           s2 = {mpmath.nstr(b, 45)}   |s1-s2| = {mpmath.nstr(diff, 3)}")
    conv_ok = worst < mpf('1e-40')
    print(f"  max |s1-s2| = {mpmath.nstr(worst, 3)} -> convergence {'OK' if conv_ok else 'NOT OK'} (threshold 1e-40)")
    print()
    r = r2
    lit_vs_fe = abs(r["phi_lit"] - r["phi_fe"])
    print(f"rho_1 (secant on own zeta)  = {mpmath.nstr(r['rho'], 40)}")
    print(f"  |zeta(rho_1)| = {mpmath.nstr(r['zeta_at_rho'], 3)};  Re(rho_1) - 1/2 = {mpmath.nstr(r['rho'].real - mpf('0.5'), 3)}")
    print(f"phi(rho_1), literal (7.5)   = {mpmath.nstr(r['phi_lit'], 30)}")
    print(f"phi(rho_1), via Lambda(z)=Lambda(1-z) = {mpmath.nstr(r['phi_fe'], 30)}   |difference| = {mpmath.nstr(lit_vs_fe, 3)}")
    print(f"phi_xi(rho_1) = xi(2s-1)/xi(2s) = {mpmath.nstr(r['phi_xi'], 30)}")
    s = r["rho"]
    ratio = r["phi_xi"] / r["phi_lit"]
    print(f"  phi_xi/phi = {mpmath.nstr(ratio, 25)};  (s-1)/s = {mpmath.nstr((s - 1) / s, 25)}")
    print(f"  |phi(rho_1)| = {mpmath.nstr(abs(r['phi_lit']), 25)};  |(s-1)/s| at rho_1 = {mpmath.nstr(abs((s - 1) / s), 25)}")
    print()
    print("Comparison with the printed numerals (rule: round half-even at the printed last place, each part):")
    res = []
    res.append(check("phi(rho_1) real part", "0.537602", r["phi_lit"].real))
    res.append(check("phi(rho_1) imaginary part", "-0.843199", r["phi_lit"].imag))
    res.append(check("first pole, real part", "0.25", r["pole"].real))
    res.append(check("first pole, imaginary part", "7.0673625708673469", r["pole"].imag))
    res.append(check("xi-convention value, real part", "0.595838", r["phi_xi"].real))
    res.append(check("xi-convention value, imaginary part", "-0.803105", r["phi_xi"].imag))
    fe_ok = lit_vs_fe < mpf('1e-40')
    print(f"  literal (7.5) and functional-equation forms agree to 1e-40: {'yes' if fe_ok else 'NO'}")
    print()
    print(f"SUMMARY: {sum(res)} of {len(res)} printed numerals PASS; convergence {'OK' if conv_ok else 'NOT OK'}.")
    print(f"ROW VERDICT: {'PASS' if (all(res) and conv_ok and fe_ok and first_ok) else 'FAIL (see the FAIL lines above)'}")


if __name__ == "__main__":
    main()
