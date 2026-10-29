# L:RZ-71a — Proposition 10.1, legs 1–2: among prime cyclotomic fields, Galois order 4 and "discriminant involves only 5" each single out p = 5

## 1 · Header
- row: L:RZ-71a (split of L:RZ-71; the in-scope leg, keeps the ledger figure NOW ≈ 0.5 pd, E1)
- unit: U6 (`RiemannZeta/Cyclotomic`)
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
- locus: §10.3 "Why four is complete", Proposition 10.1 (Cyclotomic completeness), PDF p26 (printed folio 25). Re-key change class: CHANGED (page p26–p27 → p26; note-a applied — the old "No other prime cyclotomic field simultaneously satisfies all three" is gone).
- spec_clock: 2026-10-28T17:20:12Z

## 2 · Printed statement, verbatim
§10.3, p26 (mathematical-italic letters written plain; the exponent in p* restored from `pdftotext`'s flattening "(−1)(𝑝−1)/2 𝑝"):
> Proposition 10.1 (Cyclotomic completeness). Among cyclotomic fields ℚ(ζp) for prime p, the 5th cyclotomic field ℚ(ζ5) is distinguished by the conjunction of three properties: its Galois group has order 4 (matching the operator count), its discriminant involves only the prime 5 (the Spiral eigenvalue squared), and its unique quadratic subfield is ℚ(√5) (the Eigenform field). Each of the three singles out p = 5 on its own (p − 1 = 4; the discriminant of ℚ(ζp) is a power of p; its unique quadratic subfield is ℚ(√p*), p* = (−1)^{(p−1)/2} p), so the conjunction adds no further selection [CV] (Washington 1997).

**The split.** This sub-row carries legs 1 and 2 with their printed justifications: (1) ℚ(ζp) has Galois group of order p − 1, so order 4 holds exactly at p = 5; (2) the discriminant of ℚ(ζp) is a power of p, so "involves only the prime 5" holds exactly at p = 5. Leg 3 (the quadratic subfield ℚ(√5), the general ℚ(√p*), and its selection of p = 5) is L:RZ-71b, OUT-OF-Q5 (pending the wall) — even its p = 5 instance is L:RZ-68's content, bucketed EFFORT. The closing "so the conjunction adds no further selection" is, for legs 1–2, a consequence of the two iff's below and needs no separate conjunct.

## 3 · Formal reading
- **Domain.** p : ℕ prime (`[Fact p.Prime]`), all primes including p = 2 (the print says "for prime p"; ℚ(ζ₂) = ℚ). K = ℚ(ζp): any field K with `[NumberField K] [IsCyclotomicExtension {p} ℚ K]`; all such K are ℚ-isomorphic (`IsCyclotomicExtension.algEquiv`) and every quantity below is isomorphism-invariant (same convention as L:RZ-65/66/67). `NumberField` is a `Prop`-valued class, so the instance `discr_prime` builds with `haveI` agrees with the signature's by proof irrelevance.
- **"its Galois group has order 4".** `Nat.card Gal(K/ℚ) = 4`, with `Gal(K/ℚ)` = `K ≃ₐ[ℚ] K` (notation, FieldTheory/Galois/Notation.lean:35; Galois by `IsCyclotomicExtension.isGalois`). Printed justification "p − 1 = 4": `Nat.card Gal(K/ℚ) = p - 1`.
- **"its discriminant involves only the prime 5" (convention named).** The discriminant is mathlib's signed absolute discriminant `NumberField.discr K : ℤ`. "Involves only the prime 5" is read as: **the set of primes dividing it is exactly {5}** — `(NumberField.discr K).natAbs.primeFactors = {5}`. "Involves" asserts that 5 occurs; "only" that nothing else does. The weaker reading "primeFactors ⊆ {5}" is *not* taken: under it p = 2 would also qualify (discr ℚ(ζ₂) = discr ℚ = 1, no prime factors), and the printed "singles out p = 5 on its own" would fail at p = 2. Under the reading taken, the print is true for every prime p. (V₁: this is the row's sharpest reading choice — see the unit summary's per-row look.)
- **"the discriminant of ℚ(ζp) is a power of p".** `∃ k : ℕ, (NumberField.discr K).natAbs = p ^ k` (sign dropped: the printed sentence is about the prime content; `discr_prime` gives the signed value (−1)^{(p−1)/2} · p^{p−2}, so k = p − 2, including p = 2 where it is 2⁰ = 1).
- **"singles out p = 5 on its own"** is read as the biconditional "property(ℚ(ζp)) ↔ p = 5" over all primes p — no stronger (it does not assert anything about non-prime n) and no weaker (both directions: ℚ(ζ5) has the property, and no other prime cyclotomic field does).

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
| declaration | kind | module (file:line) |
|---|---|---|
| `IsCyclotomicExtension.Rat.discr_prime` | theorem | Mathlib.NumberTheory.NumberField.Cyclotomic.Basic (:651) — `NumberField.discr K = (-1) ^ ((p - 1) / 2) * p ^ (p - 2)` under `[Fact p.Prime] [CharZero K] [IsCyclotomicExtension {p} ℚ K]` (no oddness hypothesis; at p = 2 it gives 1) |
| `NumberField.discr` | noncomputable abbrev | Mathlib.NumberTheory.NumberField.Discriminant.Defs (Defs.lean:36) — abbrev, found by `abbrev discr` |
| `IsCyclotomicExtension.Rat.finrank` | theorem | Mathlib.NumberTheory.NumberField.Cyclotomic.Basic (:45) |
| `IsGalois.card_aut_eq_finrank` | theorem | Mathlib.FieldTheory.Galois.Basic (:109) — `Nat.card Gal(E/F) = finrank F E` |
| `IsCyclotomicExtension.isGalois` | theorem | Mathlib.NumberTheory.Cyclotomic.Basic (:565) |
| `Nat.totient_prime` | theorem | Mathlib.Data.Nat.Totient (:214) |
| `Nat.primeFactors` | def | Mathlib.Data.Nat.PrimeFin (:37) |
| `Nat.primeFactors_prime_pow` | lemma | Mathlib.Data.Nat.PrimeFin (:132) — `(p ^ k).primeFactors = {p}` for k ≠ 0, p prime |
| `Int.natAbs` | def | core (Lean `Int.natAbs`), not a Mathlib declaration — no grep target under Mathlib/ |
| `IsCyclotomicExtension.algEquiv` | noncomputable def | Mathlib.NumberTheory.Cyclotomic.Basic (:601) |

No name missing at the pin. The ledger's `autEquivPow` is not needed for this leg (the order of the group suffices; L:RZ-65 carries the isomorphism).

## 5 · Intended Lean statement
**Prose.** For every prime p and K = ℚ(ζp): the Galois group of K/ℚ has order p − 1, and it has order 4 if and only if p = 5; the absolute value of the discriminant of K is a power of p, and its set of prime divisors is exactly {5} if and only if p = 5.

**Proposed signature.**
```lean
theorem rz_71a_cyclotomic_completeness_legs12 (p : ℕ) [Fact p.Prime]
    (K : Type*) [Field K] [NumberField K] [IsCyclotomicExtension {p} ℚ K] :
    Nat.card Gal(K/ℚ) = p - 1 ∧
    (Nat.card Gal(K/ℚ) = 4 ↔ p = 5) ∧
    (∃ k : ℕ, (NumberField.discr K).natAbs = p ^ k) ∧
    ((NumberField.discr K).natAbs.primeFactors = {5} ↔ p = 5) := by
  sorry
```
E1: `card_aut_eq_finrank` + `Rat.finrank` + `totient_prime`; `discr_prime` then `Int.natAbs` of (±1)·p^{p−2}; case p = 2 (natAbs 1, `primeFactors` ∅) vs p ≥ 3 (`primeFactors_prime_pow`).

## 6 · What the row does not claim
- Leg 3 — "its unique quadratic subfield is ℚ(√5)", the general "unique quadratic subfield of ℚ(ζp) is ℚ(√p*)", and leg 3's selection of p = 5 — L:RZ-71b (OUT-OF-Q5, pending the wall); its p = 5 instance is L:RZ-68 (EFFORT).
- The glosses "(matching the operator count)", "(the Spiral eigenvalue squared)", "(the Eigenform field)" and the proposition's name "Cyclotomic completeness" — the operator reading is CONCEPT ([C], §10.2).
- Nothing about non-prime cyclotomic fields ℚ(ζn) (the proposition ranges over prime p only).
- The citation "(Washington 1997)" and the [CV] grade are provenance, not content.
- For the wall (from the ledger, kept): leg 1 alone already carries the uniqueness (p − 1 = 4 ⇔ p = 5); the formal statement shows exactly that and says less than "distinguished by the conjunction of three properties" may suggest — which the served text itself now concedes ("the conjunction adds no further selection").

## 7 · Status
SPEC-DRAFT 2026-10-28T17:20:12Z

V1: V1-GREEN 2026-10-28T17:30:04Z — p26 Prop. 10.1 read by pdftotext. Ruling on "its discriminant involves only the prime 5": prime set **= {5}** (natAbs.primeFactors = {5}) is the faithful reading, not a repair — "involves … the prime 5" asserts 5 occurs, the print's own gloss "(the Spiral eigenvalue squared)" names 5 as present, and only under "= {5}" is the [CV] "each of the three singles out p = 5 on its own" true at p = 2 (disc ℚ(ζ₂) = 1, empty prime set). "Is a power of p" as ∃ k, natAbs = p^k confirmed (sign dropped; p = 2 gives 2⁰). "Singles out p = 5" as the biconditional over all primes confirmed. Domain all primes incl. 2 = the print's "for prime p". Leg 1 here and RZ-72a clause 7 are one fact printed twice: count once (see _V1-U6.md §4).

V2: V2-GREEN 2026-10-28T17:46:54Z — served p26 Prop. 10.1 read first; the theorem parses (pp.parens) as card Gal = p − 1 ∧ (card = 4 ↔ p = 5) ∧ (∃ k, |disc| = p^k) ∧ (|disc|.primeFactors = {5} ↔ p = 5), over all primes incl. 2 = "for prime p"; "involves only the prime 5" as prime set = {5} is the faithful reading (it is the one under which the printed "each … singles out p = 5 on its own" holds at p = 2, |disc ℚ(ζ₂)| = 1); "is a power of p" with the sign dropped is the printed prime-content claim; "singles out" = the biconditional. No stronger, no weaker. Signed in statement_sha256 a06f2a6e….
