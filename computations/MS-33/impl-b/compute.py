#!/usr/bin/env python3
"""MS-33, implementation B.

The printed sentence (section 3.4 of "The Invariant Structure of the Modular Surface",
revised October 2026; served PDF sha256 b4841489...0b13af5; PDF page p13):
  "... g_c = 1/(pi sqrt(d_K)) is a field certificate ... it does not distinguish X(1):
   nine of the curves Gamma_0(N) with N <= 60 return the same value exactly."

The print does not define the rule that assigns a value to a curve.  This program uses
the rule of the lab's own investigation record behind the sentence (an internal working
record, 2026-08-16): the curve's MARKED FIELD is the field of its systolic hyperbolic
element; the value is 1/(pi sqrt(d_K)) with d_K the fundamental discriminant of that
field.  Concretely, for Gamma_0(N):
  t_min(N) = the least |trace| > 2 over hyperbolic elements of Gamma_0(N),
  d_K(N)   = the fundamental discriminant of Q(sqrt(t_min^2 - 4)),
  value(N) = 1/(pi sqrt(d_K(N))), equal to X(1)'s value g_c = 1/(pi sqrt 5) iff d_K(N) = 5.
The count is #{N <= 60 : d_K(N) = 5}.  (The record's own test is the narrower
"Gamma_0(N) contains an element of trace 3"; both counts are printed.)

Method (exact integer arithmetic; two derivations that share nothing but the definition):
  (A) LOCAL criterion.  An element (a b; c d) of SL(2,Z) with N | c and trace t exists iff
      x^2 - t x + 1 = 0 has a solution mod N (take a = x, d = t - x, c = N,
      b = (a d - 1)/N).  Solvability is decided prime-power by prime-power from the
      factorisation of N, by Legendre symbols (Euler's criterion) and Hensel / 2-adic square
      classes on the discriminant t^2 - 4 -- no search over residues.
  (B) WITNESS + EXCLUSION.  For the t_min found, an explicit matrix in Gamma_0(N) is built and
      checked (det = 1, N | c, trace = t_min); every trace 2 < |t| < t_min is excluded by
      exhausting x mod N.  (Trace t and -t are the same question: negate the matrix.)
  Both must give the same t_min for every N <= 60.
Comparison rule: the count is an exact integer; PASS iff it equals the printed nine.
"""
import sys
from math import isqrt, pi, sqrt


def factor(n):
    f, p = {}, 2
    while p * p <= n:
        while n % p == 0:
            f[p] = f.get(p, 0) + 1
            n //= p
        p += 1
    if n > 1:
        f[n] = f.get(n, 0) + 1
    return f


def is_square_mod_prime_power(D, p, e):
    """Is D a square modulo p^e?"""
    m = p ** e
    D %= m
    if D == 0:
        return True
    v = 0
    while D % p == 0:
        D //= p
        v += 1
    if v % 2:
        return False
    k = e - v  # need u = D (unit) to be a square mod p^k
    if p != 2:
        return pow(D % p, (p - 1) // 2, p) == 1
    if k == 1:
        return True
    if k == 2:
        return D % 4 == 1
    return D % 8 == 1


def solvable_local(t, N):
    """x^2 - t x + 1 = 0 (mod N) solvable?  Decided per prime power."""
    for p, e in factor(N).items():
        D = t * t - 4
        if p != 2:
            ok = is_square_mod_prime_power(D, p, e)       # 2 invertible: x = (t + y)/2, y^2 = D
        else:
            if t % 2:                                     # x(x - t) + 1 is odd for every x
                ok = False
            else:
                s = t // 2                                # (x - s)^2 = s^2 - 1  (mod 2^e)
                ok = is_square_mod_prime_power(s * s - 1, 2, e)
        if not ok:
            return False
    return True


def tmin_local(N):
    t = 3
    while not solvable_local(t, N):
        t += 1
    return t


def tmin_witness(N):
    t = 3
    while True:
        xs = [x for x in range(N) if (x * x - t * x + 1) % N == 0]
        if xs:
            a = xs[0]
            d = t - a
            c = N
            b = (a * d - 1) // N
            M = (a, b, c, d)
            assert a * d - b * c == 1 and c % N == 0 and a + d == t
            return t, M
        t += 1


def fundamental_discriminant(D):
    """Fundamental discriminant of Q(sqrt D), D > 0 not a square."""
    core = 1
    for p, e in factor(D).items():
        if e % 2:
            core *= p
    return core if core % 4 == 1 else 4 * core


def main():
    print("MS-33 implementation B (exact integers: local criterion vs explicit witness + exclusion)")
    print(f"python {sys.version.split()[0]}")
    print()
    print("   N  t_min  witness (a b; c d) in Gamma_0(N)        t^2-4   d_K   value 1/(pi sqrt d_K)   = g_c?  trace-3?")
    hits, hits_t3, agree = [], [], True
    gc = 1 / (pi * sqrt(5))
    for N in range(1, 61):
        tl = tmin_local(N)
        tw, M = tmin_witness(N)
        if tl != tw:
            agree = False
        D = tw * tw - 4
        assert isqrt(D) ** 2 != D
        dK = fundamental_discriminant(D)
        same = (dK == 5)
        if same:
            hits.append(N)
        if tw == 3:
            hits_t3.append(N)
        mstr = f"({M[0]} {M[1]}; {M[2]} {M[3]})"
        flag = "  <- local and witness DISAGREE" if tl != tw else ""
        print(f"  {N:>2}  {tw:>5}  {mstr:<38} {D:>6}  {dK:>4}   {1/(pi*sqrt(dK)):.15f}   {'yes' if same else ' no'}    {'yes' if tw == 3 else ' no'}{flag}")
    print()
    print(f"local criterion and witness+exclusion agree on t_min for all N <= 60: {'yes' if agree else 'NO'}")
    print(f"X(1) value g_c = 1/(pi sqrt 5) = {gc:.15f}")
    print(f"curves Gamma_0(N), N <= 60, with d_K = 5 (same value exactly): {len(hits)}  N = {hits}")
    print(f"curves Gamma_0(N), N <= 60, containing a trace-3 element (the record's test): {len(hits_t3)}  N = {hits_t3}")
    print("printed count: nine; both censuses include N = 1 (Gamma_0(1) = SL(2,Z), i.e. X(1) itself), as the record's list does")
    extra = [N for N in hits if N not in hits_t3]
    print(f"curves with d_K = 5 but NO trace-3 element (systole trace {sorted(set(tmin_local(N) for N in extra))}): N = {extra}")
    print("  (t_min = 7 and 7^2 - 4 = 45 = 9*5, so the marked field is Q(sqrt 5) and the value is g_c exactly)")
    ok = agree and len(hits) == 9
    print()
    print(f"ROW VERDICT: {'PASS' if ok else 'FAIL'} -- under the value rule (d_K of the systole's field) the count is "
          f"{len(hits)}, printed nine.")
    print(f"  The printed nine equals the trace-3 census ({len(hits_t3)}); trace 3 is sufficient for d_K = 5 but not necessary.")


if __name__ == "__main__":
    main()
