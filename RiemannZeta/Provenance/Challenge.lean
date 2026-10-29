import Mathlib

/-!
# Unit U9 (`RiemannZeta/Provenance`) — statements

Statements of the rows of unit U9 (the EFFORT provenance cluster of §2.2–§2.4, with their echoes
in §7.2, §8.5, §9.1 and §9.5) of the paper *The Tetrahedral Structure of the Riemann Zeta
Function* (QRiemannian Research, April 2026, revised October 2026), served PDF sha256
`2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54` (prefix `2d5287e7`).
PDF page indices count the cover as p01. Each theorem states one row of the claim ledger, from
its spec `specs/<ROW>.md` (signed `V1-GREEN` / `V1-SPLIT-OK`); every proof here is `sorry`.
The proofs live in `RiemannZeta/Provenance/Solution.lean`. EFFORT lane, built 2026-10-28 by the
wall's word.

Rows, in plan order: L:RZ-14a, L:RZ-05, L:RZ-06b, L:RZ-09, L:RZ-13, L:RZ-14b (two theorems: the
covolume leg (i) and the arithmetic leg (ii-arith)). L:RZ-14b (ii-thm) — the orbifold
Gauss–Bonnet theorem (area = −2π·χ_orb for a finite-area hyperbolic 2-orbifold), applied to X(1)
with signature (0; 2, 3; 1) (genus 0, cone points of orders 2 and 3, one cusp) — is CITED, NOT
CHECKED, and carries no theorem.

Conventions across the unit: τ(γ) = inf_{z ∈ ℍ} d(z, γ·z) enters as a hypothesis in the form of
U4's `rz_63b_geometric`; hyperbolic is mathlib's `Matrix.IsHyperbolic` (`0 < discr`); the
hyperbolic measure on ℍ is mathlib's `volume` (dx dy / y²); K = ℚ(√5) is the intermediate field
`ℚ⟮√5⟯` of ℝ/ℚ; φ = `Real.goldenRatio`. Shared declarations restated byte-identically from their
home units (units restate, they do not import): `numberField_Q_sqrt5` and `RZ.phiSq` (U4,
`RiemannZeta/MatricesMobius/Challenge.lean`), `orbEulerChar` (U7,
`RiemannZeta/SmallArith/Challenge.lean`).
-/

open scoped MatrixGroups
open UpperHalfPlane

namespace RiemannZeta.Provenance

/-! ## Shared and local definitions -/

/-- F² = (2 1; 1 1) ∈ SL(2, ℤ), the printed systolic element (det 1 is L:RZ-02's). -/
def RZ.F2 : SL(2, ℤ) := ⟨!![2, 1; 1, 1], by norm_num [Matrix.det_fin_two_of]⟩

-- Restated byte-identically from U4 (`RiemannZeta/MatricesMobius/Challenge.lean`).
open IntermediateField in
/-- ℚ(√5) ⊂ ℝ is a number field: √5 is integral over ℚ (a root of X² − 5). The instance
L:RZ-64c's spec asks `Challenge.lean` to supply. -/
instance numberField_Q_sqrt5 : NumberField ℚ⟮(√5 : ℝ)⟯ where
  to_finiteDimensional := IntermediateField.adjoin.finiteDimensional
    (IsIntegral.of_pow (n := 2) (by norm_num)
      (by
        rw [Real.sq_sqrt (by norm_num)]
        simpa using isIntegral_algebraMap (R := ℚ) (A := ℝ) (x := 5)))

-- Restated byte-identically from U4 (`RiemannZeta/MatricesMobius/Challenge.lean`).
open IntermediateField NumberField in
/-- φ² as an element of the ring of integers 𝓞 of ℚ(√5) ⊂ ℝ: φ² = ((1 + √5)/2)² lies in ℚ⟮√5⟯,
and it is integral over ℤ (φ is a root of X² − X − 1). The element L:RZ-64c's spec asks
`Challenge.lean` to construct ("the systolic element's multiplier"), rather than take it as a
hypothesis. -/
noncomputable def RZ.phiSq : 𝓞 ℚ⟮(√5 : ℝ)⟯ :=
  ⟨⟨Real.goldenRatio ^ 2, pow_mem (div_mem (add_mem (one_mem _) (mem_adjoin_simple_self ℚ _))
      (by exact_mod_cast IntermediateField.natCast_mem ℚ⟮(√5 : ℝ)⟯ 2)) 2⟩,
    (isIntegral_algHom_iff ((ℚ⟮(√5 : ℝ)⟯).val.restrictScalars ℤ) Subtype.val_injective).mp
      (IsIntegral.pow ⟨Polynomial.X ^ 2 - Polynomial.X - 1, by monicity!,
        by simp [Real.goldenRatio_sq]⟩ 2)⟩

open IntermediateField NumberField in
/-- φ = (1 + √5)/2 as an element of 𝓞 ℚ(√5): it lies in ℚ⟮√5⟯ and is a root of X² − X − 1.
U4's construction of `RZ.phiSq` at exponent 1. -/
noncomputable def RZ.phi : 𝓞 ℚ⟮(√5 : ℝ)⟯ :=
  ⟨⟨Real.goldenRatio, div_mem (add_mem (one_mem _) (mem_adjoin_simple_self ℚ _))
      (by exact_mod_cast IntermediateField.natCast_mem ℚ⟮(√5 : ℝ)⟯ 2)⟩,
    (isIntegral_algHom_iff ((ℚ⟮(√5 : ℝ)⟯).val.restrictScalars ℤ) Subtype.val_injective).mp
      ⟨Polynomial.X ^ 2 - Polynomial.X - 1, by monicity!,
        by simp [Real.goldenRatio_sq]⟩⟩

open IntermediateField NumberField in
/-- φ as a unit of 𝓞 ℚ(√5), with inverse φ − 1 (φ·(φ − 1) = φ² − φ = 1). -/
noncomputable def RZ.phiUnit : (𝓞 ℚ⟮(√5 : ℝ)⟯)ˣ :=
  ⟨RZ.phi, RZ.phi - 1,
    by
      apply RingOfIntegers.coe_injective
      apply Subtype.val_injective
      change Real.goldenRatio * (Real.goldenRatio - 1) = 1
      linear_combination Real.goldenRatio_sq,
    by
      apply RingOfIntegers.coe_injective
      apply Subtype.val_injective
      change (Real.goldenRatio - 1) * Real.goldenRatio = 1
      linear_combination Real.goldenRatio_sq⟩

open scoped MatrixGroups in
/-- The modular group acting on ℍ faithfully: the image of SL(2, ℤ) in PGL(2, ℝ) (≅ PSL(2, ℤ)). -/
noncomputable def RZ.modularPGL : Subgroup PGL(2, ℝ) :=
  (Matrix.ProjGenLinGroup.mk.comp (Matrix.SpecialLinearGroup.mapGL ℝ :
    SL(2, ℤ) →* GL (Fin 2) ℝ)).range

-- Restated byte-identically from U7 (`RiemannZeta/SmallArith/Challenge.lean`).
/-- The orbifold Euler characteristic of a 2-orbifold of genus `g` with cone points of orders
`cones` and `n` cusps: 2 − 2g − Σ (1 − 1/m) − n (standard convention; RZ §7.2 uses it without
the formula). -/
def orbEulerChar (g : ℕ) (cones : List ℕ) (n : ℕ) : ℚ :=
  2 - 2 * g - (cones.map fun m : ℕ => 1 - 1 / (m : ℚ)).sum - n

/-! ## L:RZ-14a -/

/-- **L:RZ-14a** — RZ §2.4, (2.8): the hyperbolic area (dx dy / y²) of the standard fundamental
domain 𝒟 = {‖z‖ ≥ 1, |re z| ≤ 1/2} of SL(2, ℤ) is π/3. That this is vol(X(1)) is L:RZ-14b.

Served locus: §2.4 "π from the area", display (2.8) and its introducing sentence, PDF p08
(printed folio 7). PDF sha256 prefix `2d5287e7`. -/
theorem rz_14a_area_fd :
    (MeasureTheory.volume : MeasureTheory.Measure ℍ) ModularGroup.fd
      = ENNReal.ofReal (Real.pi / 3) := by
  sorry

/-! ## L:RZ-05 -/

/-- **L:RZ-05** — RZ §2.2, (2.2); §7.2: the translation length τ(γ) = inf_{z ∈ ℍ} d(z, γ·z) of a
hyperbolic γ ∈ SL(2, ℝ) with real eigenvalue λ, |λ| > 1, is ℓ = 2 log |λ| (= 2 log λ for λ > 1,
the paper's case). Carried in substance by `rz_63b_geometric`'s first conjunct (U4).

Served locus: §2.2 "φ from the systole", display (2.2) and its introducing sentence, PDF p07
(printed folio 6); §7.2 "Verification of the mapping", paragraph "Hyperbolic → Spiral",
sentence 2, PDF p18 (printed folio 17). PDF sha256 prefix `2d5287e7`. -/
theorem rz_05_translation_length (τ : SL(2, ℝ) → ℝ)
    (hτ : ∀ γ, τ γ = ⨅ z : ℍ, dist z (γ • z))
    (γ : SL(2, ℝ)) (hγ : (γ : Matrix (Fin 2) (Fin 2) ℝ).IsHyperbolic)
    (l : ℝ) (hl : l ∈ spectrum ℝ (γ : Matrix (Fin 2) (Fin 2) ℝ)) (h1 : 1 < |l|) :
    τ γ = 2 * Real.log |l| := by
  sorry

/-! ## L:RZ-06b -/

/-- **L:RZ-06b** — RZ §2.2, (2.3); §8.5: with τ the translation length, τ(F²) = 2 log(φ²) ("with
λ = φ²"), and F² realises the systole: τ(F²) is the least τ over hyperbolic elements of SL(2, ℤ).
Value and attainment at trace 3 are carried by `rz_63b_geometric` (U4); 2 log(φ²) = 4 log φ ≈ 1.9248
by L:RZ-06a.

Served locus: §2.2, display (2.3) with its introducing clause and the sentence after it, PDF p07
(printed folio 6); §8.5 "The Fibonacci ground state", the sentence after display (8.9), PDF p22
(printed folio 21). PDF sha256 prefix `2d5287e7`. -/
theorem rz_06b_systole_at_F2 (τ : SL(2, ℝ) → ℝ)
    (hτ : ∀ γ, τ γ = ⨅ z : ℍ, dist z (γ • z)) :
    τ (Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ) RZ.F2)
        = 2 * Real.log (Real.goldenRatio ^ 2) ∧
    IsLeast
      (Set.range fun γ : {γ : SL(2, ℤ) // (γ : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic} =>
        τ (Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ) γ.1))
      (τ (Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ) RZ.F2)) := by
  sorry

/-! ## L:RZ-09 -/

open IntermediateField NumberField in
/-- **L:RZ-09** — RZ §2.3; §9.1: K = ℚ(√5) has 𝓞_K = ℤ[φ], d_K = 5, h_K = 1, fundamental unit φ
(φ > 1 and (𝓞_K)ˣ = {±φⁿ}), and N(φ) = −1. Clauses (a), (b) carried in substance by
`rz_64c_conductor_one` (U4).

Served locus: §2.3 "√5 from the discriminant", first sentence, PDF p07 (printed folio 6); §9.1,
the sentence after display (9.3), PDF p23 (printed folio 22). PDF sha256 prefix `2d5287e7`. -/
theorem rz_09_Q_sqrt5_invariants :
    -- (a) the ring of integers is ℤ[φ]
    Algebra.adjoin ℤ {RZ.phi} = ⊤ ∧
    -- (b) discriminant 5
    NumberField.discr ℚ⟮(√5 : ℝ)⟯ = 5 ∧
    -- (c) class number 1
    NumberField.classNumber ℚ⟮(√5 : ℝ)⟯ = 1 ∧
    -- (d) fundamental unit φ
    ((((RZ.phiUnit : 𝓞 ℚ⟮(√5 : ℝ)⟯) : ℚ⟮(√5 : ℝ)⟯) : ℝ) = Real.goldenRatio ∧
      1 < Real.goldenRatio ∧
      ∀ u : (𝓞 ℚ⟮(√5 : ℝ)⟯)ˣ, ∃ n : ℤ, u = RZ.phiUnit ^ n ∨ u = -(RZ.phiUnit ^ n)) ∧
    -- (e) norm −1
    Algebra.norm ℚ ((RZ.phi : ℚ⟮(√5 : ℝ)⟯)) = -1 := by
  sorry

/-! ## L:RZ-13 -/

open IntermediateField NumberField in
/-- **L:RZ-13** — RZ §2.3; §9.5: d = 5 is the minimal real-quadratic discriminant — every real
quadratic field has discriminant ≥ 5, and ℚ(√5) is real quadratic of discriminant 5. The
integer form (least positive fundamental discriminant) is `ms_13_smallest_fundDisc` (U8).

Served locus: §2.3, the sentence after display (2.7), PDF p08 (printed folio 7); §9.5, the
sentence after (9.9), PDF p25 (printed folio 24). PDF sha256 prefix `2d5287e7`. -/
theorem rz_13_min_real_quadratic_discr.{u} :
    (∀ (K : Type u) [Field K] [NumberField K] [IsTotallyReal K],
        Module.finrank ℚ K = 2 → 5 ≤ NumberField.discr K) ∧
    IsTotallyReal ℚ⟮(√5 : ℝ)⟯ ∧ Module.finrank ℚ ℚ⟮(√5 : ℝ)⟯ = 2 ∧
    NumberField.discr ℚ⟮(√5 : ℝ)⟯ = 5 := by
  sorry

/-! ## L:RZ-14b (legs (i) and (ii-arith); (ii-thm) CITED, NOT CHECKED) -/

/-- **L:RZ-14b (i)** — RZ §2.4, (2.8): the standard domain 𝒟 is a fundamental domain for the
modular group acting on ℍ (as its image in PGL(2, ℝ), so that −1 acts as 1), and vol(X(1)) — the
covolume of that action for the measure dx dy / y² — is π/3.

Served locus: §2.4 "π from the area", displays (2.8)–(2.9) and the clause between them, PDF p08
(printed folio 7). PDF sha256 prefix `2d5287e7`. -/
theorem rz_14b_vol_X1 :
    MeasureTheory.IsFundamentalDomain RZ.modularPGL ModularGroup.fd ∧
    MeasureTheory.covolume RZ.modularPGL ℍ = ENNReal.ofReal (Real.pi / 3) := by
  sorry

/-- **L:RZ-14b (ii), arithmetic leg** — "the Gauss–Bonnet value for the (2, 3, ∞) orbifold":
χ(2, 3, ∞) = −1/6 and −2π·χ = π/3. The orbifold Gauss–Bonnet theorem (area = −2π·χ), applied to
X(1) with signature (0; 2, 3; 1), is CITED, NOT CHECKED.

Served locus: §2.4 "π from the area", the clause after display (2.8), PDF p08 (printed folio 7).
PDF sha256 prefix `2d5287e7`. -/
theorem rz_14b_gaussBonnet_value :
    orbEulerChar 0 [2, 3] 1 = -1 / 6 ∧
    -2 * Real.pi * (orbEulerChar 0 [2, 3] 1 : ℝ) = Real.pi / 3 := by
  sorry

end RiemannZeta.Provenance
