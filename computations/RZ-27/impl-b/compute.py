#!/usr/bin/env python3
"""RZ-27, implementation B.

Recomputes the numerals printed in section 4.3 (displays (4.4), (4.5), the term table)
and section 4.5 of "The Tetrahedral Structure of the Riemann Zeta Function"
(revised October 2026; served PDF sha256 2d5287e7...0f533e54), PDF pages p11-p12.

Method (independent of the obvious mpmath route):
  * Standard library only: decimal + fractions + integers. No mpmath, no sympy.
  * pi from Machin's formula  pi = 16 atan(1/5) - 4 atan(1/239), evaluated in
    scaled-integer fixed point (guard digits included).
  * zeta(3) from Apery's series  zeta(3) = (5/2) sum_{n>=1} (-1)^(n+1) / (n^3 C(2n,n)),
    summed EXACTLY in fractions.Fraction, then converted.  It never touches the
    Ramanujan formula (4.3), so (4.3) is checked against it rather than assumed.
  * e^(2 pi k) from decimal.Decimal.exp at the working precision.
Convergence: everything is computed at two (precision, truncation) settings,
both shown; the run requires them to agree to far beyond the printed digits.
Comparison rule: the computed value, rounded half-even to the last decimal place of the
printed mantissa, must equal the printed numeral.  Truncation agreement is shown
for information only and never changes PASS/FAIL.
"""
from decimal import Decimal, getcontext, ROUND_HALF_EVEN, ROUND_DOWN
from fractions import Fraction
import sys


def machin_pi(digits):
    """pi to `digits` decimal digits via Machin, in scaled integers."""
    guard = 12
    scale = 10 ** (digits + guard)

    def atan_inv(x):
        # atan(1/x) * scale
        total = 0
        term = scale // x
        x2 = x * x
        n = 1
        sign = 1
        while term:
            total += sign * (term // n)
            term //= x2
            n += 2
            sign = -sign
        return total

    p = 16 * atan_inv(5) - 4 * atan_inv(239)
    return Decimal(p) / Decimal(scale)


def zeta3_apery(nterms):
    """Exact partial sum of Apery's series as a Fraction."""
    s = Fraction(0)
    binom = 1  # C(2n, n), updated incrementally
    for n in range(1, nterms + 1):
        binom = binom * (2 * n) * (2 * n - 1) // (n * n)
        s += Fraction((-1) ** (n + 1), n ** 3 * binom)
    return Fraction(5, 2) * s


def frac_to_dec(f):
    return Decimal(f.numerator) / Decimal(f.denominator)


def run(prec, kmax, apery_terms):
    getcontext().prec = prec
    pi = machin_pi(prec + 5)
    z3 = frac_to_dec(zeta3_apery(apery_terms))
    A = Decimal(7) * pi ** 3 / Decimal(180)
    terms = []
    for k in range(1, kmax + 1):
        e = (Decimal(2) * pi * k).exp()
        terms.append(Decimal(1) / (Decimal(k) ** 3 * (e - 1)))
    S = sum(terms, Decimal(0))
    C = -2 * S
    q = (-(Decimal(2) * pi)).exp()
    return dict(pi=pi, z3=z3, A=A, terms=terms, S=S, C=C, q=q)


def decimals_of(s):
    m = s.split('e')[0]
    return len(m.split('.')[1]) if '.' in m else 0


def check(label, printed, value):
    """printed: numeral string as printed, optionally 'm e x' in scientific form."""
    if 'e' in printed:
        mant, ex = printed.split('e')
        v = value / (Decimal(10) ** int(ex))
        target = Decimal(mant)
    else:
        v = value
        target = Decimal(printed)
    d = decimals_of(printed)
    quant = Decimal(1).scaleb(-d)
    rounded = v.quantize(quant, rounding=ROUND_HALF_EVEN)
    trunc = v.quantize(quant, rounding=ROUND_DOWN)
    ok = (rounded == target)
    tr = 'yes' if trunc == target else 'no'
    print(f"  {label:<46} printed {printed:>11}   computed {fmt(value)}"
          f"   rounded {str(rounded)+('e'+printed.split('e')[1] if 'e' in printed else ''):>12}"
          f"   {'PASS' if ok else 'FAIL'}   (truncation agrees: {tr})")
    return ok


def fmt(x, n=16):
    return f"{x:.{n}E}" if (abs(x) < Decimal('0.01') and x != 0) else f"{x:.{n}f}"


def main():
    lo = run(prec=60, kmax=20, apery_terms=110)
    hi = run(prec=90, kmax=30, apery_terms=160)

    print("RZ-27 implementation B (decimal + fractions; Machin pi; Apery zeta(3))")
    print(f"python {sys.version.split()[0]}")
    print()
    print("Convergence (setting 1: prec 60, k<=20, Apery 110 terms | setting 2: prec 90, k<=30, Apery 160 terms)")
    for key in ("pi", "z3", "A", "C"):
        a, b = lo[key], hi[key]
        getcontext().prec = 90
        print(f"  {key:<3} s1 = {a:.40f}")
        print(f"      s2 = {b:.40f}   |s1-s2| = {abs(a-b):.2E}")
    getcontext().prec = 90
    maxdiff = max(abs(lo[k] - hi[k]) for k in ("pi", "z3", "A", "C"))
    conv_ok = maxdiff < Decimal('1e-45')
    print(f"  max |s1-s2| = {maxdiff:.2E}  -> convergence {'OK' if conv_ok else 'NOT OK'} (threshold 1e-45)")
    print()

    r = hi
    pi, z3, A, C, S, terms, q = r["pi"], r["z3"], r["A"], r["C"], r["S"], r["terms"], r["q"]
    ident = A + C - z3
    print(f"Consistency of (4.3): 7pi^3/180 - 2*sum - zeta(3) = {ident:.3E}  (zeta(3) from Apery, independent of (4.3))")
    print()
    print("Quantities (setting 2):")
    print(f"  zeta(3)        = {z3:.30f}")
    print(f"  7 pi^3 / 180   = {A:.30f}")
    print(f"  -2 sum_k 1/(k^3 (e^(2 pi k)-1)) = {C:.30E}")
    print()
    print("Comparison with the printed numerals (rule: round half-even at the printed last place):")
    results = []
    results.append(check("(4.4) 7pi^3/180", "1.2058", A))
    results.append(check("(4.4) overshoot, % of zeta(3): (A-z3)/z3", "0.31", (A - z3) / z3 * 100))
    results.append(check("      overshoot, % of A: (A-z3)/A [alt base]", "0.31", (A - z3) / A * 100))
    results.append(check("(4.5) modular correction -2*sum", "-0.003743", C))
    results.append(check("nome q = e^(-2 pi)", "1.87e-3", q))
    results.append(check("k=1 share of total correction, %", "99.977", terms[0] / S * 100))
    results.append(check("table k=1 term 1/(k^3(e^(2pi k)-1))", "1.871e-3", terms[0]))
    results.append(check("table k=2 term", "4.359e-7", terms[1]))
    results.append(check("table k=3 term", "2.412e-10", terms[2]))
    results.append(check("table k=1 cumulative fraction, %", "99.977", terms[0] / S * 100))
    results.append(check("table k=2 cumulative fraction, %", "99.9999", (terms[0] + terms[1]) / S * 100))
    results.append(check("table k=3 cumulative fraction ('~1')", "1", (terms[0] + terms[1] + terms[2]) / S))
    results.append(check("s4.5 zeta(3) as % of 7pi^3/180", "99.69", z3 / A * 100))
    results.append(check("s4.5 excess of 7pi^3/180 over zeta(3), %", "0.31", (A - z3) / z3 * 100))
    print()
    # The geometric-decay sentence: each term below the last by more than the factor e^(-2 pi).
    ratios = [terms[k + 1] / terms[k] for k in range(len(terms) - 1)]
    ratio_ok = all(x < q for x in ratios)
    print("Sentence check: t_(k+1)/t_k < e^(-2pi) for k = 1..29:"
          f" {'PASS' if ratio_ok else 'FAIL'}  (max ratio {max(ratios):.3E} at k={ratios.index(max(ratios))+1}; "
          f"min ratio {min(ratios):.3E}; e^(-2pi) = {q:.4E})")
    print("  (holds for every k exactly: t_(k+1)/t_k = (k/(k+1))^3 (e^(2pi k)-1)/(e^(2pi(k+1))-1) and"
          " (e^(2pi k)-1)/(e^(2pi(k+1))-1) < e^(-2pi) <=> 1 < e^(2pi).)")
    print()
    n_pass = sum(results)
    print(f"SUMMARY: {n_pass} of {len(results)} printed numerals PASS at the stated rounding rule;"
          f" ratio sentence {'PASS' if ratio_ok else 'FAIL'}; convergence {'OK' if conv_ok else 'NOT OK'}.")
    fails = [i for i, ok in enumerate(results) if not ok]
    print(f"ROW VERDICT: {'PASS' if (not fails and ratio_ok and conv_ok) else 'FAIL (see the FAIL lines above)'}")


if __name__ == "__main__":
    main()
