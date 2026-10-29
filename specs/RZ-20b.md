# L:RZ-20b — Theorem 4.1(i)'s "finite expressions in the isotropic sector T_iso" clause (CONCEPT leg)

**Split note.** CONCEPT leg of L:RZ-20 (see RZ-20a). No Lean statement; uncounted; specced so that V₁ signs off on the split and on where the line runs. Its arithmetic shadow — ζ(2n) is a rational multiple of π^{2n} — is RZ-20a's second theorem and is checked there.

## 1 · Header
- row: L:RZ-20b (split from L:RZ-20)
- unit: U1 (`RiemannZeta/Pilot`)
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
- locus: §4.4, Theorem 4.1(i), PDF p12 (printed folio 11); Definition 4.1, §4.2, PDF p10 (printed folio 9). Re-key change class: REWORDED.
- spec_clock: 2026-10-28T17:08:50Z

## 2 · Printed statement, verbatim
§4.1, p10 (display (4.1) linearised inside ⟦ ⟧, mathematical-italic letters written plain):
> One of the deepest unsolved asymmetries in analytic number theory is the structural divergence between even and odd evaluations of ζ(s) = ∑_{n=1}^∞ n^{−s}. The even values possess elegant closed forms: ⟦ζ(2n) = (−1)^{n+1} B_{2n} (2π)^{2n} / (2 ⋅ (2n)!), (4.1)⟧ where B_{2n} are Bernoulli numbers — yielding rational multiples of π^{2n} (e.g. ζ(2) = π²/6, ζ(4) = π⁴/90).

§4.4, p12 (display (4.7) linearised):
> Theorem 4.1 (Even/odd structure — the established part). In the algebra T: (i) The even zeta values ζ(2n) are finite expressions in the isotropic sector T_iso: ⟦ζ(2n) = f_n(π) = (−1)^{n+1} B_{2n} (2π)^{2n} / (2 ⋅ (2n)!), (4.7)⟧ closed-form expressions involving a single operator eigenvalue (π) and rational numbers [CV].

Definition the clause leans on, §4.2, p10:
> Definition 4.1 (Isotropic decomposition). The algebra T admits a decomposition under rotational parity into isotropic and anisotropic sectors. The isotropic sector T_iso consists of the Harmonic operator Ĥ and its powers; it generates expressions involving π and rational coefficients — the content accessible through rotational symmetry alone.

## 3 · Formal reading
- The clause asserts membership of ζ(2n) in "the isotropic sector T_iso" of "the algebra T" and calls π "a single operator eigenvalue". T, Ĥ and the sector decomposition are the paper's four-operator algebra, which has no formal definition sufficient to state membership (the paper itself, §3 / §13.3, records that the algebra as stated is not a fully closed Lie algebra), and Q7 keeps the algebra out of every exported `structure`/`class`.
- Read through Definition 4.1 ("it generates expressions involving π and rational coefficients"), the only mathematical content the clause carries is that ζ(2n) is a rational expression in π — which RZ-20a's `rz_20a_zeta_two_mul_nat_rat_mul_pi_pow` states (in the sharper form q·π^{2n}). Nothing further is formalisable without formalising T.

## 4 · Target mathlib declarations
None. (The arithmetic shadow's targets are in RZ-20a §4.)

## 5 · Intended Lean statement
None — CONCEPT. No signature is proposed.

## 6 · What the row does not claim
Nothing in this leg is offered as a checked statement. Not claimed in particular: that π is an eigenvalue of any operator in a formal sense; that ζ(2n) lies in any formally defined sector; the even/odd "isotropic/anisotropic" reading of §4.2–4.4.

## 7 · Status
SPEC-DRAFT 2026-10-28T17:08:50Z (CONCEPT leg; no Lean statement)

V1: V1-SPLIT-OK 2026-10-28T17:15:49Z — CONCEPT leg, uncounted — the line is drawn in the right place. Theorem 4.1(i) p12 "In the algebra T: … finite expressions in the isotropic sector T_iso … closed-form expressions involving a single operator eigenvalue (π) and rational numbers": T, Ĥ and T_iso (Definition 4.1, p10) have no formal definition that would make sector membership a statement, and the paper itself records (p10) the algebra "is not a fully closed Lie algebra". Read through Definition 4.1 the clause's only arithmetic content is "ζ(2n) is π-and-rationals", which RZ-20a's ∃ q theorem carries in a sharper form; nothing checkable is left behind. Not CC: the clause is interpretive, not a false or vacuous mathematical assertion about a defined object.
