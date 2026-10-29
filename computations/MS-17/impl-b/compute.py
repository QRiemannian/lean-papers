#!/usr/bin/env python3
"""MS-17, implementation B.

Recomputes the two numerals of section 2.5 of "The Invariant Structure of the Modular
Surface" (revised October 2026; served PDF sha256 b4841489...0b13af5), PDF page p08:
  "the smallest known Salem number (Lehmer's number, ~ 1.17628) and the plastic number
   (~ 1.32472, the smallest Pisot number) both lie below phi."

Quantities:
  Lehmer's number = the unique root > 1 of L(x) = x^10 + x^9 - x^7 - x^6 - x^5 - x^4 - x^3 + x + 1;
  plastic number  = the unique real root of  P(x) = x^3 - x - 1;
  phi = (1 + sqrt 5)/2, the positive root of x^2 - x - 1.
Method (independent of a floating-point root finder such as mpmath.polyroots / numpy.roots):
  EXACT rational arithmetic only (fractions.Fraction, standard library).  Sturm sequences
  count the real roots in an interval exactly; bisection with exact sign evaluation
  brackets each root in a rational interval of width < 10^-40 (setting 2) and < 10^-20
  (setting 1).  "< phi" is decided exactly: a rational upper end h of the bracket
  satisfies h < phi iff h^2 - h - 1 < 0 (h > 0).  No floating point enters any decision.
  Supplementary (class membership, not the "smallest" claims, which are literature):
  Salem: L is reciprocal; with y = x + 1/x, x^-5 L(x) = T(y), and the Sturm count shows T has
  exactly one root in (2, inf) and four in (-2, 2) (one root outside the unit circle, the
  rest on it, one inside).  Pisot: P has exactly one real root theta (Sturm), the two
  complex conjugates have |z|^2 = 1/theta < 1 (product of the roots = 1), and P has no
  rational root (rational-root test), so P is irreducible over Q.
Comparison rule: the root, rounded half-even to the printed 5 decimals, must equal the
printed numeral.
"""
import sys
from fractions import Fraction as F
from decimal import Decimal, getcontext, ROUND_HALF_EVEN


def strip(p):
    p = list(p)
    while len(p) > 1 and p[-1] == 0:
        p.pop()
    return p if p else [F(0)]


def ev(p, x):  # p[i] = coefficient of x^i
    acc = F(0)
    for c in reversed(p):
        acc = acc * x + c
    return acc


def deriv(p):
    return strip([i * p[i] for i in range(1, len(p))] or [F(0)])


def polyrem(a, b):
    """Remainder of a by b (exact)."""
    a = strip(a)
    db = len(b) - 1
    while len(a) - 1 >= db and not (len(a) == 1 and a[0] == 0):
        coef = a[-1] / b[-1]
        shift = len(a) - 1 - db
        for i in range(len(b)):
            a[i + shift] -= coef * b[i]
        a.pop()
        a = strip(a)
        if db == 0:
            break
    return strip(a)


def sturm(p):
    seq = [strip(p), deriv(p)]
    while True:
        r = polyrem(seq[-2], seq[-1])
        if len(r) == 1 and r[0] == 0:
            break
        seq.append([-c for c in r])
        if len(r) == 1:
            break
    return seq


def sign_changes(seq, x):
    vals = [ev(q, x) for q in seq]
    vals = [v for v in vals if v != 0]
    return sum(1 for a, b in zip(vals, vals[1:]) if (a > 0) != (b > 0))


def sign_changes_inf(seq, positive=True):
    vals = []
    for q in seq:
        lead = q[-1]
        deg = len(q) - 1
        s = lead if positive else lead * (-1) ** deg
        if s != 0:
            vals.append(s)
    return sum(1 for a, b in zip(vals, vals[1:]) if (a > 0) != (b > 0))


def count_roots(seq, a, b):  # roots in (a, b], a, b not roots
    return sign_changes(seq, a) - sign_changes(seq, b)


def bisect(p, lo, hi, width):
    flo = ev(p, lo)
    assert flo != 0 and ev(p, hi) != 0 and (flo > 0) != (ev(p, hi) > 0)
    while hi - lo >= width:
        mid = (lo + hi) / 2
        fm = ev(p, mid)
        if fm == 0:
            return mid, mid
        if (fm > 0) == (flo > 0):
            lo, flo = mid, fm
        else:
            hi = mid
    return lo, hi


def to_dec(f, digits=50):
    getcontext().prec = digits
    return Decimal(f.numerator) / Decimal(f.denominator)


def check(label, printed, lo, hi):
    d = len(printed.split('.')[1])
    q = Decimal(1).scaleb(-d)
    rlo = to_dec(lo).quantize(q, rounding=ROUND_HALF_EVEN)
    rhi = to_dec(hi).quantize(q, rounding=ROUND_HALF_EVEN)
    ok = (rlo == rhi == Decimal(printed))
    print(f"  {label:<18} printed {printed}   bracket [{to_dec(lo, 45)}, {to_dec(hi, 45)}]")
    print(f"  {'':<18} both ends round to {rlo} / {rhi}   {'PASS' if ok else 'FAIL'}")
    return ok


def main():
    print("MS-17 implementation B (exact rationals: Sturm sequences + exact bisection)")
    print(f"python {sys.version.split()[0]}")
    print()
    L = [F(c) for c in (1, 1, 0, -1, -1, -1, -1, -1, 0, 1, 1)]   # x^0 .. x^10
    P = [F(c) for c in (-1, -1, 0, 1)]                            # x^0 .. x^3
    G = [F(c) for c in (-1, -1, 1)]                               # x^2 - x - 1
    sL, sP = sturm(L), sturm(P)
    nL_gt1 = sign_changes(sL, F(1)) - sign_changes_inf(sL, True)
    nL_real = sign_changes_inf(sL, False) - sign_changes_inf(sL, True)
    nP_real = sign_changes_inf(sP, False) - sign_changes_inf(sP, True)
    nP_gt1 = sign_changes(sP, F(1)) - sign_changes_inf(sP, True)
    print(f"Sturm: L has {nL_real} real roots, {nL_gt1} of them in (1, inf); P has {nP_real} real root(s), {nP_gt1} in (1, inf).")
    assert ev(L, F(1)) != 0 and ev(P, F(1)) != 0

    results = []
    brackets = {}
    for setting, width in (("setting 1", F(1, 10 ** 20)), ("setting 2", F(1, 10 ** 40))):
        lL = bisect(L, F(1), F(2), width)
        lP = bisect(P, F(1), F(2), width)
        brackets[setting] = (lL, lP)
        print(f"{setting} (bracket width < {width}):")
        print(f"  Lehmer  in [{to_dec(lL[0], 45)}, {to_dec(lL[1], 45)}]")
        print(f"  plastic in [{to_dec(lP[0], 45)}, {to_dec(lP[1], 45)}]")
    (l1, p1), (l2, p2) = brackets["setting 1"], brackets["setting 2"]
    nested = (l1[0] <= l2[0] <= l2[1] <= l1[1]) and (p1[0] <= p2[0] <= p2[1] <= p1[1])
    print(f"Convergence: setting-2 brackets nested inside setting-1 brackets: {'yes' if nested else 'NO'}")
    print()
    print("Comparison with the printed numerals (rule: round half-even at 5 decimals; both bracket ends must round to the printed value):")
    lL, lP = brackets["setting 2"]
    results.append(check("Lehmer's number", "1.17628", *lL))
    results.append(check("plastic number", "1.32472", *lP))
    print()
    below = []
    for name, (lo, hi) in (("Lehmer", lL), ("plastic", lP)):
        exact = hi > 0 and ev(G, hi) < 0
        below.append(exact)
        print(f"  {name} < phi (exact: upper bracket end h has h^2 - h - 1 = {to_dec(ev(G, hi), 12)} < 0): {'PASS' if exact else 'FAIL'}")
    print()
    # Supplementary class checks.
    # Salem: trace polynomial T(y), x^-5 L(x) = T(x + 1/x)
    V = [[F(2)], [F(0), F(1)]]               # V_0 = 2, V_1 = y ; V_{j+1} = y V_j - V_{j-1}
    for j in range(1, 5):
        a = [F(0)] + V[j]
        b = V[j - 1] + [F(0)] * (len(a) - len(V[j - 1]))
        V.append(strip([x - y for x, y in zip(a, b)]))
    coeff_mid = L[5]
    T = [F(0)] * 6
    T[0] += coeff_mid
    for j in range(1, 6):
        for i, c in enumerate(V[j]):
            T[i] += L[5 + j] * c
    T = strip(T)
    # identity check at a few rational points x: x^-5 L(x) == T(x + 1/x)
    ident = all(ev(L, x) / x ** 5 == ev(T, x + 1 / x) for x in (F(2), F(3, 7), F(-5, 2), F(11, 3)))
    sT = sturm(T)
    in_m2_2 = count_roots(sT, F(-2), F(2))
    gt2 = sign_changes(sT, F(2)) - sign_changes_inf(sT, True)
    salem = ident and in_m2_2 == 4 and gt2 == 1 and ev(T, F(2)) != 0 and ev(T, F(-2)) != 0
    print(f"  Supplementary: T(y) coefficients (y^0..y^5) = {[str(c) for c in T]}; identity x^-5 L(x) = T(x+1/x) at 4 points: {ident}")
    print(f"  Sturm on T: {in_m2_2} roots in (-2, 2), {gt2} in (2, inf) -> Lehmer's number has Salem shape: {'yes' if salem else 'NO'}")
    rr = all(ev(P, F(r)) != 0 for r in (1, -1))
    lo, hi = lP
    print(f"  Supplementary: P has no rational root: {rr}; |conjugates|^2 = 1/theta in [{to_dec(1/hi, 20)}, {to_dec(1/lo, 20)}] < 1 -> Pisot shape: "
          f"{'yes' if (rr and nP_real == 1 and hi > 1) else 'NO'}")
    print("  ('smallest known Salem' and 'smallest Pisot' (Siegel 1944) are literature statements; not computed here.)")
    print()
    ok = all(results) and all(below) and nested and nL_gt1 == 1 and nP_real == 1
    print(f"SUMMARY: {sum(results)} of 2 printed numerals PASS; both below phi: {'PASS' if all(below) else 'FAIL'}.")
    print(f"ROW VERDICT: {'PASS' if ok else 'FAIL (see above)'}")


if __name__ == "__main__":
    main()
