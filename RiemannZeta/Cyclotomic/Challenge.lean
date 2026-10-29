import Mathlib

/-!
# Unit U6 (`RiemannZeta/Cyclotomic`) — statements

Statements of the rows of unit U6 of the paper *The Tetrahedral Structure of the Riemann Zeta
Function* (QRiemannian Research, April 2026, revised October 2026), served PDF sha256
`2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54` (prefix `2d5287e7`).
PDF page indices count the cover as p01. Each theorem states one row of the claim ledger, from
its spec `specs/<ROW>.md` (signed `V1-GREEN` / `V1-SPLIT-OK`); every proof here is `sorry`.
The proofs live in `RiemannZeta/Cyclotomic/Solution.lean`.

Rows: L:RZ-65, L:RZ-71a, L:RZ-72a (eight theorems, clause 8 included); OUT-OF-Q5 legs (pending
the wall, not counted): L:RZ-71b, L:RZ-72b. L:RZ-72c (OUT-OF-Q5, NEEDS-DEVELOPMENT: no
factorisation of the Dedekind zeta function into Dirichlet L-functions at the pin) carries no
statement here.

Conventions (spec `_UNIT-U6.md`): ℚ(ζn) is any `K` with `[CharZero K]`
`[IsCyclotomicExtension {n} ℚ K]` (`[NumberField K]` where the discriminant or
`IsPrimitiveRoot.dvd_of_isCyclotomicExtension` needs it), all ℚ-isomorphic by
`IsCyclotomicExtension.algEquiv`; `CyclotomicField p ℚ` where a set-builder must not quantify
over types. `Gal(K/ℚ)` is mathlib's notation for `K ≃ₐ[ℚ] K`; "≅" is `Nonempty (_ ≃* _)`;
ℤ/mℤ as a group is `Multiplicative (ZMod m)`; "contains ℤ/4ℤ" is a subgroup isomorphic to it.
In the ∀ p statements `[Fact p.Prime]` is the hypothesis-instance; no statement here needs a
`Fact (Nat.Prime n)` for a numeral n to elaborate (the proofs supply `⟨by norm_num⟩` locally
for 5, 7, 11, 13, 17, 29 where they use one).

Counted once: "degree 4 ⇔ p = 5" is one fact printed at two loci — L:RZ-71a leg 1 (via the
Galois order, p26) and L:RZ-72a clause 7 (via the degree, p27); both are stated, one proof is
counted. L:RZ-72b (A) is L:RZ-71b (A) printed a second time; it is stated once, as
`rz_71b_unique_quadratic_subfield`.
-/

namespace RiemannZeta.Cyclotomic

/-! ## L:RZ-65 -/

/-- **L:RZ-65** — RZ §10.2 "The 5th cyclotomic field", display (10.1), PDF p26 (folio 25);
served PDF sha256 `2d5287e7…`. ℚ(ζ₅) is a degree-4 extension of ℚ with
Gal(ℚ(ζ₅)/ℚ) ≅ (ℤ/5ℤ)* ≅ ℤ/4ℤ: (i) [K : ℚ] = 4; (ii) Gal(K/ℚ) ≅ (ℤ/5ℤ)ˣ;
(iii) (ℤ/5ℤ)ˣ ≅ ℤ/4ℤ. -/
theorem rz_65_gal_cyclotomic_five (K : Type*) [Field K] [CharZero K]
    [IsCyclotomicExtension {5} ℚ K] :
    Module.finrank ℚ K = 4 ∧
    Nonempty (Gal(K/ℚ) ≃* (ZMod 5)ˣ) ∧
    Nonempty ((ZMod 5)ˣ ≃* Multiplicative (ZMod 4)) := by
  sorry

/-! ## L:RZ-71a -/

/-- **L:RZ-71a** — RZ §10.3 "Why four is complete", Proposition 10.1 (Cyclotomic completeness),
legs 1–2, PDF p26 (folio 25); served PDF sha256 `2d5287e7…`. For every prime p and
K = ℚ(ζp): |Gal(K/ℚ)| = p − 1, and = 4 ⇔ p = 5; |disc K| is a power of p, and its set of
prime divisors is exactly {5} ⇔ p = 5 (V₁ ruling: "involves only the prime 5" = prime set
= {5}). Leg 1's "= 4 ⇔ p = 5" is the same fact as L:RZ-72a clause 7; counted once. -/
theorem rz_71a_cyclotomic_completeness_legs12 (p : ℕ) [Fact p.Prime]
    (K : Type*) [Field K] [NumberField K] [IsCyclotomicExtension {p} ℚ K] :
    Nat.card Gal(K/ℚ) = p - 1 ∧
    (Nat.card Gal(K/ℚ) = 4 ↔ p = 5) ∧
    (∃ k : ℕ, (NumberField.discr K).natAbs = p ^ k) ∧
    ((NumberField.discr K).natAbs.primeFactors = {5} ↔ p = 5) := by
  sorry

/-! ## L:RZ-71b — OUT-OF-Q5 (pending the wall) -/

open IntermediateField in
/-- **L:RZ-71b (A)** — OUT-OF-Q5 (pending the wall; not counted). RZ §10.3, Proposition 10.1,
leg 3's printed justification, PDF p26 (folio 25); the same content is printed again at the
paragraph after Proposition 10.1, PDF p27 (L:RZ-72b (A), counted once with this theorem);
served PDF sha256 `2d5287e7…`. For every odd prime p (V₁: `p ≠ 2` is a reading of the printed
p* = (−1)^{(p−1)/2} p, not a repair), ℚ(ζp) contains a square root x of p*, and its quadratic
subfields are exactly ℚ(x). -/
theorem rz_71b_unique_quadratic_subfield (p : ℕ) [Fact p.Prime] (hp2 : p ≠ 2)
    (K : Type*) [Field K] [CharZero K] [IsCyclotomicExtension {p} ℚ K] :
    ∃ x : K, x ^ 2 = ((((-1 : ℤ) ^ ((p - 1) / 2)) * p : ℤ) : K) ∧
      ∀ F : IntermediateField ℚ K, Module.finrank ℚ F = 2 ↔ F = ℚ⟮x⟯ := by
  sorry

open IntermediateField in
/-- **L:RZ-71b (B)** — OUT-OF-Q5 (pending the wall; not counted). RZ §10.3, Proposition 10.1,
leg 3, PDF p26 (folio 25); served PDF sha256 `2d5287e7…`. For every prime p, ℚ(ζp) has a
unique quadratic subfield and it is ℚ(√5) if and only if p = 5 — leg 3 singles out p = 5 on
its own. The "⇐" direction is L:RZ-68's content. -/
theorem rz_71b_leg3_selects_five (p : ℕ) [Fact p.Prime]
    (K : Type*) [Field K] [CharZero K] [IsCyclotomicExtension {p} ℚ K] :
    (∃ x : K, x ^ 2 = 5 ∧
      ∀ F : IntermediateField ℚ K, Module.finrank ℚ F = 2 ↔ F = ℚ⟮x⟯) ↔ p = 5 := by
  sorry

/-! ## L:RZ-72a -/

/-- **L:RZ-72a clause 1** — RZ §10.3 "Why four is complete", the paragraph after
Proposition 10.1, PDF p27 (folio 26); served PDF sha256 `2d5287e7…`.
"ℚ(ζ7) with degree 6, ℚ(ζ11) with degree 10". -/
theorem rz_72a_degrees
    (K₇ : Type*) [Field K₇] [CharZero K₇] [IsCyclotomicExtension {7} ℚ K₇]
    (K₁₁ : Type*) [Field K₁₁] [CharZero K₁₁] [IsCyclotomicExtension {11} ℚ K₁₁] :
    Module.finrank ℚ K₇ = 6 ∧ Module.finrank ℚ K₁₁ = 10 := by
  sorry

/-- **L:RZ-72a clause 2** — RZ §10.3, the paragraph after Proposition 10.1, PDF p27 (folio 26);
served PDF sha256 `2d5287e7…`. "The Galois group ℤ/6ℤ of ℚ(ζ7) does not contain ℤ/4ℤ":
Gal(ℚ(ζ7)/ℚ) ≅ ℤ/6ℤ and it has no subgroup isomorphic to ℤ/4ℤ. -/
theorem rz_72a_gal_seven_no_quartic
    (K : Type*) [Field K] [CharZero K] [IsCyclotomicExtension {7} ℚ K] :
    Nonempty (Gal(K/ℚ) ≃* Multiplicative (ZMod 6)) ∧
    ¬ ∃ H : Subgroup Gal(K/ℚ), Nonempty (H ≃* Multiplicative (ZMod 4)) := by
  sorry

/-- **L:RZ-72a clause 3** — RZ §10.3, the paragraph after Proposition 10.1, PDF p27 (folio 26);
served PDF sha256 `2d5287e7…`. "(ℤ/pℤ)* ≅ ℤ/(p − 1)ℤ", for every prime p. -/
theorem rz_72a_units_cyclic (p : ℕ) [Fact p.Prime] :
    Nonempty ((ZMod p)ˣ ≃* Multiplicative (ZMod (p - 1))) := by
  sorry

/-- **L:RZ-72a clause 4** — RZ §10.3, the paragraph after Proposition 10.1, PDF p27 (folio 26);
served PDF sha256 `2d5287e7…`. "(ℤ/pℤ)* … contains ℤ/4ℤ whenever p ≡ 1 (mod 4)" (the "if"
direction only, as printed). -/
theorem rz_72a_units_contain_quartic (p : ℕ) [Fact p.Prime] (hp : p ≡ 1 [MOD 4]) :
    ∃ H : Subgroup (ZMod p)ˣ, Nonempty (H ≃* Multiplicative (ZMod 4)) := by
  sorry

/-- **L:RZ-72a clause 5** — RZ §10.3, the paragraph after Proposition 10.1, PDF p27 (folio 26);
served PDF sha256 `2d5287e7…`. "(p = 13, 17, 29, …)": the printed examples are primes
≡ 1 (mod 4). -/
theorem rz_72a_examples :
    ∀ p ∈ ({13, 17, 29} : Finset ℕ), p.Prime ∧ p ≡ 1 [MOD 4] := by
  sorry

/-- **L:RZ-72a clause 6** — RZ §10.3, the paragraph after Proposition 10.1, PDF p27 (folio 26);
served PDF sha256 `2d5287e7…`. "so a cyclic quartic layer recurs in infinitely many prime
cyclotomic fields": infinitely many primes p have Gal(ℚ(ζp)/ℚ) containing a subgroup
≅ ℤ/4ℤ (V₁: the subgroup reading is the print's own argument). -/
theorem rz_72a_quartic_layer_infinitely_often :
    Set.Infinite {p : ℕ | p.Prime ∧
      ∃ H : Subgroup (CyclotomicField p ℚ ≃ₐ[ℚ] CyclotomicField p ℚ),
        Nonempty (H ≃* Multiplicative (ZMod 4))} := by
  sorry

/-- **L:RZ-72a clause 7** — RZ §10.3, the paragraph after Proposition 10.1, PDF p27 (folio 26);
served PDF sha256 `2d5287e7…`. "ℚ(ζ5) is the only prime cyclotomic field of degree 4": for a
prime p, [ℚ(ζp) : ℚ] = 4 ⇔ p = 5. The same fact as L:RZ-71a leg 1; counted once. -/
theorem rz_72a_degree_four_only_five (p : ℕ) [Fact p.Prime]
    (K : Type*) [Field K] [CharZero K] [IsCyclotomicExtension {p} ℚ K] :
    Module.finrank ℚ K = 4 ↔ p = 5 := by
  sorry

/-- **L:RZ-72a clause 8** — RZ §10.3, the paragraph after Proposition 10.1, PDF p27 (folio 26);
served PDF sha256 `2d5287e7…`. "What does not recur is ℚ(ζ5) itself", read as containment
(V₁ drift D1, closed): for every prime p ≠ 5, ℚ(ζ5) does not embed in ℚ(ζp) over ℚ, and
equivalently ℚ(ζp) contains no primitive 5th root of unity. The containment theorem. -/
theorem rz_72a_cyclotomic_five_does_not_recur (p : ℕ) [Fact p.Prime] (hp5 : p ≠ 5)
    (K : Type*) [Field K] [NumberField K] [IsCyclotomicExtension {p} ℚ K] :
    IsEmpty (CyclotomicField 5 ℚ →ₐ[ℚ] K) ∧ ¬ ∃ ζ : K, IsPrimitiveRoot ζ 5 := by
  sorry

/-! ## L:RZ-72b — OUT-OF-Q5 (pending the wall) -/

/-- **L:RZ-72b (B′)** — OUT-OF-Q5 (pending the wall; not counted). RZ §10.3, the paragraph after
Proposition 10.1, PDF p27 (folio 26); served PDF sha256 `2d5287e7…`. "What does not recur is
… the quadratic subfield ℚ(√5)": for every prime p ≠ 5, ℚ(ζp) contains no square root of 5.
L:RZ-72b (A) is `rz_71b_unique_quadratic_subfield`, stated once. -/
theorem rz_72b_sqrt_five_does_not_recur (p : ℕ) [Fact p.Prime] (hp5 : p ≠ 5)
    (K : Type*) [Field K] [CharZero K] [IsCyclotomicExtension {p} ℚ K] :
    ¬ ∃ x : K, x ^ 2 = 5 := by
  sorry

end RiemannZeta.Cyclotomic
