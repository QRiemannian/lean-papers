import Mathlib

/-!
# Unit U6 (`RiemannZeta/Cyclotomic`) — proofs

Proofs of the frozen statements of `RiemannZeta/Cyclotomic/Challenge.lean` (sha256
`a06f2a6e81f5925ecc79096314d79d21ae4401149dc5fcf9a1d05b2c23f78ffc`). Under CO's ruling this
module imports `Mathlib` only (not the Challenge module); every theorem below carries the
Challenge's name and statement text unchanged, docstring included. A theorem of the Challenge
absent here is listed under `statements_not_checked:` in `formalization.yaml`.
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
  have : Fact (Nat.Prime 5) := ⟨by norm_num⟩
  refine ⟨?_, ⟨IsCyclotomicExtension.autEquivPow K
    (Polynomial.cyclotomic.irreducible_rat (by norm_num))⟩, ?_⟩
  · rw [IsCyclotomicExtension.Rat.finrank 5 K, Nat.totient_prime Fact.out]
  · refine ⟨mulEquivOfCyclicCardEq ?_⟩
    rw [Nat.card_eq_fintype_card, ZMod.card_units, Nat.card_eq_fintype_card]
    simp

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
  have hp : p.Prime := Fact.out
  have h2 := hp.two_le
  have hcard : Nat.card Gal(K/ℚ) = p - 1 := by
    rw [Nat.card_congr (IsCyclotomicExtension.autEquivPow K
      (Polynomial.cyclotomic.irreducible_rat hp.pos)).toEquiv, Nat.card_eq_fintype_card,
      ZMod.card_units]
  have hdisc : (NumberField.discr K).natAbs = p ^ (p - 2) := by
    rw [IsCyclotomicExtension.Rat.discr_prime p K]
    simp [Int.natAbs_mul, Int.natAbs_pow]
  refine ⟨hcard, by rw [hcard]; omega, ⟨p - 2, hdisc⟩, ?_⟩
  rw [hdisc]
  constructor
  · intro h
    have h5 : 5 ∈ (p ^ (p - 2)).primeFactors := by rw [h]; simp
    rw [Nat.mem_primeFactors] at h5
    exact ((Nat.prime_dvd_prime_iff_eq (by norm_num) hp).mp
      ((by norm_num : Nat.Prime 5).dvd_of_dvd_pow h5.2.1)).symm
  · rintro rfl
    rw [Nat.primeFactors_prime_pow (by norm_num) (by norm_num)]

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
  have hpp : p.Prime := Fact.out
  have : NumberField K := IsCyclotomicExtension.numberField {p} ℚ K
  have : IsGalois ℚ K := IsCyclotomicExtension.isGalois {p} ℚ K
  -- a square root of p* : the quadratic Gauss sum
  obtain ⟨x, hx⟩ : ∃ x : K, x ^ 2 = ((((-1 : ℤ) ^ ((p - 1) / 2)) * p : ℤ) : K) := by
    have hζ := IsCyclotomicExtension.zeta_spec p ℚ K
    let ψ : AddChar (ZMod p) K := AddChar.zmodChar p hζ.pow_eq_one
    have hψ : ψ.IsPrimitive := AddChar.zmodChar_primitive_of_primitive_root p hζ
    have hF : ringChar (ZMod p) ≠ 2 := by rwa [ZMod.ringChar_zmod_n]
    let χ : MulChar (ZMod p) K := (quadraticChar (ZMod p)).ringHomComp (Int.castRingHom K)
    have hχ1 : χ ≠ 1 :=
      (MulChar.ringHomComp_ne_one_iff (RingHom.injective_int _)).mpr (quadraticChar_ne_one hF)
    have hχ2 : χ.IsQuadratic := (quadraticChar_isQuadratic (ZMod p)).comp _
    refine ⟨gaussSum χ ψ, ?_⟩
    rw [gaussSum_sq hχ1 hχ2 hψ, ZMod.card]
    have hodd : p % 2 = 1 := Nat.odd_iff.mp (hpp.odd_of_ne_two hp2)
    simp only [χ, MulChar.ringHomComp_apply, quadraticChar_neg_one hF, ZMod.card,
      ZMod.χ₄_eq_neg_one_pow hodd, eq_intCast, Int.cast_mul, Int.cast_pow, Int.cast_neg,
      Int.cast_one, Int.cast_natCast]
    rw [show p / 2 = (p - 1) / 2 by omega]
  -- p* is not a rational square
  have hdq : ∀ q : ℚ, q ^ 2 ≠ (((-1 : ℤ) ^ ((p - 1) / 2) * p : ℤ) : ℚ) := by
    intro q hq
    rcases neg_one_pow_eq_or ℤ ((p - 1) / 2) with h | h <;>
      rw [h] at hq <;> push_cast at hq
    · have : IsSquare (p : ℚ) := ⟨q, by rw [← sq, hq, one_mul]⟩
      exact (Nat.prime_iff.mp hpp).not_isSquare (Rat.isSquare_natCast_iff.mp this)
    · have : (0 : ℚ) < p := by exact_mod_cast hpp.pos
      nlinarith [sq_nonneg q]
  have hint : IsIntegral ℚ x := Algebra.IsIntegral.isIntegral x
  have hfin : Module.finrank ℚ ℚ⟮x⟯ = 2 := by
    rw [IntermediateField.adjoin.finrank hint]
    have hpos := minpoly.natDegree_pos hint
    have hne : (minpoly ℚ x).natDegree ≠ 1 := by
      rw [Ne, minpoly.natDegree_eq_one_iff]
      rintro ⟨q, hq⟩
      apply hdq q
      apply (algebraMap ℚ K).injective
      rw [map_pow, hq, hx, map_intCast]
    have hle : (minpoly ℚ x).natDegree ≤ 2 := by
      have hP : (Polynomial.X ^ 2 - Polynomial.C
          ((((-1 : ℤ) ^ ((p - 1) / 2) * p : ℤ) : ℚ)) : Polynomial ℚ) ≠ 0 :=
        Polynomial.X_pow_sub_C_ne_zero (by norm_num) _
      have := minpoly.degree_le_of_ne_zero ℚ x hP (by simp [hx])
      rw [Polynomial.degree_X_pow_sub_C (by norm_num)] at this
      exact Polynomial.natDegree_le_of_degree_le this
    omega
  -- the Galois group is cyclic, so it has at most one subgroup of index 2
  let e := IsCyclotomicExtension.autEquivPow K (Polynomial.cyclotomic.irreducible_rat hpp.pos)
  have hcyc : IsCyclic Gal(K/ℚ) := isCyclic_of_surjective e.symm e.symm.surjective
  have hsub : ∀ H₁ H₂ : Subgroup Gal(K/ℚ), H₁.index = 2 → H₂.index = 2 → H₁ ≤ H₂ := by
    intro H₁ H₂ h₁ h₂ y hy
    obtain ⟨g, hg⟩ := hcyc.exists_generator
    obtain ⟨k, rfl⟩ := Subgroup.mem_zpowers_iff.mp (hg y)
    rcases Int.even_or_odd' k with ⟨m, rfl | rfl⟩
    · have : g ^ (2 * m) = (g ^ m) ^ 2 := by group
      rw [this]
      exact Subgroup.sq_mem_of_index_two h₂ _
    · exfalso
      have hgH : g ∈ H₁ := by
        have := H₁.mul_mem hy (H₁.inv_mem (Subgroup.sq_mem_of_index_two h₁ (g ^ m)))
        convert this using 1
        group
      have htop : H₁ = ⊤ := by
        rw [eq_top_iff]
        intro z _
        obtain ⟨j, rfl⟩ := Subgroup.mem_zpowers_iff.mp (hg z)
        exact H₁.zpow_mem hgH j
      rw [htop, Subgroup.index_top] at h₁
      norm_num at h₁
  have huniq : ∀ F₁ F₂ : IntermediateField ℚ K,
      Module.finrank ℚ F₁ = 2 → Module.finrank ℚ F₂ = 2 → F₁ = F₂ := by
    intro F₁ F₂ h₁ h₂
    rw [IntermediateField.finrank_eq_fixingSubgroup_index] at h₁ h₂
    rw [← IsGalois.fixedField_fixingSubgroup F₁, ← IsGalois.fixedField_fixingSubgroup F₂,
      le_antisymm (hsub _ _ h₁ h₂) (hsub _ _ h₂ h₁)]
  refine ⟨x, hx, fun F => ⟨fun hF => huniq F _ hF hfin, fun h => ?_⟩⟩
  subst h
  exact hfin

-- `rz_71b_leg3_selects_five`: proved below, after `rz_72b_sqrt_five_does_not_recur`.

/-! ## L:RZ-72a -/

/-- **L:RZ-72a clause 1** — RZ §10.3 "Why four is complete", the paragraph after
Proposition 10.1, PDF p27 (folio 26); served PDF sha256 `2d5287e7…`.
"ℚ(ζ7) with degree 6, ℚ(ζ11) with degree 10". -/
theorem rz_72a_degrees
    (K₇ : Type*) [Field K₇] [CharZero K₇] [IsCyclotomicExtension {7} ℚ K₇]
    (K₁₁ : Type*) [Field K₁₁] [CharZero K₁₁] [IsCyclotomicExtension {11} ℚ K₁₁] :
    Module.finrank ℚ K₇ = 6 ∧ Module.finrank ℚ K₁₁ = 10 := by
  rw [IsCyclotomicExtension.Rat.finrank 7 K₇, IsCyclotomicExtension.Rat.finrank 11 K₁₁,
    Nat.totient_prime (by norm_num), Nat.totient_prime (by norm_num)]
  exact ⟨rfl, rfl⟩

/-- **L:RZ-72a clause 2** — RZ §10.3, the paragraph after Proposition 10.1, PDF p27 (folio 26);
served PDF sha256 `2d5287e7…`. "The Galois group ℤ/6ℤ of ℚ(ζ7) does not contain ℤ/4ℤ":
Gal(ℚ(ζ7)/ℚ) ≅ ℤ/6ℤ and it has no subgroup isomorphic to ℤ/4ℤ. -/
theorem rz_72a_gal_seven_no_quartic
    (K : Type*) [Field K] [CharZero K] [IsCyclotomicExtension {7} ℚ K] :
    Nonempty (Gal(K/ℚ) ≃* Multiplicative (ZMod 6)) ∧
    ¬ ∃ H : Subgroup Gal(K/ℚ), Nonempty (H ≃* Multiplicative (ZMod 4)) := by
  have : Fact (Nat.Prime 7) := ⟨by norm_num⟩
  let e := IsCyclotomicExtension.autEquivPow K
    (Polynomial.cyclotomic.irreducible_rat (n := 7) (by norm_num))
  have hcard : Nat.card Gal(K/ℚ) = 6 := by
    rw [Nat.card_congr e.toEquiv, Nat.card_eq_fintype_card, ZMod.card_units]
  refine ⟨?_, ?_⟩
  · have : IsCyclic Gal(K/ℚ) := isCyclic_of_surjective e.symm e.symm.surjective
    refine ⟨mulEquivOfCyclicCardEq ?_⟩
    rw [hcard, Nat.card_eq_fintype_card]
    simp
  · rintro ⟨H, ⟨f⟩⟩
    have h4 : Nat.card H = 4 := by
      rw [Nat.card_congr f.toEquiv, Nat.card_eq_fintype_card]; simp
    have := Subgroup.card_subgroup_dvd_card H
    rw [h4, hcard] at this
    norm_num at this

/-- **L:RZ-72a clause 3** — RZ §10.3, the paragraph after Proposition 10.1, PDF p27 (folio 26);
served PDF sha256 `2d5287e7…`. "(ℤ/pℤ)* ≅ ℤ/(p − 1)ℤ", for every prime p. -/
theorem rz_72a_units_cyclic (p : ℕ) [Fact p.Prime] :
    Nonempty ((ZMod p)ˣ ≃* Multiplicative (ZMod (p - 1))) := by
  have : NeZero (p - 1) := ⟨by have := (Fact.out : p.Prime).two_le; omega⟩
  refine ⟨mulEquivOfCyclicCardEq ?_⟩
  rw [Nat.card_eq_fintype_card, ZMod.card_units, Nat.card_eq_fintype_card]
  simp

/-- **L:RZ-72a clause 4** — RZ §10.3, the paragraph after Proposition 10.1, PDF p27 (folio 26);
served PDF sha256 `2d5287e7…`. "(ℤ/pℤ)* … contains ℤ/4ℤ whenever p ≡ 1 (mod 4)" (the "if"
direction only, as printed). -/
theorem rz_72a_units_contain_quartic (p : ℕ) [Fact p.Prime] (hp : p ≡ 1 [MOD 4]) :
    ∃ H : Subgroup (ZMod p)ˣ, Nonempty (H ≃* Multiplicative (ZMod 4)) := by
  have hpp : p.Prime := Fact.out
  have h2 := hpp.two_le
  have h4 : 4 ∣ p - 1 := (Nat.modEq_iff_dvd' hpp.one_le).mp hp.symm
  obtain ⟨g, hg⟩ := isCyclic_iff_exists_orderOf_eq_natCard.mp
    (inferInstance : IsCyclic (ZMod p)ˣ)
  rw [Nat.card_eq_fintype_card, ZMod.card_units] at hg
  obtain ⟨m, hm⟩ := h4
  have hm0 : m ≠ 0 := by
    rintro rfl
    omega
  have hord : orderOf (g ^ m) = 4 := by
    rw [orderOf_pow_of_dvd hm0 (by rw [hg, hm]; exact dvd_mul_left m 4), hg, hm,
      Nat.mul_div_cancel _ (Nat.pos_of_ne_zero hm0)]
  refine ⟨Subgroup.zpowers (g ^ m), ⟨mulEquivOfCyclicCardEq ?_⟩⟩
  rw [Nat.card_zpowers, hord, Nat.card_eq_fintype_card]
  simp

/-- **L:RZ-72a clause 5** — RZ §10.3, the paragraph after Proposition 10.1, PDF p27 (folio 26);
served PDF sha256 `2d5287e7…`. "(p = 13, 17, 29, …)": the printed examples are primes
≡ 1 (mod 4). -/
theorem rz_72a_examples :
    ∀ p ∈ ({13, 17, 29} : Finset ℕ), p.Prime ∧ p ≡ 1 [MOD 4] := by
  intro p hp
  simp only [Finset.mem_insert, Finset.mem_singleton] at hp
  rcases hp with rfl | rfl | rfl <;> exact ⟨by norm_num, by decide⟩

/-- **L:RZ-72a clause 6** — RZ §10.3, the paragraph after Proposition 10.1, PDF p27 (folio 26);
served PDF sha256 `2d5287e7…`. "so a cyclic quartic layer recurs in infinitely many prime
cyclotomic fields": infinitely many primes p have Gal(ℚ(ζp)/ℚ) containing a subgroup
≅ ℤ/4ℤ (V₁: the subgroup reading is the print's own argument). -/
theorem rz_72a_quartic_layer_infinitely_often :
    Set.Infinite {p : ℕ | p.Prime ∧
      ∃ H : Subgroup (CyclotomicField p ℚ ≃ₐ[ℚ] CyclotomicField p ℚ),
        Nonempty (H ≃* Multiplicative (ZMod 4))} := by
  refine (Nat.infinite_setOfPred_prime_modEq_one (k := 4) (by norm_num)).mono ?_
  rintro p ⟨hpp, hp⟩
  refine ⟨hpp, ?_⟩
  have : Fact p.Prime := ⟨hpp⟩
  have : NeZero ((p : ℕ) : ℚ) := ⟨by exact_mod_cast hpp.ne_zero⟩
  have : IsCyclotomicExtension {p} ℚ (CyclotomicField p ℚ) :=
    CyclotomicField.isCyclotomicExtension p ℚ
  let e := IsCyclotomicExtension.autEquivPow (CyclotomicField p ℚ)
    (Polynomial.cyclotomic.irreducible_rat hpp.pos)
  obtain ⟨H, ⟨f⟩⟩ := rz_72a_units_contain_quartic p hp
  exact ⟨H.map e.symm.toMonoidHom,
    ⟨(H.equivMapOfInjective e.symm.toMonoidHom e.symm.injective).symm.trans f⟩⟩

/-- **L:RZ-72a clause 7** — RZ §10.3, the paragraph after Proposition 10.1, PDF p27 (folio 26);
served PDF sha256 `2d5287e7…`. "ℚ(ζ5) is the only prime cyclotomic field of degree 4": for a
prime p, [ℚ(ζp) : ℚ] = 4 ⇔ p = 5. The same fact as L:RZ-71a leg 1; counted once. -/
theorem rz_72a_degree_four_only_five (p : ℕ) [Fact p.Prime]
    (K : Type*) [Field K] [CharZero K] [IsCyclotomicExtension {p} ℚ K] :
    Module.finrank ℚ K = 4 ↔ p = 5 := by
  rw [IsCyclotomicExtension.Rat.finrank p K, Nat.totient_prime Fact.out]
  have := (Fact.out : p.Prime).two_le
  omega

/-- **L:RZ-72a clause 8** — RZ §10.3, the paragraph after Proposition 10.1, PDF p27 (folio 26);
served PDF sha256 `2d5287e7…`. "What does not recur is ℚ(ζ5) itself", read as containment
(V₁ drift D1, closed): for every prime p ≠ 5, ℚ(ζ5) does not embed in ℚ(ζp) over ℚ, and
equivalently ℚ(ζp) contains no primitive 5th root of unity. The containment theorem. -/
theorem rz_72a_cyclotomic_five_does_not_recur (p : ℕ) [Fact p.Prime] (hp5 : p ≠ 5)
    (K : Type*) [Field K] [NumberField K] [IsCyclotomicExtension {p} ℚ K] :
    IsEmpty (CyclotomicField 5 ℚ →ₐ[ℚ] K) ∧ ¬ ∃ ζ : K, IsPrimitiveRoot ζ 5 := by
  have hpp : p.Prime := Fact.out
  have : NeZero ((5 : ℕ) : ℚ) := ⟨by norm_num⟩
  have : IsCyclotomicExtension {5} ℚ (CyclotomicField 5 ℚ) :=
    CyclotomicField.isCyclotomicExtension 5 ℚ
  have hno : ¬ ∃ ζ : K, IsPrimitiveRoot ζ 5 := by
    rintro ⟨ζ, hζ⟩
    have h := IsPrimitiveRoot.dvd_of_isCyclotomicExtension p hζ (by norm_num)
    have h5 : 5 ∣ p := ((Nat.Prime.dvd_mul (by norm_num)).mp h).resolve_left (by norm_num)
    exact hp5 ((Nat.prime_dvd_prime_iff_eq (by norm_num) hpp).mp h5).symm
  refine ⟨⟨fun f => hno ⟨f (IsCyclotomicExtension.zeta 5 ℚ (CyclotomicField 5 ℚ)), ?_⟩⟩, hno⟩
  exact (IsCyclotomicExtension.zeta_spec 5 ℚ (CyclotomicField 5 ℚ)).map_of_injective
    f.injective

/-! ## L:RZ-72b — OUT-OF-Q5 (pending the wall) -/

/-- **L:RZ-72b (B′)** — OUT-OF-Q5 (pending the wall; not counted). RZ §10.3, the paragraph after
Proposition 10.1, PDF p27 (folio 26); served PDF sha256 `2d5287e7…`. "What does not recur is
… the quadratic subfield ℚ(√5)": for every prime p ≠ 5, ℚ(ζp) contains no square root of 5.
L:RZ-72b (A) is `rz_71b_unique_quadratic_subfield`, stated once. -/
theorem rz_72b_sqrt_five_does_not_recur (p : ℕ) [Fact p.Prime] (hp5 : p ≠ 5)
    (K : Type*) [Field K] [CharZero K] [IsCyclotomicExtension {p} ℚ K] :
    ¬ ∃ x : K, x ^ 2 = 5 := by
  rintro ⟨y, hy⟩
  have hpp : p.Prime := Fact.out
  have : NumberField K := IsCyclotomicExtension.numberField {p} ℚ K
  -- 5 is not a rational square
  have h5 : ∀ q : ℚ, q ^ 2 ≠ 5 := by
    intro q hq
    have : IsSquare ((5 : ℕ) : ℚ) := ⟨q, by rw [← sq, hq]; norm_num⟩
    exact (Nat.prime_iff.mp (by norm_num : Nat.Prime 5)).not_isSquare
      (Rat.isSquare_natCast_iff.mp this)
  have hyQ : y ∉ (algebraMap ℚ K).range := by
    rintro ⟨q, hq⟩
    apply h5 q
    rw [eq_ratCast] at hq
    rw [← hq] at hy
    exact_mod_cast hy
  have hint : IsIntegral ℚ y := Algebra.IsIntegral.isIntegral y
  have hpos := minpoly.natDegree_pos hint
  have hne : (minpoly ℚ y).natDegree ≠ 1 := by
    rw [Ne, minpoly.natDegree_eq_one_iff]
    exact hyQ
  by_cases hp2 : p = 2
  · -- ℚ(ζ₂) = ℚ
    subst hp2
    have hK : Module.finrank ℚ K = 1 := by
      rw [IsCyclotomicExtension.Rat.finrank 2 K]
      rfl
    have := minpoly.natDegree_le (A := ℚ) y
    omega
  · obtain ⟨x, hx, hF⟩ := rz_71b_unique_quadratic_subfield p hp2 K
    have hfin : Module.finrank ℚ (IntermediateField.adjoin ℚ {y}) = 2 := by
      rw [IntermediateField.adjoin.finrank hint]
      have hle : (minpoly ℚ y).natDegree ≤ 2 := by
        have hP : (Polynomial.X ^ 2 - Polynomial.C (5 : ℚ) : Polynomial ℚ) ≠ 0 :=
          Polynomial.X_pow_sub_C_ne_zero (by norm_num) _
        have := minpoly.degree_le_of_ne_zero ℚ y hP (by simp [hy])
        rw [Polynomial.degree_X_pow_sub_C (by norm_num)] at this
        exact Polynomial.natDegree_le_of_degree_le this
      omega
    have hyx : y ∈ IntermediateField.adjoin ℚ {x} := by
      rw [← (hF _).mp hfin]
      exact IntermediateField.mem_adjoin_simple_self ℚ y
    have hxint : IsIntegral ℚ x := Algebra.IsIntegral.isIntegral x
    -- y = a + b x with a, b rational
    obtain ⟨a, b, hab⟩ : ∃ a b : ℚ, y = (a : K) + (b : K) * x := by
      have hmem : y ∈ Algebra.adjoin ℚ {x} := by
        rw [← IntermediateField.adjoin_simple_toSubalgebra_of_isAlgebraic hxint.isAlgebraic]
        exact hyx
      rw [Algebra.adjoin_singleton_eq_range_aeval] at hmem
      obtain ⟨P, hP⟩ := hmem
      let q : Polynomial ℚ :=
        Polynomial.X ^ 2 - Polynomial.C ((((-1 : ℤ) ^ ((p - 1) / 2)) * p : ℤ) : ℚ)
      have hq : q.Monic := Polynomial.monic_X_pow_sub_C _ (by norm_num)
      have hqx : Polynomial.aeval x q = 0 := by simp [q, hx]
      have hq1 : q ≠ 1 := by
        intro h
        have := congrArg Polynomial.natDegree h
        rw [Polynomial.natDegree_X_pow_sub_C, Polynomial.natDegree_one] at this
        norm_num at this
      have hdeg : (P %ₘ q).natDegree ≤ 1 := by
        have := Polynomial.natDegree_modByMonic_lt P hq hq1
        rw [Polynomial.natDegree_X_pow_sub_C] at this
        omega
      refine ⟨(P %ₘ q).coeff 0, (P %ₘ q).coeff 1, ?_⟩
      rw [← hP]
      change Polynomial.aeval x P = _
      rw [← Polynomial.aeval_modByMonic_eq_self_of_root hqx]
      nth_rewrite 1 [Polynomial.eq_X_add_C_of_natDegree_le_one hdeg]
      simp only [map_add, map_mul, Polynomial.aeval_C, Polynomial.aeval_X, eq_ratCast]
      ring
    -- p* is not a rational square
    have hd : ∀ q : ℚ, q ^ 2 ≠ (((-1 : ℤ) ^ ((p - 1) / 2) * p : ℤ) : ℚ) := by
      intro q hq
      rcases neg_one_pow_eq_or ℤ ((p - 1) / 2) with h | h <;>
        rw [h] at hq <;> push_cast at hq
      · have : IsSquare (p : ℚ) := ⟨q, by rw [← sq, hq, one_mul]⟩
        exact (Nat.prime_iff.mp hpp).not_isSquare (Rat.isSquare_natCast_iff.mp this)
      · have : (0 : ℚ) < p := by exact_mod_cast hpp.pos
        nlinarith [sq_nonneg q]
    subst hab
    have key : ((2 * a * b : ℚ) : K) * x =
        ((5 - a ^ 2 - b ^ 2 * (((-1 : ℤ) ^ ((p - 1) / 2) * p : ℤ) : ℚ) : ℚ) : K) := by
      push_cast at hx ⊢
      linear_combination hy - (b : K) ^ 2 * hx
    by_cases hab0 : a * b = 0
    · rcases mul_eq_zero.mp hab0 with ha | hb
      · -- y = b x, so b ^ 2 p* = 5
        subst ha
        have h2 : b ^ 2 * (((-1 : ℤ) ^ ((p - 1) / 2) * p : ℤ) : ℚ) = 5 := by
          have : ((b : K)) ^ 2 * x ^ 2 = 5 := by
            rw [← hy]; push_cast; ring
          rw [hx] at this
          exact_mod_cast this
        rcases neg_one_pow_eq_or ℤ ((p - 1) / 2) with h | h <;>
          rw [h] at h2 <;> push_cast at h2
        · -- 5 p would be a square
          have hsq : IsSquare ((5 * p : ℕ) : ℚ) :=
            ⟨b * p, by push_cast; linear_combination (p : ℚ) * h2.symm⟩
          obtain ⟨r, hr⟩ := Rat.isSquare_natCast_iff.mp hsq
          have h5r : 5 ∣ r * r := ⟨p, by rw [← hr]⟩
          have h5r' : 5 ∣ r := ((Nat.Prime.dvd_mul (by norm_num)).mp h5r).elim id id
          obtain ⟨s, rfl⟩ := h5r'
          have hps : p = 5 * (s * s) := by linarith
          have : 5 ∣ p := ⟨s * s, hps⟩
          exact hp5 ((Nat.prime_dvd_prime_iff_eq (by norm_num) hpp).mp this).symm
        · have : (0 : ℚ) < p := by exact_mod_cast hpp.pos
          nlinarith [sq_nonneg b]
      · -- y = a, so a ^ 2 = 5
        subst hb
        apply h5 a
        have : ((a : K)) ^ 2 = 5 := by rw [← hy]; push_cast; ring
        exact_mod_cast this
    · -- x would be rational
      have h2ab : (2 * a * b : ℚ) ≠ 0 := by
        intro h
        apply hab0
        linarith [h]
      have hx' : x = ((((5 - a ^ 2 - b ^ 2 * (((-1 : ℤ) ^ ((p - 1) / 2) * p : ℤ) : ℚ))
          / (2 * a * b) : ℚ)) : K) := by
        have h2ab' : ((2 * a * b : ℚ) : K) ≠ 0 := by exact_mod_cast h2ab
        rw [Rat.cast_div, ← key]
        field_simp
      apply hd (((5 - a ^ 2 - b ^ 2 * (((-1 : ℤ) ^ ((p - 1) / 2) * p : ℤ) : ℚ))
          / (2 * a * b) : ℚ))
      rw [hx'] at hx
      exact_mod_cast hx

/-! ## L:RZ-71b (B) — placed after L:RZ-72b: its proof uses `rz_72b_sqrt_five_does_not_recur` -/

open IntermediateField in
/-- **L:RZ-71b (B)** — OUT-OF-Q5 (pending the wall; not counted). RZ §10.3, Proposition 10.1,
leg 3, PDF p26 (folio 25); served PDF sha256 `2d5287e7…`. For every prime p, ℚ(ζp) has a
unique quadratic subfield and it is ℚ(√5) if and only if p = 5 — leg 3 singles out p = 5 on
its own. The "⇐" direction is L:RZ-68's content. -/
theorem rz_71b_leg3_selects_five (p : ℕ) [Fact p.Prime]
    (K : Type*) [Field K] [CharZero K] [IsCyclotomicExtension {p} ℚ K] :
    (∃ x : K, x ^ 2 = 5 ∧
      ∀ F : IntermediateField ℚ K, Module.finrank ℚ F = 2 ↔ F = ℚ⟮x⟯) ↔ p = 5 := by
  constructor
  · rintro ⟨x, hx, -⟩
    by_contra hp5
    exact rz_72b_sqrt_five_does_not_recur p hp5 K ⟨x, hx⟩
  · rintro rfl
    obtain ⟨x, hx, hF⟩ := rz_71b_unique_quadratic_subfield 5 (by norm_num) K
    refine ⟨x, ?_, hF⟩
    rw [hx]
    norm_num

end RiemannZeta.Cyclotomic
