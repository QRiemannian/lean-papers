# L:RZ-72a — §10.3 continuation: degrees 6 and 10; ℤ/6ℤ ⊉ ℤ/4ℤ; (ℤ/pℤ)* ≅ ℤ/(p−1)ℤ ⊇ ℤ/4ℤ for p ≡ 1 (mod 4); infinitely many such prime cyclotomic fields; ℚ(ζ₅) the only prime cyclotomic field of degree 4, and contained in no other

## 1 · Header
- row: L:RZ-72a (split of L:RZ-72; the in-scope leg, keeps the ledger figure NOW ≈ 0.25 pd, E1 — the "infinitely many" leg stays here because its mathlib name exists at the pin, §4)
- unit: U6 (`RiemannZeta/Cyclotomic`)
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
- locus: §10.3 "Why four is complete", the paragraph after Proposition 10.1, PDF p27 (printed folio 26). Re-key change class: CHANGED (old print "ℚ(ζ5)'s four-fold structure does not embed in higher prime cyclotomic fields", false, replaced by the text below).
- spec_clock: 2026-10-28T17:22:57Z

## 2 · Printed statement, verbatim
§10.3, p27, the whole paragraph (mathematical-italic letters written plain; "S 4" closed up to S4):
> For higher cyclotomic fields (ℚ(ζ7) with degree 6, ℚ(ζ11) with degree 10, etc.), additional L-function factors arise from the larger Galois groups. Since these are abelian extensions, all factors are degree-1 Dirichlet L-functions — they produce more characters, not higher-dimensional representations. The Galois group ℤ/6ℤ of ℚ(ζ7) does not contain ℤ/4ℤ; but (ℤ/pℤ)* ≅ ℤ/(p − 1)ℤ contains ℤ/4ℤ whenever p ≡ 1 (mod 4) (p = 13, 17, 29, …), so a cyclic quartic layer recurs in infinitely many prime cyclotomic fields. What does not recur is ℚ(ζ5) itself, and with it the quadratic subfield ℚ(√5): the unique quadratic subfield of ℚ(ζp) is ℚ(√p*). The question of whether non-abelian extensions with Galois group containing the tetrahedral symmetry group S4 produce L-function factors decomposing as irreducible S4 representations (dimensions 1, 1, 2, 3, 3) is a natural but distinct question beyond scope. What is established is that ℚ(ζ5) is the only prime cyclotomic field of degree 4 [CV]; its matching to the four-operator algebra is the proposal of §10.2 [C].

**The split of L:RZ-72.** 72a (this file) carries the group-theoretic and degree facts and the "infinitely many" leg. L:RZ-72b carries "and with it the quadratic subfield ℚ(√5): the unique quadratic subfield of ℚ(ζp) is ℚ(√p*)" (OUT-OF-Q5; the same formal content as L:RZ-71b). L:RZ-72c carries "Since these are abelian extensions, all factors are degree-1 Dirichlet L-functions" (OUT-OF-Q5; NEEDS-DEVELOPMENT, kin to L:RZ-69). The S4 sentence is explicitly "beyond scope" in the print and is no claim.

## 3 · Formal reading
The 72a content, clause by clause:
1. **"ℚ(ζ7) with degree 6, ℚ(ζ11) with degree 10"** — `Module.finrank ℚ K = 6` for K = ℚ(ζ7), `= 10` for ℚ(ζ11).
2. **"The Galois group ℤ/6ℤ of ℚ(ζ7) does not contain ℤ/4ℤ"** — Gal(ℚ(ζ7)/ℚ) ≅ ℤ/6ℤ, and Gal(ℚ(ζ7)/ℚ) has no subgroup isomorphic to ℤ/4ℤ.
3. **"(ℤ/pℤ)* ≅ ℤ/(p − 1)ℤ"** — for every prime p, `Nonempty ((ZMod p)ˣ ≃* Multiplicative (ZMod (p - 1)))`. (The print states it inside "whenever p ≡ 1 (mod 4)", but the isomorphism itself holds, and is printed as holding, for the p in question; stating it for every prime is not stronger than the print's general "(ℤ/pℤ)* ≅ ℤ/(p − 1)ℤ" and is the standard fact. V₁: if the iso is to be read only under p ≡ 1 (mod 4), add that hypothesis — it makes the clause weaker, never false.)
4. **"contains ℤ/4ℤ whenever p ≡ 1 (mod 4)"** — for every prime p with `p ≡ 1 [MOD 4]` (`Nat.ModEq`), (ZMod p)ˣ has a subgroup isomorphic to ℤ/4ℤ. Only the "if" direction is printed; the converse is not claimed.
5. **"(p = 13, 17, 29, …)"** — 13, 17, 29 are primes ≡ 1 (mod 4) (the examples; decidable).
6. **"so a cyclic quartic layer recurs in infinitely many prime cyclotomic fields"** — "a cyclic quartic layer" is read as a subgroup of the Galois group isomorphic to ℤ/4ℤ (the print's own argument passes through "(ℤ/pℤ)* … contains ℤ/4ℤ"; by the Galois correspondence in a cyclic group this is the same as a cyclic quartic quotient/subfield, but the spec states the group form the print argues). Formally: the set of primes p for which Gal(ℚ(ζp)/ℚ) has a subgroup ≅ ℤ/4ℤ is infinite. To keep the set-builder free of type quantifiers, ℚ(ζp) is the concrete `CyclotomicField p ℚ` here.
7. **"What is established is that ℚ(ζ5) is the only prime cyclotomic field of degree 4"** — for every prime p, [ℚ(ζp) : ℚ] = 4 ↔ p = 5.
8. **"What does not recur is ℚ(ζ5) itself"** — read as **containment**, the sense the verb carries in the same paragraph ("a cyclic quartic layer recurs *in* infinitely many prime cyclotomic fields"): for every prime p ≠ 5, ℚ(ζ5) is not a subfield of ℚ(ζp) — there is no ℚ-algebra embedding `CyclotomicField 5 ℚ →ₐ[ℚ] K`, equivalently K contains no primitive 5th root of unity. This is *not* the degree fact of clause 7: for p ≡ 1 (mod 4), 4 ∣ p − 1 and ℚ(ζp) has a cyclic quartic subfield (clause 6) — just not ℚ(ζ5). Read over all primes p ≠ 5, p = 2 included (ℚ(ζ₂) = ℚ has no primitive 5th root). Added at V₁'s drift D1 (2026-10-28).
- **Conventions.** ℚ(ζn): any K with `[CharZero K] [IsCyclotomicExtension {n} ℚ K]` (all ℚ-isomorphic, `IsCyclotomicExtension.algEquiv`) except in clause 6 (`CyclotomicField p ℚ`, instance at Cyclotomic/Basic.lean:702). Gal(K/ℚ) = `K ≃ₐ[ℚ] K`. ℤ/mℤ as a group: `Multiplicative (ZMod m)`. "≅": `Nonempty (_ ≃* _)`. "Contains ℤ/4ℤ": `∃ H : Subgroup G, Nonempty (H ≃* Multiplicative (ZMod 4))`.
- **Instance note.** Clauses 2–4 and 6 use `IsCyclic (ZMod p)ˣ` (instance `[Finite Rˣ] : IsCyclic Rˣ` for a domain), which needs `Fact p.Prime`. In the ∀ p clauses it is a hypothesis-instance; for p = 7 there is **no global `Fact (Nat.Prime 7)`** (nor for 5, 11, 13, 17, 29 — only `Nat.fact_prime_two`, `Nat.fact_prime_three`); L supplies `⟨by norm_num⟩` locally. Provable facts, not hypotheses of the statements.

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
| declaration | kind | module (file:line) |
|---|---|---|
| `IsCyclotomicExtension.Rat.finrank` | theorem | Mathlib.NumberTheory.NumberField.Cyclotomic.Basic (:45) |
| `Nat.totient_prime` | theorem | Mathlib.Data.Nat.Totient (:214) |
| `IsCyclotomicExtension.autEquivPow` | noncomputable def | Mathlib.NumberTheory.Cyclotomic.Gal (:77) |
| `Polynomial.cyclotomic.irreducible_rat` | theorem | Mathlib.RingTheory.Polynomial.Cyclotomic.Roots (:190) |
| (instance) `IsCyclic Rˣ` for `[Finite Rˣ]` | instance | Mathlib.RingTheory.IntegralDomain (:144) |
| `ZMod.card_units` | theorem | Mathlib.FieldTheory.Finite.Basic (:600) |
| `mulEquivOfCyclicCardEq` | noncomputable def | Mathlib.GroupTheory.SpecificGroups.Cyclic (:498) |
| `isCyclic_multiplicative`, `ZMod.instIsAddCyclic` | instances | Mathlib.GroupTheory.SpecificGroups.Cyclic.Basic (:62); Mathlib.GroupTheory.SpecificGroups.Cyclic (:279) |
| `Subgroup.card_subgroup_dvd_card` | theorem | Mathlib.GroupTheory.Coset.Card (:69) — Lagrange, for clause 2 (4 ∤ 6) |
| `Nat.card_congr` | theorem | Mathlib.SetTheory.Cardinal.Finite (:91) |
| `IsCyclic.exists_ofOrder_eq_natCard` | lemma | Mathlib.GroupTheory.SpecificGroups.Cyclic.Basic (:353) |
| `orderOf_pow_of_dvd` | lemma | Mathlib.GroupTheory.OrderOfElement (:420) |
| `Subgroup.zpowers` / `Subgroup.isCyclic_zpowers` / `Nat.card_zpowers` | def / instance / theorem | Mathlib.Algebra.Group.Subgroup.ZPowers.Basic (:30); Mathlib.GroupTheory.SpecificGroups.Cyclic.Basic (:49); Mathlib.Data.ZMod.QuotientGroup (:161) |
| `Set.Infinite.mono` | lemma | Mathlib.Data.Set.Finite.Basic (:530) |
| `Nat.ModEq` (notation `a ≡ b [MOD n]`) | def | Mathlib.Data.Nat.ModEq (:36; notation :40) |
| `Nat.infinite_setOfPred_prime_modEq_one` | theorem | Mathlib.NumberTheory.PrimesCongruentOne (:68) — `Set.Infinite {p : ℕ \| Nat.Prime p ∧ p ≡ 1 [MOD k]}` for k ≠ 0 |
| `Nat.infinite_setOf_prime_modEq_one` | deprecated alias (since 2026-07-09) | same file (:73) — the ledger/brief's name; it resolves at the pin but is deprecated, L should use the new name |
| `IsPrimitiveRoot` | structure | Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots (:63) — clause 8 |
| `IsPrimitiveRoot.dvd_of_isCyclotomicExtension` | theorem | Mathlib.NumberTheory.Cyclotomic.PrimitiveRoots (:220) — in an n-th cyclotomic extension of ℚ (`[NumberField K]`), a primitive l-th root forces l ∣ 2 * n; clause 8's one-step route |
| `IsPrimitiveRoot.lcm_totient_le_finrank` | theorem | Mathlib.NumberTheory.Cyclotomic.PrimitiveRoots (:189) — φ(lcm p q) ≤ finrank K L from primitive p-th and q-th roots; the degree argument behind the line above |
| `IsPrimitiveRoot.pow_mul_pow_lcm` | theorem | Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots (:232) — the product root of order lcm (V₁'s "ζ·ζp"; covers p = 2, no separate −ζ case) |
| `orderOf_mul_eq_mul_orderOf_of_coprime` | theorem | Mathlib.GroupTheory.OrderOfElement (:483) — the coprime-orders lemma, an alternative to the line above |
| `IsCyclotomicExtension.zeta`, `IsCyclotomicExtension.zeta_spec` | noncomputable def, theorem | Mathlib.NumberTheory.Cyclotomic.PrimitiveRoots (:87, :93) |
| `IsCyclotomicExtension.finrank` | theorem | Mathlib.NumberTheory.Cyclotomic.PrimitiveRoots (:180) — `finrank K L = n.totient` given irreducibility (with `Rat.finrank`, :45 of NumberField/Cyclotomic/Basic.lean, for ℚ) |
| `Nat.totient`, `Nat.totient_mul`, `Nat.totient_prime` | def, theorems | Mathlib.Data.Nat.Totient (`totient_mul` :131, `totient_prime` :214) |
| `IsPrimitiveRoot.map_of_injective` | theorem | Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots (:296) — embedding form → root form |
| `RingHom.injective` | theorem | Mathlib.RingTheory.SimpleRing.Basic (:67, declared `_root_.RingHom.injective`) — a ring hom out of a field is injective |
| `CyclotomicField` | def | Mathlib.NumberTheory.Cyclotomic.Basic (:654) |
| `IsCyclotomicExtension.algEquiv` | noncomputable def | Mathlib.NumberTheory.Cyclotomic.Basic (:601) |

The brief's other candidate `Nat.setOf_prime_and_eq_mod_infinite` (Dirichlet-family form) was not needed; the special case k = 4 is `Nat.infinite_setOfPred_prime_modEq_one`, elementary (cyclotomic-polynomial proof), no Dirichlet theorem required. No name missing at the pin.

## 5 · Intended Lean statements
**Prose.** (1) [ℚ(ζ7):ℚ] = 6 and [ℚ(ζ11):ℚ] = 10. (2) Gal(ℚ(ζ7)/ℚ) ≅ ℤ/6ℤ and has no subgroup isomorphic to ℤ/4ℤ. (3) For every prime p, (ℤ/pℤ)* ≅ ℤ/(p−1)ℤ. (4) For every prime p ≡ 1 (mod 4), (ℤ/pℤ)* has a subgroup isomorphic to ℤ/4ℤ. (5) 13, 17, 29 are primes ≡ 1 (mod 4). (6) There are infinitely many primes p such that Gal(ℚ(ζp)/ℚ) has a subgroup isomorphic to ℤ/4ℤ. (7) For a prime p, [ℚ(ζp):ℚ] = 4 if and only if p = 5. (8) For every prime p ≠ 5, ℚ(ζ5) does not embed in ℚ(ζp) over ℚ; equivalently ℚ(ζp) contains no primitive 5th root of unity.

**Proposed signatures.**
```lean
theorem rz_72a_degrees
    (K₇ : Type*) [Field K₇] [CharZero K₇] [IsCyclotomicExtension {7} ℚ K₇]
    (K₁₁ : Type*) [Field K₁₁] [CharZero K₁₁] [IsCyclotomicExtension {11} ℚ K₁₁] :
    Module.finrank ℚ K₇ = 6 ∧ Module.finrank ℚ K₁₁ = 10 := by
  sorry

theorem rz_72a_gal_seven_no_quartic
    (K : Type*) [Field K] [CharZero K] [IsCyclotomicExtension {7} ℚ K] :
    Nonempty (Gal(K/ℚ) ≃* Multiplicative (ZMod 6)) ∧
    ¬ ∃ H : Subgroup Gal(K/ℚ), Nonempty (H ≃* Multiplicative (ZMod 4)) := by
  sorry

theorem rz_72a_units_cyclic (p : ℕ) [Fact p.Prime] :
    Nonempty ((ZMod p)ˣ ≃* Multiplicative (ZMod (p - 1))) := by
  sorry

theorem rz_72a_units_contain_quartic (p : ℕ) [Fact p.Prime] (hp : p ≡ 1 [MOD 4]) :
    ∃ H : Subgroup (ZMod p)ˣ, Nonempty (H ≃* Multiplicative (ZMod 4)) := by
  sorry

theorem rz_72a_examples :
    ∀ p ∈ ({13, 17, 29} : Finset ℕ), p.Prime ∧ p ≡ 1 [MOD 4] := by
  sorry

theorem rz_72a_quartic_layer_infinitely_often :
    Set.Infinite {p : ℕ | p.Prime ∧
      ∃ H : Subgroup (CyclotomicField p ℚ ≃ₐ[ℚ] CyclotomicField p ℚ),
        Nonempty (H ≃* Multiplicative (ZMod 4))} := by
  sorry

theorem rz_72a_degree_four_only_five (p : ℕ) [Fact p.Prime]
    (K : Type*) [Field K] [CharZero K] [IsCyclotomicExtension {p} ℚ K] :
    Module.finrank ℚ K = 4 ↔ p = 5 := by
  sorry

theorem rz_72a_cyclotomic_five_does_not_recur (p : ℕ) [Fact p.Prime] (hp5 : p ≠ 5)
    (K : Type*) [Field K] [NumberField K] [IsCyclotomicExtension {p} ℚ K] :
    IsEmpty (CyclotomicField 5 ℚ →ₐ[ℚ] K) ∧ ¬ ∃ ζ : K, IsPrimitiveRoot ζ 5 := by
  sorry
```
E1 throughout. (6): `Nat.infinite_setOfPred_prime_modEq_one (k := 4)` then `Set.Infinite.mono` with (4) transported along `autEquivPow`. (7) overlaps L:RZ-71a's leg 1 (there via the Galois order, here via the degree; equal by `IsGalois.card_aut_eq_finrank`) — both are printed, at two loci; see §6. (8), E1–E2, no √p* machinery: the root form first — a primitive 5th root ζ ∈ K together with ζp = `IsCyclotomicExtension.zeta p ℚ K` gives, by `IsPrimitiveRoot.lcm_totient_le_finrank`, φ(lcm(5, p)) ≤ [K : ℚ] = p − 1; for p ≠ 5, lcm(5, p) = 5p and φ(5p) = 4(p − 1) > p − 1 (p = 2 included: lcm 10, φ = 4 > 1). Mathlib packages exactly this as `IsPrimitiveRoot.dvd_of_isCyclotomicExtension` (a primitive l-th root in ℚ(ζn) forces l ∣ 2n): 5 ∣ 2p forces p = 5. The embedding form reduces to the root form: an embedding f would send `IsCyclotomicExtension.zeta 5 ℚ (CyclotomicField 5 ℚ)` to a primitive 5th root in K (`IsPrimitiveRoot.map_of_injective` with `RingHom.injective`).

## 6 · What the row does not claim
- "and with it the quadratic subfield ℚ(√5): the unique quadratic subfield of ℚ(ζp) is ℚ(√p*)" — L:RZ-72b (OUT-OF-Q5).
- "additional L-function factors arise … all factors are degree-1 Dirichlet L-functions — they produce more characters, not higher-dimensional representations" — L:RZ-72c (OUT-OF-Q5, NEEDS-DEVELOPMENT).
- The S4 / non-abelian question — printed as "beyond scope"; no claim.
- "its matching to the four-operator algebra is the proposal of §10.2 [C]" — CONCEPT.
- The converse of clause 4 (ℤ/4ℤ ⊆ (ℤ/pℤ)* only if p ≡ 1 (mod 4)) — true but not printed.
- Clause 7 duplicates L:RZ-71a's first iff in content; counting the overlap once or twice is V₁'s/the wall's call, not this spec's (V₁ 17:30:04Z: counts once).
- Clause 8 is containment of ℚ(ζ5) only; that ℚ(√5) does not recur either is L:RZ-72b (B′).

## 7 · Status
SPEC-DRAFT 2026-10-28T17:35:06Z (revised at V₁ drift D1: clause 8 added, the non-isomorphism sentence of §3 clause 7 removed; first draft 17:22:57Z)

V1: V1-DRIFT 2026-10-28T17:30:04Z — the seven signatures are faithful, but §3 clause 7 and §6 read "What does not recur is ℚ(ζ5) itself" as non-isomorphism ("no ℚ(ζp), p ≠ 5, is ℚ-isomorphic to ℚ(ζ5) … follows by degree") — WEAKER than printed. In print "recur" is containment: it answers "a cyclic quartic layer recurs IN infinitely many prime cyclotomic fields", 72b itself reads the same verb as "ℚ(√5) is not a subfield of ℚ(ζp)", and the printed colon-reason (the quadratic subfield) would be idle under the isomorphism reading. The containment claim (∀ prime p ≠ 5, ℚ(ζ5) does not embed in ℚ(ζp) — e.g. IsEmpty (CyclotomicField 5 ℚ →ₐ[ℚ] K), equivalently ¬∃ ζ : K, IsPrimitiveRoot ζ 5) is currently carried by no sub-row; degree alone does not give it (4 ∣ p − 1 for p ≡ 1 mod 4). Back to M: add it as clause 8 (E1–E2 without the √p* machinery: ζ·ζp would be a primitive 5p-th root in K, degree φ(5p) = 4(p−1) > p − 1) or move it to 72b. Clause 6's ℤ/4ℤ-subgroup reading of "cyclic quartic layer" CONFIRMED (the print's "contains ℤ/4ℤ"; H ≅ ℤ/4ℤ is the top layer K/K^H, equivalent in a cyclic group to a cyclic quartic subfield). Clause 3 for every prime: confirmed. Clause 7 counts once with RZ-71a leg 1.

V1: V1-GREEN 2026-10-28T17:38:10Z — D1 closed. Re-read clause 8 (§3, §5) against served p27 "What does not recur is ℚ(ζ5) itself": the containment reading (∀ prime p ≠ 5, ℚ(ζ5) is not a subfield of ℚ(ζp), p = 2 included) is now stated, no stronger and no weaker. The two conjuncts IsEmpty (CyclotomicField 5 ℚ →ₐ[ℚ] K) and ¬∃ ζ : K, IsPrimitiveRoot ζ 5 are equivalent forms of the same printed fact (ℚ(ζ5) = ℚ(ζ5-root)), so the conjunction adds nothing beyond the print. [NumberField K] in place of [CharZero K] is a provable Prop instance, no change of domain. Route checked at the pin: IsPrimitiveRoot.dvd_of_isCyclotomicExtension (Cyclotomic/PrimitiveRoots.lean:220) gives 5 ∣ 2p, hence p = 5. Clause 7 now carries only "the only prime cyclotomic field of degree 4" (count once with RZ-71a leg 1, as before).

V2: V2-GREEN 2026-10-28T17:46:54Z — served p27 paragraph read first; all eight clauses say what the print says: (1) degrees 6, 10; (2) Gal(ℚ(ζ7)/ℚ) ≅ ℤ/6ℤ ∧ no subgroup ≅ ℤ/4ℤ; (3) (ℤ/pℤ)* ≅ ℤ/(p−1)ℤ for every prime (the printed apposition is unrestricted; "whenever" governs "contains"); (4) "if" direction only, as printed; (5) 13, 17, 29 prime and ≡ 1 mod 4 — the printed examples; (6) infinitely many primes with a ℤ/4ℤ subgroup of Gal(CyclotomicField p ℚ/ℚ) — the print's own "contains ℤ/4ℤ" argument, per-p equivalent in a cyclic group to a cyclic quartic subfield, so the set is the same; (7) degree 4 ↔ p = 5; (8) containment, the sense "recur … in … prime cyclotomic fields" carries one sentence earlier — not accidentally true (were CyclotomicField 5 ℚ trivial the embedding type would be inhabited and the clause false). Signed in statement_sha256 a06f2a6e….
