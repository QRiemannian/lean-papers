import Mathlib

/-!
# Unit U4 (`RiemannZeta/MatricesMobius`) — proofs

The Solution module of unit U4 (paper *The Tetrahedral Structure of the Riemann Zeta Function*,
served PDF sha256 prefix `2d5287e7`). Per the CO's ruling (Comparator README §"How it works",
step 4) this module does NOT import `RiemannZeta.MatricesMobius.Challenge`: it imports `Mathlib`,
opens the same namespace, restates the Challenge's non-theorem declarations (the defs
`RZ.hypLaplacian`, `RZ.gaussMap`, `RZ.mayer`, `RZ.phiSq`, the instances `numberField_Q_sqrt2`,
`numberField_Q_sqrt5`, and the `open` lines) byte-identically, and proves each theorem it carries
under its Challenge name and statement text. Theorems of the Challenge that are not proved here
are absent from this module and listed under `statements_not_checked:` in `formalization.yaml`.
-/

open scoped MatrixGroups
open UpperHalfPlane

namespace RiemannZeta.MatricesMobius

/-! ## L:RZ-41a -/

/-- **L:RZ-41a** — RZ §7.1 table, Hyperbolic and Elliptic rows: for γ ∈ SL(2, ℤ), (i) hyperbolic
⇔ |tr γ| > 2 and elliptic ⇔ |tr γ| < 2; (ii) both types are conjugation-invariant ("Conjugacy
class"); (iii) a hyperbolic γ fixes no point of ℍ and exactly two points of ℝ ∪ {∞};
(iv) an elliptic γ fixes exactly one point of ℍ and none of ℝ ∪ {∞}.

Served locus: §7.1 "The key identification", the sentence introducing the table and its
Hyperbolic and Elliptic rows, PDF p17 (printed folio 16). PDF sha256 prefix `2d5287e7`. -/
theorem rz_41a_hyperbolic_elliptic (γ : SL(2, ℤ)) :
    let m : Matrix (Fin 2) (Fin 2) ℤ := γ
    let g : GL (Fin 2) ℝ := Matrix.SpecialLinearGroup.mapGL ℝ γ
    (m.IsHyperbolic ↔ 2 < |m.trace|) ∧ (m.IsElliptic ↔ |m.trace| < 2) ∧
    (∀ h : SL(2, ℤ),
       (((h * γ * h⁻¹ : SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic ↔ m.IsHyperbolic) ∧
       (((h * γ * h⁻¹ : SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ).IsElliptic ↔ m.IsElliptic)) ∧
    (m.IsHyperbolic →
       (∀ z : ℍ, γ • z ≠ z) ∧
       ∃ p q : OnePoint ℝ, p ≠ q ∧ ∀ c : OnePoint ℝ, g • c = c ↔ c = p ∨ c = q) ∧
    (m.IsElliptic →
       (∃! z : ℍ, γ • z = z) ∧ ∀ c : OnePoint ℝ, g • c ≠ c) := by
  intro m g
  have hm : m = (γ : Matrix (Fin 2) (Fin 2) ℤ) := rfl
  have hdetγ : m.det = 1 := γ.2
  have hdisc : ∀ k : SL(2, ℤ), (k : Matrix (Fin 2) (Fin 2) ℤ).discr
      = (k : Matrix (Fin 2) (Fin 2) ℤ).trace ^ 2 - 4 := by
    intro k
    rw [Matrix.discr_fin_two, k.2]
    ring
  have hconjtr : ∀ h : SL(2, ℤ),
      ((h * γ * h⁻¹ : SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ).trace = m.trace := by
    intro h
    rw [Matrix.SpecialLinearGroup.coe_mul, Matrix.SpecialLinearGroup.coe_mul,
      Matrix.trace_mul_comm, ← mul_assoc, ← Matrix.SpecialLinearGroup.coe_mul, inv_mul_cancel,
      Matrix.SpecialLinearGroup.coe_one, one_mul]
  -- the entries, over ℤ and over ℝ
  set a := m 0 0 with ha
  set b := m 0 1 with hb
  set c := m 1 0 with hc
  set d := m 1 1 with hd
  have hdetZ : a * d - b * c = 1 := by rw [← Matrix.det_fin_two]; exact hdetγ
  have htrZ : m.trace = a + d := Matrix.trace_fin_two m
  set A : ℝ := (a : ℝ) with hA
  set B : ℝ := (b : ℝ) with hB
  set C : ℝ := (c : ℝ) with hC
  set D : ℝ := (d : ℝ) with hD
  have hdetR : A * D - B * C = 1 := by rw [hA, hB, hC, hD]; exact_mod_cast hdetZ
  -- c = 0 forces |trace| = 2
  have hc0 : c = 0 → m.trace = 2 ∨ m.trace = -2 := by
    intro h0
    rw [h0, mul_zero, sub_zero] at hdetZ
    rcases Int.eq_one_or_neg_one_of_mul_eq_one' hdetZ with ⟨h1, h2⟩ | ⟨h1, h2⟩
    · left; rw [htrZ, h1, h2]; norm_num
    · right; rw [htrZ, h1, h2]; norm_num
  -- the action on ℍ, by coordinates
  have hfixH : ∀ z : ℍ, γ • z = z ↔
      (2 * C * z.re + D - A) * z.im = 0 ∧ C * (z.re ^ 2 - z.im ^ 2) + (D - A) * z.re - B = 0 := by
    intro z
    have hden : (C : ℂ) * (z : ℂ) + D ≠ 0 := by
      have h := UpperHalfPlane.denom_ne_zero (Matrix.SpecialLinearGroup.mapGL ℝ γ) z
      simpa [UpperHalfPlane.denom, hC, hD, hc, hd, hm] using h
    rw [UpperHalfPlane.ext_iff, UpperHalfPlane.coe_specialLinearGroup_apply]
    simp only [algebraMap_int_eq, eq_intCast]
    rw [show ((γ 0 0 : ℝ) : ℂ) = A from rfl, show ((γ 0 1 : ℝ) : ℂ) = B from rfl,
      show ((γ 1 0 : ℝ) : ℂ) = C from rfl, show ((γ 1 1 : ℝ) : ℂ) = D from rfl,
      div_eq_iff hden, Complex.ext_iff]
    simp only [Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im, Complex.ofReal_re,
      Complex.ofReal_im, UpperHalfPlane.coe_re, UpperHalfPlane.coe_im]
    constructor
    · rintro ⟨h1, h2⟩
      constructor <;> linarith
    · rintro ⟨h1, h2⟩
      constructor <;> linarith
  -- consequences of a fixed point in ℍ
  have hfixH' : ∀ z : ℍ, γ • z = z →
      2 * C * z.re + D - A = 0 ∧ 4 * C ^ 2 * z.im ^ 2 = 4 - (A + D) ^ 2 := by
    intro z hz
    obtain ⟨h1, h2⟩ := (hfixH z).mp hz
    have e1 : 2 * C * z.re + D - A = 0 :=
      (mul_eq_zero.mp h1).resolve_right (UpperHalfPlane.im_ne_zero z)
    refine ⟨e1, ?_⟩
    linear_combination (-4 * C) * h2 + 4 * hdetR + (2 * C * z.re + D - A) * e1
  -- the action on the boundary
  have hg : ∀ i j, (g : Matrix (Fin 2) (Fin 2) ℝ) i j = (m i j : ℝ) := by
    intro i j
    simp [g, hm]
  have hinf : g • (OnePoint.infty : OnePoint ℝ) = OnePoint.infty ↔ C = 0 := by
    rw [OnePoint.smul_infty_eq_self_iff, hg]
  have hfin : ∀ k : ℝ, g • (k : OnePoint ℝ) = (k : OnePoint ℝ) ↔
      C * k ^ 2 + (D - A) * k - B = 0 := by
    intro k
    rw [OnePoint.smul_some_eq_ite, hg, hg, hg, hg]
    split_ifs with h
    · simp only [OnePoint.infty_ne_coe, false_iff]
      intro h'
      have h1 : A * k + B = 0 := by linear_combination k * h - h'
      have : A * D - B * C = 0 := by linear_combination A * h - C * h1
      rw [hdetR] at this
      norm_num at this
    · rw [OnePoint.coe_eq_coe, div_eq_iff h]
      constructor <;> intro h' <;> linear_combination -h'
  have hquad : ∀ k : ℝ, C ≠ 0 → (C * k ^ 2 + (D - A) * k - B = 0 ↔
      (2 * C * k + D - A) ^ 2 = (A + D) ^ 2 - 4) := by
    intro k hC0
    constructor
    · intro h
      linear_combination (4 * C) * h - 4 * hdetR
    · intro h
      have h4 : (4 * C) * (C * k ^ 2 + (D - A) * k - B) = 0 := by
        linear_combination h + 4 * hdetR
      exact (mul_eq_zero.mp h4).resolve_left (mul_ne_zero four_ne_zero hC0)
  have hdiscm : m.discr = (a + d) ^ 2 - 4 := by rw [hm, hdisc γ, ← hm, htrZ]
  have hhypR : m.IsHyperbolic → 0 < (A + D) ^ 2 - 4 := by
    intro h
    rw [Matrix.IsHyperbolic, hdiscm] at h
    have h' : (0 : ℝ) < (((a + d) ^ 2 - 4 : ℤ) : ℝ) := by exact_mod_cast h
    push_cast at h'
    exact h'
  have hellR : m.IsElliptic → (A + D) ^ 2 - 4 < 0 := by
    intro h
    rw [Matrix.IsElliptic, hdiscm] at h
    have h' : (((a + d) ^ 2 - 4 : ℤ) : ℝ) < 0 := by exact_mod_cast h
    push_cast at h'
    exact h'
  have hCne : C = 0 → m.discr = 0 := by
    intro hC0
    have hc0' : c = 0 := by rw [hC] at hC0; exact_mod_cast hC0
    rw [hm, hdisc γ, ← hm]
    rcases hc0 hc0' with h2 | h2 <;> rw [h2] <;> norm_num
  have hhypC : m.IsHyperbolic → C ≠ 0 := by
    intro h hC0
    rw [Matrix.IsHyperbolic, hCne hC0] at h
    exact lt_irrefl _ h
  have hellC : m.IsElliptic → C ≠ 0 := by
    intro h hC0
    rw [Matrix.IsElliptic, hCne hC0] at h
    exact lt_irrefl _ h
  refine ⟨?_, ?_, ?_, ?_, ?_⟩
  · rw [Matrix.IsHyperbolic, hm, hdisc γ, ← hm, lt_abs]
    constructor
    · intro h
      by_contra h'
      push Not at h'
      nlinarith [h'.1, h'.2]
    · rintro (h | h) <;> nlinarith
  · rw [Matrix.IsElliptic, hm, hdisc γ, ← hm, abs_lt]
    constructor
    · intro h
      constructor <;> nlinarith
    · rintro ⟨h1, h2⟩
      nlinarith
  · intro h
    rw [Matrix.IsHyperbolic, Matrix.IsHyperbolic, Matrix.IsElliptic, Matrix.IsElliptic, hdisc,
      hm, hdisc γ, ← hm, hconjtr]
    exact ⟨Iff.rfl, Iff.rfl⟩
  · intro hh
    have hR := hhypR hh
    have hC0 := hhypC hh
    refine ⟨fun z hz => ?_, ?_⟩
    · obtain ⟨_, h2⟩ := hfixH' z hz
      nlinarith [sq_nonneg (C * z.im)]
    · set s := √((A + D) ^ 2 - 4) with hs
      have hs2 : s ^ 2 = (A + D) ^ 2 - 4 := Real.sq_sqrt hR.le
      have hspos : 0 < s := Real.sqrt_pos.mpr hR
      have h2C : 2 * C ≠ 0 := mul_ne_zero two_ne_zero hC0
      refine ⟨((A - D + s) / (2 * C) : ℝ), ((A - D - s) / (2 * C) : ℝ), ?_, ?_⟩
      · rw [Ne, OnePoint.coe_eq_coe, div_left_inj' h2C]
        intro h
        linarith
      · intro x
        refine OnePoint.rec ?_ (fun k => ?_) x
        · rw [hinf]
          simp [hC0, OnePoint.infty_ne_coe]
        · rw [hfin k, hquad k hC0, ← hs2, sq_eq_sq_iff_eq_or_eq_neg, OnePoint.coe_eq_coe,
            OnePoint.coe_eq_coe, eq_div_iff h2C, eq_div_iff h2C]
          constructor
          · rintro (h | h)
            · left; linarith
            · right; linarith
          · rintro (h | h)
            · left; linarith
            · right; linarith
  · intro he
    have hR := hellR he
    have hC0 := hellC he
    have h2C : 2 * C ≠ 0 := mul_ne_zero two_ne_zero hC0
    refine ⟨?_, ?_⟩
    · have hy : 0 < √(4 - (A + D) ^ 2) / (2 * |C|) :=
        div_pos (Real.sqrt_pos.mpr (by linarith)) (by positivity)
      let z0 : ℍ := ⟨⟨(A - D) / (2 * C), √(4 - (A + D) ^ 2) / (2 * |C|)⟩, hy⟩
      have hz0re : z0.re = (A - D) / (2 * C) := rfl
      have hz0im : z0.im = √(4 - (A + D) ^ 2) / (2 * |C|) := rfl
      have hz0fix : γ • z0 = z0 := by
        rw [hfixH, hz0re, hz0im]
        constructor
        · have : 2 * C * ((A - D) / (2 * C)) + D - A = 0 := by
            field_simp
            ring
          rw [this, zero_mul]
        · rw [div_pow (√(4 - (A + D) ^ 2)) (2 * |C|) 2, Real.sq_sqrt (by linarith), mul_pow,
            sq_abs]
          have : C * (((A - D) / (2 * C)) ^ 2 - (4 - (A + D) ^ 2) / (2 ^ 2 * C ^ 2)) +
              (D - A) * ((A - D) / (2 * C)) - B = (A * D - B * C - 1) / C := by
            field_simp
            ring
          rw [this, hdetR, sub_self, zero_div]
      refine ⟨z0, hz0fix, fun z hz => ?_⟩
      obtain ⟨e1, e2⟩ := hfixH' z hz
      obtain ⟨f1, f2⟩ := hfixH' z0 hz0fix
      have hre : z.re = z0.re := by
        apply mul_left_cancel₀ h2C
        linarith
      have him : z.im = z0.im := by
        have hsq' : z.im ^ 2 = z0.im ^ 2 := by
          have h4 : (4 * C ^ 2) * (z.im ^ 2 - z0.im ^ 2) = 0 := by linear_combination e2 - f2
          have := (mul_eq_zero.mp h4).resolve_left (by positivity)
          linarith
        exact (sq_eq_sq₀ z.im_pos.le z0.im_pos.le).mp hsq'
      apply UpperHalfPlane.ext
      apply Complex.ext
      · exact hre
      · exact him
    · intro x
      refine OnePoint.rec ?_ (fun k => ?_) x
      · rw [Ne, hinf]
        exact hC0
      · rw [Ne, hfin k, hquad k hC0]
        intro h
        nlinarith [sq_nonneg (2 * C * k + D - A)]

/-! ## L:RZ-41c (OUT-OF-Q5, pending the wall) -/

/-- **L:RZ-41c** — RZ §7.1 table, action column: hyperbolic elements are dilations along a
geodesic, elliptic elements rotations about a fixed point, read as SL(2, ℝ) normal forms
(conjugate to ±diag(λ, λ⁻¹) with λ > 1, resp. to a rotation with sin θ ≠ 0).
**OUT-OF-Q5 (pending the wall).**

Served locus: §7.1 table, "Action on ℍ" column, Hyperbolic and Elliptic rows, PDF p17 (printed
folio 16); the same words recur in §7.2, PDF p18. PDF sha256 prefix `2d5287e7`. -/
theorem rz_41c_normal_forms (γ : SL(2, ℤ)) :
    let m : Matrix (Fin 2) (Fin 2) ℤ := γ
    let γR : SL(2, ℝ) := Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ) γ
    (m.IsHyperbolic → ∃ h : SL(2, ℝ), ∃ lam : ℝ, 1 < lam ∧
       (((h * γR * h⁻¹ : SL(2, ℝ)) : Matrix (Fin 2) (Fin 2) ℝ) = !![lam, 0; 0, lam⁻¹] ∨
        ((h * γR * h⁻¹ : SL(2, ℝ)) : Matrix (Fin 2) (Fin 2) ℝ) = -!![lam, 0; 0, lam⁻¹])) ∧
    (m.IsElliptic → ∃ h : SL(2, ℝ), ∃ θ : ℝ, Real.sin θ ≠ 0 ∧
       ((h * γR * h⁻¹ : SL(2, ℝ)) : Matrix (Fin 2) (Fin 2) ℝ)
         = !![Real.cos θ, -Real.sin θ; Real.sin θ, Real.cos θ]) := by
  intro m γR
  have hm : m = (γ : Matrix (Fin 2) (Fin 2) ℤ) := rfl
  set a := m 0 0 with ha
  set b := m 0 1 with hb
  set c := m 1 0 with hc
  set d := m 1 1 with hd
  have hdetZ : a * d - b * c = 1 := by rw [← Matrix.det_fin_two]; exact γ.2
  set A : ℝ := (a : ℝ) with hA
  set B : ℝ := (b : ℝ) with hB
  set C : ℝ := (c : ℝ) with hC
  set D : ℝ := (d : ℝ) with hD
  have hdet : A * D - B * C = 1 := by rw [hA, hB, hC, hD]; exact_mod_cast hdetZ
  have hγR : (γR : Matrix (Fin 2) (Fin 2) ℝ) = !![A, B; C, D] := by
    ext i j
    fin_cases i <;> fin_cases j <;> rfl
  have hdiscm : m.discr = (a + d) ^ 2 - 4 := by
    rw [Matrix.discr_fin_two, Matrix.trace_fin_two, Matrix.det_fin_two, ← ha, ← hb, ← hc, ← hd,
      hdetZ]
    ring
  have hc0 : c = 0 → m.discr = 0 := by
    intro h0
    rw [hdiscm]
    rw [h0, mul_zero, sub_zero] at hdetZ
    rcases Int.eq_one_or_neg_one_of_mul_eq_one' hdetZ with ⟨h1, h2⟩ | ⟨h1, h2⟩ <;>
      rw [h1, h2] <;> norm_num
  have hCne : ∀ P : ℤ → Prop, (P 0 → False) → P m.discr → C ≠ 0 := by
    intro P hP h hC0
    have hc0' : c = 0 := by rw [hC] at hC0; exact_mod_cast hC0
    rw [hc0 hc0'] at h
    exact hP h
  -- conjugation to a diagonal form, from two roots of λ² − tλ + 1
  have hdiag : ∀ μ1 μ2 : ℝ, C ≠ 0 → μ1 ≠ μ2 → μ1 * μ2 = 1 →
      μ1 ^ 2 - (A + D) * μ1 + 1 = 0 → μ2 ^ 2 - (A + D) * μ2 + 1 = 0 →
      ∃ h : SL(2, ℝ), ((h * γR * h⁻¹ : SL(2, ℝ)) : Matrix (Fin 2) (Fin 2) ℝ)
        = !![μ1, 0; 0, μ2] := by
    intro μ1 μ2 hC0 hne hprod hμ1 hμ2
    have hδ : μ1 - μ2 ≠ 0 := sub_ne_zero.mpr hne
    set u := 1 / (C * (μ1 - μ2)) with hu_def
    have hu : u * C * (μ1 - μ2) = 1 := by
      rw [hu_def]
      field_simp
    let P : SL(2, ℝ) := ⟨!![(μ1 - D) * u, μ2 - D; u * C, C], by
      rw [Matrix.det_fin_two_of]
      linear_combination hu⟩
    let Dg : SL(2, ℝ) := ⟨!![μ1, 0; 0, μ2], by
      rw [Matrix.det_fin_two_of]
      linear_combination hprod⟩
    have hPD : γR * P = P * Dg := by
      apply Subtype.ext
      rw [Matrix.SpecialLinearGroup.coe_mul, Matrix.SpecialLinearGroup.coe_mul, hγR]
      change !![A, B; C, D] * !![(μ1 - D) * u, μ2 - D; u * C, C]
        = !![(μ1 - D) * u, μ2 - D; u * C, C] * !![μ1, 0; 0, μ2]
      rw [Matrix.mul_fin_two, Matrix.mul_fin_two]
      ext i j
      fin_cases i <;> fin_cases j <;>
        simp only [Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
          Matrix.empty_val', Matrix.cons_val_fin_one, Fin.zero_eta, Fin.isValue, Fin.mk_one]
      · linear_combination (-u) * hμ1 - u * hdet
      · linear_combination -hμ2 - hdet
      · ring
      · ring
    refine ⟨P⁻¹, ?_⟩
    rw [inv_inv, mul_assoc, hPD, ← mul_assoc, inv_mul_cancel, one_mul]
  refine ⟨?_, ?_⟩
  · intro hh
    have hC0 : C ≠ 0 := hCne (fun x => 0 < x) (lt_irrefl 0) hh
    have hR : 0 < (A + D) ^ 2 - 4 := by
      have h := hh
      rw [Matrix.IsHyperbolic, hdiscm] at h
      have h' : (0 : ℝ) < (((a + d) ^ 2 - 4 : ℤ) : ℝ) := by exact_mod_cast h
      push_cast at h'
      exact h'
    set s := √((A + D) ^ 2 - 4) with hs
    have hs2 : s ^ 2 = (A + D) ^ 2 - 4 := Real.sq_sqrt hR.le
    have hspos : 0 < s := Real.sqrt_pos.mpr hR
    have hroot : ∀ e : ℝ, e ^ 2 = 1 →
        ((A + D + e * s) / 2) ^ 2 - (A + D) * ((A + D + e * s) / 2) + 1 = 0 := by
      intro e he
      linear_combination (1 / 4) * e ^ 2 * hs2 + (1 / 4) * ((A + D) ^ 2 - 4) * he
    have hprod : (A + D + s) / 2 * ((A + D - s) / 2) = 1 := by
      linear_combination (-1 / 4) * hs2
    have htcase : 2 < A + D ∨ A + D < -2 := by
      by_contra hn
      push Not at hn
      nlinarith [hn.1, hn.2]
    rcases htcase with ht | ht
    · obtain ⟨h, hh'⟩ := hdiag ((A + D + s) / 2) ((A + D - s) / 2) hC0
        (by intro h; linarith) hprod (by simpa using hroot 1 (by norm_num))
        (by have := hroot (-1) (by norm_num); ring_nf at this ⊢; linarith)
      refine ⟨h, (A + D + s) / 2, by linarith, Or.inl ?_⟩
      rw [hh', ← eq_inv_of_mul_eq_one_right hprod]
    · obtain ⟨h, hh'⟩ := hdiag ((A + D - s) / 2) ((A + D + s) / 2) hC0
        (by intro h; linarith) (by linarith [hprod])
        (by have := hroot (-1) (by norm_num); ring_nf at this ⊢; linarith)
        (by simpa using hroot 1 (by norm_num))
      have hprod' : (s - (A + D)) / 2 * (-((A + D + s) / 2)) = 1 := by
        linear_combination hprod
      refine ⟨h, (s - (A + D)) / 2, by linarith, Or.inr ?_⟩
      rw [hh', ← eq_inv_of_mul_eq_one_right hprod']
      ext i j
      fin_cases i <;> fin_cases j <;>
        simp only [Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
          Matrix.empty_val', Matrix.cons_val_fin_one, Fin.zero_eta, Fin.isValue, Fin.mk_one,
          Matrix.neg_apply, neg_zero] <;> ring
  · intro he
    have hC0 : C ≠ 0 := hCne (fun x => x < 0) (lt_irrefl 0) he
    have hR : (A + D) ^ 2 - 4 < 0 := by
      have h := he
      rw [Matrix.IsElliptic, hdiscm] at h
      have h' : (((a + d) ^ 2 - 4 : ℤ) : ℝ) < 0 := by exact_mod_cast h
      push_cast at h'
      exact h'
    have hc0b1 : -1 < (A + D) / 2 := by nlinarith
    have hc0b2 : (A + D) / 2 < 1 := by nlinarith
    have h1c : 0 < 1 - ((A + D) / 2) ^ 2 := by nlinarith
    have hrot : ∀ σ : ℝ, σ ^ 2 = 1 - ((A + D) / 2) ^ 2 → 0 < σ / C →
        ∃ h : SL(2, ℝ), ((h * γR * h⁻¹ : SL(2, ℝ)) : Matrix (Fin 2) (Fin 2) ℝ)
          = !![(A + D) / 2, -σ; σ, (A + D) / 2] := by
      intro σ hσ hσC
      obtain ⟨α, hαpos, hα⟩ : ∃ α : ℝ, 0 < α ∧ α ^ 2 * C = σ :=
        ⟨√(σ / C), Real.sqrt_pos.mpr hσC, by rw [Real.sq_sqrt hσC.le]; field_simp⟩
      obtain ⟨w, hw⟩ : ∃ w : ℝ, α * w = 1 := ⟨α⁻¹, mul_inv_cancel₀ hαpos.ne'⟩
      obtain ⟨κ, hκ⟩ : ∃ κ : ℝ, C * κ = 1 := ⟨C⁻¹, mul_inv_cancel₀ hC0⟩
      let P : SL(2, ℝ) := ⟨!![α, (A - D) * w * κ / 2; 0, w], by
        rw [Matrix.det_fin_two_of]
        linear_combination hw⟩
      let R : SL(2, ℝ) := ⟨!![(A + D) / 2, -σ; σ, (A + D) / 2], by
        rw [Matrix.det_fin_two_of]
        linear_combination hσ⟩
      have hPR : γR * P = P * R := by
        apply Subtype.ext
        rw [Matrix.SpecialLinearGroup.coe_mul, Matrix.SpecialLinearGroup.coe_mul, hγR]
        change !![A, B; C, D] * !![α, (A - D) * w * κ / 2; 0, w]
          = !![α, (A - D) * w * κ / 2; 0, w] * !![(A + D) / 2, -σ; σ, (A + D) / 2]
        rw [Matrix.mul_fin_two, Matrix.mul_fin_two]
        ext i j
        fin_cases i <;> fin_cases j <;>
          simp only [Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
            Matrix.empty_val', Matrix.cons_val_fin_one, Fin.zero_eta, Fin.isValue, Fin.mk_one]
        · linear_combination ((A - D) / 2) * (-α * C * κ * hw - α * hκ + w * κ * hα)
        · have hE : α * C * (A * ((A - D) * w * κ / 2) + B * w
              - (α * -σ + (A - D) * w * κ / 2 * ((A + D) / 2))) = 0 := by
            linear_combination ((A - D) ^ 2 / 4 * C * κ + B * C) * hw + ((A - D) ^ 2 / 4) * hκ
              + σ * hα + hσ - hdet
          have h0 := (mul_eq_zero.mp hE).resolve_left (mul_ne_zero hαpos.ne' hC0)
          linear_combination h0
        · linear_combination (-C * α) * hw + w * hα
        · linear_combination ((A - D) * w / 2) * hκ
      refine ⟨P⁻¹, ?_⟩
      rw [inv_inv, mul_assoc, hPR, ← mul_assoc, inv_mul_cancel, one_mul]
    have hsq : √(1 - ((A + D) / 2) ^ 2) ^ 2 = 1 - ((A + D) / 2) ^ 2 := Real.sq_sqrt h1c.le
    have hsqpos : 0 < √(1 - ((A + D) / 2) ^ 2) := Real.sqrt_pos.mpr h1c
    rcases lt_or_gt_of_ne hC0 with hneg | hpos
    · obtain ⟨h, hh⟩ := hrot (-√(1 - ((A + D) / 2) ^ 2)) (by rw [neg_sq, hsq])
        (div_pos_of_neg_of_neg (by linarith) hneg)
      refine ⟨h, -Real.arccos ((A + D) / 2), ?_, ?_⟩
      · rw [Real.sin_neg, Real.sin_arccos]
        linarith
      · rw [hh, Real.cos_neg, Real.sin_neg, Real.cos_arccos hc0b1.le hc0b2.le, Real.sin_arccos]
    · obtain ⟨h, hh⟩ := hrot (√(1 - ((A + D) / 2) ^ 2)) hsq (div_pos hsqpos hpos)
      refine ⟨h, Real.arccos ((A + D) / 2), ?_, ?_⟩
      · rw [Real.sin_arccos]
        linarith
      · rw [hh, Real.cos_arccos hc0b1.le hc0b2.le, Real.sin_arccos]

/-! ## L:RZ-43 (legs 43a and 43b, both in scope) -/

/-- **L:RZ-43a** — RZ §7.2 "Elliptic → Harmonic": for SL(2, ℤ) the elliptic elements have orders
3, 4 and 6; the only element of order 2 is −I, central and not elliptic; the centre is {±1}
(so mathlib's PSL(2, ℤ) is the printed SL(2, ℤ)/{±I}); their images in PSL(2, ℤ) have orders
2 and 3.

Served locus: §7.2 "Verification of the mapping", paragraph "Elliptic → Harmonic", the first two
sentences after the lead, PDF p18 (printed folio 17). PDF sha256 prefix `2d5287e7`. -/
theorem rz_43a_elliptic_orders :
    {n : ℕ | ∃ γ : SL(2, ℤ), (γ : Matrix (Fin 2) (Fin 2) ℤ).IsElliptic ∧ orderOf γ = n}
      = {3, 4, 6} ∧
    (∀ γ : SL(2, ℤ), orderOf γ = 2 ↔ γ = -1) ∧
    ((-1 : SL(2, ℤ)) ∈ Subgroup.center SL(2, ℤ) ∧
      ¬ ((-1 : SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ).IsElliptic) ∧
    ((Subgroup.center SL(2, ℤ) : Set SL(2, ℤ)) = {1, -1}) ∧
    {n : ℕ | ∃ γ : SL(2, ℤ), (γ : Matrix (Fin 2) (Fin 2) ℤ).IsElliptic ∧
        orderOf (QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) γ) = n} = {2, 3} := by
  have hcen : ∀ g : SL(2, ℤ), g ∈ Subgroup.center SL(2, ℤ) ↔ g = 1 ∨ g = -1 := by
    intro g
    rw [Matrix.SpecialLinearGroup.mem_center_iff]
    constructor
    · rintro ⟨r, hr, hg⟩
      simp only [Fintype.card_fin] at hr
      have hr' : r * r = 1 := by rw [← sq]; exact hr
      rcases mul_self_eq_one_iff.mp hr' with rfl | rfl
      · left
        ext i j
        rw [← hg]
        simp
      · right
        ext i j
        rw [← hg, Matrix.SpecialLinearGroup.coe_neg]
        simp
    · rintro (rfl | rfl)
      · exact ⟨1, by norm_num, by simp⟩
      · exact ⟨-1, by norm_num, by rw [Matrix.SpecialLinearGroup.coe_neg]; simp⟩
  have htr1 : ∀ g : SL(2, ℤ), (g : Matrix (Fin 2) (Fin 2) ℤ).trace ≠ 2 → g ≠ 1 := by
    intro g hg h
    apply hg
    rw [h]
    simp
  have htrm1 : ∀ g : SL(2, ℤ), (g : Matrix (Fin 2) (Fin 2) ℤ).trace ≠ -2 → g ≠ -1 := by
    intro g hg h
    apply hg
    rw [h, Matrix.SpecialLinearGroup.coe_neg]
    norm_num
  have hq1 : ∀ g : SL(2, ℤ),
      QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) g = 1 ↔ g = 1 ∨ g = -1 := by
    intro g
    rw [QuotientGroup.mk'_apply, QuotientGroup.eq_one_iff, hcen]
  have hsq : ∀ (M : Matrix (Fin 2) (Fin 2) ℤ) (t : ℤ), M.det = 1 → M.trace = t →
      M * M = t • M - 1 := by
    intro M t hM ht
    rw [Matrix.det_fin_two] at hM
    rw [Matrix.trace_fin_two] at ht
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp only [Matrix.mul_apply, Fin.sum_univ_two, Matrix.sub_apply, Matrix.smul_apply,
        smul_eq_mul, Matrix.one_apply_eq, Matrix.one_apply_ne, ne_eq, Fin.zero_eta, Fin.mk_one,
        Fin.isValue, zero_ne_one, one_ne_zero, not_false_eq_true] <;>
      rw [← ht] <;> linarith
  have : Fact (Nat.Prime 3) := ⟨by norm_num⟩
  have hneg1 : (-1 : SL(2, ℤ)) ≠ 1 :=
    htr1 _ (by rw [Matrix.SpecialLinearGroup.coe_neg]; norm_num)
  have hell : ∀ γ : SL(2, ℤ), (γ : Matrix (Fin 2) (Fin 2) ℤ).IsElliptic →
      ((γ : Matrix (Fin 2) (Fin 2) ℤ).trace = 0 ∧ orderOf γ = 4 ∧
        orderOf (QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) γ) = 2) ∨
      ((γ : Matrix (Fin 2) (Fin 2) ℤ).trace = 1 ∧ orderOf γ = 6 ∧
        orderOf (QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) γ) = 3) ∨
      ((γ : Matrix (Fin 2) (Fin 2) ℤ).trace = -1 ∧ orderOf γ = 3 ∧
        orderOf (QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) γ) = 3) := by
    intro γ he
    have hdet : (γ : Matrix (Fin 2) (Fin 2) ℤ).det = 1 := γ.2
    have ht : (γ : Matrix (Fin 2) (Fin 2) ℤ).trace ^ 2 < 4 := by
      have h := he
      simp only [Matrix.IsElliptic, Matrix.discr_fin_two, hdet] at h
      linarith
    have hb1 : -1 ≤ (γ : Matrix (Fin 2) (Fin 2) ℤ).trace := by nlinarith
    have hb2 : (γ : Matrix (Fin 2) (Fin 2) ℤ).trace ≤ 1 := by nlinarith
    have hM2 := hsq (γ : Matrix (Fin 2) (Fin 2) ℤ) _ hdet rfl
    have hγ1 : γ ≠ 1 := htr1 γ (by omega)
    have hγm1 : γ ≠ -1 := htrm1 γ (by omega)
    have hqγ : QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) γ ≠ 1 := by
      rw [Ne, hq1]
      tauto
    have hqm1 : QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) (-1 : SL(2, ℤ)) = 1 :=
      (hq1 _).mpr (Or.inr rfl)
    rcases (by omega : (γ : Matrix (Fin 2) (Fin 2) ℤ).trace = 0 ∨
        (γ : Matrix (Fin 2) (Fin 2) ℤ).trace = 1 ∨
        (γ : Matrix (Fin 2) (Fin 2) ℤ).trace = -1) with h0 | h0 | h0
    · left
      rw [h0, zero_smul, zero_sub] at hM2
      have hg2 : γ ^ 2 = -1 := by
        apply Subtype.ext
        rw [Matrix.SpecialLinearGroup.coe_pow, pow_two, hM2, Matrix.SpecialLinearGroup.coe_neg,
          Matrix.SpecialLinearGroup.coe_one]
      refine ⟨h0, ?_, ?_⟩
      · have h := orderOf_eq_prime_pow (p := 2) (n := 1) (x := γ)
          (by rw [pow_one, hg2]; exact hneg1)
          (by rw [show 2 ^ (1 + 1) = 2 * 2 by norm_num, pow_mul, hg2]; simp)
        simpa using h
      · exact orderOf_eq_prime (by rw [← map_pow, hg2]; exact hqm1) hqγ
    · right; left
      rw [h0, one_smul] at hM2
      have hg3 : γ ^ 3 = -1 := by
        apply Subtype.ext
        rw [Matrix.SpecialLinearGroup.coe_pow, pow_succ, pow_two, hM2, sub_mul, one_mul, hM2,
          Matrix.SpecialLinearGroup.coe_neg, Matrix.SpecialLinearGroup.coe_one]
        abel
      have hg6 : γ ^ 6 = 1 := by
        rw [show 6 = 3 * 2 by norm_num, pow_mul, hg3]; simp
      have hg2 : γ ^ 2 ≠ 1 := by
        intro h
        apply hγm1
        rw [← hg3, pow_succ, h, one_mul]
      refine ⟨h0, ?_, ?_⟩
      · have hd : orderOf γ ∈ Nat.divisors 6 :=
          Nat.mem_divisors.mpr ⟨orderOf_dvd_of_pow_eq_one hg6, by norm_num⟩
        rw [show Nat.divisors 6 = {1, 2, 3, 6} by decide] at hd
        simp only [Finset.mem_insert, Finset.mem_singleton] at hd
        rcases hd with h | h | h | h
        · exact absurd (orderOf_eq_one_iff.mp h) hγ1
        · exact absurd (by have := pow_orderOf_eq_one γ; rwa [h] at this) hg2
        · exact absurd (by have := pow_orderOf_eq_one γ; rwa [h] at this) (by rw [hg3]; exact hneg1)
        · exact h
      · exact orderOf_eq_prime (by rw [← map_pow, hg3]; exact hqm1) hqγ
    · right; right
      rw [h0, _root_.neg_smul, one_smul] at hM2
      have hg3 : γ ^ 3 = 1 := by
        apply Subtype.ext
        rw [Matrix.SpecialLinearGroup.coe_pow, pow_succ, pow_two, hM2, sub_mul, neg_mul, one_mul,
          hM2, Matrix.SpecialLinearGroup.coe_one]
        abel
      refine ⟨h0, orderOf_eq_prime hg3 hγ1, ?_⟩
      exact orderOf_eq_prime (by rw [← map_pow, hg3, map_one]) hqγ
  let e4 : SL(2, ℤ) := ⟨!![0, -1; 1, 0], by norm_num [Matrix.det_fin_two_of]⟩
  let e6 : SL(2, ℤ) := ⟨!![0, -1; 1, 1], by norm_num [Matrix.det_fin_two_of]⟩
  let e3 : SL(2, ℤ) := ⟨!![-1, -1; 1, 0], by norm_num [Matrix.det_fin_two_of]⟩
  have he4 : (e4 : Matrix (Fin 2) (Fin 2) ℤ).IsElliptic ∧
      (e4 : Matrix (Fin 2) (Fin 2) ℤ).trace = 0 := by
    rw [show (e4 : Matrix (Fin 2) (Fin 2) ℤ) = !![0, -1; 1, 0] from rfl]
    simp only [Matrix.IsElliptic, Matrix.discr_fin_two, Matrix.trace_fin_two_of,
      Matrix.det_fin_two_of]
    norm_num
  have he6 : (e6 : Matrix (Fin 2) (Fin 2) ℤ).IsElliptic ∧
      (e6 : Matrix (Fin 2) (Fin 2) ℤ).trace = 1 := by
    rw [show (e6 : Matrix (Fin 2) (Fin 2) ℤ) = !![0, -1; 1, 1] from rfl]
    simp only [Matrix.IsElliptic, Matrix.discr_fin_two, Matrix.trace_fin_two_of,
      Matrix.det_fin_two_of]
    norm_num
  have he3 : (e3 : Matrix (Fin 2) (Fin 2) ℤ).IsElliptic ∧
      (e3 : Matrix (Fin 2) (Fin 2) ℤ).trace = -1 := by
    rw [show (e3 : Matrix (Fin 2) (Fin 2) ℤ) = !![-1, -1; 1, 0] from rfl]
    simp only [Matrix.IsElliptic, Matrix.discr_fin_two, Matrix.trace_fin_two_of,
      Matrix.det_fin_two_of]
    norm_num
  have o4 : orderOf e4 = 4 ∧ orderOf (QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) e4) = 2 := by
    rcases hell e4 he4.1 with ⟨_, h, h'⟩ | ⟨h, _⟩ | ⟨h, _⟩
    · exact ⟨h, h'⟩
    · rw [he4.2] at h; norm_num at h
    · rw [he4.2] at h; norm_num at h
  have o6 : orderOf e6 = 6 ∧ orderOf (QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) e6) = 3 := by
    rcases hell e6 he6.1 with ⟨h, _⟩ | ⟨_, h, h'⟩ | ⟨h, _⟩
    · rw [he6.2] at h; norm_num at h
    · exact ⟨h, h'⟩
    · rw [he6.2] at h; norm_num at h
  have o3 : orderOf e3 = 3 := by
    rcases hell e3 he3.1 with ⟨h, _⟩ | ⟨h, _⟩ | ⟨_, h, _⟩
    · rw [he3.2] at h; norm_num at h
    · rw [he3.2] at h; norm_num at h
    · exact h
  refine ⟨?_, ?_, ⟨(hcen _).mpr (Or.inr rfl), ?_⟩, ?_, ?_⟩
  · ext n
    simp only [Set.mem_ofPred_eq, Set.mem_insert_iff, Set.mem_singleton_iff]
    constructor
    · rintro ⟨γ, he, rfl⟩
      rcases hell γ he with ⟨_, h, _⟩ | ⟨_, h, _⟩ | ⟨_, h, _⟩ <;> omega
    · rintro (rfl | rfl | rfl)
      · exact ⟨e3, he3.1, o3⟩
      · exact ⟨e4, he4.1, o4.1⟩
      · exact ⟨e6, he6.1, o6.1⟩
  · intro γ
    constructor
    · intro h
      have hγ2 : γ ^ 2 = 1 := by have := pow_orderOf_eq_one γ; rwa [h] at this
      have hγ1 : γ ≠ 1 := by
        rintro rfl
        rw [orderOf_one] at h
        norm_num at h
      have hdet : (γ : Matrix (Fin 2) (Fin 2) ℤ).det = 1 := γ.2
      have hm : (γ : Matrix (Fin 2) (Fin 2) ℤ) * γ = 1 := by
        rw [← pow_two, ← Matrix.SpecialLinearGroup.coe_pow, hγ2, Matrix.SpecialLinearGroup.coe_one]
      rw [Matrix.det_fin_two] at hdet
      have e00 := congrFun (congrFun hm 0) 0
      have e01 := congrFun (congrFun hm 0) 1
      have e10 := congrFun (congrFun hm 1) 0
      simp only [Matrix.mul_apply, Fin.sum_univ_two, Matrix.one_apply_eq,
        Matrix.one_apply_ne, ne_eq, zero_ne_one, one_ne_zero, not_false_eq_true] at e00 e01 e10
      set a := (γ : Matrix (Fin 2) (Fin 2) ℤ) 0 0
      set b := (γ : Matrix (Fin 2) (Fin 2) ℤ) 0 1
      set c := (γ : Matrix (Fin 2) (Fin 2) ℤ) 1 0
      set d := (γ : Matrix (Fin 2) (Fin 2) ℤ) 1 1
      have had : a * (a + d) = 2 := by linarith
      have hs : a + d ≠ 0 := by
        intro h0
        rw [h0, mul_zero] at had
        norm_num at had
      have hb : b = 0 := by
        have : b * (a + d) = 0 := by linarith
        exact (mul_eq_zero.mp this).resolve_right hs
      have hc : c = 0 := by
        have : c * (a + d) = 0 := by linarith
        exact (mul_eq_zero.mp this).resolve_right hs
      have had1 : a * d = 1 := by rw [hb] at hdet; linarith
      rcases Int.eq_one_or_neg_one_of_mul_eq_one' had1 with ⟨ha, hd⟩ | ⟨ha, hd⟩
      · exact absurd (Matrix.SpecialLinearGroup.ext _ _ (fun i j => by
          fin_cases i <;> fin_cases j <;> simp [a, b, c, d, ha, hb, hc, hd] at *)) hγ1
      · apply Matrix.SpecialLinearGroup.ext
        intro i j
        rw [Matrix.SpecialLinearGroup.coe_neg]
        fin_cases i <;> fin_cases j <;>
          simp only [Fin.zero_eta, Fin.isValue, Fin.mk_one, Matrix.SpecialLinearGroup.coe_one,
            Matrix.neg_apply, Matrix.one_apply_eq, Matrix.one_apply_ne, ne_eq, zero_ne_one,
            one_ne_zero, not_false_eq_true, neg_zero, Int.reduceNeg] <;> assumption
    · rintro rfl
      exact orderOf_eq_prime (by simp) hneg1
  · rw [Matrix.SpecialLinearGroup.coe_neg]
    simp [Matrix.IsElliptic, Matrix.discr_fin_two, Matrix.det_fin_two]
  · ext g
    simp only [SetLike.mem_coe, hcen, Set.mem_insert_iff, Set.mem_singleton_iff]
  · ext n
    simp only [Set.mem_ofPred_eq, Set.mem_insert_iff, Set.mem_singleton_iff]
    constructor
    · rintro ⟨γ, he, rfl⟩
      rcases hell γ he with ⟨_, _, h⟩ | ⟨_, _, h⟩ | ⟨_, _, h⟩ <;> omega
    · rintro (rfl | rfl)
      · exact ⟨e4, he4.1, o4.2⟩
      · exact ⟨e6, he6.1, o6.2⟩

/-- **L:RZ-43b** — RZ §7.2 "Elliptic → Harmonic": the stabilizers of the two orbifold points in
PSL(2, ℤ) are ℤ/2 and ℤ/3, giving cone angles π and 2π/3 — angular deficits π and 4π/3.
(i) every point of ℍ whose SL(2, ℤ)-stabilizer is not inside the centre lies in the orbit of i
or of ρ, and these orbits are distinct; (ii) the PSL-images of the stabilizers of i and ρ are
ℤ/2 and ℤ/3; (iii) cone angle := 2π / order of the stabilizer, deficit := 2π − cone angle
(definitions, no metric fact). In scope under L:RZ-43.

Served locus: §7.2 "Verification of the mapping", paragraph "Elliptic → Harmonic", third
sentence, PDF p18 (printed folio 17). PDF sha256 prefix `2d5287e7`. -/
theorem rz_43b_orbifold_points :
    let q := QuotientGroup.mk' (Subgroup.center SL(2, ℤ))
    ((∀ z : ℍ, ¬ (MulAction.stabilizer SL(2, ℤ) z ≤ Subgroup.center SL(2, ℤ)) →
        ∃ g : SL(2, ℤ), g • z = I ∨ g • z = ρ) ∧
      ¬ ∃ g : SL(2, ℤ), g • I = ρ) ∧
    Nonempty ((MulAction.stabilizer SL(2, ℤ) I).map q ≃* Multiplicative (ZMod 2)) ∧
    Nonempty ((MulAction.stabilizer SL(2, ℤ) ρ).map q ≃* Multiplicative (ZMod 3)) ∧
    (2 * Real.pi / Nat.card ((MulAction.stabilizer SL(2, ℤ) I).map q) = Real.pi ∧
      2 * Real.pi / Nat.card ((MulAction.stabilizer SL(2, ℤ) ρ).map q) = 2 * Real.pi / 3 ∧
      2 * Real.pi - 2 * Real.pi / Nat.card ((MulAction.stabilizer SL(2, ℤ) I).map q) = Real.pi ∧
      2 * Real.pi - 2 * Real.pi / Nat.card ((MulAction.stabilizer SL(2, ℤ) ρ).map q)
        = 4 * Real.pi / 3) := by
  intro q
  have hcen : ∀ g : SL(2, ℤ), g ∈ Subgroup.center SL(2, ℤ) ↔ g = 1 ∨ g = -1 := by
    intro g
    rw [Matrix.SpecialLinearGroup.mem_center_iff]
    constructor
    · rintro ⟨r, hr, hg⟩
      simp only [Fintype.card_fin] at hr
      have hr' : r * r = 1 := by rw [← sq]; exact hr
      rcases mul_self_eq_one_iff.mp hr' with rfl | rfl
      · left
        ext i j
        rw [← hg]
        simp
      · right
        ext i j
        rw [← hg, Matrix.SpecialLinearGroup.coe_neg]
        simp
    · rintro (rfl | rfl)
      · exact ⟨1, by norm_num, by simp⟩
      · exact ⟨-1, by norm_num, by rw [Matrix.SpecialLinearGroup.coe_neg]; simp⟩
  have htr1 : ∀ g : SL(2, ℤ), (g : Matrix (Fin 2) (Fin 2) ℤ).trace ≠ 2 → g ≠ 1 := by
    intro g hg h
    apply hg
    rw [h]
    simp
  have htrm1 : ∀ g : SL(2, ℤ), (g : Matrix (Fin 2) (Fin 2) ℤ).trace ≠ -2 → g ≠ -1 := by
    intro g hg h
    apply hg
    rw [h, Matrix.SpecialLinearGroup.coe_neg]
    norm_num
  have hq1 : ∀ g : SL(2, ℤ),
      QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) g = 1 ↔ g = 1 ∨ g = -1 := by
    intro g
    rw [QuotientGroup.mk'_apply, QuotientGroup.eq_one_iff, hcen]
  have hsq : ∀ (M : Matrix (Fin 2) (Fin 2) ℤ) (t : ℤ), M.det = 1 → M.trace = t →
      M * M = t • M - 1 := by
    intro M t hM ht
    rw [Matrix.det_fin_two] at hM
    rw [Matrix.trace_fin_two] at ht
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp only [Matrix.mul_apply, Fin.sum_univ_two, Matrix.sub_apply, Matrix.smul_apply,
        smul_eq_mul, Matrix.one_apply_eq, Matrix.one_apply_ne, ne_eq, Fin.zero_eta, Fin.mk_one,
        Fin.isValue, zero_ne_one, one_ne_zero, not_false_eq_true] <;>
      rw [← ht] <;> linarith
  have : Fact (Nat.Prime 3) := ⟨by norm_num⟩
  have hneg1 : (-1 : SL(2, ℤ)) ≠ 1 :=
    htr1 _ (by rw [Matrix.SpecialLinearGroup.coe_neg]; norm_num)
  have hell : ∀ γ : SL(2, ℤ), (γ : Matrix (Fin 2) (Fin 2) ℤ).IsElliptic →
      ((γ : Matrix (Fin 2) (Fin 2) ℤ).trace = 0 ∧ orderOf γ = 4 ∧
        orderOf (QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) γ) = 2) ∨
      ((γ : Matrix (Fin 2) (Fin 2) ℤ).trace = 1 ∧ orderOf γ = 6 ∧
        orderOf (QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) γ) = 3) ∨
      ((γ : Matrix (Fin 2) (Fin 2) ℤ).trace = -1 ∧ orderOf γ = 3 ∧
        orderOf (QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) γ) = 3) := by
    intro γ he
    have hdet : (γ : Matrix (Fin 2) (Fin 2) ℤ).det = 1 := γ.2
    have ht : (γ : Matrix (Fin 2) (Fin 2) ℤ).trace ^ 2 < 4 := by
      have h := he
      simp only [Matrix.IsElliptic, Matrix.discr_fin_two, hdet] at h
      linarith
    have hb1 : -1 ≤ (γ : Matrix (Fin 2) (Fin 2) ℤ).trace := by nlinarith
    have hb2 : (γ : Matrix (Fin 2) (Fin 2) ℤ).trace ≤ 1 := by nlinarith
    have hM2 := hsq (γ : Matrix (Fin 2) (Fin 2) ℤ) _ hdet rfl
    have hγ1 : γ ≠ 1 := htr1 γ (by omega)
    have hγm1 : γ ≠ -1 := htrm1 γ (by omega)
    have hqγ : QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) γ ≠ 1 := by
      rw [Ne, hq1]
      tauto
    have hqm1 : QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) (-1 : SL(2, ℤ)) = 1 :=
      (hq1 _).mpr (Or.inr rfl)
    rcases (by omega : (γ : Matrix (Fin 2) (Fin 2) ℤ).trace = 0 ∨
        (γ : Matrix (Fin 2) (Fin 2) ℤ).trace = 1 ∨
        (γ : Matrix (Fin 2) (Fin 2) ℤ).trace = -1) with h0 | h0 | h0
    · left
      rw [h0, zero_smul, zero_sub] at hM2
      have hg2 : γ ^ 2 = -1 := by
        apply Subtype.ext
        rw [Matrix.SpecialLinearGroup.coe_pow, pow_two, hM2, Matrix.SpecialLinearGroup.coe_neg,
          Matrix.SpecialLinearGroup.coe_one]
      refine ⟨h0, ?_, ?_⟩
      · have h := orderOf_eq_prime_pow (p := 2) (n := 1) (x := γ)
          (by rw [pow_one, hg2]; exact hneg1)
          (by rw [show 2 ^ (1 + 1) = 2 * 2 by norm_num, pow_mul, hg2]; simp)
        simpa using h
      · exact orderOf_eq_prime (by rw [← map_pow, hg2]; exact hqm1) hqγ
    · right; left
      rw [h0, one_smul] at hM2
      have hg3 : γ ^ 3 = -1 := by
        apply Subtype.ext
        rw [Matrix.SpecialLinearGroup.coe_pow, pow_succ, pow_two, hM2, sub_mul, one_mul, hM2,
          Matrix.SpecialLinearGroup.coe_neg, Matrix.SpecialLinearGroup.coe_one]
        abel
      have hg6 : γ ^ 6 = 1 := by
        rw [show 6 = 3 * 2 by norm_num, pow_mul, hg3]; simp
      have hg2 : γ ^ 2 ≠ 1 := by
        intro h
        apply hγm1
        rw [← hg3, pow_succ, h, one_mul]
      refine ⟨h0, ?_, ?_⟩
      · have hd : orderOf γ ∈ Nat.divisors 6 :=
          Nat.mem_divisors.mpr ⟨orderOf_dvd_of_pow_eq_one hg6, by norm_num⟩
        rw [show Nat.divisors 6 = {1, 2, 3, 6} by decide] at hd
        simp only [Finset.mem_insert, Finset.mem_singleton] at hd
        rcases hd with h | h | h | h
        · exact absurd (orderOf_eq_one_iff.mp h) hγ1
        · exact absurd (by have := pow_orderOf_eq_one γ; rwa [h] at this) hg2
        · exact absurd (by have := pow_orderOf_eq_one γ; rwa [h] at this) (by rw [hg3]; exact hneg1)
        · exact h
      · exact orderOf_eq_prime (by rw [← map_pow, hg3]; exact hqm1) hqγ
    · right; right
      rw [h0, _root_.neg_smul, one_smul] at hM2
      have hg3 : γ ^ 3 = 1 := by
        apply Subtype.ext
        rw [Matrix.SpecialLinearGroup.coe_pow, pow_succ, pow_two, hM2, sub_mul, neg_mul, one_mul,
          hM2, Matrix.SpecialLinearGroup.coe_one]
        abel
      refine ⟨h0, orderOf_eq_prime hg3 hγ1, ?_⟩
      exact orderOf_eq_prime (by rw [← map_pow, hg3, map_one]) hqγ
  have hnegmul : ∀ g : SL(2, ℤ), -g = -1 * g := fun g =>
    Subtype.ext (by
      rw [Matrix.SpecialLinearGroup.coe_neg, Matrix.SpecialLinearGroup.coe_mul,
        Matrix.SpecialLinearGroup.coe_neg, Matrix.SpecialLinearGroup.coe_one, neg_one_mul])
  have hqm1 : QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) (-1 : SL(2, ℤ)) = 1 :=
    (hq1 _).mpr (Or.inr rfl)
  have hqneg : ∀ g : SL(2, ℤ), QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) (-g)
      = QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) g := by
    intro g
    rw [hnegmul, map_mul, hqm1, one_mul]
  have hSS : ModularGroup.S * ModularGroup.S = -1 :=
    Subtype.ext (by
      rw [Matrix.SpecialLinearGroup.coe_mul, ModularGroup.S_mul_S_eq,
        Matrix.SpecialLinearGroup.coe_neg, Matrix.SpecialLinearGroup.coe_one])
  have htrS : (ModularGroup.S : Matrix (Fin 2) (Fin 2) ℤ).trace = 0 := by
    rw [ModularGroup.coe_S, Matrix.trace_fin_two_of]
    norm_num
  have hqS : QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) ModularGroup.S ≠ 1 := by
    rw [Ne, hq1]
    rintro (h | h)
    · exact htr1 _ (by rw [htrS]; norm_num) h
    · exact htrm1 _ (by rw [htrS]; norm_num) h
  have hordS : orderOf (QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) ModularGroup.S) = 2 :=
    orderOf_eq_prime (by rw [← map_pow, pow_two, hSS]; exact hqm1) hqS
  have hstabI : (MulAction.stabilizer SL(2, ℤ) UpperHalfPlane.I).map
        (QuotientGroup.mk' (Subgroup.center SL(2, ℤ)))
      = Subgroup.zpowers (QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) ModularGroup.S) := by
    apply le_antisymm
    · rw [Subgroup.map_le_iff_le_comap]
      intro g hg
      rw [MulAction.mem_stabilizer_iff, ModularGroup.stabilizer_I] at hg
      rw [Subgroup.mem_comap]
      simp only [Finset.mem_insert, Finset.mem_singleton] at hg
      rcases hg with rfl | rfl | rfl | rfl
      · rw [map_one]; exact one_mem _
      · rw [hqm1]; exact one_mem _
      · exact Subgroup.mem_zpowers _
      · rw [hqneg]; exact Subgroup.mem_zpowers _
    · rw [Subgroup.zpowers_le]
      exact Subgroup.mem_map.mpr ⟨ModularGroup.S, MulAction.mem_stabilizer_iff.mpr
        (ModularGroup.stabilizer_I.mpr (by simp)), rfl⟩
  have hST : ((ModularGroup.S * ModularGroup.T : SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ)
      = !![0, -1; 1, 1] := by
    rw [Matrix.SpecialLinearGroup.coe_mul, ModularGroup.coe_S, ModularGroup.coe_T,
      Matrix.mul_fin_two]
    norm_num
  have hTS : ((ModularGroup.T⁻¹ * ModularGroup.S : SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ)
      = !![-1, -1; 1, 0] := by
    rw [Matrix.SpecialLinearGroup.coe_mul, ModularGroup.coe_S, ModularGroup.coe_T_inv,
      Matrix.mul_fin_two]
    norm_num
  have hST2 : (ModularGroup.S * ModularGroup.T) ^ 2 = ModularGroup.T⁻¹ * ModularGroup.S := by
    apply Subtype.ext
    rw [Matrix.SpecialLinearGroup.coe_pow, hST, hTS, pow_two, Matrix.mul_fin_two]
    norm_num
  have hordST : orderOf (q (ModularGroup.S * ModularGroup.T)) = 3 := by
    have he : ((ModularGroup.S * ModularGroup.T : SL(2, ℤ)) :
        Matrix (Fin 2) (Fin 2) ℤ).IsElliptic := by
      rw [hST]
      simp only [Matrix.IsElliptic, Matrix.discr_fin_two, Matrix.trace_fin_two_of,
        Matrix.det_fin_two_of]
      norm_num
    have ht : ((ModularGroup.S * ModularGroup.T : SL(2, ℤ)) :
        Matrix (Fin 2) (Fin 2) ℤ).trace = 1 := by
      rw [hST, Matrix.trace_fin_two_of]
      norm_num
    rcases hell _ he with ⟨h, _⟩ | ⟨_, _, h⟩ | ⟨h, _⟩
    · rw [ht] at h; norm_num at h
    · exact h
    · rw [ht] at h; norm_num at h
  have hstabρ : (MulAction.stabilizer SL(2, ℤ) ρ).map q
      = Subgroup.zpowers (q (ModularGroup.S * ModularGroup.T)) := by
    apply le_antisymm
    · rw [Subgroup.map_le_iff_le_comap]
      intro g hg
      rw [MulAction.mem_stabilizer_iff, ModularGroup.stabilizer_ρ] at hg
      rw [Subgroup.mem_comap]
      simp only [Finset.mem_insert, Finset.mem_singleton] at hg
      have hTSq : q (ModularGroup.T⁻¹ * ModularGroup.S)
          ∈ Subgroup.zpowers (q (ModularGroup.S * ModularGroup.T)) := by
        rw [← hST2, map_pow]
        exact Subgroup.pow_mem _ (Subgroup.mem_zpowers _) 2
      rcases hg with rfl | rfl | rfl | rfl | rfl | rfl
      · rw [map_one]; exact one_mem _
      · rw [hqm1]; exact one_mem _
      · exact Subgroup.mem_zpowers _
      · rw [hqneg]; exact Subgroup.mem_zpowers _
      · exact hTSq
      · rw [hqneg]; exact hTSq
    · rw [Subgroup.zpowers_le]
      exact Subgroup.mem_map.mpr ⟨ModularGroup.S * ModularGroup.T,
        MulAction.mem_stabilizer_iff.mpr (ModularGroup.stabilizer_ρ.mpr (by simp)), rfl⟩
  have hcardI : Nat.card ((MulAction.stabilizer SL(2, ℤ) I).map q) = 2 := by
    rw [hstabI, Nat.card_zpowers, hordS]
  have hcardρ : Nat.card ((MulAction.stabilizer SL(2, ℤ) ρ).map q) = 3 := by
    rw [hstabρ, Nat.card_zpowers, hordST]
  refine ⟨⟨?_, ?_⟩, ⟨mulEquivOfPrimeCardEq hcardI (by simp)⟩,
    ⟨mulEquivOfPrimeCardEq hcardρ (by simp)⟩, ?_⟩
  · intro z hz
    obtain ⟨g0, hg0⟩ := ModularGroup.exists_smul_mem_fd z
    rw [SetLike.le_def] at hz
    push Not at hz
    obtain ⟨h, hh, hhc⟩ := hz
    have hfix : (g0 * h * g0⁻¹) • (g0 • z) = g0 • z := by
      rw [mul_smul, mul_smul, inv_smul_smul, MulAction.mem_stabilizer_iff.mp hh]
    have hne : ¬ (g0 * h * g0⁻¹ = 1 ∨ g0 * h * g0⁻¹ = -1) := by
      have hm1 := (Subgroup.mem_center_iff.mp ((hcen (-1)).mpr (Or.inr rfl)))
      rintro (h1 | h1) <;> apply hhc <;> rw [hcen]
      · left
        calc h = g0⁻¹ * (g0 * h * g0⁻¹) * g0 := by group
          _ = 1 := by rw [h1]; group
      · right
        calc h = g0⁻¹ * (g0 * h * g0⁻¹) * g0 := by group
          _ = g0⁻¹ * -1 * g0 := by rw [h1]
          _ = g0⁻¹ * (g0 * -1) := by rw [mul_assoc, ← hm1 g0]
          _ = -1 := by rw [← mul_assoc, inv_mul_cancel, one_mul]
    by_contra hcon
    push Not at hcon
    have hρ' : g0 • z ≠ (1 : ℝ) +ᵥ ρ := by
      intro h1
      apply (hcon (ModularGroup.T⁻¹ * g0)).2
      rw [mul_smul, h1, ← UpperHalfPlane.modular_T_smul, inv_smul_smul]
    exact hne (ModularGroup.stabilizer_of_ne hg0 hfix (hcon g0).1 (hcon g0).2 hρ')
  · rintro ⟨g, hg⟩
    have hSI : ModularGroup.S • I = I := ModularGroup.stabilizer_I.mpr (by simp)
    have hfix : (g * ModularGroup.S * g⁻¹) • ρ = ρ := by
      rw [← hg, mul_smul, mul_smul, inv_smul_smul, hSI]
    have hmem := ModularGroup.stabilizer_ρ.mp hfix
    have htr : ((g * ModularGroup.S * g⁻¹ : SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ).trace = 0 := by
      rw [Matrix.SpecialLinearGroup.coe_mul, Matrix.SpecialLinearGroup.coe_mul,
        Matrix.trace_mul_comm, ← mul_assoc, ← Matrix.SpecialLinearGroup.coe_mul, inv_mul_cancel,
        Matrix.SpecialLinearGroup.coe_one, one_mul, htrS]
    simp only [Finset.mem_insert, Finset.mem_singleton] at hmem
    rcases hmem with h | h | h | h | h | h <;> rw [h] at htr
    · simp at htr
    · rw [Matrix.SpecialLinearGroup.coe_neg] at htr; norm_num at htr
    · rw [hST, Matrix.trace_fin_two_of] at htr; norm_num at htr
    · rw [Matrix.SpecialLinearGroup.coe_neg, hST, Matrix.trace_neg, Matrix.trace_fin_two_of] at htr
      norm_num at htr
    · rw [hTS, Matrix.trace_fin_two_of] at htr; norm_num at htr
    · rw [Matrix.SpecialLinearGroup.coe_neg, hTS, Matrix.trace_neg, Matrix.trace_fin_two_of] at htr
      norm_num at htr
  · rw [hcardI, hcardρ]
    push_cast
    refine ⟨by ring, by ring, by ring, by ring⟩

/-! ## L:RZ-53a — the definitions (8.1)–(8.3) -/

/-- RZ (8.1): the hyperbolic Laplacian Δ = −y²(∂²/∂x² + ∂²/∂y²), z = x + iy (L:RZ-53a). -/
noncomputable def RZ.hypLaplacian (f : ℂ → ℂ) (z : ℂ) : ℂ :=
  -((z.im : ℂ) ^ 2) *
    (iteratedFDeriv ℝ 2 f z ![1, 1] + iteratedFDeriv ℝ 2 f z ![Complex.I, Complex.I])

/-- RZ (8.2): the Gauss map T(x) = {1/x} (Lean's 0⁻¹ = 0 gives T 0 = 0) (L:RZ-53a). -/
noncomputable def RZ.gaussMap (x : ℝ) : ℝ := Int.fract x⁻¹

/-- RZ (8.3): ℒ_s f(x) = Σ_{n ≥ 1} (x + n)^{−2s} f(1/(x + n)) (as a `tsum`) (L:RZ-53a). -/
noncomputable def RZ.mayer (s : ℂ) (f : ℝ → ℂ) (x : ℝ) : ℂ :=
  ∑' n : ℕ, (((x + (n + 1) : ℝ) : ℂ) ^ (-2 * s)) * f (1 / (x + (n + 1)))

/-- **L:RZ-53a** — RZ (8.1)–(8.3) as the definitions `RZ.hypLaplacian`, `RZ.gaussMap`,
`RZ.mayer` above; the theorem is the typing printed with (8.2): T : [0, 1) → [0, 1).

Served locus: §8.1 display (8.1), PDF p20 (printed folio 19); §8.2 display (8.2), PDF p20;
display (8.3), PDF p21 (printed folio 20). PDF sha256 prefix `2d5287e7`. -/
theorem rz_53a_gaussMap_mapsTo :
    Set.MapsTo RZ.gaussMap (Set.Ico 0 1) (Set.Ico 0 1) := by
  intro x _
  exact ⟨Int.fract_nonneg _, Int.fract_lt_one _⟩

/-- **L:RZ-53a** (second theorem, the spec's optional identity) — the definition
`RZ.hypLaplacian` of (8.1) read through mathlib's Laplacian on ℂ: Δ_hyp f(z) = −(Im z)² · Δ f(z).
States the same definition through mathlib's operator, nothing new.

Served locus: §8.1 display (8.1), PDF p20 (printed folio 19). PDF sha256 prefix `2d5287e7`. -/
theorem rz_53a_hypLaplacian_eq (f : ℂ → ℂ) (z : ℂ) :
    RZ.hypLaplacian f z = -((z.im : ℂ) ^ 2) * Laplacian.laplacian f z := by
  rw [InnerProductSpace.laplacian_eq_iteratedFDeriv_complexPlane]
  rfl

/-! ## L:RZ-53c (OUT-OF-Q5, pending the wall) -/

/-- **L:RZ-53c** (C1) — RZ §8.2: the Gauss map generates the continued-fraction expansion, read
through mathlib's `GenContFract.IntFractPair.stream`: for v ∈ [0, 1) the stream starts at ⟨0, v⟩
and its (n + 1)-st term, when it exists, has integer part ⌊1/Tⁿ(v)⌋ and fractional part Tⁿ⁺¹(v).
**OUT-OF-Q5 (pending the wall).**

Served locus: §8.2, the sentence carrying (8.2) and (8.3), PDF p20–p21 (printed folios 19–20).
PDF sha256 prefix `2d5287e7`. -/
theorem rz_53c_gauss_generates_cf (v : ℝ) (hv : v ∈ Set.Ico (0 : ℝ) 1) :
    GenContFract.IntFractPair.stream v 0 = some ⟨0, v⟩ ∧
    ∀ (n : ℕ) (p : GenContFract.IntFractPair ℝ),
      GenContFract.IntFractPair.stream v (n + 1) = some p →
        p.b = ⌊(RZ.gaussMap^[n] v)⁻¹⌋ ∧ p.fr = RZ.gaussMap^[n + 1] v := by
  have hfr : ∀ (n : ℕ) (p : GenContFract.IntFractPair ℝ),
      GenContFract.IntFractPair.stream v n = some p → p.fr = RZ.gaussMap^[n] v := by
    intro n
    induction n with
    | zero =>
      intro p hp
      rw [GenContFract.IntFractPair.stream_zero, Option.some.injEq] at hp
      rw [← hp, Function.iterate_zero_apply]
      exact Int.fract_eq_self.mpr hv
    | succ n ih =>
      intro p hp
      obtain ⟨q, hq, _, rfl⟩ := GenContFract.IntFractPair.succ_nth_stream_eq_some_iff.mp hp
      rw [Function.iterate_succ_apply', ← ih q hq]
      rfl
  refine ⟨?_, ?_⟩
  · rw [GenContFract.IntFractPair.stream_zero]
    congr 1
    change (⟨⌊v⌋, Int.fract v⟩ : GenContFract.IntFractPair ℝ) = ⟨0, v⟩
    rw [Int.floor_eq_zero_iff.mpr hv, Int.fract_eq_self.mpr hv]
  · intro n p hp
    obtain ⟨q, hq, _, rfl⟩ := GenContFract.IntFractPair.succ_nth_stream_eq_some_iff.mp hp
    have h := hfr n q hq
    refine ⟨?_, ?_⟩
    · change ⌊q.fr⁻¹⌋ = _
      rw [h]
    · change Int.fract q.fr⁻¹ = _
      rw [Function.iterate_succ_apply', h]
      rfl

/-- **L:RZ-53c** (C2) — RZ §8.2: (8.3) is the transfer operator of T, with the weight
|T′|^{−s} (not printed; named as the reading): for x ∈ (0, 1), the preimages of x under T in
(0, 1) are the points 1/(x + n), n ≥ 1; T′(1/(x + n)) = −(x + n)²; and ℒ_s f(x) is the sum over
those preimages y of |T′(y)|^{−s} f(y). **OUT-OF-Q5 (pending the wall).**

Served locus: §8.2, the sentence carrying (8.2) and (8.3), PDF p21 (printed folio 20).
PDF sha256 prefix `2d5287e7`. -/
theorem rz_53c_mayer_is_transfer (s : ℂ) (f : ℝ → ℂ) (x : ℝ) (hx : x ∈ Set.Ioo (0 : ℝ) 1) :
    {y : ℝ | y ∈ Set.Ioo 0 1 ∧ RZ.gaussMap y = x} = Set.range (fun n : ℕ => 1 / (x + (n + 1))) ∧
    (∀ n : ℕ, HasDerivAt RZ.gaussMap (-(x + (n + 1)) ^ 2) (1 / (x + (n + 1)))) ∧
    RZ.mayer s f x =
      ∑' y : {y : ℝ // y ∈ Set.Ioo 0 1 ∧ RZ.gaussMap y = x},
        (((|deriv RZ.gaussMap y|) : ℝ) : ℂ) ^ (-s) * f y := by
  obtain ⟨hx0, hx1⟩ := hx
  have hpos : ∀ n : ℕ, 0 < x + ((n : ℝ) + 1) := fun n => by positivity
  have hmem : ∀ n : ℕ, (1 / (x + ((n : ℝ) + 1))) ∈ Set.Ioo (0 : ℝ) 1 ∧
      RZ.gaussMap (1 / (x + ((n : ℝ) + 1))) = x := by
    intro n
    refine ⟨⟨by have := hpos n; positivity, ?_⟩, ?_⟩
    · rw [div_lt_one (hpos n)]
      have : (0 : ℝ) ≤ n := Nat.cast_nonneg n
      linarith
    · unfold RZ.gaussMap
      rw [one_div, inv_inv, show x + ((n : ℝ) + 1) = x + ((n + 1 : ℕ) : ℝ) by push_cast; ring,
        Int.fract_add_natCast]
      exact Int.fract_eq_self.mpr ⟨hx0.le, hx1⟩
  have hset : {y : ℝ | y ∈ Set.Ioo 0 1 ∧ RZ.gaussMap y = x}
      = Set.range (fun n : ℕ => 1 / (x + (n + 1))) := by
    ext y
    simp only [Set.mem_ofPred_eq, Set.mem_range]
    constructor
    · rintro ⟨⟨hy0, hy1⟩, hT⟩
      have hinv : 1 < y⁻¹ := (one_lt_inv₀ hy0).mpr hy1
      have hm1 : (1 : ℤ) ≤ ⌊y⁻¹⌋ := Int.le_floor.mpr (by exact_mod_cast hinv.le)
      have hdec : y⁻¹ = (⌊y⁻¹⌋ : ℝ) + x := by
        rw [← hT]
        unfold RZ.gaussMap
        rw [Int.floor_add_fract]
      refine ⟨(⌊y⁻¹⌋ - 1).toNat, ?_⟩
      have hcast : (((⌊y⁻¹⌋ - 1).toNat : ℕ) : ℝ) + 1 = (⌊y⁻¹⌋ : ℝ) := by
        have h := Int.toNat_of_nonneg (by omega : (0 : ℤ) ≤ ⌊y⁻¹⌋ - 1)
        have h' : ((((⌊y⁻¹⌋ - 1).toNat : ℕ) : ℤ) : ℝ) = ((⌊y⁻¹⌋ - 1 : ℤ) : ℝ) := by rw [h]
        push_cast at h'
        linarith
      change 1 / (x + ((((⌊y⁻¹⌋ - 1).toNat : ℕ) : ℝ) + 1)) = y
      rw [hcast, add_comm, ← hdec, one_div, inv_inv]
    · rintro ⟨n, rfl⟩
      exact hmem n
  have hderiv : ∀ n : ℕ, HasDerivAt RZ.gaussMap (-(x + (n + 1)) ^ 2) (1 / (x + (n + 1))) := by
    intro n
    set N : ℝ := (n : ℝ) + 1 with hN
    have hy0 : (1 / (x + N)) ≠ 0 := by have := hpos n; positivity
    have hinv0 : (1 / (x + N))⁻¹ = x + N := by rw [one_div, inv_inv]
    have hev : RZ.gaussMap =ᶠ[nhds (1 / (x + N))] fun y => y⁻¹ - N := by
      have hU : Set.Ioo N (N + 1) ∈ nhds ((1 / (x + N))⁻¹) := by
        rw [hinv0]
        exact Ioo_mem_nhds (by linarith) (by linarith)
      filter_upwards [(continuousAt_inv₀ hy0).preimage_mem_nhds hU] with y hy
      simp only [Set.mem_preimage, Set.mem_Ioo] at hy
      unfold RZ.gaussMap
      have hfl : ⌊y⁻¹⌋ = (n : ℤ) + 1 := by
        rw [Int.floor_eq_iff]
        push_cast
        constructor <;> linarith [hy.1, hy.2]
      rw [← Int.self_sub_floor, hfl]
      push_cast
      ring
    have h := ((hasDerivAt_inv hy0).sub_const N).congr_of_eventuallyEq hev
    have hval : -((1 / (x + N)) ^ 2)⁻¹ = -(x + N) ^ 2 := by rw [one_div, inv_pow, inv_inv]
    rw [hval] at h
    exact h
  refine ⟨hset, hderiv, ?_⟩
  have hcp : ∀ r : ℝ, 0 < r → ((r ^ 2 : ℝ) : ℂ) ^ (-s) = ((r : ℝ) : ℂ) ^ (-2 * s) := by
    intro r hr
    rw [Complex.cpow_def_of_ne_zero (by exact_mod_cast (pow_pos hr 2).ne'),
      Complex.cpow_def_of_ne_zero (by exact_mod_cast hr.ne'),
      ← Complex.ofReal_log (pow_pos hr 2).le, ← Complex.ofReal_log hr.le, Real.log_pow]
    push_cast
    ring_nf
  have hinj : Function.Injective
      (fun n : ℕ => (⟨1 / (x + ((n : ℝ) + 1)), hmem n⟩ :
        {y : ℝ // y ∈ Set.Ioo 0 1 ∧ RZ.gaussMap y = x})) := by
    intro n m h
    simp only [Subtype.mk.injEq, one_div] at h
    have h' := inv_injective h
    exact_mod_cast (show (n : ℝ) = m by linarith)
  have hsurj : Function.Surjective
      (fun n : ℕ => (⟨1 / (x + ((n : ℝ) + 1)), hmem n⟩ :
        {y : ℝ // y ∈ Set.Ioo 0 1 ∧ RZ.gaussMap y = x})) := by
    rintro ⟨y, hy⟩
    have hy' : y ∈ {y : ℝ | y ∈ Set.Ioo 0 1 ∧ RZ.gaussMap y = x} := hy
    rw [hset] at hy'
    obtain ⟨n, rfl⟩ := hy'
    exact ⟨n, rfl⟩
  rw [RZ.mayer, ← (Equiv.ofBijective _ ⟨hinj, hsurj⟩).tsum_eq]
  congr 1
  funext n
  change _ = ((|deriv RZ.gaussMap (1 / (x + ((n : ℝ) + 1)))| : ℝ) : ℂ) ^ (-s) *
    f (1 / (x + ((n : ℝ) + 1)))
  rw [(hderiv n).deriv, abs_neg, abs_of_nonneg (sq_nonneg _), hcp _ (hpos n)]

/-! ## L:RZ-55 -/

open Real in
/-- **L:RZ-55** — RZ §8.3, (8.6)–(8.7): each Gauss-map branch is x ↦ 1/(x + n) (an inverse
branch of T on [0, 1)), given by (0 1; 1 n) acting on ℝ ∪ {∞}, of determinant −1, the
composition of STⁿ with the reflection x ↦ −x (reflection applied last, R·(S·Tⁿ)); even products
of branch matrices have determinant 1; the n = 1 fixed point is (−1 + √5)/2 = 1/φ; S² = −I, and
S has order 2 in PSL(2, ℤ), generating the stabilizer of i there.

Served locus: §8.3, displays (8.6)–(8.7) and the sentences around them, PDF p21–p22 (printed
folios 20–21). PDF sha256 prefix `2d5287e7`. -/
theorem rz_55_gauss_branches :
    (∀ n : ℕ, 0 < n → ∀ x ∈ Set.Ico (0 : ℝ) 1, Int.fract ((1 / (x + n))⁻¹) = x) ∧
    (∀ n : ℕ, 0 < n → ∀ x : ℝ, x + n ≠ 0 →
       (Matrix.GeneralLinearGroup.mkOfDetNeZero !![(0 : ℝ), 1; 1, n]
           (by simp [Matrix.det_fin_two_of])) •
         (x : OnePoint ℝ) = ((1 / (x + n) : ℝ) : OnePoint ℝ)) ∧
    (∀ n : ℕ, (!![0, 1; 1, (n : ℤ)]).det = -1) ∧
    (∀ n : ℕ, !![0, 1; 1, (n : ℤ)]
        = !![-1, 0; 0, 1] * ((ModularGroup.S : Matrix (Fin 2) (Fin 2) ℤ) *
            ((ModularGroup.T ^ (n : ℤ) : SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ))) ∧
    (∀ l : List ℕ, Even l.length →
       ((l.map fun n : ℕ => !![0, 1; 1, (n : ℤ)]).prod).det = 1) ∧
    ((∀ x : ℝ, x ≠ -1 → (x = 1 / (x + 1) ↔ x ^ 2 + x - 1 = 0)) ∧
     (∀ x ∈ Set.Ico (0 : ℝ) 1, x = 1 / (x + 1) ↔ x = (-1 + √5) / 2) ∧
     (-1 + √5) / 2 = Real.goldenRatio⁻¹) ∧
    (ModularGroup.S * ModularGroup.S = -1 ∧
     orderOf (QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) ModularGroup.S) = 2 ∧
     (MulAction.stabilizer SL(2, ℤ) UpperHalfPlane.I).map
         (QuotientGroup.mk' (Subgroup.center SL(2, ℤ)))
       = Subgroup.zpowers (QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) ModularGroup.S)) := by
  have hcen : ∀ g : SL(2, ℤ), g ∈ Subgroup.center SL(2, ℤ) ↔ g = 1 ∨ g = -1 := by
    intro g
    rw [Matrix.SpecialLinearGroup.mem_center_iff]
    constructor
    · rintro ⟨r, hr, hg⟩
      simp only [Fintype.card_fin] at hr
      have hr' : r * r = 1 := by rw [← sq]; exact hr
      rcases mul_self_eq_one_iff.mp hr' with rfl | rfl
      · left
        ext i j
        rw [← hg]
        simp
      · right
        ext i j
        rw [← hg, Matrix.SpecialLinearGroup.coe_neg]
        simp
    · rintro (rfl | rfl)
      · exact ⟨1, by norm_num, by simp⟩
      · exact ⟨-1, by norm_num, by rw [Matrix.SpecialLinearGroup.coe_neg]; simp⟩
  have htr1 : ∀ g : SL(2, ℤ), (g : Matrix (Fin 2) (Fin 2) ℤ).trace ≠ 2 → g ≠ 1 := by
    intro g hg h
    apply hg
    rw [h]
    simp
  have htrm1 : ∀ g : SL(2, ℤ), (g : Matrix (Fin 2) (Fin 2) ℤ).trace ≠ -2 → g ≠ -1 := by
    intro g hg h
    apply hg
    rw [h, Matrix.SpecialLinearGroup.coe_neg]
    norm_num
  have hq1 : ∀ g : SL(2, ℤ),
      QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) g = 1 ↔ g = 1 ∨ g = -1 := by
    intro g
    rw [QuotientGroup.mk'_apply, QuotientGroup.eq_one_iff, hcen]
  have hsq : ∀ (M : Matrix (Fin 2) (Fin 2) ℤ) (t : ℤ), M.det = 1 → M.trace = t →
      M * M = t • M - 1 := by
    intro M t hM ht
    rw [Matrix.det_fin_two] at hM
    rw [Matrix.trace_fin_two] at ht
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp only [Matrix.mul_apply, Fin.sum_univ_two, Matrix.sub_apply, Matrix.smul_apply,
        smul_eq_mul, Matrix.one_apply_eq, Matrix.one_apply_ne, ne_eq, Fin.zero_eta, Fin.mk_one,
        Fin.isValue, zero_ne_one, one_ne_zero, not_false_eq_true] <;>
      rw [← ht] <;> linarith
  have hnegmul : ∀ g : SL(2, ℤ), -g = -1 * g := fun g =>
    Subtype.ext (by
      rw [Matrix.SpecialLinearGroup.coe_neg, Matrix.SpecialLinearGroup.coe_mul,
        Matrix.SpecialLinearGroup.coe_neg, Matrix.SpecialLinearGroup.coe_one, neg_one_mul])
  have hqm1 : QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) (-1 : SL(2, ℤ)) = 1 :=
    (hq1 _).mpr (Or.inr rfl)
  have hqneg : ∀ g : SL(2, ℤ), QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) (-g)
      = QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) g := by
    intro g
    rw [hnegmul, map_mul, hqm1, one_mul]
  have hSS : ModularGroup.S * ModularGroup.S = -1 :=
    Subtype.ext (by
      rw [Matrix.SpecialLinearGroup.coe_mul, ModularGroup.S_mul_S_eq,
        Matrix.SpecialLinearGroup.coe_neg, Matrix.SpecialLinearGroup.coe_one])
  have htrS : (ModularGroup.S : Matrix (Fin 2) (Fin 2) ℤ).trace = 0 := by
    rw [ModularGroup.coe_S, Matrix.trace_fin_two_of]
    norm_num
  have hqS : QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) ModularGroup.S ≠ 1 := by
    rw [Ne, hq1]
    rintro (h | h)
    · exact htr1 _ (by rw [htrS]; norm_num) h
    · exact htrm1 _ (by rw [htrS]; norm_num) h
  have hordS : orderOf (QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) ModularGroup.S) = 2 :=
    orderOf_eq_prime (by rw [← map_pow, pow_two, hSS]; exact hqm1) hqS
  have hstabI : (MulAction.stabilizer SL(2, ℤ) UpperHalfPlane.I).map
        (QuotientGroup.mk' (Subgroup.center SL(2, ℤ)))
      = Subgroup.zpowers (QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) ModularGroup.S) := by
    apply le_antisymm
    · rw [Subgroup.map_le_iff_le_comap]
      intro g hg
      rw [MulAction.mem_stabilizer_iff, ModularGroup.stabilizer_I] at hg
      rw [Subgroup.mem_comap]
      simp only [Finset.mem_insert, Finset.mem_singleton] at hg
      rcases hg with rfl | rfl | rfl | rfl
      · rw [map_one]; exact one_mem _
      · rw [hqm1]; exact one_mem _
      · exact Subgroup.mem_zpowers _
      · rw [hqneg]; exact Subgroup.mem_zpowers _
    · rw [Subgroup.zpowers_le]
      exact Subgroup.mem_map.mpr ⟨ModularGroup.S, MulAction.mem_stabilizer_iff.mpr
        (ModularGroup.stabilizer_I.mpr (by simp)), rfl⟩
  have h5 : (√5 : ℝ) ^ 2 = 5 := Real.sq_sqrt (by norm_num)
  have h5p : (0 : ℝ) ≤ √5 := Real.sqrt_nonneg 5
  have hquad : ∀ x : ℝ, x ≠ -1 → (x = 1 / (x + 1) ↔ x ^ 2 + x - 1 = 0) := by
    intro x hx
    have hx1 : x + 1 ≠ 0 := fun h => hx (by linarith)
    rw [eq_div_iff hx1]
    constructor <;> intro h <;> linear_combination h
  refine ⟨?_, ?_, ?_, ?_, ?_, ⟨hquad, ?_, ?_⟩, ⟨hSS, hordS, hstabI⟩⟩
  · intro n _ x hx
    rw [one_div, inv_inv, Int.fract_add_natCast]
    exact Int.fract_eq_self.mpr hx
  · intro n _ x hx
    rw [OnePoint.smul_some_eq_ite]
    have hv : ∀ h, ((Matrix.GeneralLinearGroup.mkOfDetNeZero !![(0 : ℝ), 1; 1, (n : ℝ)] h :
        GL (Fin 2) ℝ) : Matrix (Fin 2) (Fin 2) ℝ) = !![0, 1; 1, (n : ℝ)] := fun _ => rfl
    have hx' : (1 : ℝ) * x + n ≠ 0 := by rwa [one_mul]
    simp only [hv, Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
      Matrix.empty_val', Matrix.cons_val_fin_one]
    rw [if_neg hx', zero_mul, zero_add, one_mul]
  · intro n
    rw [Matrix.det_fin_two_of]
    ring
  · intro n
    rw [ModularGroup.coe_S, ModularGroup.coe_T_zpow]
    ext i j
    fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]
  · have hdet : ∀ l : List ℕ,
        ((l.map fun n : ℕ => !![0, 1; 1, (n : ℤ)]).prod).det = (-1) ^ l.length := by
      intro l
      induction l with
      | nil => simp
      | cons a l ih =>
        rw [List.map_cons, List.prod_cons, Matrix.det_mul, ih, List.length_cons, pow_succ,
          Matrix.det_fin_two_of]
        ring
    intro l hl
    rw [hdet, hl.neg_one_pow]
  · intro x hx
    rw [hquad x (by linarith [hx.1])]
    constructor
    · intro h
      have key : (x - (-1 + √5) / 2) * (x - (-1 - √5) / 2) = 0 := by
        linear_combination h - (1 / 4) * h5
      rcases mul_eq_zero.mp key with h1 | h1
      · linarith
      · nlinarith [hx.1]
    · rintro rfl
      linear_combination (1 / 4) * h5
  · rw [Real.inv_goldenRatio, Real.goldenConj]
    ring

/-! ## L:RZ-63a -/

open Real in
/-- **L:RZ-63a** — RZ §9.5, (9.9a): for a hyperbolic element with trace t and multiplier λ
(|λ| > 1), √(t² − 4) = 2 sinh(ℓ/2) with ℓ = 2 log |λ|; at t = 3, σ = 4 log φ (σ the number),
√5 = 2 sinh(σ/2), so the geometry constant g_c = 1/(√5·π) equals 1/(2π sinh(σ/2)).

Served locus: §9.5, paragraph "The metric twin, and what it does not buy.", display (9.9a),
PDF p25 (printed folio 24); g_c = 1/(√5·π) from the abstract, PDF p02. PDF sha256 prefix
`2d5287e7`. -/
theorem rz_63a_sinh_identity :
    (∀ γ : SL(2, ℝ), (γ : Matrix (Fin 2) (Fin 2) ℝ).IsHyperbolic →
      ∀ lam : ℝ, lam ^ 2 - (γ : Matrix (Fin 2) (Fin 2) ℝ).trace * lam + 1 = 0 → 1 < |lam| →
        √((γ : Matrix (Fin 2) (Fin 2) ℝ).trace ^ 2 - 4)
          = 2 * Real.sinh ((2 * Real.log |lam|) / 2)) ∧
    (√((3 : ℝ) ^ 2 - 4) = √5 ∧
      (Real.goldenRatio ^ 2) ^ 2 - 3 * Real.goldenRatio ^ 2 + 1 = 0 ∧
      1 < Real.goldenRatio ^ 2 ∧
      2 * Real.log (Real.goldenRatio ^ 2) = 4 * Real.log Real.goldenRatio ∧
      √5 = 2 * Real.sinh ((4 * Real.log Real.goldenRatio) / 2)) ∧
    1 / (√5 * Real.pi) = 1 / (2 * Real.pi * Real.sinh ((4 * Real.log Real.goldenRatio) / 2)) := by
  have hφ1 : 1 < Real.goldenRatio := Real.one_lt_goldenRatio
  have hφ0 : 0 < Real.goldenRatio := Real.goldenRatio_pos
  have hφsq : Real.goldenRatio ^ 2 = Real.goldenRatio + 1 := Real.goldenRatio_sq
  have h5 : (0 : ℝ) ≤ 5 := by norm_num
  have hs5 : √5 = 2 * Real.goldenRatio - 1 := by
    rw [Real.goldenRatio]; ring
  have hsinh : √5 = 2 * Real.sinh ((4 * Real.log Real.goldenRatio) / 2) := by
    have h2 : (4 * Real.log Real.goldenRatio) / 2 = Real.log (Real.goldenRatio ^ 2) := by
      rw [Real.log_pow]; push_cast; ring
    have hm : (2 - Real.goldenRatio) * Real.goldenRatio ^ 2 = 1 := by nlinarith [hφsq]
    have hi : (Real.goldenRatio ^ 2)⁻¹ = 2 - Real.goldenRatio := (eq_inv_of_mul_eq_one_left hm).symm
    rw [h2, Real.sinh_log (by positivity), hs5, hi, hφsq]
    ring
  refine ⟨?_, ⟨?_, ?_, ?_, ?_, hsinh⟩, ?_⟩
  · intro γ _ lam hlam h1
    set t := (γ : Matrix (Fin 2) (Fin 2) ℝ).trace
    have ha : 0 < |lam| := lt_trans one_pos h1
    have hl : lam ≠ 0 := abs_pos.mp ha
    have hsq : |lam| ^ 2 = lam ^ 2 := sq_abs lam
    have hinv : |lam|⁻¹ < 1 := inv_lt_one_of_one_lt₀ h1
    have key : t ^ 2 - 4 = (|lam| - |lam|⁻¹) ^ 2 := by
      have ht : t = (lam ^ 2 + 1) / lam := by
        field_simp
        linarith
      rw [ht]
      field_simp
      rw [hsq]
      ring
    rw [show (2 * Real.log |lam|) / 2 = Real.log |lam| by ring, Real.sinh_log ha, key,
      Real.sqrt_sq (by linarith)]
    ring
  · norm_num
  · nlinarith [hφsq]
  · nlinarith [hφsq]
  · rw [Real.log_pow]; push_cast; ring
  · rw [show 2 * Real.pi * Real.sinh ((4 * Real.log Real.goldenRatio) / 2)
        = Real.pi * (2 * Real.sinh ((4 * Real.log Real.goldenRatio) / 2)) by ring, ← hsinh]
    ring

/-! ## L:RZ-63b (OUT-OF-Q5, pending the wall) -/

open Real in
/-- **L:RZ-63b** — RZ §9.5, (9.9a): with ℓ the hyperbolic translation length
τ(γ) = inf_z d(z, γz), √(t² − 4) = 2 sinh(ℓ/2); the systole of X(1) (the infimum of τ over
hyperbolic elements of SL(2, ℤ)) is 4 log φ, attained at an element of trace 3 (F² = (2 1; 1 1)).
**OUT-OF-Q5 (pending the wall)**; inherits L:RZ-05 and L:RZ-06b.

Served locus: §9.5, paragraph "The metric twin, and what it does not buy.", display (9.9a),
PDF p25 (printed folio 24). PDF sha256 prefix `2d5287e7`. -/
theorem rz_63b_geometric (τ : SL(2, ℝ) → ℝ)
    (hτ : ∀ γ, τ γ = ⨅ z : ℍ, dist z (γ • z)) :
    (∀ γ : SL(2, ℝ), (γ : Matrix (Fin 2) (Fin 2) ℝ).IsHyperbolic →
        √((γ : Matrix (Fin 2) (Fin 2) ℝ).trace ^ 2 - 4) = 2 * Real.sinh (τ γ / 2)) ∧
    (⨅ γ : {γ : SL(2, ℤ) // (γ : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic},
        τ (Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ) γ.1))
      = 4 * Real.log Real.goldenRatio ∧
    (∃ γ : SL(2, ℤ), (γ : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic ∧
        (γ : Matrix (Fin 2) (Fin 2) ℤ).trace = 3 ∧
        τ (Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ) γ)
          = 4 * Real.log Real.goldenRatio) := by
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
  let F2 : SL(2, ℤ) := ⟨!![2, 1; 1, 1], by norm_num [Matrix.det_fin_two_of]⟩
  have hF2tr : (F2 : Matrix (Fin 2) (Fin 2) ℤ).trace = 3 := by
    change (!![2, 1; 1, 1] : Matrix (Fin 2) (Fin 2) ℤ).trace = 3
    rw [Matrix.trace_fin_two_of]
    norm_num
  have hF2hyp : (F2 : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic := by
    rw [hdiscZ, hF2tr]
    norm_num
  have hF2τ : τ (Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ) F2)
      = 4 * Real.log Real.goldenRatio := by
    rw [hτZ F2 hF2hyp, hF2tr, ← hφ]
    norm_num
  refine ⟨fun γ hγ => ?_, ?_, ⟨F2, hF2hyp, hF2tr, hF2τ⟩⟩
  · rw [hlen γ hγ, mul_div_cancel_left₀ _ two_ne_zero, Real.sinh_arsinh]
    ring
  · have : Nonempty {γ : SL(2, ℤ) // (γ : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic} :=
      ⟨⟨F2, hF2hyp⟩⟩
    apply le_antisymm
    · exact (ciInf_le ⟨4 * Real.log Real.goldenRatio, by
        rintro _ ⟨⟨γ, hγ⟩, rfl⟩
        exact hlower γ hγ⟩ ⟨F2, hF2hyp⟩).trans hF2τ.le
    · exact le_ciInf fun γ => hlower γ.1 γ.2

/-! ## L:RZ-64a -/

open Real in
/-- **L:RZ-64a** — RZ §9.5: at Γ(2) the minimal hyperbolic trace is t = 6 (read with |t|, since
−I ∈ Γ(2)), giving √(t² − 4) = √32; the multiplier of trace 6 is 3 + 2√2.

Served locus: §9.5, the sentence after display (9.9a), PDF p25 (printed folio 24). PDF sha256
prefix `2d5287e7`. -/
theorem rz_64a_gamma2_min_trace :
    (∃ γ ∈ CongruenceSubgroup.Gamma 2,
        (γ : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic ∧ (γ : Matrix (Fin 2) (Fin 2) ℤ).trace = 6) ∧
    (∀ γ ∈ CongruenceSubgroup.Gamma 2, (γ : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic →
        6 ≤ |(γ : Matrix (Fin 2) (Fin 2) ℤ).trace|) ∧
    √((6 : ℝ) ^ 2 - 4) = √32 ∧
    ((3 + 2 * √2 : ℝ) ^ 2 - 6 * (3 + 2 * √2) + 1 = 0 ∧ (1 : ℝ) < 3 + 2 * √2) := by
  have h2 : (√2 : ℝ) ^ 2 = 2 := Real.sq_sqrt (by norm_num)
  have h2p : (0 : ℝ) ≤ √2 := Real.sqrt_nonneg 2
  refine ⟨?_, ?_, ?_, ?_, ?_⟩
  · let g : SL(2, ℤ) := ⟨!![1, 2; 2, 5], by norm_num [Matrix.det_fin_two_of]⟩
    have hg : (g : Matrix (Fin 2) (Fin 2) ℤ) = !![1, 2; 2, 5] := rfl
    refine ⟨g, ?_, ?_, ?_⟩
    · rw [CongruenceSubgroup.Gamma_mem, hg]
      simp only [Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
        Matrix.empty_val', Matrix.cons_val_fin_one]
      decide
    · simp only [hg, Matrix.IsHyperbolic, Matrix.discr_fin_two, Matrix.trace_fin_two_of,
        Matrix.det_fin_two_of]
      norm_num
    · simp only [hg, Matrix.trace_fin_two_of]
      norm_num
  · intro γ hγ hhyp
    rw [CongruenceSubgroup.Gamma_mem] at hγ
    obtain ⟨ha, hb, hc, hd⟩ := hγ
    have hdet := γ.2
    rw [Matrix.det_fin_two] at hdet
    simp only [Matrix.IsHyperbolic, Matrix.discr_fin_two, Matrix.trace_fin_two, Matrix.det_fin_two]
      at hhyp ⊢
    set a := (γ : Matrix (Fin 2) (Fin 2) ℤ) 0 0
    set b := (γ : Matrix (Fin 2) (Fin 2) ℤ) 0 1
    set c := (γ : Matrix (Fin 2) (Fin 2) ℤ) 1 0
    set d := (γ : Matrix (Fin 2) (Fin 2) ℤ) 1 1
    have ha' : (2 : ℤ) ∣ a - 1 := by
      have := (ZMod.intCast_zmod_eq_zero_iff_dvd (a - 1) 2).mp (by push_cast [ha]; ring)
      exact_mod_cast this
    have hd' : (2 : ℤ) ∣ d - 1 := by
      have := (ZMod.intCast_zmod_eq_zero_iff_dvd (d - 1) 2).mp (by push_cast [hd]; ring)
      exact_mod_cast this
    have hb' : (2 : ℤ) ∣ b := by
      have := (ZMod.intCast_zmod_eq_zero_iff_dvd b 2).mp hb
      exact_mod_cast this
    have hc' : (2 : ℤ) ∣ c := by
      have := (ZMod.intCast_zmod_eq_zero_iff_dvd c 2).mp hc
      exact_mod_cast this
    obtain ⟨k, hk⟩ := ha'
    obtain ⟨l, hl⟩ := hd'
    obtain ⟨m, hm⟩ := hb'
    obtain ⟨n, hn⟩ := hc'
    have ha2 : a = 2 * k + 1 := by omega
    have hd2 : d = 2 * l + 1 := by omega
    rw [ha2, hd2, hm, hn] at hdet hhyp
    rw [ha2, hd2]
    have hkl : 2 * (k * l) + k + l = 2 * (m * n) := by linarith
    have hpar : (k + l) % 2 = 0 := by omega
    have hgt : 2 * k + 1 + (2 * l + 1) > 2 ∨ 2 * k + 1 + (2 * l + 1) < -2 := by
      by_contra hne
      push Not at hne
      nlinarith
    rcases abs_cases (2 * k + 1 + (2 * l + 1)) with ⟨h, _⟩ | ⟨h, _⟩ <;> rw [h] <;> omega
  · norm_num
  · nlinarith
  · nlinarith

/-! ## L:RZ-64b, L:RZ-64c (OUT-OF-Q5, pending the wall) -/

open IntermediateField in
/-- ℚ(√2) ⊂ ℝ is a number field: √2 is integral over ℚ (a root of X² − 2), so ℚ⟮√2⟯ is
finite-dimensional over ℚ. The instance L:RZ-64b's spec asks `Challenge.lean` to supply, so that
the statement is not conditional on it. -/
instance numberField_Q_sqrt2 : NumberField ℚ⟮(√2 : ℝ)⟯ where
  to_finiteDimensional := IntermediateField.adjoin.finiteDimensional
    (IsIntegral.of_pow (n := 2) (by norm_num)
      (by
        rw [Real.sq_sqrt (by norm_num)]
        simpa using isIntegral_algebraMap (R := ℚ) (A := ℝ) (x := 2)))

open IntermediateField in
/-- ℚ(√5) ⊂ ℝ is a number field: √5 is integral over ℚ (a root of X² − 5). The instance
L:RZ-64c's spec asks `Challenge.lean` to supply. -/
instance numberField_Q_sqrt5 : NumberField ℚ⟮(√5 : ℝ)⟯ where
  to_finiteDimensional := IntermediateField.adjoin.finiteDimensional
    (IsIntegral.of_pow (n := 2) (by norm_num)
      (by
        rw [Real.sq_sqrt (by norm_num)]
        simpa using isIntegral_algebraMap (R := ℚ) (A := ℝ) (x := 5)))

open IntermediateField in
/-- **L:RZ-64b** — RZ §9.5: the quadratic field of the multiplier 3 + 2√2 is ℚ(√2) (as
intermediate fields of ℝ/ℚ), with d_K = 8 (√d_K = √8). **OUT-OF-Q5 (pending the wall)**; rides
L:RZ-13.

Served locus: §9.5, the sentence after display (9.9a), PDF p25 (printed folio 24). PDF sha256
prefix `2d5287e7`. -/
theorem rz_64b_disc_Q_sqrt2 :
    ℚ⟮((3 + 2 * √2 : ℝ))⟯ = ℚ⟮(√2 : ℝ)⟯ ∧ NumberField.discr ℚ⟮(√2 : ℝ)⟯ = 8 := by
  have hs : (√2 : ℝ) ∈ ℚ⟮(√2 : ℝ)⟯ := mem_adjoin_simple_self ℚ _
  refine ⟨?_, ?_⟩
  · apply le_antisymm
    · rw [IntermediateField.adjoin_simple_le_iff]
      exact add_mem (by simp) (mul_mem (by simp) hs)
    · rw [IntermediateField.adjoin_simple_le_iff]
      have ht : ((3 + 2 * √2 : ℝ)) ∈ ℚ⟮((3 + 2 * √2 : ℝ))⟯ := mem_adjoin_simple_self ℚ _
      have hmem : ((3 + 2 * √2 : ℝ) - 3) / 2 ∈ ℚ⟮((3 + 2 * √2 : ℝ))⟯ :=
        div_mem (sub_mem ht (by simp)) (by simp)
      rw [show ((3 + 2 * √2 : ℝ) - 3) / 2 = √2 by ring] at hmem
      exact hmem
  · open Polynomial in (
    have h2 : (√2 : ℝ) ^ 2 = 2 := Real.sq_sqrt (by norm_num)
    have hirr : ∀ b : ℚ, b ^ 2 ≠ 2 := by
      intro b hb
      have hb' : ((b : ℝ)) ^ 2 = 2 := by exact_mod_cast hb
      have : (√2 : ℝ) = |(b : ℝ)| := by rw [← hb', Real.sqrt_sq_eq_abs]
      exact irrational_sqrt_two ⟨|b|, by rw [this]; push_cast; rfl⟩
    have hmin : minpoly ℚ (√2 : ℝ) = X ^ 2 - C 2 := by
      refine (minpoly.eq_of_irreducible_of_monic
        (X_pow_sub_C_irreducible_of_prime Nat.prime_two hirr) ?_
        (monic_X_pow_sub_C _ two_ne_zero)).symm
      simp [h2]
    have hint : IsIntegral ℚ (√2 : ℝ) := by
      refine ⟨X ^ 2 - C 2, monic_X_pow_sub_C _ two_ne_zero, ?_⟩
      simp [h2]
    set K := ℚ⟮(√2 : ℝ)⟯ with hK
    let B : PowerBasis ℚ K := IntermediateField.adjoin.powerBasis hint
    have hBgen : B.gen = AdjoinSimple.gen ℚ (√2 : ℝ) := rfl
    have hminK : minpoly ℚ B.gen = X ^ 2 - C 2 := (minpoly_gen ℚ (√2 : ℝ)).trans hmin
    have hBdim : B.dim = 2 := by
      rw [← B.natDegree_minpoly, hminK, natDegree_X_pow_sub_C]
    have hgen2 : B.gen ^ 2 = 2 := by
      apply Subtype.ext
      rw [hBgen]
      push_cast
      simp only [AdjoinSimple.coe_gen, h2]
      norm_cast
    have hαint : IsIntegral ℤ B.gen := by
      refine ⟨X ^ 2 - C 2, monic_X_pow_sub_C _ two_ne_zero, ?_⟩
      rw [eval₂_sub, eval₂_X_pow, eval₂_C, hgen2]
      norm_num
    have hminZ : minpoly ℤ B.gen = X ^ 2 - C 2 := by
      apply Polynomial.map_injective (algebraMap ℤ ℚ) (algebraMap ℤ ℚ).injective_int
      rw [← minpoly.isIntegrallyClosed_eq_field_fractions' ℚ hαint, hminK]
      simp only [Polynomial.map_sub, Polynomial.map_pow, map_X, map_C]
      rfl
    have hei : (minpoly ℤ B.gen).IsEisensteinAt (Submodule.span ℤ {(2 : ℤ)}) := by
      rw [hminZ]
      refine ⟨?_, ?_, ?_⟩
      · rw [(monic_X_pow_sub_C (2 : ℤ) two_ne_zero).leadingCoeff, Ideal.mem_span_singleton]
        decide
      · intro n hn
        rw [natDegree_X_pow_sub_C] at hn
        rw [Ideal.mem_span_singleton]
        interval_cases n <;> simp
      · rw [pow_two, Ideal.span_singleton_mul_span_singleton, Ideal.mem_span_singleton]
        simp
    have hdiscB : Algebra.discr ℚ B.basis = 8 := by
      have hder : aeval B.gen (derivative (X ^ 2 - C (2 : ℚ))) = algebraMap ℚ K 2 * B.gen := by
        rw [derivative_sub, derivative_X_pow, derivative_C, sub_zero]
        simp
      have hnorm : Algebra.norm ℚ B.gen = -2 := by
        rw [Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly, hBdim, hminK]
        simp
      rw [Algebra.discr_powerBasis_eq_norm, B.finrank, hBdim, hminK, hder, map_mul,
        Algebra.norm_algebraMap, B.finrank, hBdim, hnorm]
      norm_num
    have hclos : IsIntegralClosure (Algebra.adjoin ℤ ({B.gen} : Set K)) ℤ K := by
      refine ⟨Subtype.val_injective, @fun x => ⟨fun h => ⟨⟨x, ?_⟩, rfl⟩, ?_⟩⟩
      swap
      · rintro ⟨y, rfl⟩
        exact IsIntegral.algebraMap
          ((le_integralClosure_iff_isIntegral.1
            (adjoin_le_integralClosure hαint)).isIntegral _)
      have H := Algebra.discr_mul_isIntegral_mem_adjoin ℚ hαint h
      rw [hdiscB] at H
      have H' : (2 : ℤ) ^ 3 • x ∈ Algebra.adjoin ℤ ({B.gen} : Set K) := by
        have : (2 : ℤ) ^ 3 • x = (8 : ℚ) • x := by
          rw [← Int.cast_smul_eq_zsmul ℚ]
          norm_num
        rw [this]
        exact H
      exact mem_adjoin_of_smul_prime_pow_smul_of_minpoly_isEisensteinAt Int.prime_two hαint h H' hei
    let pB₁ : PowerBasis ℤ (NumberField.RingOfIntegers K) :=
      (Algebra.adjoin.powerBasis' hαint).map
        (IsIntegralClosure.equiv ℤ (Algebra.adjoin ℤ ({B.gen} : Set K)) K
          (NumberField.RingOfIntegers K))
    have hdim : pB₁.dim = B.dim := by
      rw [← PowerBasis.finrank, ← PowerBasis.finrank]
      exact NumberField.RingOfIntegers.rank K
    apply (algebraMap ℤ ℚ).injective_int
    rw [← NumberField.discr_eq_discr _ pB₁.basis,
      ← Algebra.discr_localizationLocalization ℤ (nonZeroDivisors ℤ) K,
      show algebraMap ℤ ℚ 8 = 8 by norm_num, ← hdiscB, ← Algebra.discr_reindex _ _ (finCongr hdim)]
    congr 1
    ext i
    rw [Function.comp_apply, Module.Basis.localizationLocalization_apply, PowerBasis.coe_basis,
      PowerBasis.coe_basis]
    simp only [finCongr_symm, finCongr_apply, Fin.val_cast, map_pow]
    simp only [pB₁, PowerBasis.map_gen, Algebra.adjoin.powerBasis'_gen]
    rw [IsIntegralClosure.algebraMap_equiv]
    rfl)

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
/-- **L:RZ-64c** — RZ §9.5: on X(1) the two writings agree, √(3² − 4) = √d_K with K = ℚ(√5),
and the systolic element's multiplier φ² has conductor 1 — read as mathlib's conductor ideal
`conductor ℤ φ² = ⊤` in 𝓞_K (equivalently ℤ[φ²] = 𝓞_K). The first conjunct records which element
`RZ.phiSq` is (the spec's pinning hypothesis, made unconditional). "only because" is not taken as
a formal claim. **OUT-OF-Q5 (pending the wall)**; rides L:RZ-09.

Served locus: §9.5, the sentence after display (9.9a), final clause, PDF p25 (printed folio 24).
PDF sha256 prefix `2d5287e7`. -/
theorem rz_64c_conductor_one :
    ((RZ.phiSq : ℚ⟮(√5 : ℝ)⟯) : ℝ) = Real.goldenRatio ^ 2 ∧
    √((3 : ℝ) ^ 2 - 4) = √(NumberField.discr ℚ⟮(√5 : ℝ)⟯ : ℝ) ∧
    conductor ℤ RZ.phiSq = ⊤ := by
  open Polynomial in (
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
  refine ⟨rfl, ?_, ?_⟩
  · rw [hdiscK]
    norm_num
  · apply conductor_eq_top_of_adjoin_eq_top
    rw [eq_top_iff, ← pB₁.adjoin_gen_eq_top, Algebra.adjoin_le_iff, Set.singleton_subset_iff]
    have hg : pB₁.gen = RZ.phiSq + 1 := by
      apply NumberField.RingOfIntegers.ext
      change algebraMap (NumberField.RingOfIntegers K) K pB₁.gen
        = algebraMap (NumberField.RingOfIntegers K) K (RZ.phiSq + 1)
      rw [hgenval, map_add, map_one]
      apply Subtype.ext
      change K.val B.gen = K.val (algebraMap (NumberField.RingOfIntegers K) K RZ.phiSq + 1)
      rw [map_add, map_one]
      change θ = Real.goldenRatio ^ 2 + 1
      rw [Real.goldenRatio_sq, hθ, Real.goldenRatio]
      ring
    rw [hg]
    exact add_mem (Algebra.self_mem_adjoin_singleton ℤ _) (one_mem _))

/-! ## L:RZ-83 -/

/-- **L:RZ-83** — RZ §13.5: the product of two hyperbolic elements can be hyperbolic, elliptic,
or parabolic (in SL(2, ℤ), the trace formula's group; parabolic = discriminant 0 and not ±I,
mathlib's `Matrix.IsParabolic`).

Served locus: §13.5, PDF p33. PDF sha256 prefix `2d5287e7`. -/
theorem rz_83_hyperbolic_products :
    (∃ A B : SL(2, ℤ), (A : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic ∧
        (B : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic ∧
        ((A * B : SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic) ∧
    (∃ A B : SL(2, ℤ), (A : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic ∧
        (B : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic ∧
        ((A * B : SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ).IsElliptic) ∧
    (∃ A B : SL(2, ℤ), (A : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic ∧
        (B : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic ∧
        ((A * B : SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ).IsParabolic) := by
  let A : SL(2, ℤ) := ⟨!![2, 1; 1, 1], by norm_num [Matrix.det_fin_two_of]⟩
  let B₁ : SL(2, ℤ) := ⟨!![2, -7; -1, 4], by norm_num [Matrix.det_fin_two_of]⟩
  let B₂ : SL(2, ℤ) := ⟨!![1, -3; -1, 4], by norm_num [Matrix.det_fin_two_of]⟩
  have hA : (A : Matrix (Fin 2) (Fin 2) ℤ) = !![2, 1; 1, 1] := rfl
  have hB₁ : (B₁ : Matrix (Fin 2) (Fin 2) ℤ) = !![2, -7; -1, 4] := rfl
  have hB₂ : (B₂ : Matrix (Fin 2) (Fin 2) ℤ) = !![1, -3; -1, 4] := rfl
  refine ⟨⟨A, A, ?_, ?_, ?_⟩, ⟨A, B₁, ?_, ?_, ?_⟩, ⟨A, B₂, ?_, ?_, ?_⟩⟩ <;>
    simp only [Matrix.IsHyperbolic, Matrix.IsElliptic, Matrix.IsParabolic, Matrix.discr_fin_two,
      Matrix.SpecialLinearGroup.coe_mul, hA, hB₁, hB₂, Matrix.mul_fin_two, Matrix.trace_fin_two_of,
      Matrix.det_fin_two_of] <;> norm_num
  intro c hc
  have h := congrFun (congrFun hc 0) 1
  rw [Matrix.intCast_apply] at h
  simp at h

end RiemannZeta.MatricesMobius
