# L:RZ-71b — Proposition 10.1, leg 3: the unique quadratic subfield of ℚ(ζp) is ℚ(√p*), and "its unique quadratic subfield is ℚ(√5)" singles out p = 5

**OUT-OF-Q5 (pending the wall).** Split leg of L:RZ-71 (the general leg the re-key named: a generalisation of L:RZ-68, EFFORT). Not counted in Q5; specced so the wall can rule on it with the statement in hand.

## 1 · Header
- row: L:RZ-71b (split of L:RZ-71; general leg, proposed EFFORT, E2–E3; L:RZ-68's 8 pd for the p = 5 instance is the cost reference — this seat does not set a figure)
- unit: U6 (`RiemannZeta/Cyclotomic`)
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
- locus: §10.3, Proposition 10.1, PDF p26 (printed folio 25). Re-key change class: CHANGED (leg 3's general form "ℚ(√p*)" is new print).
- spec_clock: 2026-10-28T17:21:24Z

## 2 · Printed statement, verbatim
The same Proposition 10.1 as L:RZ-71a (§10.3, p26; the exponent in p* restored from `pdftotext`'s flattening):
> Proposition 10.1 (Cyclotomic completeness). Among cyclotomic fields ℚ(ζp) for prime p, the 5th cyclotomic field ℚ(ζ5) is distinguished by the conjunction of three properties: its Galois group has order 4 (matching the operator count), its discriminant involves only the prime 5 (the Spiral eigenvalue squared), and its unique quadratic subfield is ℚ(√5) (the Eigenform field). Each of the three singles out p = 5 on its own (p − 1 = 4; the discriminant of ℚ(ζp) is a power of p; its unique quadratic subfield is ℚ(√p*), p* = (−1)^{(p−1)/2} p), so the conjunction adds no further selection [CV] (Washington 1997).

This sub-row carries: (A) "its unique quadratic subfield is ℚ(√p*), p* = (−1)^{(p−1)/2} p" for ℚ(ζp); (B) leg 3 — "its unique quadratic subfield is ℚ(√5)" — singles out p = 5 among primes. (A) at p = 5 (p* = 5) is the property ℚ(ζ5) is said to have, which is L:RZ-68's content.

## 3 · Formal reading
- **Domain of (A): odd primes.** p* = (−1)^{(p−1)/2} p is an integer only for odd p; at p = 2 the printed definiens is undefined, and ℚ(ζ₂) = ℚ has no quadratic subfield at all. The spec therefore reads (A) over odd primes, hypothesis `p ≠ 2`, *taken from the printed formula, not added as a repair*. V₁ to rule whether this is a reading or a defect (if a defect, this sub-row becomes a CC-CANDIDATE on the clause "for prime p … ℚ(√p*)"; L:RZ-71a is unaffected).
- **Domain of (B): all primes.** "Its unique quadratic subfield is ℚ(√5)" is a property P(p) of ℚ(ζp) meaningful for every prime (false at p = 2, where there is no quadratic subfield); "singles out p = 5" is `P(p) ↔ p = 5`.
- **The field.** K with `[CharZero K] [IsCyclotomicExtension {p} ℚ K]`, all ℚ-isomorphic (`IsCyclotomicExtension.algEquiv`), as in L:RZ-65.
- **"Quadratic subfield."** An intermediate field F : `IntermediateField ℚ K` with `Module.finrank ℚ F = 2` (for p = 3 this is K itself, ⊤).
- **"Its unique quadratic subfield is ℚ(√d)"** (d ∈ ℤ, d = p* or 5) is read as: there is x ∈ K with x² = d, and the quadratic subfields of K are exactly ℚ⟮x⟯ — `∃ x : K, x ^ 2 = (d : K) ∧ ∀ F : IntermediateField ℚ K, Module.finrank ℚ F = 2 ↔ F = ℚ⟮x⟯`. This packs existence, "√d ∈ K", "ℚ(√d) is quadratic", and uniqueness in one clause; it is independent of the choice of the square root (ℚ⟮x⟯ = ℚ⟮−x⟯). ℚ⟮x⟯ is `IntermediateField.adjoin ℚ {x}` (scoped notation, `open IntermediateField`).
- **p\* as an element of K:** `(((-1 : ℤ) ^ ((p - 1) / 2) * p : ℤ) : K)`; ℕ-division in the exponent is exact for odd p.

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
| declaration | kind | module (file:line) |
|---|---|---|
| `IntermediateField` | structure | Mathlib.FieldTheory.IntermediateField.Basic (:51) |
| `IntermediateField.adjoin` (+ scoped `F⟮x⟯` notation) | def / macro | Mathlib.FieldTheory.IntermediateField.Adjoin.Defs (:34; notation :529) |
| `IsGalois.intermediateFieldEquivSubgroup` | def | Mathlib.FieldTheory.Galois.Basic (:350) — the Galois correspondence |
| `IsCyclotomicExtension.isGalois` | theorem | Mathlib.NumberTheory.Cyclotomic.Basic (:565) |
| `IsCyclotomicExtension.autEquivPow` | noncomputable def | Mathlib.NumberTheory.Cyclotomic.Gal (:77) — Gal(ℚ(ζp)/ℚ) ≃* (ZMod p)ˣ, hence cyclic |
| (instance) `IsCyclic Rˣ` for `[Finite Rˣ]`, R a domain | instance | Mathlib.RingTheory.IntegralDomain (:144) |
| `IsCyclic.card_pow_eq_one_le` | theorem | Mathlib.GroupTheory.SpecificGroups.Cyclic.Basic (:313) — at most n solutions of gⁿ = 1, the route to "one subgroup of each order" |
| `gaussSum_sq` | theorem | Mathlib.NumberTheory.GaussSum (:222) — `gaussSum χ ψ ^ 2 = χ (-1) * Fintype.card R`, the route to √p* ∈ ℚ(ζp) |
| `quadraticChar`, `quadraticChar_isQuadratic`, `quadraticChar_ne_one`, `quadraticChar_neg_one` | def / theorems | Mathlib.NumberTheory.LegendreSymbol.QuadraticChar.Basic (:120, :199, :207, :258) |
| `AddChar.zmodChar`, `AddChar.zmodChar_primitive_of_primitive_root` | def / theorem | Mathlib.NumberTheory.LegendreSymbol.AddCharacter (:139, :184) — a primitive additive character of ZMod p valued in K from ζp |
| `IsCyclotomicExtension.zeta_spec` | theorem | Mathlib.NumberTheory.Cyclotomic.PrimitiveRoots (:93) |
| `IsCyclotomicExtension.Rat.finrank` | theorem | Mathlib.NumberTheory.NumberField.Cyclotomic.Basic (:45) |

**Gaps (EFFORT, not NEEDS-DEVELOPMENT in the strict sense):** no packaged lemma at the pin states "a cyclic Galois extension of even degree has exactly one quadratic intermediate field" or "√p* ∈ ℚ(ζp)"; both are composed from the declarations above. (B)'s "⇒" direction needs, beyond (A), the elementary fact that √5 ∈ ℚ(√p*) forces p* = 5 (write √5 = a + b√p*, square, compare) — no single mathlib name; local algebra over ℚ.

## 5 · Intended Lean statement
**Prose.** (A) For every odd prime p, ℚ(ζp) contains a square root x of p* = (−1)^{(p−1)/2} p, and the quadratic subfields of ℚ(ζp) are exactly ℚ(x). (B) For every prime p, ℚ(ζp) has a unique quadratic subfield and it is ℚ(√5) if and only if p = 5.

**Proposed signatures.**
```lean
open IntermediateField in
theorem rz_71b_unique_quadratic_subfield (p : ℕ) [Fact p.Prime] (hp2 : p ≠ 2)
    (K : Type*) [Field K] [CharZero K] [IsCyclotomicExtension {p} ℚ K] :
    ∃ x : K, x ^ 2 = ((((-1 : ℤ) ^ ((p - 1) / 2)) * p : ℤ) : K) ∧
      ∀ F : IntermediateField ℚ K, Module.finrank ℚ F = 2 ↔ F = ℚ⟮x⟯ := by
  sorry

open IntermediateField in
theorem rz_71b_leg3_selects_five (p : ℕ) [Fact p.Prime]
    (K : Type*) [Field K] [CharZero K] [IsCyclotomicExtension {p} ℚ K] :
    (∃ x : K, x ^ 2 = 5 ∧
      ∀ F : IntermediateField ℚ K, Module.finrank ℚ F = 2 ↔ F = ℚ⟮x⟯) ↔ p = 5 := by
  sorry
```
The "⇐" direction of the second is L:RZ-68 (the first at p = 5); the second is the formal content of "each of the three singles out p = 5 on its own" for leg 3.

## 6 · What the row does not claim
- Legs 1–2 (Galois order, discriminant) — L:RZ-71a.
- The glosses "(the Eigenform field)", "(matching the operator count)", "(the Spiral eigenvalue squared)" — CONCEPT.
- Anything about quadratic subfields of ℚ(ζn) for composite n.
- The citation "(Washington 1997)" and the [CV] grade are provenance, not content.
- The L-function reading of ℚ(√5) (ζ·L(χ₅)) — L:RZ-69 / §10.1 table.

## 7 · Status
SPEC-DRAFT 2026-10-28T17:21:24Z — OUT-OF-Q5 (pending the wall); not counted.

V1: V1-GREEN 2026-10-28T17:30:04Z — hypothesis p ≠ 2 in (A) is a READING of the printed p*, not a repair; no CC-CANDIDATE. The print's "its unique quadratic subfield is ℚ(√p*)" presupposes a quadratic subfield exists (false only at p = 2, ℚ(ζ₂) = ℚ), and the printed definiens (−1)^{(p−1)/2} p is an integer only for odd p (the standard p* convention of the cited Washington); at p = 2 the clause fails by presupposition, not by falsity, and the Lean ℕ-division would otherwise silently turn p* into 2. (B) over all primes, false at p = 2 by the packed existence, is faithful. The packed form "∃ x, x² = d ∧ ∀ F, finrank F = 2 ↔ F = ℚ⟮x⟯" is exactly existence + uniqueness of the quadratic subfield and its identity (F := ℚ⟮x⟯ gives finrank 2) — no stronger. OUT-OF-Q5 pending the wall: agreed (needs the RZ-68-class quadratic-subfield machinery).

V2: V2-GREEN 2026-10-28T17:46:54Z (fidelity only; OUT-OF-Q5 pending the wall, uncounted) — served p26 leg 3 + p27 colon-reason read first; (A) p odd (p ≠ 2 reads the printed p* = (−1)^{(p−1)/2} p, integral only for odd p — a reading, not a repair), ∃ x, x² = p* (ℤ-cast, exponent (p−1)/2 exact for odd p) ∧ ∀ F, finrank F = 2 ↔ F = ℚ⟮x⟯ — parse checked: the ↔ sits under ∀ F — is exactly "its unique quadratic subfield is ℚ(√p*)" (existence, √p* ∈ K, uniqueness, identity); (B) the same packed property with d = 5, ↔ p = 5 over all primes, is "singles out p = 5 on its own" for leg 3. Signed in statement_sha256 a06f2a6e….
