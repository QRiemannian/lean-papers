# L:RZ-72b — §10.3 continuation: ℚ(√5) does not recur; the unique quadratic subfield of ℚ(ζp) is ℚ(√p*)

**OUT-OF-Q5 (pending the wall).** Split leg of L:RZ-72; its general clause is the same formal content as L:RZ-71b (A), printed a second time at this locus. Not counted in Q5.

## 1 · Header
- row: L:RZ-72b (split of L:RZ-72; proposed EFFORT, E2–E3, cost shared with L:RZ-71b — specced once there, re-used here)
- unit: U6 (`RiemannZeta/Cyclotomic`)
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
- locus: §10.3, the paragraph after Proposition 10.1, PDF p27 (printed folio 26). Re-key change class: CHANGED.
- spec_clock: 2026-10-28T17:24:03Z

## 2 · Printed statement, verbatim
§10.3, p27 (the two sentences carrying this leg; the full paragraph is quoted in RZ-72a.md §2):
> What does not recur is ℚ(ζ5) itself, and with it the quadratic subfield ℚ(√5): the unique quadratic subfield of ℚ(ζp) is ℚ(√p*).

(p* is defined at Proposition 10.1, p26: "p* = (−1)^{(p−1)/2} p".) The "ℚ(ζ5) itself" half is L:RZ-72a clause 8 (containment: ℚ(ζ5) ⊄ ℚ(ζp) for primes p ≠ 5; pointer revised 2026-10-28T17:35:06Z at V₁ drift D1); this sub-row carries "and with it the quadratic subfield ℚ(√5)" and its stated reason.

## 3 · Formal reading
- **"The unique quadratic subfield of ℚ(ζp) is ℚ(√p*)"** — exactly L:RZ-71b (A): for odd primes p (the printed p* is defined only for odd p; ℚ(ζ₂) = ℚ has no quadratic subfield), `∃ x : K, x ^ 2 = p* ∧ ∀ F : IntermediateField ℚ K, Module.finrank ℚ F = 2 ↔ F = ℚ⟮x⟯`. The same reading note and the same V₁ question (reading vs defect at p = 2) apply; see RZ-71b.md §3.
- **"What does not recur is … the quadratic subfield ℚ(√5)"** — read as: for every prime p ≠ 5, ℚ(√5) is not a subfield of ℚ(ζp), i.e. ℚ(ζp) contains no square root of 5: `¬ ∃ x : K, x ^ 2 = 5`. (Read over all primes p ≠ 5, p = 2 included, where it is trivially true — ℚ has no √5.) This is the "⇒" content of L:RZ-71b (B) in its plainest form, and it is what the colon's reason ("the unique quadratic subfield … is ℚ(√p*)") is offered for: √5 ∈ ℚ(√p*) forces p* = 5.
- Field conventions as in L:RZ-65 (`[CharZero K] [IsCyclotomicExtension {p} ℚ K]`).

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
As RZ-71b.md §4 (all present at the pin): `IntermediateField` (IntermediateField/Basic.lean:51), `IntermediateField.adjoin` (Adjoin/Defs.lean:34, notation :529), `IsGalois.intermediateFieldEquivSubgroup` (Galois/Basic.lean:350), `IsCyclotomicExtension.isGalois` (Cyclotomic/Basic.lean:565), `IsCyclotomicExtension.autEquivPow` (Cyclotomic/Gal.lean:77), `IsCyclic.card_pow_eq_one_le` (Cyclic/Basic.lean:313), `gaussSum_sq` (GaussSum.lean:222), `quadraticChar` (QuadraticChar/Basic.lean:120), `AddChar.zmodChar_primitive_of_primitive_root` (AddCharacter.lean:184), `IsCyclotomicExtension.Rat.finrank` (NumberField/Cyclotomic/Basic.lean:45). Same gaps as there: no packaged "unique quadratic subfield of a cyclic extension" or "√p* ∈ ℚ(ζp)"; the √5 ∉ ℚ(√p*) step for p ≠ 5 is local algebra over ℚ.

## 5 · Intended Lean statement
**Prose.** (A) as L:RZ-71b. (B′) For every prime p ≠ 5, ℚ(ζp) contains no square root of 5.

**Proposed signatures.**
```lean
-- (A): identical to rz_71b_unique_quadratic_subfield (RZ-71b.md §5); L proves it once and cites it.

theorem rz_72b_sqrt_five_does_not_recur (p : ℕ) [Fact p.Prime] (hp5 : p ≠ 5)
    (K : Type*) [Field K] [CharZero K] [IsCyclotomicExtension {p} ℚ K] :
    ¬ ∃ x : K, x ^ 2 = 5 := by
  sorry
```

## 6 · What the row does not claim
- "What does not recur is ℚ(ζ5) itself" — L:RZ-72a clause 8 (containment); "ℚ(ζ5) is the only prime cyclotomic field of degree 4" — L:RZ-72a clause 7.
- That ℚ(√5) *is* the quadratic subfield of ℚ(ζ5) — L:RZ-68 / L:RZ-71b (B "⇐").
- The degree-1 L-function remark — L:RZ-72c; the operator matching [C] — CONCEPT.

## 7 · Status
SPEC-DRAFT 2026-10-28T17:24:03Z — OUT-OF-Q5 (pending the wall); not counted.

V1: V1-GREEN 2026-10-28T17:30:04Z — (A) = RZ-71b (A), same p ≠ 2 ruling (reading, no CC); counted once with RZ-71b. (B′) "¬ ∃ x : K, x² = 5 for prime p ≠ 5" is the faithful containment reading of "what does not recur is … the quadratic subfield ℚ(√5)". Only the §2/§6 pointer "the 'ℚ(ζ5) itself' half is in L:RZ-72a clause 7" changes with RZ-72a's drift D1 (that half is containment, not degree); if M moves it here, this row takes it.

V1: V1-GREEN 2026-10-28T17:38:10Z — pointers re-read: §2 and §6 now send the "ℚ(ζ5) itself" half to L:RZ-72a clause 8 (containment), clause 7 keeps the degree-4 fact; this row keeps "and with it the quadratic subfield ℚ(√5)" and its colon-reason. That is the served p27 sentence divided with nothing lost and nothing counted twice. The earlier verdict on (A) and (B′) stands.

V2: V2-GREEN 2026-10-28T17:46:54Z (fidelity only; OUT-OF-Q5 pending the wall, uncounted) — served p27 read first: (B′) ∀ prime p ≠ 5, ¬ ∃ x : K, x² = 5 is "what does not recur is … the quadratic subfield ℚ(√5)" read as containment, parallel to RZ-72a clause 8; p = 2 included (trivially true, ℚ has no √5) as the print's "prime cyclotomic fields"; (A) is rz_71b_unique_quadratic_subfield, stated once. Signed in statement_sha256 a06f2a6e….
