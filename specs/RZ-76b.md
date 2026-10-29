# L:RZ-76b — the roles of the three appearances of 1/8 (Stirling / ξ-prefactor / Selberg elliptic term) and the decomposition's sources — NOT A LEAN TARGET

## 1 · Header
- row: `L:RZ-76b` (split from `L:RZ-76` as the brief directs; sibling `L:RZ-76a` keeps the arithmetic and the ledger figure). **NOT A LEAN TARGET** — CONCEPT / EFFORT-FAR; uncounted in Q5; no Lean statement is proposed.
- unit: U7 `RiemannZeta/SmallArith`
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
- locus: §12.2 (the sentence after (12.2)); §12.3 "Three appearances of 1/8" (the prose around (12.3)–(12.6) and the closing paragraph) — served PDF page p29 (printed folio 28).
- spec_clock: 2026-10-28T17:25:33Z
- CHANGED in the republish (see `L:RZ-76a` §1): Path C's sign and role; the heading; Path B's disclaimer; the "structure, not coincidence" sentence is gone.

## 2 · Printed statement, verbatim
Served p29, `pdftotext -layout`, mathematical-italic letters written plain:

> where the 1 comes from the pole of ζ(s) at s = 1 (the identity element's contribution — the winding number of the single simple pole) and the 1/8 is the genuine Maslov phase correction [CV].

> Three mathematical paths yield 1/8:
> Path A — Stirling approximation. The counting function involves arg Γ(s/2) on the critical line. The cross-term Re(z − 1/2) × Im(log z) evaluated at z = 1/4 + iT/2 gives [(12.3)] yielding −1/8 after dividing by π.

> This is a coincidence of value, not a derivation: the prefactor enters N(T) only through its argument change along the contour (the 1 of (12.2)), never through its value at s = 1/2.

> Path C — Selberg trace formula. The order-2 orbifold point at z = i contributes [(12.6)] to the constant term of the Weyl law of X(1).
> Path A is the derivation of the −1/8 in N(T) [CV]. Path B is a coincidence of value. Path C is the order-2 elliptic point's contribution, of size 1/8, to the constant term of the Weyl law for the Maass spectrum of X(1) — a different counting function; its relation to Path A is not shown here [I].

## 3 · Formal reading (why there is no target)
The content splits into four kinds, none buildable at the pin within Q5:
1. **Path A as the source of the −1/8 in N(T) [CV]** — the Riemann–von Mangoldt formula N(T) = (T/2π) log(T/2πe) + 7/8 + S(T) + O(1/T), with 7/8 obtained from arg of s(s − 1) along the contour (the 1) and Stirling's expansion of arg Γ(1/4 + iT/2) (the −1/8). Needs the complex Stirling expansion of log Γ with an error term and the argument-principle counting of zeros: not in mathlib at the pin (ledger: complex Stirling not found under `Complex.Gamma, Stirling`). EFFORT-FAR.
2. **Path C as the elliptic contribution to the constant term of the Weyl law for the Maass spectrum of X(1)** — needs the Selberg trace formula for SL(2, ℤ) with its elliptic terms and the resulting Weyl law; none of these exists in mathlib at the pin. EFFORT-FAR. This seat does not assess the printed value or sign of the elliptic contribution; only its arithmetic (1/(4·2·sin(π/2)) = 1/8) is in `L:RZ-76a`.
3. **Path B "a coincidence of value, not a derivation"** and **"its relation to Path A is not shown here [I]"** — negative / interpretive statements with no formal content to state.
4. **"the 1 comes from the pole … the identity element's contribution … the winding number"**, **"the genuine Maslov phase correction [CV]"** — readings and cited physics (CONCEPT).

**Wording note for V₁ (not a CC by this seat):** "The cross-term Re(z − 1/2) × Im(log z) evaluated at z = 1/4 + iT/2 gives (1/4 − 1/2) × π/2". At z = 1/4 + iT/2, Re(z − 1/2) = −1/4 exactly, but Im(log z) = arg z = arctan(2T) < π/2 for every finite T > 0; the printed value is the T → ∞ limit (the leading term in Stirling's expansion), not an evaluation. In the asymptotic register of "Stirling approximation" this is standard shorthand; read literally as an equality at a point it is false. The display (12.3) itself, as arithmetic, is true and sits in `L:RZ-76a`. V₁ decides whether the sentence goes to the correction track.

## 4 · Target mathlib declarations
None targeted. Gaps named (searched at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`): no complex Stirling formula with error term for `Complex.Gamma` (the ledger's search; `Stirling` occurs only in Analysis/SpecialFunctions/Stirling.lean — `stirlingSeq`, the real factorial — and Gamma/BohrMollerup.lean); no Selberg trace formula (`/usr/bin/grep -rli selberg` over Mathlib/ → only NumberTheory/SelbergSieve.lean); no Weyl law for Maass forms and no Maass-spectrum object (`maass`, `weyl law`: 0 real hits — the only matches are the substring `sigmaAssoc`); no Riemann–von Mangoldt zero-counting formula N(T).

## 5 · Intended Lean statement
None — NOT A LEAN TARGET. Reason in one line: the roles are EFFORT-FAR analytic theorems (Stirling with error term + argument principle; Selberg trace formula + Weyl law) absent from mathlib, plus [I]/coincidence statements that carry no formal claim.

## 6 · What the row does not claim
- It does not claim the arithmetic (that is `L:RZ-76a`).
- It does not claim "three paths, one number — structure, not coincidence": that sentence is no longer printed.
- It makes no claim that Path C and Path A are related ("not shown here [I]").

## 7 · Status line
- `SPEC-DRAFT 2026-10-28T17:25:33Z` — NOT A LEAN TARGET (CONCEPT / EFFORT-FAR); uncounted.
- V1: V1-SPLIT-OK; NOT A LEAN TARGET confirmed 2026-10-28T17:32:07Z — the roles (Stirling source of the −1/8, ξ-prefactor coincidence, Selberg elliptic term in the Weyl law, pole winding, Maslov) are EFFORT-FAR or [I]/coincidence statements, and nothing printed falls between 76a and 76b. Path A wording note RULED: not a CC (the sentence sits in Path A's own asymptotic register, "Stirling approximation", and the −π/8 it names is the correct constant term — with z = 1/4 + iT/2 the cross-term is −arctan(2T)/4 → −π/8, e.g. −0.3802 at T = 10 vs −0.3927), but it GOES TO THE CORRECTION TRACK as an optional, uncounted wording note: read literally "evaluated at z = 1/4 + iT/2 gives" is false at every finite T; suggested wording "gives, as T → ∞,".
- V2: no statement — NOT A LEAN TARGET by rule; Challenge.lean carries no theorem for this row (checked 2026-10-28T17:44:42Z); nothing to verify for fidelity; uncounted.
