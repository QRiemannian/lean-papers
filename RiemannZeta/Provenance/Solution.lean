import Mathlib

/-!
# Unit U9 (`RiemannZeta/Provenance`) — proofs

Proofs of the statements of `RiemannZeta/Provenance/Challenge.lean` (unit U9, the EFFORT
provenance cluster of the paper *The Tetrahedral Structure of the Riemann Zeta Function*, served
PDF sha256 prefix `2d5287e7`). This module does not import the Challenge module nor any other
unit: it imports Mathlib, opens the same namespace, restates every non-theorem declaration of the
Challenge byte-identically and in the same order, and proves each theorem under the identical name
and statement text. Proof steps taken from U4 (`RiemannZeta/MatricesMobius/Solution.lean`) are
copied in place and marked where they occur.

Rows: L:RZ-14a, L:RZ-05, L:RZ-06b, L:RZ-09, L:RZ-13, L:RZ-14b (legs (i) and (ii-arith); the
orbifold Gauss–Bonnet theorem, leg (ii-thm), is CITED, NOT CHECKED, and carries no theorem).
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
  -- the outer integral: ∫_{−1/2}^{1/2} (1 − x²)^{−1/2} dx = 2 arcsin(1/2) = π/3
  have hI : ∫ x in (-1/2 : ℝ)..(1/2), 1 / √(1 - x ^ 2) = Real.pi / 3 := by
    have hb : ∀ x ∈ Set.uIcc (-1/2 : ℝ) (1/2), 0 < 1 - x ^ 2 := by
      intro x hx
      rw [Set.uIcc_of_le (by norm_num)] at hx
      nlinarith [hx.1, hx.2]
    rw [intervalIntegral.integral_eq_sub_of_hasDerivAt (f := Real.arcsin)]
    · have h6 : Real.arcsin (1 / 2) = Real.pi / 6 := by
        rw [← Real.sin_pi_div_six, Real.arcsin_sin] <;> linarith [Real.pi_pos]
      rw [show (-1 / 2 : ℝ) = -(1 / 2) by norm_num, Real.arcsin_neg, h6]
      ring
    · intro x hx
      have h := hb x hx
      apply Real.hasDerivAt_arcsin <;> intro hx' <;> rw [hx'] at h <;> norm_num at h
    · apply ContinuousOn.intervalIntegrable
      apply ContinuousOn.div continuousOn_const (by fun_prop)
      intro x hx
      exact (Real.sqrt_pos.mpr (hb x hx)).ne'
  -- the inner integral: ∫_a^∞ y⁻² dy = 1/a
  have hJ : ∀ a : ℝ, 0 < a →
      ∫⁻ y in Set.Ici a, ENNReal.ofReal (1 / y ^ 2) = ENNReal.ofReal (1 / a) := by
    intro a ha
    rw [MeasureTheory.setLIntegral_congr MeasureTheory.Ioi_ae_eq_Ici.symm]
    have hcongr : Set.EqOn (fun y : ℝ => 1 / y ^ 2) (fun y : ℝ => y ^ (-2 : ℝ)) (Set.Ioi a) := by
      intro y hy
      have hy0 : 0 < y := ha.trans hy
      simp only
      rw [Real.rpow_neg hy0.le, one_div]
      norm_cast
    have hint : MeasureTheory.IntegrableOn (fun y : ℝ => 1 / y ^ 2) (Set.Ioi a) :=
      (integrableOn_Ioi_rpow_of_lt (by norm_num : (-2 : ℝ) < -1) ha).congr_fun hcongr.symm
        measurableSet_Ioi
    rw [← MeasureTheory.ofReal_integral_eq_lintegral_ofReal hint]
    · rw [MeasureTheory.setIntegral_congr_fun measurableSet_Ioi hcongr,
        integral_Ioi_rpow_of_lt (by norm_num) ha]
      congr 1
      rw [show (-2 : ℝ) + 1 = -1 by norm_num, Real.rpow_neg_one]
      field_simp
    · filter_upwards with y
      positivity
  -- the area as a lintegral over 𝒟 ⊂ ℂ ≅ ℝ², then Tonelli
  rw [UpperHalfPlane.volume_eq_lintegral,
    ← MeasureTheory.lintegral_indicator ModularGroup.isClosed_coe_fd.measurableSet,
    ModularGroup.coe_fd,
    ← (MeasureTheory.MeasurePreserving.symm Complex.measurableEquivRealProd
      Complex.volume_preserving_equiv_real_prod).lintegral_comp_emb
      Complex.measurableEquivRealProd.symm.measurableEmbedding,
    MeasureTheory.Measure.volume_eq_prod, MeasureTheory.lintegral_prod]
  swap
  · have hS : MeasurableSet {z : ℂ | 0 < z.im ∧ 1 ≤ ‖z‖ ∧ |z.re| ≤ 1 / 2} := by
      rw [← ModularGroup.coe_fd]
      exact ModularGroup.isClosed_coe_fd.measurableSet
    exact ((Measurable.indicator (by fun_prop) hS).comp
      Complex.measurableEquivRealProd.symm.measurable).aemeasurable
  -- for |x| ≤ 1/2 the slice is y ≥ √(1 − x²), of weight 1/√(1 − x²); otherwise empty
  have hinner : ∀ x : ℝ,
      ∫⁻ y, {z : ℂ | 0 < z.im ∧ 1 ≤ ‖z‖ ∧ |z.re| ≤ 1 / 2}.indicator
          (fun z : ℂ => (((1 / ‖z.im‖₊) ^ 2 : NNReal) : ENNReal))
          (Complex.measurableEquivRealProd.symm (x, y))
        = (Set.Icc (-1/2 : ℝ) (1/2)).indicator (fun x => ENNReal.ofReal (1 / √(1 - x ^ 2))) x := by
    intro x
    by_cases hx : |x| ≤ 1 / 2
    · have hx' : x ∈ Set.Icc (-1/2 : ℝ) (1/2) := by
        rw [abs_le] at hx
        constructor <;> linarith [hx.1, hx.2]
      rw [Set.indicator_of_mem hx']
      have ha : 0 < 1 - x ^ 2 := by nlinarith [abs_le.mp hx]
      have hpt : ∀ y : ℝ, {z : ℂ | 0 < z.im ∧ 1 ≤ ‖z‖ ∧ |z.re| ≤ 1 / 2}.indicator
          (fun z : ℂ => (((1 / ‖z.im‖₊) ^ 2 : NNReal) : ENNReal))
          (Complex.measurableEquivRealProd.symm (x, y))
          = (Set.Ici (√(1 - x ^ 2))).indicator (fun y => ENNReal.ofReal (1 / y ^ 2)) y := by
        intro y
        rw [Complex.measurableEquivRealProd_symm_apply]
        have hnorm : ‖(⟨x, y⟩ : ℂ)‖ = √(x ^ 2 + y ^ 2) := Complex.norm_eq_sqrt_sq_add_sq _
        have hs := Real.sq_sqrt ha.le
        have hs0 := Real.sqrt_pos.mpr ha
        by_cases hy : √(1 - x ^ 2) ≤ y
        · have hy0 : 0 < y := lt_of_lt_of_le hs0 hy
          have h1 : 1 ≤ ‖(⟨x, y⟩ : ℂ)‖ := by
            rw [hnorm, Real.one_le_sqrt]
            nlinarith
          rw [Set.indicator_of_mem (show (⟨x, y⟩ : ℂ) ∈ {z : ℂ | 0 < z.im ∧ 1 ≤ ‖z‖ ∧
            |z.re| ≤ 1 / 2} from ⟨hy0, h1, hx⟩), Set.indicator_of_mem (Set.mem_Ici.mpr hy),
            ← ENNReal.ofReal_coe_nnreal]
          congr 1
          push_cast
          rw [Real.norm_eq_abs, abs_of_pos hy0, div_pow, one_pow]
        · have hnot : (⟨x, y⟩ : ℂ) ∉ {z : ℂ | 0 < z.im ∧ 1 ≤ ‖z‖ ∧ |z.re| ≤ 1 / 2} := by
            rintro ⟨hy0, h1, -⟩
            apply hy
            rw [hnorm, Real.one_le_sqrt] at h1
            have hy0' : 0 ≤ y := le_of_lt hy0
            calc √(1 - x ^ 2) ≤ √(y ^ 2) := Real.sqrt_le_sqrt (by linarith)
              _ = y := Real.sqrt_sq hy0'
          rw [Set.indicator_of_notMem hnot,
            Set.indicator_of_notMem (fun h => hy (Set.mem_Ici.mp h))]
      rw [MeasureTheory.lintegral_congr hpt, MeasureTheory.lintegral_indicator measurableSet_Ici,
        hJ _ (Real.sqrt_pos.mpr ha)]
    · rw [Set.indicator_of_notMem (by rintro ⟨h1, h2⟩; exact hx (abs_le.mpr ⟨by linarith, h2⟩))]
      have h0 : ∀ y : ℝ, {z : ℂ | 0 < z.im ∧ 1 ≤ ‖z‖ ∧ |z.re| ≤ 1 / 2}.indicator
          (fun z : ℂ => (((1 / ‖z.im‖₊) ^ 2 : NNReal) : ENNReal))
          (Complex.measurableEquivRealProd.symm (x, y)) = 0 := by
        intro y
        rw [Complex.measurableEquivRealProd_symm_apply]
        exact Set.indicator_of_notMem (by rintro ⟨-, -, h⟩; exact hx h) _
      rw [MeasureTheory.lintegral_congr h0]
      simp
  rw [MeasureTheory.lintegral_congr hinner, MeasureTheory.lintegral_indicator measurableSet_Icc,
    ← MeasureTheory.ofReal_integral_eq_lintegral_ofReal, MeasureTheory.integral_Icc_eq_integral_Ioc,
    ← intervalIntegral.integral_of_le (by norm_num), hI]
  · exact (ContinuousOn.integrableOn_Icc (ContinuousOn.div continuousOn_const (by fun_prop)
      (fun x hx => (Real.sqrt_pos.mpr (by nlinarith [hx.1, hx.2])).ne')))
  · filter_upwards with x
    positivity

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
  -- Steps `hcosh` and `hlen` copied from U4's proof of `rz_63b_geometric`
  -- (`RiemannZeta/MatricesMobius/Solution.lean`, lines 1386–1512); U9 restates, it does not import.
  have hcosh : ∀ (γ : SL(2, ℝ)) (z : ℍ),
      Real.cosh (dist z (γ • z)) = 1 +
        (((γ : Matrix (Fin 2) (Fin 2) ℝ) 1 0 * (z.re ^ 2 + z.im ^ 2)
            + ((γ : Matrix (Fin 2) (Fin 2) ℝ) 1 1 - (γ : Matrix (Fin 2) (Fin 2) ℝ) 0 0) * z.re
            - (γ : Matrix (Fin 2) (Fin 2) ℝ) 0 1) ^ 2
          + ((γ : Matrix (Fin 2) (Fin 2) ℝ).trace ^ 2 - 4) * z.im ^ 2) / (2 * z.im ^ 2) := by
    intro γ z
    have hdet : (γ : Matrix (Fin 2) (Fin 2) ℝ).det = 1 := γ.2
    rw [Matrix.det_fin_two] at hdet
    rw [Matrix.trace_fin_two]
    set a := (γ : Matrix (Fin 2) (Fin 2) ℝ) 0 0 with ha
    set b := (γ : Matrix (Fin 2) (Fin 2) ℝ) 0 1 with hb
    set c := (γ : Matrix (Fin 2) (Fin 2) ℝ) 1 0 with hc
    set d := (γ : Matrix (Fin 2) (Fin 2) ℝ) 1 1 with hd
    set x := z.re with hx
    set y := z.im with hy
    have hy0 : 0 < y := z.im_pos
    have hzc : (z : ℂ) = ⟨x, y⟩ := Complex.ext (UpperHalfPlane.coe_re z) (UpperHalfPlane.coe_im z)
    have hgz : ((γ • z : ℍ) : ℂ) = ((a : ℂ) * z + b) / ((c : ℂ) * z + d) := by
      rw [UpperHalfPlane.coe_specialLinearGroup_apply]
      rfl
    have hden : (c : ℂ) * z + d ≠ 0 := by
      have h := UpperHalfPlane.denom_ne_zero (Matrix.SpecialLinearGroup.mapGL ℝ γ) z
      simpa [UpperHalfPlane.denom] using h
    have hN : Complex.normSq ((c : ℂ) * z + d) = (c * x + d) ^ 2 + (c * y) ^ 2 := by
      rw [Complex.normSq_apply, hzc]
      simp only [Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im,
        Complex.ofReal_re, Complex.ofReal_im]
      ring
    have hNpos : 0 < (c * x + d) ^ 2 + (c * y) ^ 2 := by
      rw [← hN]
      exact Complex.normSq_pos.mpr hden
    have him : (γ • z).im = y / ((c * x + d) ^ 2 + (c * y) ^ 2) := by
      rw [← UpperHalfPlane.coe_im, hgz, Complex.div_im, hN, hzc]
      simp only [Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im,
        Complex.ofReal_re, Complex.ofReal_im]
      rw [div_sub_div_same, div_left_inj' hNpos.ne']
      linear_combination y * hdet
    have hdist : dist (z : ℂ) ((γ • z : ℍ) : ℂ) ^ 2
        = ((c * (x ^ 2 + y ^ 2) + (d - a) * x - b) ^ 2 + ((a + d) ^ 2 - 4) * y ^ 2)
          / ((c * x + d) ^ 2 + (c * y) ^ 2) := by
      rw [Complex.dist_eq, Complex.sq_norm, hgz, sub_div' hden, Complex.normSq_div, hN]
      congr 1
      rw [Complex.normSq_apply, hzc]
      simp only [Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im,
        Complex.sub_re, Complex.sub_im, Complex.ofReal_re, Complex.ofReal_im]
      linear_combination (-4 * y ^ 2) * hdet
    have hN' : (c * x + d) ^ 2 + c ^ 2 * y ^ 2 ≠ 0 := by rw [← mul_pow]; exact hNpos.ne'
    rw [UpperHalfPlane.cosh_dist, hdist, him, ← hy]
    field_simp
  have hlen : ∀ γ : SL(2, ℝ), (γ : Matrix (Fin 2) (Fin 2) ℝ).IsHyperbolic →
      τ γ = 2 * Real.arsinh (√((γ : Matrix (Fin 2) (Fin 2) ℝ).trace ^ 2 - 4) / 2) := by
    intro γ hγ
    have hdet : (γ : Matrix (Fin 2) (Fin 2) ℝ).det = 1 := γ.2
    have hcz := hcosh γ
    rw [Matrix.IsHyperbolic, Matrix.discr_fin_two, hdet, Matrix.trace_fin_two] at hγ
    rw [Matrix.det_fin_two] at hdet
    rw [Matrix.trace_fin_two] at hcz ⊢
    generalize (γ : Matrix (Fin 2) (Fin 2) ℝ) 0 0 = a at hγ hdet hcz ⊢
    generalize (γ : Matrix (Fin 2) (Fin 2) ℝ) 0 1 = b at hγ hdet hcz ⊢
    generalize (γ : Matrix (Fin 2) (Fin 2) ℝ) 1 0 = c at hγ hdet hcz ⊢
    generalize (γ : Matrix (Fin 2) (Fin 2) ℝ) 1 1 = d at hγ hdet hcz ⊢
    have hΔ : 0 < (a + d) ^ 2 - 4 := by linarith
    have hℓ0 : 0 ≤ 2 * Real.arsinh (√((a + d) ^ 2 - 4) / 2) :=
      mul_nonneg zero_le_two (Real.arsinh_nonneg_iff.mpr (by positivity))
    have hcoshℓ : Real.cosh (2 * Real.arsinh (√((a + d) ^ 2 - 4) / 2))
        = 1 + ((a + d) ^ 2 - 4) / 2 := by
      rw [Real.cosh_two_mul, Real.cosh_sq, Real.sinh_arsinh, div_pow, Real.sq_sqrt hΔ.le]
      ring
    have hge : ∀ z : ℍ, 2 * Real.arsinh (√((a + d) ^ 2 - 4) / 2) ≤ dist z (γ • z) := by
      intro z
      have hy := z.im_pos
      have h : Real.cosh (2 * Real.arsinh (√((a + d) ^ 2 - 4) / 2))
          ≤ Real.cosh (dist z (γ • z)) := by
        rw [hcz z, hcoshℓ]
        have hsplit : ((c * (z.re ^ 2 + z.im ^ 2) + (d - a) * z.re - b) ^ 2
            + ((a + d) ^ 2 - 4) * z.im ^ 2) / (2 * z.im ^ 2)
            = (c * (z.re ^ 2 + z.im ^ 2) + (d - a) * z.re - b) ^ 2 / (2 * z.im ^ 2)
              + ((a + d) ^ 2 - 4) / 2 := by
          field_simp
        rw [hsplit]
        have : 0 ≤ (c * (z.re ^ 2 + z.im ^ 2) + (d - a) * z.re - b) ^ 2 / (2 * z.im ^ 2) := by
          positivity
        linarith
      rw [Real.cosh_le_cosh, abs_of_nonneg hℓ0, abs_of_nonneg dist_nonneg] at h
      exact h
    have heq : ∀ z : ℍ, c * (z.re ^ 2 + z.im ^ 2) + (d - a) * z.re - b = 0 →
        dist z (γ • z) = 2 * Real.arsinh (√((a + d) ^ 2 - 4) / 2) := by
      intro z hS
      have hy := z.im_pos
      have h : Real.cosh (dist z (γ • z))
          = Real.cosh (2 * Real.arsinh (√((a + d) ^ 2 - 4) / 2)) := by
        rw [hcz z, hS, hcoshℓ]
        field_simp
        ring
      apply le_antisymm
      · have h' := h.le
        rw [Real.cosh_le_cosh, abs_of_nonneg hℓ0, abs_of_nonneg dist_nonneg] at h'
        exact h'
      · exact hge z
    obtain ⟨z0, hz0⟩ : ∃ z0 : ℍ, c * (z0.re ^ 2 + z0.im ^ 2) + (d - a) * z0.re - b = 0 := by
      by_cases hc : c = 0
      · have had : a * d = 1 := by rw [hc] at hdet; linarith
        have hne : d - a ≠ 0 := by
          intro h
          have hda : d = a := by linarith
          rw [hda] at had hΔ
          nlinarith
        refine ⟨⟨⟨b / (d - a), 1⟩, one_pos⟩, ?_⟩
        change c * ((b / (d - a)) ^ 2 + 1 ^ 2) + (d - a) * (b / (d - a)) - b = 0
        rw [hc]
        field_simp
        ring
      · have hy : 0 < √((a + d) ^ 2 - 4) / (2 * |c|) :=
          div_pos (Real.sqrt_pos.mpr hΔ) (mul_pos two_pos (abs_pos.mpr hc))
        refine ⟨⟨⟨(a - d) / (2 * c), √((a + d) ^ 2 - 4) / (2 * |c|)⟩, hy⟩, ?_⟩
        change c * (((a - d) / (2 * c)) ^ 2 + (√((a + d) ^ 2 - 4) / (2 * |c|)) ^ 2)
          + (d - a) * ((a - d) / (2 * c)) - b = 0
        rw [div_pow (√((a + d) ^ 2 - 4)) (2 * |c|) 2, Real.sq_sqrt hΔ.le, mul_pow, sq_abs]
        have : c * (((a - d) / (2 * c)) ^ 2 + ((a + d) ^ 2 - 4) / (2 ^ 2 * c ^ 2))
            + (d - a) * ((a - d) / (2 * c)) - b = (a * d - b * c - 1) / c := by
          field_simp
          ring
        rw [this, hdet, sub_self, zero_div]
    rw [hτ]
    exact le_antisymm ((ciInf_le ⟨0, by rintro _ ⟨z, rfl⟩; exact dist_nonneg⟩ z0).trans
      (heq z0 hz0).le) (le_ciInf hge)
  rw [hlen γ hγ]
  have hdet : (γ : Matrix (Fin 2) (Fin 2) ℝ).det = 1 := γ.2
  rw [Matrix.mem_spectrum_iff_isRoot_charpoly, Matrix.charpoly_fin_two, hdet] at hl
  simp only [Polynomial.IsRoot, Polynomial.eval_add, Polynomial.eval_sub, Polynomial.eval_pow,
    Polynomial.eval_X, Polynomial.eval_mul, Polynomial.eval_C] at hl
  set t := (γ : Matrix (Fin 2) (Fin 2) ℝ).trace with ht
  have hl0 : 0 < |l| := by linarith
  have hlne : l ≠ 0 := abs_pos.mp hl0
  have htl : t = l + l⁻¹ := by
    field_simp
    linear_combination -hl
  have hinv : |l|⁻¹ < 1 := inv_lt_one_of_one_lt₀ h1
  have hsq : t ^ 2 - 4 = (|l| - |l|⁻¹) ^ 2 := by
    have e1 : |l| ^ 2 = l ^ 2 := sq_abs l
    have e2 : |l|⁻¹ ^ 2 = l⁻¹ ^ 2 := by rw [← abs_inv, sq_abs]
    have e3 : |l| * |l|⁻¹ = 1 := mul_inv_cancel₀ hl0.ne'
    have e4 : l * l⁻¹ = 1 := mul_inv_cancel₀ hlne
    rw [htl]
    linear_combination -e1 - e2 + 2 * e4 + 2 * e3
  rw [hsq, Real.sqrt_sq (by linarith), ← Real.sinh_log hl0, Real.arsinh_sinh]

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
  -- Steps `hcosh` … `hlower` copied from U4's proof of `rz_63b_geometric`
  -- (`RiemannZeta/MatricesMobius/Solution.lean`, lines 1386–1573); U9 restates, it does not import.
  have hcosh : ∀ (γ : SL(2, ℝ)) (z : ℍ),
      Real.cosh (dist z (γ • z)) = 1 +
        (((γ : Matrix (Fin 2) (Fin 2) ℝ) 1 0 * (z.re ^ 2 + z.im ^ 2)
            + ((γ : Matrix (Fin 2) (Fin 2) ℝ) 1 1 - (γ : Matrix (Fin 2) (Fin 2) ℝ) 0 0) * z.re
            - (γ : Matrix (Fin 2) (Fin 2) ℝ) 0 1) ^ 2
          + ((γ : Matrix (Fin 2) (Fin 2) ℝ).trace ^ 2 - 4) * z.im ^ 2) / (2 * z.im ^ 2) := by
    intro γ z
    have hdet : (γ : Matrix (Fin 2) (Fin 2) ℝ).det = 1 := γ.2
    rw [Matrix.det_fin_two] at hdet
    rw [Matrix.trace_fin_two]
    set a := (γ : Matrix (Fin 2) (Fin 2) ℝ) 0 0 with ha
    set b := (γ : Matrix (Fin 2) (Fin 2) ℝ) 0 1 with hb
    set c := (γ : Matrix (Fin 2) (Fin 2) ℝ) 1 0 with hc
    set d := (γ : Matrix (Fin 2) (Fin 2) ℝ) 1 1 with hd
    set x := z.re with hx
    set y := z.im with hy
    have hy0 : 0 < y := z.im_pos
    have hzc : (z : ℂ) = ⟨x, y⟩ := Complex.ext (UpperHalfPlane.coe_re z) (UpperHalfPlane.coe_im z)
    have hgz : ((γ • z : ℍ) : ℂ) = ((a : ℂ) * z + b) / ((c : ℂ) * z + d) := by
      rw [UpperHalfPlane.coe_specialLinearGroup_apply]
      rfl
    have hden : (c : ℂ) * z + d ≠ 0 := by
      have h := UpperHalfPlane.denom_ne_zero (Matrix.SpecialLinearGroup.mapGL ℝ γ) z
      simpa [UpperHalfPlane.denom] using h
    have hN : Complex.normSq ((c : ℂ) * z + d) = (c * x + d) ^ 2 + (c * y) ^ 2 := by
      rw [Complex.normSq_apply, hzc]
      simp only [Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im,
        Complex.ofReal_re, Complex.ofReal_im]
      ring
    have hNpos : 0 < (c * x + d) ^ 2 + (c * y) ^ 2 := by
      rw [← hN]
      exact Complex.normSq_pos.mpr hden
    have him : (γ • z).im = y / ((c * x + d) ^ 2 + (c * y) ^ 2) := by
      rw [← UpperHalfPlane.coe_im, hgz, Complex.div_im, hN, hzc]
      simp only [Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im,
        Complex.ofReal_re, Complex.ofReal_im]
      rw [div_sub_div_same, div_left_inj' hNpos.ne']
      linear_combination y * hdet
    have hdist : dist (z : ℂ) ((γ • z : ℍ) : ℂ) ^ 2
        = ((c * (x ^ 2 + y ^ 2) + (d - a) * x - b) ^ 2 + ((a + d) ^ 2 - 4) * y ^ 2)
          / ((c * x + d) ^ 2 + (c * y) ^ 2) := by
      rw [Complex.dist_eq, Complex.sq_norm, hgz, sub_div' hden, Complex.normSq_div, hN]
      congr 1
      rw [Complex.normSq_apply, hzc]
      simp only [Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im,
        Complex.sub_re, Complex.sub_im, Complex.ofReal_re, Complex.ofReal_im]
      linear_combination (-4 * y ^ 2) * hdet
    have hN' : (c * x + d) ^ 2 + c ^ 2 * y ^ 2 ≠ 0 := by rw [← mul_pow]; exact hNpos.ne'
    rw [UpperHalfPlane.cosh_dist, hdist, him, ← hy]
    field_simp
  have hlen : ∀ γ : SL(2, ℝ), (γ : Matrix (Fin 2) (Fin 2) ℝ).IsHyperbolic →
      τ γ = 2 * Real.arsinh (√((γ : Matrix (Fin 2) (Fin 2) ℝ).trace ^ 2 - 4) / 2) := by
    intro γ hγ
    have hdet : (γ : Matrix (Fin 2) (Fin 2) ℝ).det = 1 := γ.2
    have hcz := hcosh γ
    rw [Matrix.IsHyperbolic, Matrix.discr_fin_two, hdet, Matrix.trace_fin_two] at hγ
    rw [Matrix.det_fin_two] at hdet
    rw [Matrix.trace_fin_two] at hcz ⊢
    generalize (γ : Matrix (Fin 2) (Fin 2) ℝ) 0 0 = a at hγ hdet hcz ⊢
    generalize (γ : Matrix (Fin 2) (Fin 2) ℝ) 0 1 = b at hγ hdet hcz ⊢
    generalize (γ : Matrix (Fin 2) (Fin 2) ℝ) 1 0 = c at hγ hdet hcz ⊢
    generalize (γ : Matrix (Fin 2) (Fin 2) ℝ) 1 1 = d at hγ hdet hcz ⊢
    have hΔ : 0 < (a + d) ^ 2 - 4 := by linarith
    have hℓ0 : 0 ≤ 2 * Real.arsinh (√((a + d) ^ 2 - 4) / 2) :=
      mul_nonneg zero_le_two (Real.arsinh_nonneg_iff.mpr (by positivity))
    have hcoshℓ : Real.cosh (2 * Real.arsinh (√((a + d) ^ 2 - 4) / 2))
        = 1 + ((a + d) ^ 2 - 4) / 2 := by
      rw [Real.cosh_two_mul, Real.cosh_sq, Real.sinh_arsinh, div_pow, Real.sq_sqrt hΔ.le]
      ring
    have hge : ∀ z : ℍ, 2 * Real.arsinh (√((a + d) ^ 2 - 4) / 2) ≤ dist z (γ • z) := by
      intro z
      have hy := z.im_pos
      have h : Real.cosh (2 * Real.arsinh (√((a + d) ^ 2 - 4) / 2))
          ≤ Real.cosh (dist z (γ • z)) := by
        rw [hcz z, hcoshℓ]
        have hsplit : ((c * (z.re ^ 2 + z.im ^ 2) + (d - a) * z.re - b) ^ 2
            + ((a + d) ^ 2 - 4) * z.im ^ 2) / (2 * z.im ^ 2)
            = (c * (z.re ^ 2 + z.im ^ 2) + (d - a) * z.re - b) ^ 2 / (2 * z.im ^ 2)
              + ((a + d) ^ 2 - 4) / 2 := by
          field_simp
        rw [hsplit]
        have : 0 ≤ (c * (z.re ^ 2 + z.im ^ 2) + (d - a) * z.re - b) ^ 2 / (2 * z.im ^ 2) := by
          positivity
        linarith
      rw [Real.cosh_le_cosh, abs_of_nonneg hℓ0, abs_of_nonneg dist_nonneg] at h
      exact h
    have heq : ∀ z : ℍ, c * (z.re ^ 2 + z.im ^ 2) + (d - a) * z.re - b = 0 →
        dist z (γ • z) = 2 * Real.arsinh (√((a + d) ^ 2 - 4) / 2) := by
      intro z hS
      have hy := z.im_pos
      have h : Real.cosh (dist z (γ • z))
          = Real.cosh (2 * Real.arsinh (√((a + d) ^ 2 - 4) / 2)) := by
        rw [hcz z, hS, hcoshℓ]
        field_simp
        ring
      apply le_antisymm
      · have h' := h.le
        rw [Real.cosh_le_cosh, abs_of_nonneg hℓ0, abs_of_nonneg dist_nonneg] at h'
        exact h'
      · exact hge z
    obtain ⟨z0, hz0⟩ : ∃ z0 : ℍ, c * (z0.re ^ 2 + z0.im ^ 2) + (d - a) * z0.re - b = 0 := by
      by_cases hc : c = 0
      · have had : a * d = 1 := by rw [hc] at hdet; linarith
        have hne : d - a ≠ 0 := by
          intro h
          have hda : d = a := by linarith
          rw [hda] at had hΔ
          nlinarith
        refine ⟨⟨⟨b / (d - a), 1⟩, one_pos⟩, ?_⟩
        change c * ((b / (d - a)) ^ 2 + 1 ^ 2) + (d - a) * (b / (d - a)) - b = 0
        rw [hc]
        field_simp
        ring
      · have hy : 0 < √((a + d) ^ 2 - 4) / (2 * |c|) :=
          div_pos (Real.sqrt_pos.mpr hΔ) (mul_pos two_pos (abs_pos.mpr hc))
        refine ⟨⟨⟨(a - d) / (2 * c), √((a + d) ^ 2 - 4) / (2 * |c|)⟩, hy⟩, ?_⟩
        change c * (((a - d) / (2 * c)) ^ 2 + (√((a + d) ^ 2 - 4) / (2 * |c|)) ^ 2)
          + (d - a) * ((a - d) / (2 * c)) - b = 0
        rw [div_pow (√((a + d) ^ 2 - 4)) (2 * |c|) 2, Real.sq_sqrt hΔ.le, mul_pow, sq_abs]
        have : c * (((a - d) / (2 * c)) ^ 2 + ((a + d) ^ 2 - 4) / (2 ^ 2 * c ^ 2))
            + (d - a) * ((a - d) / (2 * c)) - b = (a * d - b * c - 1) / c := by
          field_simp
          ring
        rw [this, hdet, sub_self, zero_div]
    rw [hτ]
    exact le_antisymm ((ciInf_le ⟨0, by rintro _ ⟨z, rfl⟩; exact dist_nonneg⟩ z0).trans
      (heq z0 hz0).le) (le_ciInf hge)
  have hsinhφ : Real.sinh (2 * Real.log Real.goldenRatio) = √5 / 2 := by
    have hφsq : Real.goldenRatio ^ 2 = Real.goldenRatio + 1 := Real.goldenRatio_sq
    have hm : (2 - Real.goldenRatio) * Real.goldenRatio ^ 2 = 1 := by nlinarith [hφsq]
    have hi : (Real.goldenRatio ^ 2)⁻¹ = 2 - Real.goldenRatio :=
      (eq_inv_of_mul_eq_one_left hm).symm
    rw [show 2 * Real.log Real.goldenRatio = Real.log (Real.goldenRatio ^ 2) by
      rw [Real.log_pow]; push_cast; ring, Real.sinh_log (by positivity), hi, hφsq,
      Real.goldenRatio]
    ring
  have hφ : 2 * Real.arsinh (√5 / 2) = 4 * Real.log Real.goldenRatio := by
    rw [← hsinhφ, Real.arsinh_sinh]
    ring
  have hmapM : ∀ γ : SL(2, ℤ),
      ((Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ) γ : SL(2, ℝ)) :
        Matrix (Fin 2) (Fin 2) ℝ) = (γ : Matrix (Fin 2) (Fin 2) ℤ).map (Int.cast) := fun _ => rfl
  have hmaptr : ∀ γ : SL(2, ℤ),
      ((Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ) γ : SL(2, ℝ)) :
        Matrix (Fin 2) (Fin 2) ℝ).trace = (((γ : Matrix (Fin 2) (Fin 2) ℤ).trace : ℤ) : ℝ) := by
    intro γ
    rw [hmapM, Matrix.trace_fin_two, Matrix.trace_fin_two]
    push_cast
    rfl
  have hdiscZ : ∀ γ : SL(2, ℤ), (γ : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic ↔
      4 < (γ : Matrix (Fin 2) (Fin 2) ℤ).trace ^ 2 := by
    intro γ
    rw [Matrix.IsHyperbolic, Matrix.discr_fin_two, γ.2]
    constructor <;> intro h <;> linarith
  have hτZ : ∀ γ : SL(2, ℤ), (γ : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic →
      τ (Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ) γ)
        = 2 * Real.arsinh (√((((γ : Matrix (Fin 2) (Fin 2) ℤ).trace : ℤ) : ℝ) ^ 2 - 4) / 2) := by
    intro γ hγ
    have hR : ((Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ) γ : SL(2, ℝ)) :
        Matrix (Fin 2) (Fin 2) ℝ).IsHyperbolic := by
      rw [Matrix.IsHyperbolic, Matrix.discr_fin_two,
        (Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ) γ).2, hmaptr]
      have h := (hdiscZ γ).mp hγ
      have h' : ((4 : ℤ) : ℝ) < (((γ : Matrix (Fin 2) (Fin 2) ℤ).trace ^ 2 : ℤ) : ℝ) := by
        exact_mod_cast h
      push_cast at h'
      linarith
    rw [hlen _ hR, hmaptr]
  have hlower : ∀ γ : SL(2, ℤ), (γ : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic →
      4 * Real.log Real.goldenRatio ≤ τ (Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ) γ) := by
    intro γ hγ
    rw [hτZ γ hγ, ← hφ]
    have h9 : 9 ≤ (γ : Matrix (Fin 2) (Fin 2) ℤ).trace ^ 2 := by
      have h := (hdiscZ γ).mp hγ
      have habs : 2 < |(γ : Matrix (Fin 2) (Fin 2) ℤ).trace| := by
        by_contra hn
        push Not at hn
        have := abs_le.mp hn
        nlinarith
      have h3 : 3 ≤ |(γ : Matrix (Fin 2) (Fin 2) ℤ).trace| := habs
      nlinarith [sq_abs (γ : Matrix (Fin 2) (Fin 2) ℤ).trace,
        abs_nonneg (γ : Matrix (Fin 2) (Fin 2) ℤ).trace]
    have h9R : (9 : ℝ) ≤ (((γ : Matrix (Fin 2) (Fin 2) ℤ).trace : ℤ) : ℝ) ^ 2 := by
      exact_mod_cast h9
    apply mul_le_mul_of_nonneg_left _ zero_le_two
    rw [Real.arsinh_le_arsinh]
    apply div_le_div_of_nonneg_right _ zero_le_two
    exact Real.sqrt_le_sqrt (by linarith)
  have hF2tr : (RZ.F2 : Matrix (Fin 2) (Fin 2) ℤ).trace = 3 := by
    change (!![2, 1; 1, 1] : Matrix (Fin 2) (Fin 2) ℤ).trace = 3
    rw [Matrix.trace_fin_two_of]
    norm_num
  have hF2hyp : (RZ.F2 : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic := by
    rw [hdiscZ, hF2tr]
    norm_num
  have hF2τ : τ (Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ) RZ.F2)
      = 4 * Real.log Real.goldenRatio := by
    rw [hτZ RZ.F2 hF2hyp, hF2tr, ← hφ]
    norm_num
  refine ⟨?_, ⟨⟨RZ.F2, hF2hyp⟩, rfl⟩, ?_⟩
  · rw [hF2τ, Real.log_pow]
    push_cast
    ring
  · rintro _ ⟨⟨γ, hγ⟩, rfl⟩
    rw [hF2τ]
    exact hlower γ hγ

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
  open Polynomial in (
  -- the arithmetic core of (d): a unit a + bφ (norm a² + ab − b² = ±1) with 1 ≤ (a + bφ)² < φ²
  -- has (a + bφ)² = 1, via its conjugate x' = a + b(1 − φ)
  have harith : ∀ a b : ℤ, (a ^ 2 + a * b - b ^ 2 = 1 ∨ a ^ 2 + a * b - b ^ 2 = -1) →
      1 ≤ ((a : ℝ) + b * Real.goldenRatio) ^ 2 →
      ((a : ℝ) + b * Real.goldenRatio) ^ 2 < Real.goldenRatio ^ 2 →
      ((a : ℝ) + b * Real.goldenRatio) ^ 2 = 1 := by
    intro a b hN hlo hhi
    have hsq := Real.goldenRatio_sq
    have hφ1 := Real.one_lt_goldenRatio
    have hφ2 := Real.goldenRatio_lt_two
    set x : ℝ := a + b * Real.goldenRatio with hx
    set x' : ℝ := a + b * (1 - Real.goldenRatio) with hx'
    have hxx' : x * x' = ((a ^ 2 + a * b - b ^ 2 : ℤ) : ℝ) := by
      rw [hx, hx']
      push_cast
      linear_combination (-(b : ℝ) ^ 2) * Real.goldenRatio_sq
    have e1 : (x - x') ^ 2 = 5 * (b : ℝ) ^ 2 := by
      rw [hx, hx']
      linear_combination (4 * (b : ℝ) ^ 2) * Real.goldenRatio_sq
    have e2 : (x + x') ^ 2 = (2 * (a : ℝ) + b) ^ 2 := by
      rw [hx, hx']
      ring
    have hN2 : x ^ 2 * x' ^ 2 = 1 := by
      rw [← mul_pow, hxx']
      rcases hN with h | h <;> rw [h] <;> norm_num
    have hx'2 : x' ^ 2 ≤ 1 := by
      by_contra h
      have := one_lt_mul_of_le_of_lt hlo (lt_of_not_ge h)
      linarith
    have hφsq4 : Real.goldenRatio ^ 2 < 4 := by rw [hsq]; linarith
    have hcross : -2 ≤ 2 * (x * x') ∧ 2 * (x * x') ≤ 2 := by
      rw [hxx']
      rcases hN with h | h <;> rw [h] <;> norm_num
    have hm : (x - x') ^ 2 = x ^ 2 + x' ^ 2 - 2 * (x * x') := by ring
    have hp : (x + x') ^ 2 = x ^ 2 + x' ^ 2 + 2 * (x * x') := by ring
    have hb : 5 * (b : ℝ) ^ 2 < 7 := by linarith [hcross.1]
    have hs : (2 * (a : ℝ) + b) ^ 2 < 7 := by linarith [hcross.2]
    have hbZ : b ^ 2 < 2 := by
      have h : ((b ^ 2 : ℤ) : ℝ) < 2 := by push_cast; linarith
      exact_mod_cast h
    have hsZ : (2 * a + b) ^ 2 < 7 := by
      have h : (((2 * a + b) ^ 2 : ℤ) : ℝ) < 7 := by push_cast; linarith
      exact_mod_cast h
    have hbA := abs_lt.mp (abs_lt_of_sq_lt_sq (by linarith : b ^ 2 < 2 ^ 2) (by norm_num))
    have hsA := abs_lt.mp
      (abs_lt_of_sq_lt_sq (by linarith : (2 * a + b) ^ 2 < 3 ^ 2) (by norm_num))
    have ha1 : -1 ≤ a := by omega
    have ha2 : a ≤ 1 := by omega
    have hb1 : -1 ≤ b := by omega
    have hb2 : b ≤ 1 := by omega
    have hx2 : x ^ 2
        = ((a : ℝ) ^ 2 + (b : ℝ) ^ 2) + (2 * a * b + (b : ℝ) ^ 2) * Real.goldenRatio := by
      rw [hx]
      linear_combination ((b : ℝ) ^ 2) * hsq
    rw [hx2] at hlo hhi ⊢
    rw [hsq] at hhi
    clear_value x x'
    interval_cases a <;> interval_cases b <;> first | omega | (push_cast at hlo hhi ⊢; linarith)
  -- The power-basis computation of 𝓞 ℚ(√5) and d = 5 (`h5` … `hgenval`) is copied from U4's
  -- proof of `rz_64c_conductor_one` (`RiemannZeta/MatricesMobius/Solution.lean`, lines
  -- 1831–1974); U9 restates, it does not import.
  have h5 : (√5 : ℝ) ^ 2 = 5 := Real.sq_sqrt (by norm_num)
  have hirr : ∀ b : ℚ, b ^ 2 ≠ 5 := by
    intro b hb
    have hb' : ((b : ℝ)) ^ 2 = 5 := by exact_mod_cast hb
    have : (√5 : ℝ) = |(b : ℝ)| := by rw [← hb', Real.sqrt_sq_eq_abs]
    exact (Nat.prime_five.irrational_sqrt) ⟨|b|, by push_cast; rw [this]⟩
  have hmin5 : minpoly ℚ (√5 : ℝ) = X ^ 2 - C 5 := by
    refine (minpoly.eq_of_irreducible_of_monic
      (X_pow_sub_C_irreducible_of_prime Nat.prime_two hirr) ?_
        (monic_X_pow_sub_C _ two_ne_zero)).symm
    simp [h5]
  have hint5 : IsIntegral ℚ (√5 : ℝ) := by
    refine ⟨X ^ 2 - C 5, monic_X_pow_sub_C _ two_ne_zero, ?_⟩
    simp [h5]
  set K := ℚ⟮(√5 : ℝ)⟯ with hK
  set θ : ℝ := (5 + √5) / 2 with hθ
  have hθq : θ ^ 2 - 5 * θ + 5 = 0 := by rw [hθ]; linear_combination (1 / 4) * h5
  have hintθ : IsIntegral ℚ θ := by
    refine ⟨X ^ 2 - C 5 * X + C 5, by monicity!, ?_⟩
    simp only [eval₂_add, eval₂_sub, eval₂_X_pow, eval₂_mul, eval₂_C, eval₂_X]
    norm_num
    linear_combination hθq
  have hEq : ℚ⟮θ⟯ = K := by
    apply le_antisymm
    · rw [IntermediateField.adjoin_simple_le_iff]
      have hs : (√5 : ℝ) ∈ K := IntermediateField.mem_adjoin_simple_self ℚ _
      exact div_mem (add_mem (by simp) hs) (by simp)
    · rw [hK, IntermediateField.adjoin_simple_le_iff]
      have ht : θ ∈ ℚ⟮θ⟯ := IntermediateField.mem_adjoin_simple_self ℚ _
      have hmem : 2 * θ - 5 ∈ ℚ⟮θ⟯ := sub_mem (mul_mem (by simp) ht) (by simp)
      rw [show 2 * θ - 5 = √5 by rw [hθ]; ring] at hmem
      exact hmem
  let B : PowerBasis ℚ K :=
    (IntermediateField.adjoin.powerBasis hintθ).map (IntermediateField.equivOfEq hEq)
  have hBval : ((B.gen : K) : ℝ) = θ := rfl
  have hfin : Module.finrank ℚ K = 2 := by
    rw [hK, IntermediateField.adjoin.finrank hint5, hmin5, natDegree_X_pow_sub_C]
  have hBdim : B.dim = 2 := by rw [← B.finrank, hfin]
  have hminR : minpoly ℚ θ = X ^ 2 - C 5 * X + C 5 := by
    have hdvd : minpoly ℚ θ ∣ X ^ 2 - C 5 * X + C 5 := by
      apply minpoly.dvd
      simp only [map_add, map_sub, map_pow, aeval_X, map_mul, aeval_C]
      norm_num
      linear_combination hθq
    have hdeg : (minpoly ℚ θ).natDegree = 2 := by
      rw [← IntermediateField.adjoin.finrank hintθ, hEq, hfin]
    refine (Polynomial.eq_of_monic_of_dvd_of_natDegree_le (minpoly.monic hintθ)
      (by monicity!) hdvd ?_).symm
    rw [hdeg]
    compute_degree!
  have hminK : minpoly ℚ B.gen = X ^ 2 - C 5 * X + C 5 := by
    rw [← hminR, ← minpoly.algebraMap_eq (algebraMap K ℝ).injective B.gen]
    rfl
  have hθZ : IsIntegral ℤ θ := by
    refine ⟨X ^ 2 - C 5 * X + C 5, by monicity!, ?_⟩
    simp only [eval₂_add, eval₂_sub, eval₂_X_pow, eval₂_mul, eval₂_C, eval₂_X]
    norm_num
    linear_combination hθq
  have hαint : IsIntegral ℤ B.gen :=
    (isIntegral_algHom_iff (K.val.restrictScalars ℤ) Subtype.val_injective).mp hθZ
  have hminZ : minpoly ℤ B.gen = X ^ 2 - C 5 * X + C 5 := by
    apply Polynomial.map_injective (algebraMap ℤ ℚ) (algebraMap ℤ ℚ).injective_int
    rw [← minpoly.isIntegrallyClosed_eq_field_fractions' ℚ hαint, hminK]
    simp only [Polynomial.map_add, Polynomial.map_sub, Polynomial.map_pow, Polynomial.map_mul,
      map_X, map_C]
    rfl
  have hei : (minpoly ℤ B.gen).IsEisensteinAt (Submodule.span ℤ {(5 : ℤ)}) := by
    rw [hminZ]
    have hdeg : (X ^ 2 - C (5 : ℤ) * X + C 5).natDegree = 2 := by compute_degree!
    have hmon : (X ^ 2 - C (5 : ℤ) * X + C 5).Monic := by monicity!
    refine ⟨?_, ?_, ?_⟩
    · rw [hmon.leadingCoeff, Ideal.mem_span_singleton]
      decide
    · intro n hn
      rw [hdeg] at hn
      rw [Ideal.mem_span_singleton]
      interval_cases n <;> simp [coeff_X]
    · rw [pow_two, Ideal.span_singleton_mul_span_singleton, Ideal.mem_span_singleton]
      simp [coeff_X]
  set s5 : K := IntermediateField.AdjoinSimple.gen ℚ (√5 : ℝ) with hs5
  have hnorm5 : Algebra.norm ℚ s5 = -5 := by
    have h := Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly
      (IntermediateField.adjoin.powerBasis hint5)
    rw [IntermediateField.adjoin.powerBasis_gen, IntermediateField.adjoin.powerBasis_dim,
      IntermediateField.minpoly_gen, hmin5, natDegree_X_pow_sub_C] at h
    rw [hs5]
    refine h.trans ?_
    simp
  have hdiscB : Algebra.discr ℚ B.basis = 5 := by
    have hder : aeval B.gen (derivative (X ^ 2 - C (5 : ℚ) * X + C 5)) = s5 := by
      have hd2 : aeval B.gen (derivative (X ^ 2 - C (5 : ℚ) * X + C 5)) = 2 * B.gen - 5 := by
        simp only [derivative_add, derivative_sub, derivative_X_pow, derivative_C_mul_X,
          derivative_C]
        simp
      rw [hd2]
      apply Subtype.ext
      change K.val (2 * B.gen - 5) = K.val s5
      rw [map_sub, map_mul, map_ofNat, map_ofNat]
      change 2 * θ - 5 = √5
      rw [hθ]
      ring
    rw [Algebra.discr_powerBasis_eq_norm, B.finrank, hBdim, hminK, hder, hnorm5]
    norm_num
  have hclos : IsIntegralClosure (Algebra.adjoin ℤ ({B.gen} : Set K)) ℤ K := by
    refine ⟨Subtype.val_injective, @fun x => ⟨fun h => ⟨⟨x, ?_⟩, rfl⟩, ?_⟩⟩
    swap
    · rintro ⟨y, rfl⟩
      exact IsIntegral.algebraMap
        ((le_integralClosure_iff_isIntegral.1 (adjoin_le_integralClosure hαint)).isIntegral _)
    have H := Algebra.discr_mul_isIntegral_mem_adjoin ℚ hαint h
    rw [hdiscB] at H
    have H' : (5 : ℤ) ^ 1 • x ∈ Algebra.adjoin ℤ ({B.gen} : Set K) := by
      have : (5 : ℤ) ^ 1 • x = (5 : ℚ) • x := by
        rw [← Int.cast_smul_eq_zsmul ℚ]
        norm_num
      rw [this]
      exact H
    exact mem_adjoin_of_smul_prime_pow_smul_of_minpoly_isEisensteinAt
      (Int.prime_iff_natAbs_prime.mpr (by norm_num)) hαint h H' hei
  let pB₁ : PowerBasis ℤ (NumberField.RingOfIntegers K) :=
    (Algebra.adjoin.powerBasis' hαint).map
      (IsIntegralClosure.equiv ℤ (Algebra.adjoin ℤ ({B.gen} : Set K)) K
        (NumberField.RingOfIntegers K))
  have hdim : pB₁.dim = B.dim := by
    rw [← PowerBasis.finrank, ← PowerBasis.finrank]
    exact NumberField.RingOfIntegers.rank K
  have hdiscK : NumberField.discr K = 5 := by
    apply (algebraMap ℤ ℚ).injective_int
    rw [← NumberField.discr_eq_discr _ pB₁.basis,
      ← Algebra.discr_localizationLocalization ℤ (nonZeroDivisors ℤ) K,
      show algebraMap ℤ ℚ 5 = 5 by norm_num, ← hdiscB,
      ← Algebra.discr_reindex _ _ (finCongr hdim)]
    congr 1
    ext i
    rw [Function.comp_apply, Module.Basis.localizationLocalization_apply, PowerBasis.coe_basis,
      PowerBasis.coe_basis]
    simp only [finCongr_symm, finCongr_apply, Fin.val_cast, map_pow]
    simp only [pB₁, PowerBasis.map_gen, Algebra.adjoin.powerBasis'_gen]
    rw [IsIntegralClosure.algebraMap_equiv]
    rfl
  have hgenval : algebraMap (NumberField.RingOfIntegers K) K pB₁.gen = B.gen := by
    simp only [pB₁, PowerBasis.map_gen, Algebra.adjoin.powerBasis'_gen]
    rw [IsIntegralClosure.algebraMap_equiv]
    rfl
  -- (a) 𝓞 K = ℤ[φ]: the integral power basis has generator θ = φ + 2
  have ha : Algebra.adjoin ℤ {RZ.phi} = ⊤ := by
    rw [eq_top_iff, ← pB₁.adjoin_gen_eq_top, Algebra.adjoin_le_iff, Set.singleton_subset_iff]
    have hg : pB₁.gen = RZ.phi + 2 := by
      apply NumberField.RingOfIntegers.ext
      change algebraMap (NumberField.RingOfIntegers K) K pB₁.gen
        = algebraMap (NumberField.RingOfIntegers K) K (RZ.phi + 2)
      rw [hgenval, map_add, map_ofNat]
      apply Subtype.ext
      change K.val B.gen = K.val (algebraMap (NumberField.RingOfIntegers K) K RZ.phi + 2)
      rw [map_add, map_ofNat]
      change θ = Real.goldenRatio + 2
      rw [hθ, Real.goldenRatio]
      ring
    rw [hg]
    exact add_mem (Algebra.self_mem_adjoin_singleton ℤ _)
      (by exact_mod_cast Subalgebra.natCast_mem _ 2)
  -- K is totally real: one real place, and r₁ + 2 r₂ = 2
  have hreal : ∃ w : InfinitePlace K, w.IsReal := by
    refine ⟨InfinitePlace.mk (Complex.ofRealHom.comp (K.val : K →+* ℝ)), ?_⟩
    rw [InfinitePlace.isReal_mk_iff, ComplexEmbedding.isReal_iff]
    ext x
    simp [ComplexEmbedding.conjugate_coe_eq]
  have hnrC : InfinitePlace.nrComplexPlaces K = 0 := by
    have h1 := InfinitePlace.card_add_two_mul_card_eq_rank K
    rw [hfin] at h1
    have h2 : 0 < InfinitePlace.nrRealPlaces K := by
      classical
      obtain ⟨w, hw⟩ := hreal
      exact Fintype.card_pos_iff.mpr ⟨⟨w, hw⟩⟩
    omega
  -- (c) Minkowski: |d_K| = 5 < 16
  have hc : NumberField.classNumber K = 1 := by
    rw [NumberField.classNumber_eq_one_iff]
    apply RingOfIntegers.isPrincipalIdealRing_of_abs_discr_lt
    rw [hdiscK, hnrC, hfin]
    norm_num [Nat.factorial]
  -- (e) N(φ) = −1, from the power basis of K generated by φ
  have hintφ : IsIntegral ℚ Real.goldenRatio := by
    refine ⟨X ^ 2 - X - 1, by monicity!, ?_⟩
    simp only [eval₂_sub, eval₂_X_pow, eval₂_X, eval₂_one]
    linear_combination Real.goldenRatio_sq
  have hEqφ : ℚ⟮Real.goldenRatio⟯ = K := by
    apply le_antisymm
    · rw [IntermediateField.adjoin_simple_le_iff]
      exact (((RZ.phi : NumberField.RingOfIntegers K) : K)).property
    · rw [hK, IntermediateField.adjoin_simple_le_iff]
      have ht : Real.goldenRatio ∈ ℚ⟮Real.goldenRatio⟯ :=
        IntermediateField.mem_adjoin_simple_self ℚ _
      have hmem : 2 * Real.goldenRatio - 1 ∈ ℚ⟮Real.goldenRatio⟯ :=
        sub_mem (mul_mem (by simp) ht) (by simp)
      rw [show 2 * Real.goldenRatio - 1 = √5 by rw [Real.goldenRatio]; ring] at hmem
      exact hmem
  let Bφ : PowerBasis ℚ K :=
    (IntermediateField.adjoin.powerBasis hintφ).map (IntermediateField.equivOfEq hEqφ)
  have hBφdim : Bφ.dim = 2 := by rw [← Bφ.finrank, hfin]
  have hminφ : minpoly ℚ Real.goldenRatio = X ^ 2 - X - 1 := by
    have hdvd : minpoly ℚ Real.goldenRatio ∣ X ^ 2 - X - 1 := by
      apply minpoly.dvd
      simp only [map_sub, map_pow, aeval_X, map_one]
      linear_combination Real.goldenRatio_sq
    have hdeg : (minpoly ℚ Real.goldenRatio).natDegree = 2 := by
      rw [← IntermediateField.adjoin.finrank hintφ, hEqφ, hfin]
    refine (Polynomial.eq_of_monic_of_dvd_of_natDegree_le (minpoly.monic hintφ)
      (by monicity!) hdvd ?_).symm
    rw [hdeg]
    compute_degree!
  have hminKφ : minpoly ℚ Bφ.gen = X ^ 2 - X - 1 := by
    rw [← hminφ, ← minpoly.algebraMap_eq (algebraMap K ℝ).injective Bφ.gen]
    rfl
  have he : Algebra.norm ℚ ((RZ.phi : K)) = -1 := by
    have hgen : Bφ.gen = (RZ.phi : K) := Subtype.ext rfl
    rw [← hgen, Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly, hBφdim, hminKφ]
    simp
  -- (d) the unit group is {±φⁿ}
  let rr : NumberField.RingOfIntegers K →+* ℝ :=
    (K.val : K →+* ℝ).comp (algebraMap (NumberField.RingOfIntegers K) K)
  have hrr_inj : Function.Injective rr := by
    intro x y h
    exact NumberField.RingOfIntegers.ext (Subtype.ext h)
  have hrrφ : rr RZ.phi = Real.goldenRatio := rfl
  have hform : ∀ x : NumberField.RingOfIntegers K,
      ∃ a b : ℤ, rr x = a + b * Real.goldenRatio := by
    intro x
    have hx : x ∈ Algebra.adjoin ℤ {RZ.phi} := ha ▸ Algebra.mem_top
    induction hx using Algebra.adjoin_induction with
    | mem y hy =>
      rw [Set.mem_singleton_iff.mp hy, hrrφ]
      exact ⟨0, 1, by push_cast; ring⟩
    | algebraMap r => exact ⟨r, 0, by simp⟩
    | add y z _ _ hy hz =>
      obtain ⟨a, b, h1⟩ := hy
      obtain ⟨c, d, h2⟩ := hz
      exact ⟨a + c, b + d, by rw [map_add, h1, h2]; push_cast; ring⟩
    | mul y z _ _ hy hz =>
      obtain ⟨a, b, h1⟩ := hy
      obtain ⟨c, d, h2⟩ := hz
      exact ⟨a * c + b * d, a * d + b * c + b * d, by
        rw [map_mul, h1, h2]; push_cast; linear_combination ((b : ℝ) * d) * Real.goldenRatio_sq⟩
  have hsep : ∀ p q : ℤ, (p : ℝ) + q * Real.goldenRatio = 0 → p = 0 ∧ q = 0 := by
    intro p q h
    have hq : q = 0 := by
      by_contra hq
      apply Real.goldenRatio_irrational.ne_rat (-p / q)
      have hq' : (q : ℝ) ≠ 0 := by exact_mod_cast hq
      push_cast
      rw [eq_div_iff hq']
      linear_combination h
    refine ⟨?_, hq⟩
    rw [hq] at h
    push_cast at h
    exact_mod_cast (by linarith : (p : ℝ) = 0)
  -- the norm form a² + ab − b² of a unit a + bφ is ±1
  have hnorm : ∀ (u : (NumberField.RingOfIntegers K)ˣ) (a b : ℤ),
      rr u = a + b * Real.goldenRatio → a ^ 2 + a * b - b ^ 2 = 1 ∨ a ^ 2 + a * b - b ^ 2 = -1 := by
    intro u a b hab
    obtain ⟨c, d, hcd⟩ := hform (u⁻¹ : (NumberField.RingOfIntegers K)ˣ)
    have hprod : rr u * rr (u⁻¹ : (NumberField.RingOfIntegers K)ˣ) = 1 := by
      rw [← map_mul, Units.mul_inv, map_one]
    rw [hab, hcd] at hprod
    have h0 : ((a * c + b * d - 1 : ℤ) : ℝ) + ((a * d + b * c + b * d : ℤ) : ℝ) * Real.goldenRatio
        = 0 := by
      push_cast
      linear_combination hprod - ((b : ℝ) * d) * Real.goldenRatio_sq
    obtain ⟨e1, e2⟩ := hsep _ _ h0
    have hmul : (a ^ 2 + a * b - b ^ 2) * (c ^ 2 + c * d - d ^ 2) = 1 := by
      linear_combination (a * c + b * d + 1) * e1 + (a * c + b * d) * e2
        - (a * d + b * c + b * d) * e2
    exact Int.eq_one_or_neg_one_of_mul_eq_one hmul
  -- no unit has 1 < |value| < φ
  have hkey : ∀ u : (NumberField.RingOfIntegers K)ˣ,
      1 ≤ (rr u) ^ 2 → (rr u) ^ 2 < Real.goldenRatio ^ 2 → (rr u) ^ 2 = 1 := by
    intro u hlo hhi
    obtain ⟨a, b, hab⟩ := hform u
    rw [hab] at hlo hhi ⊢
    exact harith a b (hnorm u a b hab) hlo hhi
  have hpow : ∀ m : ℤ, rr ((RZ.phiUnit ^ m : (NumberField.RingOfIntegers K)ˣ) :
      NumberField.RingOfIntegers K) = Real.goldenRatio ^ m := by
    intro m
    change (((Units.map rr.toMonoidHom) (RZ.phiUnit ^ m) : ℝˣ) : ℝ) = Real.goldenRatio ^ m
    rw [map_zpow, Units.val_zpow_eq_zpow_val]
    rfl
  have hd : ∀ u : (NumberField.RingOfIntegers K)ˣ,
      ∃ n : ℤ, u = RZ.phiUnit ^ n ∨ u = -(RZ.phiUnit ^ n) := by
    intro u
    have hne : rr u ≠ 0 := by
      intro h
      have hprod : rr u * rr (u⁻¹ : (NumberField.RingOfIntegers K)ˣ) = 1 := by
        rw [← map_mul, Units.mul_inv, map_one]
      rw [h, zero_mul] at hprod
      exact zero_ne_one hprod
    obtain ⟨n, hn1, hn2⟩ := exists_mem_Ico_zpow (abs_pos.mpr hne) Real.one_lt_goldenRatio
    set v := u * RZ.phiUnit ^ (-n) with hv
    have hφn : 0 < Real.goldenRatio ^ n := zpow_pos Real.goldenRatio_pos n
    have hrv : rr v = rr u * (Real.goldenRatio ^ n)⁻¹ := by
      rw [hv, Units.val_mul, map_mul, hpow, zpow_neg]
    have habs : |rr v| = |rr u| * (Real.goldenRatio ^ n)⁻¹ := by
      rw [hrv, abs_mul, abs_of_pos (inv_pos.mpr hφn)]
    have hv1 : 1 ≤ |rr v| := by
      rw [habs, le_mul_inv_iff₀ hφn, one_mul]
      exact hn1
    have hv2 : |rr v| < Real.goldenRatio := by
      rw [habs, mul_inv_lt_iff₀ hφn]
      rw [zpow_add_one₀ Real.goldenRatio_pos.ne'] at hn2
      nlinarith [hn2]
    have hvsq : (rr v) ^ 2 = 1 := by
      apply hkey v
      · nlinarith [sq_abs (rr v)]
      · nlinarith [sq_abs (rr v), abs_nonneg (rr v)]
    have hvpm : v = 1 ∨ v = -1 := by
      have h : (rr v - 1) * (rr v + 1) = 0 := by linear_combination hvsq
      rcases mul_eq_zero.mp h with h | h
      · left
        exact Units.ext (hrr_inj (by rw [Units.val_one, map_one]; linarith))
      · right
        exact Units.ext (hrr_inj (by rw [Units.val_neg, Units.val_one, map_neg, map_one]; linarith))
    have huv : u = v * RZ.phiUnit ^ n := by
      rw [hv, mul_assoc, ← zpow_add, neg_add_cancel, zpow_zero, mul_one]
    refine ⟨n, ?_⟩
    rcases hvpm with h | h
    · left; rw [huv, h, one_mul]
    · right; rw [huv, h, neg_one_mul]
  exact ⟨ha, hdiscK, hc, ⟨rfl, Real.one_lt_goldenRatio, hd⟩, he⟩)

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
  open Polynomial in (
  refine ⟨?_, ?_⟩
  · intro K _ _ _ hK2
    have hr2 : InfinitePlace.nrComplexPlaces K = 0 := nrComplexPlaces_eq_zero_iff.mpr ‹_›
    -- d_K > 0 (sign (−1)^{r₂}) and d_K ≥ 4 (Minkowski at n = 2, r₂ = 0)
    have hpos : 0 < NumberField.discr K := by
      have h := NumberField.sign_discr K
      rw [hr2, pow_zero] at h
      exact Int.sign_eq_one_iff_pos.mp h
    have h4 : 4 ≤ NumberField.discr K := by
      have h := NumberField.abs_discr_ge' K
      rw [hK2, hr2] at h
      norm_num [Nat.factorial] at h
      have h' : ((4 : ℤ) : ℝ) ≤ ((|NumberField.discr K| : ℤ) : ℝ) := by push_cast; linarith
      have h'' := Int.cast_le.mp h'
      rwa [abs_of_pos hpos] at h''
    suffices hne : NumberField.discr K ≠ 4 by omega
    intro hd4
    -- a primitive element α, of degree 2, and its root equation α² + c₁α + c₀ = 0
    obtain ⟨α, hα⟩ := Field.exists_primitive_element ℚ K
    have hαint : IsIntegral ℚ α := .of_finite ℚ α
    have hdeg : (minpoly ℚ α).natDegree = 2 := by
      rw [← IntermediateField.adjoin.finrank hαint, hα, IntermediateField.finrank_top', hK2]
    have hαQ : α ∉ (algebraMap ℚ K).range := by
      intro h
      rw [← minpoly.natDegree_eq_one_iff] at h
      omega
    set c0 := (minpoly ℚ α).coeff 0 with hc0
    set c1 := (minpoly ℚ α).coeff 1 with hc1
    have hroot : α ^ 2 + (c1 : K) * α + (c0 : K) = 0 := by
      have h := minpoly.aeval ℚ α
      have h2 : (minpoly ℚ α).coeff 2 = 1 := by
        have := (minpoly.monic hαint).coeff_natDegree
        rwa [hdeg] at this
      rw [Polynomial.aeval_eq_sum_range, hdeg] at h
      simp only [Finset.sum_range_succ, Finset.sum_range_zero, zero_add, h2, Rat.smul_def,
        pow_zero, pow_one, Rat.cast_one, one_mul, mul_one] at h
      rw [← hc0, ← hc1] at h
      linear_combination h
    -- δ = den(D₀)·(2α + c₁) is an algebraic integer with δ² = D ∈ ℤ, δ ∉ ℚ
    set D0 : ℚ := c1 ^ 2 - 4 * c0 with hD0
    set δ : K := (D0.den : K) * (2 * α + c1) with hδ
    set D : ℤ := D0.num * D0.den with hD
    have hden : (D0.den : K) ≠ 0 := Nat.cast_ne_zero.mpr D0.den_nz
    have hδsq : δ ^ 2 = (D : K) := by
      have hcast : (D0 : K) * (D0.den : K) = (D0.num : K) := by
        rw [Rat.cast_def]
        field_simp
      have hβ : (2 * α + c1) ^ 2 = (D0 : K) := by
        rw [hD0]
        push_cast
        linear_combination 4 * hroot
      rw [hδ, mul_pow, hβ, hD]
      push_cast
      linear_combination (D0.den : K) * hcast
    have hδQ : ∀ q : ℚ, δ ≠ (q : K) := by
      intro q hq
      apply hαQ
      refine ⟨(q / D0.den - c1) / 2, ?_⟩
      rw [eq_ratCast]
      push_cast
      rw [← hq, hδ]
      field_simp
      ring
    have hirr : ∀ b : ℚ, b ^ 2 ≠ (D : ℚ) := by
      intro b hb
      have hb' : (δ - b) * (δ + b) = 0 := by
        have : ((b ^ 2 : ℚ) : K) = ((D : ℚ) : K) := by rw [hb]
        push_cast at this
        linear_combination hδsq - this
      rcases mul_eq_zero.mp hb' with h | h
      · exact hδQ b (by linear_combination h)
      · exact hδQ (-b) (by push_cast; linear_combination h)
    have hδint : IsIntegral ℤ δ := by
      refine ⟨X ^ 2 - C D, monic_X_pow_sub_C _ two_ne_zero, ?_⟩
      rw [eval₂_sub, eval₂_X_pow, eval₂_C, hδsq]
      simp
    -- traces: Tr 1 = 2, Tr δ = 0, Tr δ² = 2D
    have hmin : minpoly ℚ δ = X ^ 2 - C (D : ℚ) := by
      refine (minpoly.eq_of_irreducible_of_monic
        (X_pow_sub_C_irreducible_of_prime Nat.prime_two hirr) ?_
          (monic_X_pow_sub_C _ two_ne_zero)).symm
      simp [hδsq]
    have htr1 : Algebra.trace ℚ K 1 = 2 := by
      rw [← map_one (algebraMap ℚ K), Algebra.trace_algebraMap, hK2]
      norm_num
    have htrδ : Algebra.trace ℚ K δ = 0 := by
      have hnc : (X ^ 2 - C (D : ℚ)).nextCoeff = 0 := by
        rw [nextCoeff, natDegree_X_pow_sub_C, if_neg (by norm_num), coeff_sub, coeff_X_pow,
          coeff_C]
        norm_num
      rw [trace_eq_finrank_mul_minpoly_nextCoeff, hmin, hnc]
      simp
    have htrδ2 : Algebra.trace ℚ K (δ * δ) = 2 * D := by
      rw [← sq, hδsq, show (D : K) = algebraMap ℚ K (D : ℚ) by simp, Algebra.trace_algebraMap, hK2]
      simp
    have hdv : Algebra.discr ℚ ![(1 : K), δ] = 4 * D := by
      rw [Algebra.discr_def, Matrix.det_fin_two]
      simp only [Algebra.traceMatrix_apply, Algebra.traceForm_apply, Matrix.cons_val_zero,
        Matrix.cons_val_one, one_mul, mul_one]
      rw [htr1, htrδ, htrδ2]
      ring
    -- an integral basis, reindexed by Fin 2; ![1, δ] has integral coordinates in it, so
    -- discr ℚ ![1, δ] = m² · d_K for an integer m
    have hcard :
        Fintype.card (Module.Free.ChooseBasisIndex ℤ (NumberField.RingOfIntegers K)) = 2 := by
      rw [← Module.finrank_eq_card_chooseBasisIndex, NumberField.RingOfIntegers.rank, hK2]
    let bI : Module.Basis (Fin 2) ℚ K :=
      (NumberField.integralBasis K).reindex (Fintype.equivFinOfCardEq hcard)
    let w : NumberField.RingOfIntegers K := ⟨δ, hδint⟩
    have hv : (![(1 : K), δ] : Fin 2 → K)
        = fun j => algebraMap (NumberField.RingOfIntegers K) K (![1, w] j) := by
      ext j
      fin_cases j
      · simp
      · rfl
    have hint : ∀ i j, IsIntegral ℤ (bI.toMatrix ![(1 : K), δ] i j) := by
      intro i j
      rw [Module.Basis.toMatrix_apply, hv, Module.Basis.repr_reindex_apply,
        NumberField.integralBasis_repr_apply]
      exact isIntegral_algebraMap
    obtain ⟨m, hm⟩ := IsIntegrallyClosed.isIntegral_iff.mp (IsIntegral.det hint)
    have hdisc := Algebra.discr_of_matrix_vecMul bI (bI.toMatrix ![(1 : K), δ])
    rw [bI.toMatrix_map_vecMul, hdv, ← hm, Module.Basis.coe_reindex, Algebra.discr_reindex,
      ← NumberField.coe_discr, hd4] at hdisc
    apply hirr (m : ℚ)
    rw [eq_intCast] at hdisc
    push_cast at hdisc ⊢
    linarith
  · -- ℚ(√5): the power-basis computation copied from U4's proof of `rz_64c_conductor_one`
    -- (`RiemannZeta/MatricesMobius/Solution.lean`, lines 1831–1970), then the real place.
    have h5 : (√5 : ℝ) ^ 2 = 5 := Real.sq_sqrt (by norm_num)
    have hirr : ∀ b : ℚ, b ^ 2 ≠ 5 := by
      intro b hb
      have hb' : ((b : ℝ)) ^ 2 = 5 := by exact_mod_cast hb
      have : (√5 : ℝ) = |(b : ℝ)| := by rw [← hb', Real.sqrt_sq_eq_abs]
      exact (Nat.prime_five.irrational_sqrt) ⟨|b|, by push_cast; rw [this]⟩
    have hmin5 : minpoly ℚ (√5 : ℝ) = X ^ 2 - C 5 := by
      refine (minpoly.eq_of_irreducible_of_monic
        (X_pow_sub_C_irreducible_of_prime Nat.prime_two hirr) ?_
          (monic_X_pow_sub_C _ two_ne_zero)).symm
      simp [h5]
    have hint5 : IsIntegral ℚ (√5 : ℝ) := by
      refine ⟨X ^ 2 - C 5, monic_X_pow_sub_C _ two_ne_zero, ?_⟩
      simp [h5]
    set K := ℚ⟮(√5 : ℝ)⟯ with hK
    set θ : ℝ := (5 + √5) / 2 with hθ
    have hθq : θ ^ 2 - 5 * θ + 5 = 0 := by rw [hθ]; linear_combination (1 / 4) * h5
    have hintθ : IsIntegral ℚ θ := by
      refine ⟨X ^ 2 - C 5 * X + C 5, by monicity!, ?_⟩
      simp only [eval₂_add, eval₂_sub, eval₂_X_pow, eval₂_mul, eval₂_C, eval₂_X]
      norm_num
      linear_combination hθq
    have hEq : ℚ⟮θ⟯ = K := by
      apply le_antisymm
      · rw [IntermediateField.adjoin_simple_le_iff]
        have hs : (√5 : ℝ) ∈ K := IntermediateField.mem_adjoin_simple_self ℚ _
        exact div_mem (add_mem (by simp) hs) (by simp)
      · rw [hK, IntermediateField.adjoin_simple_le_iff]
        have ht : θ ∈ ℚ⟮θ⟯ := IntermediateField.mem_adjoin_simple_self ℚ _
        have hmem : 2 * θ - 5 ∈ ℚ⟮θ⟯ := sub_mem (mul_mem (by simp) ht) (by simp)
        rw [show 2 * θ - 5 = √5 by rw [hθ]; ring] at hmem
        exact hmem
    let B : PowerBasis ℚ K :=
      (IntermediateField.adjoin.powerBasis hintθ).map (IntermediateField.equivOfEq hEq)
    have hBval : ((B.gen : K) : ℝ) = θ := rfl
    have hfin : Module.finrank ℚ K = 2 := by
      rw [hK, IntermediateField.adjoin.finrank hint5, hmin5, natDegree_X_pow_sub_C]
    have hBdim : B.dim = 2 := by rw [← B.finrank, hfin]
    have hminR : minpoly ℚ θ = X ^ 2 - C 5 * X + C 5 := by
      have hdvd : minpoly ℚ θ ∣ X ^ 2 - C 5 * X + C 5 := by
        apply minpoly.dvd
        simp only [map_add, map_sub, map_pow, aeval_X, map_mul, aeval_C]
        norm_num
        linear_combination hθq
      have hdeg : (minpoly ℚ θ).natDegree = 2 := by
        rw [← IntermediateField.adjoin.finrank hintθ, hEq, hfin]
      refine (Polynomial.eq_of_monic_of_dvd_of_natDegree_le (minpoly.monic hintθ)
        (by monicity!) hdvd ?_).symm
      rw [hdeg]
      compute_degree!
    have hminK : minpoly ℚ B.gen = X ^ 2 - C 5 * X + C 5 := by
      rw [← hminR, ← minpoly.algebraMap_eq (algebraMap K ℝ).injective B.gen]
      rfl
    have hθZ : IsIntegral ℤ θ := by
      refine ⟨X ^ 2 - C 5 * X + C 5, by monicity!, ?_⟩
      simp only [eval₂_add, eval₂_sub, eval₂_X_pow, eval₂_mul, eval₂_C, eval₂_X]
      norm_num
      linear_combination hθq
    have hαint : IsIntegral ℤ B.gen :=
      (isIntegral_algHom_iff (K.val.restrictScalars ℤ) Subtype.val_injective).mp hθZ
    have hminZ : minpoly ℤ B.gen = X ^ 2 - C 5 * X + C 5 := by
      apply Polynomial.map_injective (algebraMap ℤ ℚ) (algebraMap ℤ ℚ).injective_int
      rw [← minpoly.isIntegrallyClosed_eq_field_fractions' ℚ hαint, hminK]
      simp only [Polynomial.map_add, Polynomial.map_sub, Polynomial.map_pow, Polynomial.map_mul,
        map_X, map_C]
      rfl
    have hei : (minpoly ℤ B.gen).IsEisensteinAt (Submodule.span ℤ {(5 : ℤ)}) := by
      rw [hminZ]
      have hdeg : (X ^ 2 - C (5 : ℤ) * X + C 5).natDegree = 2 := by compute_degree!
      have hmon : (X ^ 2 - C (5 : ℤ) * X + C 5).Monic := by monicity!
      refine ⟨?_, ?_, ?_⟩
      · rw [hmon.leadingCoeff, Ideal.mem_span_singleton]
        decide
      · intro n hn
        rw [hdeg] at hn
        rw [Ideal.mem_span_singleton]
        interval_cases n <;> simp [coeff_X]
      · rw [pow_two, Ideal.span_singleton_mul_span_singleton, Ideal.mem_span_singleton]
        simp [coeff_X]
    set s5 : K := IntermediateField.AdjoinSimple.gen ℚ (√5 : ℝ) with hs5
    have hnorm5 : Algebra.norm ℚ s5 = -5 := by
      have h := Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly
        (IntermediateField.adjoin.powerBasis hint5)
      rw [IntermediateField.adjoin.powerBasis_gen, IntermediateField.adjoin.powerBasis_dim,
        IntermediateField.minpoly_gen, hmin5, natDegree_X_pow_sub_C] at h
      rw [hs5]
      refine h.trans ?_
      simp
    have hdiscB : Algebra.discr ℚ B.basis = 5 := by
      have hder : aeval B.gen (derivative (X ^ 2 - C (5 : ℚ) * X + C 5)) = s5 := by
        have hd2 : aeval B.gen (derivative (X ^ 2 - C (5 : ℚ) * X + C 5)) = 2 * B.gen - 5 := by
          simp only [derivative_add, derivative_sub, derivative_X_pow, derivative_C_mul_X,
            derivative_C]
          simp
        rw [hd2]
        apply Subtype.ext
        change K.val (2 * B.gen - 5) = K.val s5
        rw [map_sub, map_mul, map_ofNat, map_ofNat]
        change 2 * θ - 5 = √5
        rw [hθ]
        ring
      rw [Algebra.discr_powerBasis_eq_norm, B.finrank, hBdim, hminK, hder, hnorm5]
      norm_num
    have hclos : IsIntegralClosure (Algebra.adjoin ℤ ({B.gen} : Set K)) ℤ K := by
      refine ⟨Subtype.val_injective, @fun x => ⟨fun h => ⟨⟨x, ?_⟩, rfl⟩, ?_⟩⟩
      swap
      · rintro ⟨y, rfl⟩
        exact IsIntegral.algebraMap
          ((le_integralClosure_iff_isIntegral.1 (adjoin_le_integralClosure hαint)).isIntegral _)
      have H := Algebra.discr_mul_isIntegral_mem_adjoin ℚ hαint h
      rw [hdiscB] at H
      have H' : (5 : ℤ) ^ 1 • x ∈ Algebra.adjoin ℤ ({B.gen} : Set K) := by
        have : (5 : ℤ) ^ 1 • x = (5 : ℚ) • x := by
          rw [← Int.cast_smul_eq_zsmul ℚ]
          norm_num
        rw [this]
        exact H
      exact mem_adjoin_of_smul_prime_pow_smul_of_minpoly_isEisensteinAt
        (Int.prime_iff_natAbs_prime.mpr (by norm_num)) hαint h H' hei
    let pB₁ : PowerBasis ℤ (NumberField.RingOfIntegers K) :=
      (Algebra.adjoin.powerBasis' hαint).map
        (IsIntegralClosure.equiv ℤ (Algebra.adjoin ℤ ({B.gen} : Set K)) K
          (NumberField.RingOfIntegers K))
    have hdim : pB₁.dim = B.dim := by
      rw [← PowerBasis.finrank, ← PowerBasis.finrank]
      exact NumberField.RingOfIntegers.rank K
    have hdiscK : NumberField.discr K = 5 := by
      apply (algebraMap ℤ ℚ).injective_int
      rw [← NumberField.discr_eq_discr _ pB₁.basis,
        ← Algebra.discr_localizationLocalization ℤ (nonZeroDivisors ℤ) K,
        show algebraMap ℤ ℚ 5 = 5 by norm_num, ← hdiscB,
        ← Algebra.discr_reindex _ _ (finCongr hdim)]
      congr 1
      ext i
      rw [Function.comp_apply, Module.Basis.localizationLocalization_apply, PowerBasis.coe_basis,
        PowerBasis.coe_basis]
      simp only [finCongr_symm, finCongr_apply, Fin.val_cast, map_pow]
      simp only [pB₁, PowerBasis.map_gen, Algebra.adjoin.powerBasis'_gen]
      rw [IsIntegralClosure.algebraMap_equiv]
      rfl
    -- K is totally real: one real place, and r₁ + 2 r₂ = 2
    have hreal : ∃ w : InfinitePlace K, w.IsReal := by
      refine ⟨InfinitePlace.mk (Complex.ofRealHom.comp (K.val : K →+* ℝ)), ?_⟩
      rw [InfinitePlace.isReal_mk_iff, ComplexEmbedding.isReal_iff]
      ext x
      simp [ComplexEmbedding.conjugate_coe_eq]
    have hnrC : InfinitePlace.nrComplexPlaces K = 0 := by
      have h1 := InfinitePlace.card_add_two_mul_card_eq_rank K
      rw [hfin] at h1
      have h2 : 0 < InfinitePlace.nrRealPlaces K := by
        classical
        obtain ⟨w, hw⟩ := hreal
        exact Fintype.card_pos_iff.mpr ⟨⟨w, hw⟩⟩
      omega
    exact ⟨nrComplexPlaces_eq_zero_iff.mp hnrC, hfin, hdiscK⟩)

/-! ## L:RZ-14b (legs (i) and (ii-arith); (ii-thm) CITED, NOT CHECKED) -/

/-- **L:RZ-14b (i)** — RZ §2.4, (2.8): the standard domain 𝒟 is a fundamental domain for the
modular group acting on ℍ (as its image in PGL(2, ℝ), so that −1 acts as 1), and vol(X(1)) — the
covolume of that action for the measure dx dy / y² — is π/3.

Served locus: §2.4 "π from the area", displays (2.8)–(2.9) and the clause between them, PDF p08
(printed folio 7). PDF sha256 prefix `2d5287e7`. -/
theorem rz_14b_vol_X1 :
    MeasureTheory.IsFundamentalDomain RZ.modularPGL ModularGroup.fd ∧
    MeasureTheory.covolume RZ.modularPGL ℍ = ENNReal.ofReal (Real.pi / 3) := by
  open scoped Pointwise in (
  -- every element of the image is mk (mapGL γ), acting on ℍ as γ does
  have hact : ∀ g : RZ.modularPGL, ∃ γ : SL(2, ℤ),
      (g : PGL(2, ℝ)) = Matrix.ProjGenLinGroup.mk (Matrix.SpecialLinearGroup.mapGL ℝ γ) ∧
      ∀ z : ℍ, g • z = (Matrix.SpecialLinearGroup.mapGL ℝ γ : GL (Fin 2) ℝ) • z := by
    rintro ⟨g, γ, rfl⟩
    refine ⟨γ, rfl, fun z => ?_⟩
    change (Matrix.ProjGenLinGroup.mk (Matrix.SpecialLinearGroup.mapGL ℝ γ)) • z = _
    rw [UpperHalfPlane.pglMk_smul]
  have hmp : ∀ g : RZ.modularPGL,
      MeasureTheory.MeasurePreserving (g • · : ℍ → ℍ)
        MeasureTheory.volume MeasureTheory.volume := by
    intro g
    obtain ⟨γ, -, hγ⟩ := hact g
    have : (g • · : ℍ → ℍ) = ((Matrix.SpecialLinearGroup.mapGL ℝ γ : GL (Fin 2) ℝ) • ·) :=
      funext hγ
    rw [this]
    exact MeasureTheory.measurePreserving_smul _ _
  have : MeasurableConstSMul RZ.modularPGL ℍ := ⟨fun g => (hmp g).measurable⟩
  have : MeasureTheory.SMulInvariantMeasure RZ.modularPGL ℍ MeasureTheory.volume :=
    ⟨fun g s hs => (hmp g).measure_preimage hs.nullMeasurableSet⟩
  have : Countable SL(2, ℤ) :=
    @Function.Injective.countable _ (Fin 2 → Fin 2 → ℤ) _
      (fun g : SL(2, ℤ) => ((g : Matrix (Fin 2) (Fin 2) ℤ) : Fin 2 → Fin 2 → ℤ))
      Subtype.val_injective
  have : Countable RZ.modularPGL := (Set.countable_range _).to_subtype
  -- the boundary 𝒟 \ 𝒟ᵒ is null: it lies on two vertical lines and the unit circle
  have hline : ∀ c : ℝ, MeasureTheory.volume {z : ℂ | z.re = c} = 0 := by
    intro c
    have hset : {z : ℂ | z.re = c}
        = Complex.measurableEquivRealProd ⁻¹' ({c} ×ˢ Set.univ) := by
      ext z
      simp [Complex.measurableEquivRealProd]
    rw [hset, Complex.volume_preserving_equiv_real_prod.measure_preimage
      ((measurableSet_singleton c).prod MeasurableSet.univ).nullMeasurableSet,
      MeasureTheory.Measure.volume_eq_prod, MeasureTheory.Measure.prod_prod,
      Real.volume_singleton, zero_mul]
  have hnull : MeasureTheory.volume (ModularGroup.fd \ ModularGroup.fdo) = 0 := by
    rw [UpperHalfPlane.volume_eq_lintegral]
    apply MeasureTheory.setLIntegral_measure_zero
    have hsub : UpperHalfPlane.coe '' (ModularGroup.fd \ ModularGroup.fdo)
        ⊆ ({z : ℂ | z.re = 1 / 2} ∪ {z : ℂ | z.re = -(1 / 2)}) ∪ Metric.sphere 0 1 := by
      rintro _ ⟨z, ⟨⟨h1, h2⟩, h3⟩, rfl⟩
      by_cases hn : 1 < Complex.normSq (z : ℂ)
      · have hre : |z.re| = 1 / 2 := by
          by_contra hne
          exact h3 ⟨hn, lt_of_le_of_ne h2 hne⟩
        left
        rcases abs_eq (by norm_num : (0 : ℝ) ≤ 1 / 2) |>.mp hre with h | h
        · left; exact h
        · right; exact h
      · right
        rw [mem_sphere_zero_iff_norm, Complex.norm_def]
        have : Complex.normSq (z : ℂ) = 1 := le_antisymm (not_lt.mp hn) h1
        rw [this, Real.sqrt_one]
    exact MeasureTheory.measure_mono_null hsub
      (MeasureTheory.measure_union_null (MeasureTheory.measure_union_null (hline _) (hline _))
        (MeasureTheory.Measure.addHaar_sphere _ _ _))
  have hfd : MeasureTheory.IsFundamentalDomain RZ.modularPGL ModularGroup.fd := by
    refine MeasureTheory.IsFundamentalDomain.mk''
      ModularGroup.isClosed_fd.measurableSet.nullMeasurableSet ?_ ?_
      (fun g => (hmp g).quasiMeasurePreserving)
    · refine Filter.Eventually.of_forall fun z => ?_
      obtain ⟨γ, hγ⟩ := ModularGroup.exists_smul_mem_fd z
      refine ⟨⟨Matrix.ProjGenLinGroup.mk (Matrix.SpecialLinearGroup.mapGL ℝ γ), γ, rfl⟩, ?_⟩
      change (Matrix.ProjGenLinGroup.mk (Matrix.SpecialLinearGroup.mapGL ℝ γ)) • z
        ∈ ModularGroup.fd
      rw [UpperHalfPlane.pglMk_smul]
      exact hγ
    · intro g hg
      obtain ⟨γ, hgγ, hγ⟩ := hact g
      have hsub : g • ModularGroup.fd ∩ ModularGroup.fd
          ⊆ g • (ModularGroup.fd \ ModularGroup.fdo) := by
        rintro _ ⟨⟨z, hz, rfl⟩, hw⟩
        refine ⟨z, ⟨hz, fun hzo => hg ?_⟩, rfl⟩
        have hw' : γ • z ∈ ModularGroup.fd := by
          have hw2 : g • z ∈ ModularGroup.fd := hw
          rw [hγ] at hw2
          exact hw2
        have hm1 : Matrix.SpecialLinearGroup.mapGL ℝ (-1 : SL(2, ℤ)) = -1 := by
          ext i j
          fin_cases i <;> fin_cases j <;> simp
        have hcen : (-1 : GL (Fin 2) ℝ) ∈ Subgroup.center (GL (Fin 2) ℝ) :=
          Subgroup.mem_center_iff.mpr fun h => by rw [mul_neg_one, neg_one_mul]
        apply Subtype.ext
        rw [hgγ]
        rcases ModularGroup.eq_one_or_neg_one_of_mem_fdo_mem_fd hzo hw' with h | h
        · rw [h, map_one, map_one]
          rfl
        · rw [h, hm1]
          rw [← Matrix.ProjGenLinGroup.ker_mk] at hcen
          exact hcen
      exact MeasureTheory.measure_mono_null hsub (by rw [MeasureTheory.measure_smul]; exact hnull)
  refine ⟨hfd, ?_⟩
  rw [hfd.covolume_eq_volume, rz_14a_area_fd])

/-- **L:RZ-14b (ii), arithmetic leg** — "the Gauss–Bonnet value for the (2, 3, ∞) orbifold":
χ(2, 3, ∞) = −1/6 and −2π·χ = π/3. The orbifold Gauss–Bonnet theorem (area = −2π·χ), applied to
X(1) with signature (0; 2, 3; 1), is CITED, NOT CHECKED.

Served locus: §2.4 "π from the area", the clause after display (2.8), PDF p08 (printed folio 7).
PDF sha256 prefix `2d5287e7`. -/
theorem rz_14b_gaussBonnet_value :
    orbEulerChar 0 [2, 3] 1 = -1 / 6 ∧
    -2 * Real.pi * (orbEulerChar 0 [2, 3] 1 : ℝ) = Real.pi / 3 := by
  have h : orbEulerChar 0 [2, 3] 1 = -1 / 6 := by
    norm_num [orbEulerChar]
  refine ⟨h, ?_⟩
  rw [h]
  push_cast
  ring

end RiemannZeta.Provenance
