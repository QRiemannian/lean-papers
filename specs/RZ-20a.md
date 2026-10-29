# L:RZ-20a — ζ(2n) = (−1)^{n+1} B_{2n} (2π)^{2n} / (2·(2n)!), a rational multiple of π^{2n}

**Split note.** L:RZ-20 is split. RZ-20a is the checkable leg and keeps the ledger figure (NOW, 0.5 pd, E1, target `riemannZeta_two_mul_nat`): the closed form (4.1) = (4.7) and the printed consequence "rational multiples of π^{2n}". RZ-20b is Theorem 4.1(i)'s remaining clause — "finite expressions in the isotropic sector T_iso … involving a single operator eigenvalue (π)" — a CONCEPT leg with no Lean statement, uncounted.

## 1 · Header
- row: L:RZ-20a (split from L:RZ-20)
- unit: U1 (`RiemannZeta/Pilot`)
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
- locus: §4.1, eq. (4.1), PDF p10 (printed folio 9); §4.4, Theorem 4.1(i), eq. (4.7), PDF p12 (printed folio 11). Re-key change class: REWORDED (Theorem 4.1 retitled "the established part"; (i) now carries [CV]; the formula is unchanged).
- spec_clock: 2026-10-28T17:08:50Z

## 2 · Printed statement, verbatim
§4.1, p10 (display (4.1) linearised inside ⟦ ⟧, mathematical-italic letters written plain):
> One of the deepest unsolved asymmetries in analytic number theory is the structural divergence between even and odd evaluations of ζ(s) = ∑_{n=1}^∞ n^{−s}. The even values possess elegant closed forms: ⟦ζ(2n) = (−1)^{n+1} B_{2n} (2π)^{2n} / (2 ⋅ (2n)!), (4.1)⟧ where B_{2n} are Bernoulli numbers — yielding rational multiples of π^{2n} (e.g. ζ(2) = π²/6, ζ(4) = π⁴/90).

§4.4, p12 (display (4.7) linearised):
> Theorem 4.1 (Even/odd structure — the established part). In the algebra T: (i) The even zeta values ζ(2n) are finite expressions in the isotropic sector T_iso: ⟦ζ(2n) = f_n(π) = (−1)^{n+1} B_{2n} (2π)^{2n} / (2 ⋅ (2n)!), (4.7)⟧ closed-form expressions involving a single operator eigenvalue (π) and rational numbers [CV].

## 3 · Formal reading
- **ζ.** The paper defines ζ(s) = Σ_{n≥1} n^{−s} (p10). Mathlib's `riemannZeta` is the analytic continuation; for 1 < re s it equals the series (`zeta_eq_tsum_one_div_nat_cpow`), and every argument 2n with n ≥ 1 is in that range, so the paper's ζ(2n) and `riemannZeta (2 * n)` coincide on the whole domain of the claim.
- **Range of n.** The print does not state it; the series definition, "the even zeta values" and the examples ζ(2), ζ(4) fix n ≥ 1. The formula is read for natural n ≥ 1 only (`n ≠ 0`). (At n = 0 the right-hand side is −1/2 = mathlib's `riemannZeta 0`, but the paper's series diverges there; the spec does not claim n = 0.)
- **Bernoulli convention (named).** The paper's generating function is t/(e^t − 1) (Proposition 4.1, p11), which is mathlib's `bernoulli` (`bernoulliPowerSeries`, B₁ = −1/2, `bernoulli_one`), not `bernoulli'` (B₁ = +1/2). For the indices used here (2n ≥ 2) the two conventions agree (`bernoulli_eq_bernoulli'_of_ne_one`), so the convention does not move the statement; the spec uses `bernoulli` to match the paper's generating function. Mathlib's `bernoulli : ℕ → ℚ`, cast to ℂ.
- **Rearrangement bridge.** Mathlib's `riemannZeta_two_mul_nat (hk : k ≠ 0)` states ζ(2k) = (−1)^{k+1} · 2^{2k−1} · π^{2k} · B_{2k} / (2k)!. The paper's form has (2π)^{2n}/2 in place of 2^{2n−1}π^{2n}; they agree for n ≥ 1 by `mul_pow` and 2^{2n} = 2·2^{2n−1}. That is the whole bridge.
- **"Rational multiples of π^{2n}".** Read as: there is q ∈ ℚ with ζ(2n) = q·π^{2n} (here q = (−1)^{n+1} 2^{2n−1} B_{2n}/(2n)!). It is a consequence of the formula with B_{2n} ∈ ℚ; it is stated separately because the print states it, and because Theorem 4.1(i)'s "involving … (π) and rational numbers" has this as its mathematical content.

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
| declaration | kind | module (file:line) |
|---|---|---|
| `riemannZeta` | def | Mathlib.NumberTheory.LSeries.RiemannZeta (RiemannZeta.lean:121) |
| `riemannZeta_two_mul_nat` | theorem | Mathlib.NumberTheory.LSeries.HurwitzZetaValues (HurwitzZetaValues.lean:206) |
| `zeta_eq_tsum_one_div_nat_cpow` | theorem | Mathlib.NumberTheory.LSeries.RiemannZeta (:207) — the series agreement for `1 < re s` |
| `hasSum_zeta_nat` | theorem | Mathlib.NumberTheory.ZetaValues (ZetaValues.lean:430) — the real-series form, if L prefers it |
| `bernoulli` | def | Mathlib.NumberTheory.Bernoulli (Bernoulli.lean:197) |
| `bernoulli_one` | theorem | Mathlib.NumberTheory.Bernoulli (:207) — fixes the convention (−1/2) |
| `bernoulli_eq_bernoulli'_of_ne_one` | theorem | Mathlib.NumberTheory.Bernoulli (:217) |
| `bernoulliPowerSeries` | def | Mathlib.NumberTheory.Bernoulli (:268) — the paper's t/(e^t − 1) |

No name missing at the pin.

## 5 · Intended Lean statement
**Prose.** For every natural number n ≥ 1, ζ(2n) = (−1)^{n+1} B_{2n} (2π)^{2n} / (2·(2n)!), where B_{2n} is the Bernoulli number (generating function t/(e^t − 1)); consequently ζ(2n) is a rational multiple of π^{2n}.

**Proposed signature.**
```lean
open Real in
theorem rz_20a_zeta_two_mul_nat {n : ℕ} (hn : n ≠ 0) :
    riemannZeta (2 * (n : ℂ)) =
      (-1) ^ (n + 1) * (bernoulli (2 * n) : ℂ) * (2 * (π : ℂ)) ^ (2 * n)
        / (2 * ((2 * n).factorial : ℂ)) := by
  sorry

open Real in
theorem rz_20a_zeta_two_mul_nat_rat_mul_pi_pow {n : ℕ} (hn : n ≠ 0) :
    ∃ q : ℚ, riemannZeta (2 * (n : ℂ)) = (q : ℂ) * (π : ℂ) ^ (2 * n) := by
  sorry
```
E1 for the first (rearrangement of `riemannZeta_two_mul_nat`), E0 for the second given the first.

## 6 · What the row does not claim
- The examples ζ(2) = π²/6, ζ(4) = π⁴/90 — L:RZ-21.
- That B_{2n+1} = 0 for n ≥ 1, or the generating-function symmetry (4.2) — L:RZ-23, L:RZ-24.
- "In the algebra T", "finite expressions in the isotropic sector T_iso", "a single operator eigenvalue (π)" — RZ-20b (CONCEPT).
- Anything about the odd values: (4.6), (4.8), Theorem 4.1(ii), the irrationality results, or the algebraic-independence conjecture (L:RZ-22, and the (4.3)–(4.8) rows).
- The value at n = 0.

## 7 · Status
SPEC-DRAFT 2026-10-28T17:08:50Z

V1: V1-SPLIT-OK 2026-10-28T17:15:49Z — leg fidelity V1-GREEN. (4.1) p10 and (4.7) p12 print the same formula ζ(2n) = (−1)^{n+1} B_{2n} (2π)^{2n} / (2·(2n)!), plus (p10) "yielding rational multiples of π^{2n}"; the spec states both, for n ≠ 0. Range confirmed: the print leaves n implicit, but defines ζ(s) = Σ n^{−s} on p10 and exemplifies ζ(2), ζ(4) — n ≥ 1 is the printed domain, and `riemannZeta` equals the series there; excluding n = 0 is not a weakening of anything printed. Bernoulli convention confirmed: the paper's generating function t/(e^t − 1) (p11) is mathlib's `bernoulli` (pin: `bernoulli` = (−1)^n·`bernoulli'`, B₁ = −1/2), and at index 2n ≥ 2 the conventions coincide. Bridge checked: `riemannZeta_two_mul_nat` = (−1)^{k+1}·2^{2k−1}·π^{2k}·B_{2k}/(2k)!, equal to the printed form since (2π)^{2n}/2 = 2^{2n−1}π^{2n} for n ≥ 1. The "∃ q : ℚ, ζ(2n) = q·π^{2n}" theorem is exactly the printed "rational multiples of π^{2n}". The examples ζ(2), ζ(4) rightly left to RZ-21.
V2: V2-GREEN 2026-10-28T17:25:09Z — read served p10 (4.1) and p12 Theorem 4.1(i) (4.7). `rz_20a_zeta_two_mul_nat` for n : ℕ, n ≠ 0: `riemannZeta (2n)` = (−1)^{n+1}·B_{2n}·(2π)^{2n} / (2·(2n)!) — term for term the printed formula; ζ(2n) with Re = 2n > 1 is the paper's series Σ n^{−s}; n ≥ 1 is the printed domain (series definition, examples ζ(2), ζ(4)). Bernoulli convention: mathlib `bernoulli` = (−1)^n·`bernoulli'`, generating function `bernoulliPowerSeries` with `bernoulliPowerSeries_mul_exp_sub_one` = t/(e^t − 1), the paper's (p11); at even index ≥ 2 convention-free anyway. `rz_20a_zeta_two_mul_nat_rat_mul_pi_pow`: ∃ q : ℚ, ζ(2n) = q·π^{2n} — the printed "rational multiples of π^{2n}". The T_iso / operator-eigenvalue clause rightly absent (RZ-20b, CONCEPT).
