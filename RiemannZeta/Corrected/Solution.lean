import Mathlib
import RiemannZeta.ZetaL.Solution

/-!
# Unit U11 (`RiemannZeta/Corrected`) — proofs

The Solution module of unit U11 (the corrected legs L:RZ-33b and L:RZ-41b of the paper *The
Tetrahedral Structure of the Riemann Zeta Function*, QRiemannian Research, April 2026, revised
October 2026; served PDF sha256 prefix `2d5287e7`, the legs formalizing the corrected edition).
This module does NOT import `RiemannZeta.Corrected.Challenge`: it imports `Mathlib` and
`RiemannZeta.ZetaL.Solution` (the CO decision for this unit, the U10 decision-2 pattern: the
functional equation (5.2) is taken from `RiemannZeta.ZetaL.rz_33a_functional_equation`, linked to
the local `zetaChi` by `rfl`), opens the same namespace, restates the Challenge's one definition
`zetaChi` byte-identically, and proves both theorems under their Challenge names and statement
text (Challenge sha256 `7f9a7838…`, signed by V₂). The helpers `aux_*` sit in `section Aux` and
enter no statement.

**Routes.** L:RZ-33b: (0) (5.2) at s and at 1 − s from U3's `rz_33a`, and χ(s)χ(1 − s) = 1 from
2^s 2^(1−s) = 2, π^(s−1) π^(−s) = π⁻¹, sin(π(1 − s)/2) = cos(πs/2), sin(πs) = 2 sin cos and
Euler's reflection Γ(s)Γ(1 − s) = π/sin(πs), with sin(πs) ≠ 0 off ℤ; (i) `ring` and
`linear_combination`; (ii-a) real and imaginary parts; (ii-b) a non-trivial zero lies in the
strip (U3's steps), the functional equation `riemannZeta_one_sub` at ρ gives ζ(1 − ρ) = 0, and
`riemannZeta_conj` carries it to 1 − ρ̄ = conj (1 − ρ). L:RZ-41b: discr = tr² − 4 on SL(2, ℤ);
the scalar elements are exactly ±1 (det r² = 1); the three types and their exclusions read off
the sign of the discriminant; conjugation keeps the trace and the set {±1}; on ℍ and on
ℝ ∪ {∞} the action by coordinates (U4's `rz_41a` steps): a fixed point in ℍ forces c = 0,
d = a, b = 0 (scalar), and the boundary fixed point is ∞ when c = 0, else (a − d)/(2c).
-/

open scoped MatrixGroups
open UpperHalfPlane

namespace RiemannZeta.Corrected

/-! ## Shared definition (restated) -/

-- Restated byte-identically from U3 (`RiemannZeta/ZetaL/Challenge.lean`); the corrected
-- edition prints this χ beside (5.2) (correction draft `1b2af75c`, p14).
/-- The standard factor of the asymmetric functional equation,
χ(s) = 2^s π^(s−1) sin(πs/2) Γ(1−s). Supplied by the spec: the served text prints χ(s) in (5.2)
without defining it (L:RZ-33a §3; V₁ ruling: definite enough — χ = ζ(s)/ζ(1−s) is forced). -/
noncomputable def zetaChi (s : ℂ) : ℂ :=
  2 ^ s * (Real.pi : ℂ) ^ (s - 1) * Complex.sin (Real.pi * s / 2) * Complex.Gamma (1 - s)

/-! ## Helpers -/

section Aux

theorem aux_chi_mul (s : ℂ) (hs : ∀ n : ℤ, s ≠ n) : zetaChi s * zetaChi (1 - s) = 1 := by
  unfold zetaChi
  have hsin : Complex.sin (Real.pi * s) ≠ 0 := by
    rw [Ne, Complex.sin_eq_zero_iff]
    rintro ⟨k, hk⟩
    apply hs k
    have hπ : (Real.pi : ℂ) ≠ 0 := Complex.ofReal_ne_zero.mpr Real.pi_ne_zero
    apply mul_left_cancel₀ hπ
    rw [hk]; ring
  have hπ : (Real.pi : ℂ) ≠ 0 := Complex.ofReal_ne_zero.mpr Real.pi_ne_zero
  have h2 : (2 : ℂ) ^ s * (2 : ℂ) ^ (1 - s) = 2 := by
    rw [← Complex.cpow_add _ _ (by norm_num)]; simp
  have hp : (Real.pi : ℂ) ^ (s - 1) * (Real.pi : ℂ) ^ (1 - s - 1) = (Real.pi : ℂ)⁻¹ := by
    rw [← Complex.cpow_add _ _ hπ, show s - 1 + (1 - s - 1) = -1 by ring, Complex.cpow_neg_one]
  have hcos : Complex.sin (Real.pi * (1 - s) / 2) = Complex.cos (Real.pi * s / 2) := by
    rw [← Complex.sin_pi_div_two_sub]; congr 1; ring
  have hsin2 : Complex.sin (Real.pi * s) =
      2 * Complex.sin (Real.pi * s / 2) * Complex.cos (Real.pi * s / 2) := by
    rw [← Complex.sin_two_mul]; congr 1; ring
  have hG := Complex.Gamma_mul_Gamma_one_sub s
  rw [sub_sub_cancel, hcos]
  calc 2 ^ s * (Real.pi : ℂ) ^ (s - 1) * Complex.sin (Real.pi * s / 2) * Complex.Gamma (1 - s) *
        (2 ^ (1 - s) * (Real.pi : ℂ) ^ (1 - s - 1) * Complex.cos (Real.pi * s / 2) *
          Complex.Gamma s)
      = ((2 : ℂ) ^ s * (2 : ℂ) ^ (1 - s)) * ((Real.pi : ℂ) ^ (s - 1) * (Real.pi : ℂ) ^ (1 - s - 1))
          * (Complex.sin (Real.pi * s / 2) * Complex.cos (Real.pi * s / 2)) *
          (Complex.Gamma s * Complex.Gamma (1 - s)) := by ring
    _ = 1 := by
      rw [h2, hp, hG]
      have hsc : Complex.sin (Real.pi * s / 2) * Complex.cos (Real.pi * s / 2) ≠ 0 := by
        intro h; apply hsin; rw [hsin2, mul_assoc, h, mul_zero]
      rw [hsin2]
      field_simp
      exact div_self hsc

/-- A zero of ζ that is not a trivial zero lies in the open strip 0 < Re ρ < 1 (U3's steps,
`RiemannZeta/ZetaL/Solution.lean:275–300`, restated here). -/
theorem aux_strip (ρ : ℂ) (hζ : riemannZeta ρ = 0) (hnt : ∀ n : ℕ, ρ ≠ -2 * (n + 1)) :
    0 < ρ.re ∧ ρ.re < 1 := by
  have hρ0 : ρ ≠ 0 := by
    rintro rfl; rw [riemannZeta_zero] at hζ; norm_num at hζ
  have h1 : ρ ≠ 1 := by
    rintro rfl
    exact riemannZeta_ne_zero_of_one_le_re (by simp) hζ
  have hGρ : Complex.Gammaℝ ρ ≠ 0 := by
    rw [Ne, Complex.Gammaℝ_eq_zero_iff]
    rintro ⟨n, hn⟩
    rcases n with _ | m
    · apply hρ0; simpa using hn
    · apply hnt m; rw [hn]; push_cast; ring
  have hΛρ : completedRiemannZeta ρ = 0 := by
    have := riemannZeta_def_of_ne_zero hρ0
    rw [hζ, eq_comm, div_eq_zero_iff] at this
    exact this.resolve_right hGρ
  have hre1 : ρ.re < 1 := by
    by_contra h
    exact riemannZeta_ne_zero_of_one_le_re (not_lt.mp h) hζ
  have hre0 : 0 < ρ.re := by
    by_contra h
    replace h := not_lt.mp h
    have h1r : 1 ≤ (1 - ρ).re := by simp; linarith
    have hne : (1 - ρ) ≠ 0 := by intro h'; apply h1; linear_combination -h'
    apply riemannZeta_ne_zero_of_one_le_re h1r
    rw [riemannZeta_def_of_ne_zero hne, completedRiemannZeta_one_sub, hΛρ, zero_div]
  exact ⟨hre0, hre1⟩

end Aux

/-! ## L:RZ-33b -/

/-- **L:RZ-33b** — RZ §5.4, as corrected (CC-15): "The functional equation ζ(s) = χ(s) ζ(1 − s),
χ(s) = 2^s π^(s−1) sin(πs/2) Γ(1 − s), (5.2) has reflection symmetry s ↔ 1 − s with fixed point
s = 1/2 [CV] … Together with ζ(s̄) = conj ζ(s) it makes the non-trivial zeros symmetric about the
line Re(s) = 1/2, the line fixed by s ↦ 1 − s̄ [CV]." (0) off ℤ, χ(s)χ(1 − s) = 1 and (5.2) holds
at s and at 1 − s, so s ↦ 1 − s carries the equation to itself; (i) s ↦ 1 − s is an involution
with fixed-point set {1/2}; (ii) s ↦ 1 − s̄ fixes exactly the line Re s = 1/2 and maps non-trivial
zeros (ρ ≠ −2, −4, …) to non-trivial zeros. The full zero set is NOT symmetric (−2n ↦ 1 + 2n).

Served locus: §5.4, display (5.2) and the clause after it, PDF p14 (printed folio 13). PDF sha256
prefix `2d5287e7` (the edition served). The leg formalizes the corrected edition (correction
draft `1b2af75c` at the M read; pass 2 is `8346ab41`), whose republish waits on the wall's
read. -/
theorem rz_33b_reflection_fixed_point :
    (∀ s : ℂ, (∀ n : ℤ, s ≠ n) →
      zetaChi s * zetaChi (1 - s) = 1 ∧
      riemannZeta s = zetaChi s * riemannZeta (1 - s) ∧
      riemannZeta (1 - s) = zetaChi (1 - s) * riemannZeta s) ∧
    Function.Involutive (fun s : ℂ ↦ 1 - s) ∧
    Function.fixedPoints (fun s : ℂ ↦ 1 - s) = {1 / 2} ∧
    Function.fixedPoints (fun s : ℂ ↦ 1 - starRingEnd ℂ s) = {s : ℂ | s.re = 1 / 2} ∧
    ∀ ρ : ℂ, riemannZeta ρ = 0 → (∀ n : ℕ, ρ ≠ -2 * (n + 1)) →
      riemannZeta (1 - starRingEnd ℂ ρ) = 0 ∧ ∀ n : ℕ, 1 - starRingEnd ℂ ρ ≠ -2 * (n + 1) := by
  refine ⟨fun s hs ↦ ⟨aux_chi_mul s hs, ?_, ?_⟩, fun s ↦ by ring, ?_, ?_, ?_⟩
  · have h := RiemannZeta.ZetaL.rz_33a_functional_equation s (fun n hn ↦ hs n (by rw [hn]; simp))
    exact h
  · have h := RiemannZeta.ZetaL.rz_33a_functional_equation (1 - s) (fun n hn ↦ by
      apply hs (1 - n); push_cast; linear_combination -hn)
    rw [sub_sub_cancel] at h
    exact h
  · ext s
    rw [Function.mem_fixedPoints, Function.IsFixedPt, Set.mem_singleton_iff]
    constructor
    · intro h; linear_combination -h / 2
    · intro h; rw [h]; ring
  · ext s
    rw [Function.mem_fixedPoints, Function.IsFixedPt, Set.mem_ofPred_eq, Complex.ext_iff]
    simp only [Complex.sub_re, Complex.one_re, Complex.conj_re, Complex.sub_im, Complex.one_im,
      Complex.conj_im, sub_neg_eq_add, zero_add, and_true]
    constructor
    · intro h; linarith
    · intro h; linarith
  · intro ρ hζ hnt
    have h1 : ρ ≠ 1 := by
      rintro rfl
      exact riemannZeta_ne_zero_of_one_le_re (by simp) hζ
    obtain ⟨hre0, hre1⟩ := aux_strip ρ hζ hnt
    have hρn : ∀ n : ℕ, ρ ≠ -n := by
      intro n hn
      have := congrArg Complex.re hn
      simp at this
      have : (0 : ℝ) ≤ n := Nat.cast_nonneg n
      linarith
    have hz : riemannZeta (1 - ρ) = 0 := by
      rw [riemannZeta_one_sub hρn h1, hζ, mul_zero]
    have hc : 1 - starRingEnd ℂ ρ = starRingEnd ℂ (1 - ρ) := by simp
    refine ⟨?_, fun n hn ↦ ?_⟩
    · rw [hc, riemannZeta_conj, hz, map_zero]
    · have := congrArg Complex.re hn
      simp at this
      have : (0 : ℝ) ≤ n := Nat.cast_nonneg n
      linarith


/-! ## L:RZ-41b -/

/-- **L:RZ-41b** — RZ §7.1, as corrected (CC-16): "its elements other than ±I classify into three
types by fixed-point behavior", and the Parabolic row "|tr(γ)| = 2, γ ≠ ±I — Fixes a single
boundary point (cusp)". For γ ∈ SL(2, ℤ), γ ≠ ±I: exactly one of hyperbolic / parabolic /
elliptic holds, read by trace (|tr| > 2 / = 2 / < 2); parabolicity is a conjugacy-class
property; a parabolic γ fixes no point of ℍ and exactly one point of ℝ ∪ {∞}, a cusp (∞ or
rational).

Served locus: §7.1 "The key identification", the sentence introducing the table and its
Parabolic row, PDF p17–18 (printed folios 16–17; the correction draft breaks the table onto
p18). PDF sha256 prefix `2d5287e7` (the edition served). The leg formalizes the corrected
edition (correction draft `1b2af75c` at the M read; pass 2 is `8346ab41`), whose republish waits
on the wall's read. -/
theorem rz_41b_noncentral_trichotomy (γ : SL(2, ℤ)) (h₁ : γ ≠ 1) (h₂ : γ ≠ -1) :
    let m : Matrix (Fin 2) (Fin 2) ℤ := γ
    let g : GL (Fin 2) ℝ := Matrix.SpecialLinearGroup.mapGL ℝ γ
    (m.IsHyperbolic ∨ m.IsParabolic ∨ m.IsElliptic) ∧
    ¬ (m.IsHyperbolic ∧ m.IsParabolic) ∧ ¬ (m.IsHyperbolic ∧ m.IsElliptic) ∧
    ¬ (m.IsParabolic ∧ m.IsElliptic) ∧
    (m.IsHyperbolic ↔ 2 < |m.trace|) ∧ (m.IsParabolic ↔ |m.trace| = 2) ∧
    (m.IsElliptic ↔ |m.trace| < 2) ∧
    (∀ h : SL(2, ℤ),
       (((h * γ * h⁻¹ : SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ).IsParabolic ↔ m.IsParabolic)) ∧
    (m.IsParabolic →
       (∀ z : ℍ, γ • z ≠ z) ∧
       ∃ c : OnePoint ℝ, (c = OnePoint.infty ∨ ∃ q : ℚ, c = ((q : ℝ) : OnePoint ℝ)) ∧
         ∀ c' : OnePoint ℝ, g • c' = c' ↔ c' = c) := by
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
  -- the scalar elements of SL(2, ℤ) are ±1
  have hns : ∀ k : SL(2, ℤ),
      (k : Matrix (Fin 2) (Fin 2) ℤ) ∈ Set.range (Matrix.scalar (Fin 2)) ↔ k = 1 ∨ k = -1 := by
    intro k
    constructor
    · rintro ⟨r, hr⟩
      have hk := k.2
      rw [← hr, Matrix.det_fin_two] at hk
      simp only [Matrix.scalar_apply, Matrix.diagonal_apply_eq, Fin.isValue,
        Matrix.diagonal_apply_ne _ (show (0 : Fin 2) ≠ 1 by decide),
        Matrix.diagonal_apply_ne _ (show (1 : Fin 2) ≠ 0 by decide), mul_zero, sub_zero] at hk
      rcases Int.eq_one_or_neg_one_of_mul_eq_one' hk with ⟨h1, _⟩ | ⟨h1, _⟩
      · left
        ext i j
        rw [← hr, h1]
        simp
      · right
        ext i j
        rw [← hr, h1, Matrix.SpecialLinearGroup.coe_neg, Matrix.SpecialLinearGroup.coe_one]
        simp
    · rintro (rfl | rfl)
      · exact ⟨1, by simp⟩
      · exact ⟨-1, by simp⟩
  have hpm : ∀ h k : SL(2, ℤ), k = 1 ∨ k = -1 → h * k * h⁻¹ = 1 ∨ h * k * h⁻¹ = -1 := by
    rintro h k (rfl | rfl)
    · left; group
    · right; simp
  have hnsconj : ∀ h : SL(2, ℤ),
      ((h * γ * h⁻¹ : SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ) ∈ Set.range (Matrix.scalar (Fin 2))
        ↔ m ∈ Set.range (Matrix.scalar (Fin 2)) := by
    intro h
    rw [hns, hm, hns]
    constructor
    · intro hk
      have := hpm h⁻¹ _ hk
      simpa [mul_assoc] using this
    · exact hpm h γ
  have hnsγ : m ∉ Set.range (Matrix.scalar (Fin 2)) := by
    rw [hm, hns]
    rintro (h | h)
    · exact h₁ h
    · exact h₂ h
  have hdm : m.discr = m.trace ^ 2 - 4 := hdisc γ
  have hparab : m.IsParabolic ↔ m.discr = 0 := ⟨fun h ↦ h.2, fun h ↦ ⟨hnsγ, h⟩⟩
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · rcases lt_trichotomy 0 m.discr with h | h | h
    · exact Or.inl h
    · exact Or.inr (Or.inl (hparab.mpr h.symm))
    · exact Or.inr (Or.inr h)
  · rintro ⟨h, h'⟩
    rw [Matrix.IsHyperbolic, hparab.mp h'] at h
    exact lt_irrefl _ h
  · rintro ⟨h, h'⟩
    rw [Matrix.IsHyperbolic] at h
    rw [Matrix.IsElliptic] at h'
    exact lt_asymm h h'
  · rintro ⟨h, h'⟩
    rw [Matrix.IsElliptic, hparab.mp h] at h'
    exact lt_irrefl _ h'
  · rw [Matrix.IsHyperbolic, hdm, lt_abs]
    constructor
    · intro h
      by_contra h'
      push Not at h'
      nlinarith [h'.1, h'.2]
    · rintro (h | h) <;> nlinarith
  · rw [hparab, hdm]
    constructor
    · intro h
      have h4 : |m.trace| ^ 2 = 2 ^ 2 := by rw [sq_abs]; linarith
      exact (pow_left_inj₀ (abs_nonneg _) (by norm_num) two_ne_zero).mp h4
    · intro h
      rw [← sq_abs, h]
      norm_num
  · rw [Matrix.IsElliptic, hdm, abs_lt]
    constructor
    · intro h
      constructor <;> nlinarith
    · rintro ⟨h1, h2⟩
      nlinarith
  · intro h
    rw [Matrix.IsParabolic, Matrix.IsParabolic, hdisc, hconjtr, hnsconj, ← hdm]
  · intro hp
    -- the entries, over ℤ and over ℝ (U4 `rz_41a`, MatricesMobius/Solution.lean:56–69)
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
    -- the discriminant vanishes, over ℤ and over ℝ
    have hd0Z : (a + d) ^ 2 - 4 = 0 := by rw [← htrZ, ← hdm]; exact hp.2
    have hd0R : (A + D) ^ 2 = 4 := by
      have h' : (((a + d) ^ 2 - 4 : ℤ) : ℝ) = 0 := by exact_mod_cast hd0Z
      push_cast at h'
      linarith
    -- a scalar matrix is excluded: b = 0, c = 0, d = a cannot all hold
    have hnot : ¬ (b = 0 ∧ c = 0 ∧ d = a) := by
      rintro ⟨hb0, hc0, hda⟩
      apply hnsγ
      refine ⟨a, ?_⟩
      rw [Matrix.scalar_apply]
      ext i j
      fin_cases i <;> fin_cases j
      · exact Matrix.diagonal_apply_eq _ _
      · rw [Matrix.diagonal_apply_ne _ (by decide)]; exact hb0.symm
      · rw [Matrix.diagonal_apply_ne _ (by decide)]; exact hc0.symm
      · rw [Matrix.diagonal_apply_eq]; exact hda.symm
    -- the action on ℍ, by coordinates (U4 `rz_41a`, MatricesMobius/Solution.lean:78–95)
    have hfixH : ∀ z : ℍ, γ • z = z ↔
        (2 * C * z.re + D - A) * z.im = 0 ∧
          C * (z.re ^ 2 - z.im ^ 2) + (D - A) * z.re - B = 0 := by
      intro z
      have hden : (C : ℂ) * (z : ℂ) + D ≠ 0 := by
        have h := UpperHalfPlane.denom_ne_zero (Matrix.SpecialLinearGroup.mapGL ℝ γ) z
        simpa [UpperHalfPlane.denom, hC, hD, hc, hd, hm] using h
      rw [UpperHalfPlane.ext_iff, UpperHalfPlane.coe_specialLinearGroup_apply]
      simp only [algebraMap_int_eq, eq_intCast]
      rw [show ((γ 0 0 : ℝ) : ℂ) = A from rfl, show ((γ 0 1 : ℝ) : ℂ) = B from rfl,
        show ((γ 1 0 : ℝ) : ℂ) = C from rfl, show ((γ 1 1 : ℝ) : ℂ) = D from rfl,
        div_eq_iff hden, Complex.ext_iff]
      simp only [Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im,
        Complex.ofReal_re, Complex.ofReal_im, UpperHalfPlane.coe_re, UpperHalfPlane.coe_im]
      constructor
      · rintro ⟨h1, h2⟩
        constructor <;> linarith
      · rintro ⟨h1, h2⟩
        constructor <;> linarith
    -- the action on the boundary (U4 `rz_41a`, MatricesMobius/Solution.lean:106–124)
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
    refine ⟨fun z hz ↦ ?_, ?_⟩
    · -- no fixed point in ℍ
      obtain ⟨h1, h2⟩ := (hfixH z).mp hz
      have e1 : 2 * C * z.re + D - A = 0 :=
        (mul_eq_zero.mp h1).resolve_right (UpperHalfPlane.im_ne_zero z)
      have e2 : (C * z.im) ^ 2 = 0 := by
        have : 4 * C ^ 2 * z.im ^ 2 = 4 - (A + D) ^ 2 := by
          linear_combination (-4 * C) * h2 + 4 * hdetR + (2 * C * z.re + D - A) * e1
        rw [hd0R] at this
        linear_combination this / 4
      have hC0 : C = 0 :=
        (mul_eq_zero.mp (pow_eq_zero_iff two_ne_zero |>.mp e2)).resolve_right
          (UpperHalfPlane.im_ne_zero z)
      have hDA : D = A := by rw [hC0] at e1; linarith
      have hB0 : B = 0 := by rw [hC0, hDA] at h2; linarith
      apply hnot
      refine ⟨?_, ?_, ?_⟩
      · rw [hB] at hB0; exact_mod_cast hB0
      · rw [hC] at hC0; exact_mod_cast hC0
      · rw [hD, hA] at hDA; exact_mod_cast hDA
    · by_cases hC0 : C = 0
      · -- the cusp ∞
        have hc0 : c = 0 := by rw [hC] at hC0; exact_mod_cast hC0
        have hda : d = a := by
          rw [hc0, mul_zero, sub_zero] at hdetZ
          rcases Int.eq_one_or_neg_one_of_mul_eq_one' hdetZ with ⟨h1, h2⟩ | ⟨h1, h2⟩
          · rw [h1, h2]
          · rw [h1, h2]
        have hb0 : b ≠ 0 := fun hb0 ↦ hnot ⟨hb0, hc0, hda⟩
        have hB0 : B ≠ 0 := by rw [hB]; exact_mod_cast hb0
        have hDA : D = A := by rw [hD, hA, hda]
        refine ⟨OnePoint.infty, Or.inl rfl, fun x ↦ ?_⟩
        refine OnePoint.rec ?_ (fun k ↦ ?_) x
        · simp only [hinf, hC0]
        · rw [hfin k, hC0, hDA]
          simp only [zero_mul, sub_self, zero_add, zero_sub, neg_eq_zero, hB0, false_iff]
          exact OnePoint.coe_ne_infty k
      · -- the cusp (a − d)/(2c), rational
        have hc0 : c ≠ 0 := by
          intro h; apply hC0; rw [hC, h]; simp
        have h2C : 2 * C ≠ 0 := mul_ne_zero two_ne_zero hC0
        refine ⟨(((((a - d : ℤ) : ℚ) / (2 * (c : ℚ)) : ℚ) : ℝ) : OnePoint ℝ), Or.inr ⟨_, rfl⟩,
          fun x ↦ ?_⟩
        have hq : ((((a - d : ℤ) : ℚ) / (2 * (c : ℚ)) : ℚ) : ℝ) = (A - D) / (2 * C) := by
          rw [hA, hC, hD]; push_cast; ring
        refine OnePoint.rec ?_ (fun k ↦ ?_) x
        · rw [hinf]
          simp [hC0, OnePoint.infty_ne_coe]
        · rw [hfin k, hq, OnePoint.coe_eq_coe, eq_div_iff h2C]
          constructor
          · intro h
            have hsq : (2 * C * k + D - A) ^ 2 = 0 := by
              linear_combination (4 * C) * h - 4 * hdetR + hd0R
            have := pow_eq_zero_iff two_ne_zero |>.mp hsq
            linarith
          · intro h
            have hk : 2 * C * k + D - A = 0 := by linarith
            have h4 : (4 * C) * (C * k ^ 2 + (D - A) * k - B) = 0 := by
              linear_combination (2 * C * k + D - A) * hk + 4 * hdetR - hd0R
            exact (mul_eq_zero.mp h4).resolve_left (mul_ne_zero four_ne_zero hC0)

end RiemannZeta.Corrected
