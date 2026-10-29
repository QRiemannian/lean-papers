import Mathlib

/-!
# Unit U8 (`ModularSurface/Now`) — proofs

Proofs of the frozen statements of unit U8 of the paper *The Invariant Structure of the Modular
Surface* (QRiemannian Research, 2026, revised October 2026), served PDF sha256
`b4841489ec6bea619f8d5525ce4c788b86e0109e51d6e9d2cb252690f5b13af5` (prefix `b4841489`).
The statements are frozen in `ModularSurface/Now/Challenge.lean` (sha256 signed in the unit's
`formalization.yaml`). This module does not import the Challenge module: it imports Mathlib,
restates every supporting definition of the Challenge byte-identically, and proves each theorem
under the identical name and statement text (generated from the Challenge by replacing each
placeholder proof body with its proof).

Every theorem of the Challenge is proved in this module; `statements_not_checked:` in
`formalization.yaml` is empty. `ms_32b_certificate_max_fields` (L:MS-32b, OUT-OF-Q5, proved beyond
scope) carries steps copied from unit U9's `RiemannZeta/Provenance/Solution.lean` as `have`s and a
local instance inside its proof (no new top-level declaration; the line ranges are in its comments
and in this unit's `BUILD-LOG.md`).
-/

namespace ModularSurface.Now

/-! ## Shared definitions -/

/-- The geometry constant g_c = 1/(√5·π). Restated identically to unit U3's
`RiemannZeta.ZetaL.geometryConstant` (spec L:RZ-15; units do not import each other). Used by
L:MS-24b and L:MS-25. -/
noncomputable def geometryConstant : ℝ := 1 / (Real.sqrt 5 * Real.pi)

/-- RZ (8.2): the Gauss map T(x) = {1/x} (Lean's 0⁻¹ = 0 gives T 0 = 0) (L:RZ-53a).
Restated identically to unit U4's `RiemannZeta.MatricesMobius.RZ.gaussMap`; used by L:MS-39. -/
noncomputable def RZ.gaussMap (x : ℝ) : ℝ := Int.fract x⁻¹

/-- RZ (8.3): ℒ_s f(x) = Σ_{n ≥ 1} (x + n)^{−2s} f(1/(x + n)) (as a `tsum`) (L:RZ-53a).
Restated identically to unit U4's `RiemannZeta.MatricesMobius.RZ.mayer`; used by L:MS-39 (MS
names the Mayer operator without printing its formula; V₁: the RZ (8.3) import is accepted). -/
noncomputable def RZ.mayer (s : ℂ) (f : ℝ → ℂ) (x : ℝ) : ℂ :=
  ∑' n : ℕ, (((x + (n + 1) : ℝ) : ℂ) ^ (-2 * s)) * f (1 / (x + (n + 1)))

/-! ## L:MS-02 -/

/-- 1/r on the (2,3,r) family, with the printed convention 1/∞ = 0. -/
noncomputable def ms02InvOrder (r : ℕ∞) : ℝ := if r = ⊤ then 0 else 1 / (r.toNat : ℝ)
/-- MS §2.1 p05: area of the (2,3,r) member, 2π(1/6 − 1/r) (as printed). -/
noncomputable def ms02Area (r : ℕ∞) : ℝ := 2 * Real.pi * (1 / 6 - ms02InvOrder r)
/-- χ_orb of the (2,3,r) sphere orbifold, 1/r − 1/6 (supplied: standard formula). -/
noncomputable def ms02ChiOrb (r : ℕ∞) : ℝ := ms02InvOrder r - 1 / 6
/-- MS §2.1 p05: k = 1/(2|χ_orb|). -/
noncomputable def ms02K (r : ℕ∞) : ℝ := 1 / (2 * |ms02ChiOrb r|)

/-- **L:MS-02** — the (2, 3, r) triangle family on F = {r : ℕ∞ | 7 ≤ r}: area 2π(1/6 − 1/r)
strictly increasing; π/3 at r = ∞ the least upper bound of the finite members; π/21 at r = 7
the least; k = 1/(2|χ_orb|) from 21 down to 3, strictly decreasing, and k = 3 exactly at r = ∞.

Served locus: §2.1, paragraph "What kind of forcing the home claim is, and what it is not.",
PDF p05 (printed folio 4). PDF sha256 prefix `b4841489`. -/
theorem ms_02_triangleFamily :
    let F : Set ℕ∞ := {r | 7 ≤ r}
    StrictMonoOn ms02Area F ∧
    ms02Area ⊤ = Real.pi / 3 ∧
    IsLUB (ms02Area '' {r | 7 ≤ r ∧ r ≠ ⊤}) (Real.pi / 3) ∧
    ms02Area 7 = Real.pi / 21 ∧
    IsLeast (ms02Area '' F) (Real.pi / 21) ∧
    ms02K 7 = 21 ∧ ms02K ⊤ = 3 ∧ StrictAntiOn ms02K F ∧
    (∀ r ∈ F, ms02K r = 3 ↔ r = ⊤) := by
  intro F
  have hπ : 0 < Real.pi := Real.pi_pos
  have hfin : ∀ n : ℕ, ms02InvOrder (n : ℕ∞) = 1 / (n : ℝ) := by
    intro n
    simp [ms02InvOrder]
  have htop : ms02InvOrder ⊤ = 0 := by simp [ms02InvOrder]
  -- the members of F: ⊤, or a natural number n ≥ 7
  have hF : ∀ r ∈ F, r = ⊤ ∨ ∃ n : ℕ, 7 ≤ n ∧ r = (n : ℕ∞) := by
    intro r hr
    induction r using ENat.recTopCoe with
    | top => exact Or.inl rfl
    | coe n =>
      refine Or.inr ⟨n, ?_, rfl⟩
      have : ((7 : ℕ) : ℕ∞) ≤ (n : ℕ∞) := hr
      exact_mod_cast this
  -- 1/r is strictly decreasing on F, valued in [0, 1/7], and vanishes only at ⊤
  have hI : ∀ a ∈ F, ∀ b ∈ F, a < b → ms02InvOrder b < ms02InvOrder a := by
    intro a ha b hb hab
    rcases hF a ha with rfl | ⟨m, hm, rfl⟩
    · exact absurd hab (not_lt.mpr le_top)
    rcases hF b hb with rfl | ⟨n, hn, rfl⟩
    · rw [htop, hfin]
      have : (0 : ℝ) < m := by exact_mod_cast (by omega : 0 < m)
      positivity
    · rw [hfin, hfin]
      have hmn : m < n := by exact_mod_cast hab
      have hm0 : (0 : ℝ) < m := by exact_mod_cast (by omega : 0 < m)
      have hmn' : (m : ℝ) < n := by exact_mod_cast hmn
      exact one_div_lt_one_div_of_lt hm0 hmn'
  have hB : ∀ r ∈ F, 0 ≤ ms02InvOrder r ∧ ms02InvOrder r ≤ 1 / 7 := by
    intro r hr
    rcases hF r hr with rfl | ⟨n, hn, rfl⟩
    · rw [htop]; norm_num
    · rw [hfin]
      have hn' : (7 : ℝ) ≤ n := by exact_mod_cast hn
      refine ⟨by positivity, ?_⟩
      exact one_div_le_one_div_of_le (by norm_num) hn'
  have hZ : ∀ r ∈ F, ms02InvOrder r = 0 ↔ r = ⊤ := by
    intro r hr
    rcases hF r hr with rfl | ⟨n, hn, rfl⟩
    · simp [htop]
    · rw [hfin]
      have : (0 : ℝ) < n := by exact_mod_cast (by omega : 0 < n)
      simp only [ENat.natCast_ne_top, iff_false]
      positivity
  have h7 : (7 : ℕ∞) ∈ F := show (7 : ℕ∞) ≤ 7 from le_rfl
  have hA7 : ms02Area 7 = Real.pi / 21 := by
    have : ms02InvOrder 7 = 1 / 7 := by
      have h := hfin 7
      simpa using h
    unfold ms02Area
    rw [this]
    ring
  have hmono : StrictMonoOn ms02Area F := by
    intro a ha b hb hab
    unfold ms02Area
    have := hI a ha b hb hab
    nlinarith
  -- |χ_orb r| = 1/6 − 1/r on F
  have hchi : ∀ r ∈ F, |ms02ChiOrb r| = 1 / 6 - ms02InvOrder r := by
    intro r hr
    unfold ms02ChiOrb
    have := hB r hr
    rw [abs_of_neg (by linarith)]
    ring
  refine ⟨hmono, ?_, ?_, hA7, ?_, ?_, ?_, ?_, ?_⟩
  · unfold ms02Area; rw [htop]; ring
  · constructor
    · rintro x ⟨r, ⟨hr7, -⟩, rfl⟩
      unfold ms02Area
      have := (hB r hr7).1
      nlinarith
    · intro b hb
      by_contra hlt
      rw [not_le] at hlt
      have hgap : 0 < Real.pi / 3 - b := by linarith
      obtain ⟨N, hN⟩ := exists_nat_gt (2 * Real.pi / (Real.pi / 3 - b))
      set n := max N 7 with hn
      have hn7 : 7 ≤ n := le_max_right _ _
      have hNn : (N : ℝ) ≤ n := by exact_mod_cast le_max_left N 7
      have hnpos : (0 : ℝ) < n := by exact_mod_cast (by omega : 0 < n)
      have hmem : ms02Area (n : ℕ∞) ∈ ms02Area '' {r | 7 ≤ r ∧ r ≠ ⊤} := by
        refine ⟨(n : ℕ∞), ⟨?_, ENat.natCast_ne_top n⟩, rfl⟩
        exact_mod_cast hn7
      have hle := hb hmem
      unfold ms02Area at hle
      rw [hfin] at hle
      have h1 : 2 * Real.pi / (Real.pi / 3 - b) < n := lt_of_lt_of_le hN hNn
      rw [div_lt_iff₀ hgap] at h1
      have h2 : 2 * Real.pi * (1 / n) < Real.pi / 3 - b := by
        rw [mul_one_div, div_lt_iff₀ hnpos]
        linarith
      nlinarith
  · refine ⟨⟨7, h7, hA7⟩, ?_⟩
    rintro x ⟨r, hr, rfl⟩
    rw [← hA7]
    exact hmono.monotoneOn h7 hr hr
  · unfold ms02K ms02ChiOrb
    have : ms02InvOrder 7 = 1 / 7 := by
      have h := hfin 7
      simpa using h
    rw [this]
    norm_num [abs_of_neg]
  · unfold ms02K ms02ChiOrb
    rw [htop]
    norm_num [abs_of_neg]
  · intro a ha b hb hab
    unfold ms02K
    rw [hchi a ha, hchi b hb]
    have hab' := hI a ha b hb hab
    have hb' := hB b hb
    have hpa : 0 < 2 * (1 / 6 - ms02InvOrder a) := by linarith [(hB a ha).2]
    exact one_div_lt_one_div_of_lt hpa (by linarith)
  · intro r hr
    unfold ms02K
    rw [hchi r hr, ← hZ r hr]
    have := hB r hr
    have hp : 0 < 2 * (1 / 6 - ms02InvOrder r) := by linarith
    constructor
    · intro h
      rw [div_eq_iff hp.ne'] at h
      linarith
    · intro h
      rw [h]
      norm_num

/-! ## L:MS-03 -/

/-- Area of the (2, q, ∞) Hecke orbifold, π − 2π/q (supplied; the paper prints only the
values). -/
noncomputable def ms03HeckeArea (q : ℕ) : ℝ := Real.pi - 2 * Real.pi / q

/-- **L:MS-03** — the Hecke (2, q, ∞) family: the areas at q = 3, 4, 5, 6 are π/3, π/2, 3π/5,
2π/3, they run strictly upward in that order, and X(1) (q = 3) is area-minimal over q ≥ 3.

Served locus: §2.1, same paragraph as L:MS-02, PDF p05 (printed folio 4). PDF sha256 prefix
`b4841489`. -/
theorem ms_03_heckeFamily :
    ms03HeckeArea 3 = Real.pi / 3 ∧ ms03HeckeArea 4 = Real.pi / 2 ∧
    ms03HeckeArea 5 = 3 * Real.pi / 5 ∧ ms03HeckeArea 6 = 2 * Real.pi / 3 ∧
    Real.pi / 3 < Real.pi / 2 ∧ Real.pi / 2 < 3 * Real.pi / 5 ∧ 3 * Real.pi / 5 < 2 * Real.pi / 3 ∧
    IsLeast (ms03HeckeArea '' {q : ℕ | 3 ≤ q}) (Real.pi / 3) := by
  have hπ : 0 < Real.pi := Real.pi_pos
  unfold ms03HeckeArea
  refine ⟨by push_cast; ring, by push_cast; ring, by push_cast; ring, by push_cast; ring,
    by linarith, by linarith, by linarith, ⟨⟨3, le_refl 3, by push_cast; ring⟩, ?_⟩⟩
  rintro a ⟨q, hq, rfl⟩
  have hq' : (3 : ℝ) ≤ q := by exact_mod_cast hq
  have hqpos : (0 : ℝ) < q := by linarith
  have : 2 * Real.pi / q ≤ 2 * Real.pi / 3 :=
    div_le_div_of_nonneg_left (by positivity) (by norm_num) hq'
  linarith

/-! ## L:MS-05 -/

open OnePoint in
/-- **L:MS-05** — the two fixed points of F² on ∂ℍ = ℝ ∪ {∞} are φ and −1/φ: the fixed-point
set of F² = (2 1; 1 1), acting on `OnePoint ℝ` by Möbius maps, is exactly {φ, −1/φ}.

Served locus: §2.2, the sentence after display (2.3), PDF p06 (printed folio 5). PDF sha256
prefix `b4841489`. -/
theorem ms_05_fixedPoints_F2 :
    let g : GL (Fin 2) ℝ :=
      Matrix.GeneralLinearGroup.mkOfDetNeZero !![2, 1; 1, 1] (by norm_num [Matrix.det_fin_two_of])
    {p : OnePoint ℝ | g • p = p} =
      {((Real.goldenRatio : ℝ) : OnePoint ℝ), ((-1 / Real.goldenRatio : ℝ) : OnePoint ℝ)} := by
  intro g
  have g00 : g 0 0 = 2 := rfl
  have g01 : g 0 1 = 1 := rfl
  have g10 : g 1 0 = 1 := rfl
  have g11 : g 1 1 = 1 := rfl
  have hφ0 : Real.goldenRatio ≠ 0 := Real.goldenRatio_ne_zero
  have hφsq : Real.goldenRatio ^ 2 = Real.goldenRatio + 1 := Real.goldenRatio_sq
  -- x² − x − 1 = (x − φ)(x + 1/φ)
  have key' : ∀ a : ℝ, a ≠ 0 → a ^ 2 = a + 1 → ∀ x : ℝ, x ^ 2 - x - 1 = (x - a) * (x - -1 / a) := by
    intro a ha h x
    field_simp
    linear_combination x * h
  have key := key' Real.goldenRatio hφ0 hφsq
  ext p
  simp only [Set.mem_ofPred_eq, Set.mem_insert_iff, Set.mem_singleton_iff]
  induction p using OnePoint.rec with
  | infty =>
    rw [OnePoint.smul_infty_eq_ite, g10, g00]
    simp
  | coe x =>
    rw [OnePoint.smul_some_eq_ite, g00, g01, g10, g11]
    simp only [one_mul]
    by_cases hx : x + 1 = 0
    · rw [if_pos hx]
      have hx' : x = -1 := by linarith
      subst hx'
      simp only [OnePoint.infty_ne_coe, false_iff, not_or]
      constructor
      · intro h
        have := OnePoint.coe_injective h
        have hpos := Real.goldenRatio_pos
        linarith
      · intro h
        have h1 := OnePoint.coe_injective h
        rw [eq_div_iff hφ0] at h1
        have : Real.goldenRatio = 1 := by linarith
        rw [this] at hφsq
        norm_num at hφsq
    · rw [if_neg hx]
      rw [OnePoint.coe_eq_coe, OnePoint.coe_eq_coe, OnePoint.coe_eq_coe, div_eq_iff hx]
      have : (2 * x + 1 = x * (x + 1)) ↔ x ^ 2 - x - 1 = 0 := by
        constructor <;> intro h <;> linear_combination -h
      rw [this, key, mul_eq_zero, sub_eq_zero, sub_eq_zero]

/-! ## L:MS-07 -/

/-- The Selberg norm N_Γ of a hyperbolic element of trace `t` (> 2): λ², λ = (t + √(t² − 4))/2
the eigenvalue of modulus > 1 (Selberg's normalisation, log N_Γ = translation length). -/
noncomputable def selbergNormOfTrace (t : ℝ) : ℝ := ((t + Real.sqrt (t ^ 2 - 4)) / 2) ^ 2

/-- **L:MS-07** — (2.6): with F² = (2 1; 1 1), λ = φ², the Selberg norm N_Γ(F²) = φ⁴, and
log N_Γ(F²) = 2 log λ (the (2.4) length) = 4 log φ.

Served locus: §2.2, display (2.6) and the clause after it, PDF p06 (printed folio 5). PDF
sha256 prefix `b4841489`. -/
theorem ms_07_selbergNorm_F2 :
    let F2 : Matrix (Fin 2) (Fin 2) ℝ := !![2, 1; 1, 1]
    (F2.trace + Real.sqrt (F2.trace ^ 2 - 4)) / 2 = Real.goldenRatio ^ 2 ∧   -- λ = φ²
    selbergNormOfTrace F2.trace = Real.goldenRatio ^ 4 ∧            -- (2.6)
    Real.log (selbergNormOfTrace F2.trace) = 2 * Real.log (Real.goldenRatio ^ 2) ∧  -- = ℓ of (2.4)
    2 * Real.log (Real.goldenRatio ^ 2) = 4 * Real.log Real.goldenRatio := by
  intro F2
  have htr : F2.trace = 3 := by
    simp only [F2, Matrix.trace_fin_two, Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero,
      Matrix.cons_val_one, Matrix.empty_val', Matrix.cons_val_fin_one]
    norm_num
  have hl : (F2.trace + Real.sqrt (F2.trace ^ 2 - 4)) / 2 = Real.goldenRatio ^ 2 := by
    rw [htr, Real.goldenRatio_sq, Real.goldenRatio]
    norm_num
    ring
  have hN : selbergNormOfTrace F2.trace = Real.goldenRatio ^ 4 := by
    unfold selbergNormOfTrace
    rw [hl]
    ring
  refine ⟨hl, hN, ?_, ?_⟩
  · rw [hN, show Real.goldenRatio ^ 4 = (Real.goldenRatio ^ 2) ^ 2 by ring, Real.log_pow]
    push_cast
    ring
  · rw [Real.log_pow]
    push_cast
    ring

/-! ## L:MS-09a -/

/-- **L:MS-09a** — (2.8): φ² = (3 + √5)/2.

Served locus: §2.2, display (2.8), PDF p06 (printed folio 5). PDF sha256 prefix `b4841489`. -/
theorem ms_09a_goldenRatio_sq :
    Real.goldenRatio ^ 2 = (3 + Real.sqrt 5) / 2 := by
  rw [Real.goldenRatio_sq, Real.goldenRatio]
  ring

/-! ## L:MS-09b (OUT-OF-Q5, pending the wall) -/

/-- **L:MS-09b** — "φ² = (3 + √5)/2 is the fundamental automorph", read as minimality (the
definite description): φ² is the least (t + u√5)/2 > 1 over integers t, u with t² − 5u² = 4,
attained at (3, 1). OUT-OF-Q5 pending the wall's re-weigh at the IsLeast cost.

Served locus: §2.2, the clause closing display (2.8), PDF p06 (printed folio 5). PDF sha256
prefix `b4841489`. -/
theorem ms_09b_fundamental_automorph :
    IsLeast {ε : ℝ | 1 < ε ∧ ∃ t u : ℤ, t ^ 2 - 5 * u ^ 2 = 4 ∧ ε = ((t : ℝ) + u * Real.sqrt 5) / 2}
      (Real.goldenRatio ^ 2) ∧
    ((3 : ℤ) ^ 2 - 5 * 1 ^ 2 = 4) ∧
    Real.goldenRatio ^ 2 = (((3 : ℤ) : ℝ) + ((1 : ℤ) : ℝ) * Real.sqrt 5) / 2 := by
  have h5 : Real.sqrt 5 ^ 2 = 5 := Real.sq_sqrt (by norm_num)
  have h5p : 2 < Real.sqrt 5 := by
    rw [Real.lt_sqrt (by norm_num)]; norm_num
  have hφ2 : Real.goldenRatio ^ 2 = (3 + Real.sqrt 5) / 2 := by
    rw [Real.goldenRatio_sq, Real.goldenRatio]; ring
  refine ⟨⟨⟨?_, 3, 1, by norm_num, ?_⟩, ?_⟩, by norm_num, ?_⟩
  · rw [hφ2]; linarith
  · rw [hφ2]; push_cast; ring
  · rintro ε ⟨hε, t, u, htu, rfl⟩
    rw [hφ2]
    have htuR : (t : ℝ) ^ 2 - 5 * (u : ℝ) ^ 2 = 4 := by exact_mod_cast htu
    -- (t + u√5)(t − u√5) = 4, with t + u√5 > 2
    have hprod : ((t : ℝ) + u * Real.sqrt 5) * ((t : ℝ) - u * Real.sqrt 5) = 4 := by
      linear_combination htuR - (u : ℝ) ^ 2 * h5
    have hplus : 2 < (t : ℝ) + u * Real.sqrt 5 := by linarith
    have hminus_pos : 0 < (t : ℝ) - u * Real.sqrt 5 := by
      by_contra h
      rw [not_lt] at h
      nlinarith
    have hminus_lt : (t : ℝ) - u * Real.sqrt 5 < 2 := by
      by_contra h
      rw [not_lt] at h
      nlinarith
    have huR : (0 : ℝ) < u * Real.sqrt 5 := by linarith
    have hu0 : (0 : ℝ) < u := by
      by_contra h
      rw [not_lt] at h
      nlinarith
    have hu1 : (1 : ℤ) ≤ u := by
      have : (0 : ℤ) < u := by exact_mod_cast hu0
      omega
    have ht0 : (0 : ℝ) < t := by linarith
    have ht3 : (3 : ℤ) ≤ t := by
      have htpos : (0 : ℤ) < t := by exact_mod_cast ht0
      by_contra h
      rw [not_le] at h
      have : t = 1 ∨ t = 2 := by omega
      have hu2 : 1 ≤ u ^ 2 := by nlinarith
      rcases this with rfl | rfl <;> nlinarith
    have ht3R : (3 : ℝ) ≤ t := by exact_mod_cast ht3
    have hu1R : (1 : ℝ) ≤ u := by exact_mod_cast hu1
    have : Real.sqrt 5 ≤ u * Real.sqrt 5 := by nlinarith
    linarith
  · rw [hφ2]; push_cast; ring

/-! ## L:MS-13 -/

/-- Fundamental discriminant (positive form): D ≡ 1 (mod 4) squarefree, or D = 4m with
m ≡ 2, 3 (mod 4) squarefree. Local definition (none at the pin). -/
def ms13IsFundDisc (D : ℕ) : Prop :=
  (D ≡ 1 [MOD 4] ∧ Squarefree D) ∨
  (∃ m : ℕ, D = 4 * m ∧ (m ≡ 2 [MOD 4] ∨ m ≡ 3 [MOD 4]) ∧ Squarefree m)

/-- **L:MS-13** — 5 is the least squarefree d > 1 with d ≡ 1 (mod 4), and the least fundamental
discriminant greater than 1.

Served locus: §2.4, PDF p07 (printed folio 6); echoed in §5.1, PDF p17 (printed folio 16).
PDF sha256 prefix `b4841489`. -/
theorem ms_13_smallest_fundDisc :
    IsLeast {d : ℕ | 1 < d ∧ Squarefree d ∧ d ≡ 1 [MOD 4]} 5 ∧
    IsLeast {D : ℕ | 1 < D ∧ ms13IsFundDisc D} 5 := by
  have h5sq : Squarefree 5 := Nat.prime_five.squarefree
  refine ⟨⟨⟨by norm_num, h5sq, rfl⟩, ?_⟩, ⟨⟨by norm_num, Or.inl ⟨rfl, h5sq⟩⟩, ?_⟩⟩
  · rintro d ⟨h1, -, h4⟩
    by_contra hlt
    rw [not_le] at hlt
    unfold Nat.ModEq at h4
    interval_cases d <;> simp_all
  · rintro D ⟨h1, hD⟩
    by_contra hlt
    rw [not_le] at hlt
    rcases hD with ⟨h4, -⟩ | ⟨m, rfl, hm, -⟩
    · unfold Nat.ModEq at h4
      interval_cases D <;> simp_all
    · unfold Nat.ModEq at hm
      have : m = 1 := by omega
      subst this
      simp at hm

/-! ## L:MS-14a -/

/-- MS §2.4 p08: the squarefree d > 1 for which x² − dy² = −1 (or −4) is solvable. -/
def ms14NegPellSet : Set ℕ :=
  {d | 1 < d ∧ Squarefree d ∧
    ∃ x y : ℤ, x ^ 2 - (d : ℤ) * y ^ 2 = -1 ∨ x ^ 2 - (d : ℤ) * y ^ 2 = -4}

/-- **L:MS-14a** — the printed instance: {2, 5, 10, 13, 17, 26, 29, 37} ⊆ S, S the squarefree
d > 1 with x² − dy² = −1 or −4 solvable.

Served locus: §2.4, PDF p08 (printed folio 7). PDF sha256 prefix `b4841489`. -/
theorem ms_14a_listed_in_negPellSet :
    ({2, 5, 10, 13, 17, 26, 29, 37} : Set ℕ) ⊆ ms14NegPellSet := by
  have hsf : ∀ n : ℕ, 0 < n → (∀ k ∈ Finset.Icc 2 n, ¬ (k * k ∣ n)) → Squarefree n := by
    intro n hn h x hx
    rw [Nat.isUnit_iff]
    by_contra hx1
    have hx0 : x ≠ 0 := by
      rintro rfl
      simp at hx
      omega
    have hxn : x ≤ n := Nat.le_of_dvd hn (dvd_trans (dvd_mul_right x x) hx)
    exact h x (Finset.mem_Icc.mpr ⟨by omega, hxn⟩) hx
  intro d hd
  simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hd
  rcases hd with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact ⟨by norm_num, hsf _ (by norm_num) (by decide), 1, 1, Or.inl (by norm_num)⟩
  · exact ⟨by norm_num, hsf _ (by norm_num) (by decide), 2, 1, Or.inl (by norm_num)⟩
  · exact ⟨by norm_num, hsf _ (by norm_num) (by decide), 3, 1, Or.inl (by norm_num)⟩
  · exact ⟨by norm_num, hsf _ (by norm_num) (by decide), 3, 1, Or.inr (by norm_num)⟩
  · exact ⟨by norm_num, hsf _ (by norm_num) (by decide), 4, 1, Or.inl (by norm_num)⟩
  · exact ⟨by norm_num, hsf _ (by norm_num) (by decide), 5, 1, Or.inl (by norm_num)⟩
  · exact ⟨by norm_num, hsf _ (by norm_num) (by decide), 5, 1, Or.inr (by norm_num)⟩
  · exact ⟨by norm_num, hsf _ (by norm_num) (by decide), 6, 1, Or.inl (by norm_num)⟩

/-! ## L:MS-14b (OUT-OF-Q5, pending the wall) -/

/-- **L:MS-14b** — "shared by infinitely many d": `ms14NegPellSet` is infinite. OUT-OF-Q5
(pending the wall).

Served locus: §2.4, PDF p08 (printed folio 7). PDF sha256 prefix `b4841489`. -/
theorem ms_14b_negPellSet_infinite : ms14NegPellSet.Infinite := by
  refine Set.infinite_of_not_bddAbove ?_
  rintro ⟨N, hN⟩
  -- n = N!, and n² + 1 = b² k with k squarefree
  set n := N.factorial with hn
  have hn1 : 1 ≤ n := Nat.one_le_iff_ne_zero.mpr (Nat.factorial_ne_zero N)
  obtain ⟨k, b, hkb, hk⟩ := Nat.sq_mul_squarefree (n ^ 2 + 1)
  have hk0 : k ≠ 0 := by
    rintro rfl
    simp at hkb
  have hk1 : k ≠ 1 := by
    rintro rfl
    rw [mul_one] at hkb
    -- n² < b² < (n + 1)², impossible
    have h1 : n < b := by nlinarith
    have h2 : b < n + 1 := by nlinarith
    omega
  have hk2 : 2 ≤ k := by omega
  -- every prime factor of k exceeds N
  have hpN : N < k.minFac := by
    by_contra hle
    rw [not_lt] at hle
    have hp : k.minFac.Prime := Nat.minFac_prime hk1
    have hpk : k.minFac ∣ n ^ 2 + 1 := by
      rw [← hkb]
      exact Dvd.dvd.mul_left (Nat.minFac_dvd k) _
    have hpn : k.minFac ∣ n := Nat.dvd_factorial hp.pos hle
    have hpn2 : k.minFac ∣ n ^ 2 := Dvd.dvd.mul_left hpn n |>.trans (by rw [sq])
    have : k.minFac ∣ 1 := (Nat.dvd_add_right hpn2).mp hpk
    exact hp.one_lt.ne' (Nat.dvd_one.mp this)
  have hkN : N < k := lt_of_lt_of_le hpN (Nat.minFac_le (by omega))
  have hmem : k ∈ ms14NegPellSet := by
    refine ⟨by omega, hk, n, b, Or.inl ?_⟩
    have hz : ((b : ℤ) ^ 2 * k) = (n : ℤ) ^ 2 + 1 := by exact_mod_cast hkb
    linear_combination -hz
  exact absurd (hN hmem) (not_le.mpr hkN)

/-! ## L:MS-14c (OUT-OF-Q5, pending the wall) -/

/-- **L:MS-14c** — the listed values are the first eight members of `ms14NegPellSet`:
S ∩ [0, 37] = {2, 5, 10, 13, 17, 26, 29, 37}. OUT-OF-Q5 (pending the wall).

Served locus: §2.4, PDF p08 (printed folio 7). PDF sha256 prefix `b4841489`. -/
theorem ms_14c_negPellSet_initial :
    {d ∈ ms14NegPellSet | d ≤ 37} = ({2, 5, 10, 13, 17, 26, 29, 37} : Set ℕ) := by
  have hsf : ∀ n : ℕ, 0 < n → (∀ k ∈ Finset.Icc 2 n, ¬ (k * k ∣ n)) → Squarefree n := by
    intro n hn h x hx
    rw [Nat.isUnit_iff]
    by_contra hx1
    have hx0 : x ≠ 0 := by
      rintro rfl
      simp at hx
      omega
    have hxn : x ≤ n := Nat.le_of_dvd hn (dvd_trans (dvd_mul_right x x) hx)
    exact h x (Finset.mem_Icc.mpr ⟨by omega, hxn⟩) hx
  have hnsf : ∀ n k : ℕ, 2 ≤ k → k * k ∣ n → ¬ Squarefree n := by
    intro n k hk hkn hsq
    have := hsq k hkn
    rw [Nat.isUnit_iff] at this
    omega
  -- a prime p ≡ 3 (mod 4) dividing d: neither −1 nor −4 is a square mod p
  have hcon : ∀ (p : ℕ) (d : ℕ) (x y : ℤ), p ∣ d → (∀ a : ZMod p, a ^ 2 ≠ -1 ∧ a ^ 2 ≠ -4) →
      ¬ (x ^ 2 - (d : ℤ) * y ^ 2 = -1 ∨ x ^ 2 - (d : ℤ) * y ^ 2 = -4) := by
    intro p d x y hpd hp h
    have hd0 : (d : ZMod p) = 0 := (ZMod.natCast_eq_zero_iff d p).mpr hpd
    rcases h with h | h
    · have h' := congrArg (fun z : ℤ => (z : ZMod p)) h
      push_cast at h'
      rw [hd0, zero_mul, sub_zero] at h'
      exact (hp _).1 h'
    · have h' := congrArg (fun z : ℤ => (z : ZMod p)) h
      push_cast at h'
      rw [hd0, zero_mul, sub_zero] at h'
      exact (hp _).2 h'
  -- d = 34: no solution, by descent along the unit 35 + 6√34
  have hdesc : ∀ c : ℤ, (c = 1 ∨ c = 4) → ∀ m : ℕ, ∀ x y : ℤ, y.natAbs = m →
      x ^ 2 - 34 * y ^ 2 ≠ -c := by
    intro c hc m
    induction m using Nat.strong_induction_on with
    | _ m ih =>
    intro x y hm h
    have ha : 0 ≤ |x| := abs_nonneg x
    have hb : 0 ≤ |y| := abs_nonneg y
    have hab : |x| ^ 2 - 34 * |y| ^ 2 = -c := by rw [sq_abs, sq_abs]; exact h
    have hc0 : 0 < c := by rcases hc with rfl | rfl <;> norm_num
    have hb0 : 0 < |y| := by
      rcases hb.lt_or_eq with h' | h'
      · exact h'
      · exfalso
        rw [← h'] at hab
        nlinarith [sq_nonneg |x|]
    have hb2 : c = 4 → 2 ≤ |y| := by
      intro hc4
      by_contra hlt
      have hy1 : |y| = 1 := by omega
      rw [hy1, hc4] at hab
      rcases le_or_gt |x| 5 with h5 | h6
      · nlinarith
      · nlinarith
    have hpos : 0 < 35 * |y| - 6 * |x| := by
      by_contra hle
      rw [not_lt] at hle
      nlinarith [mul_self_le_mul_self (by positivity : (0 : ℤ) ≤ 35 * |y|)
        (by linarith : 35 * |y| ≤ 6 * |x|)]
    have hlt : 35 * |y| - 6 * |x| < |y| := by
      by_contra hle
      rw [not_lt] at hle
      have h36 := mul_self_le_mul_self (by positivity : (0 : ℤ) ≤ 6 * |x|)
        (by linarith : 6 * |x| ≤ 34 * |y|)
      rcases hc with rfl | rfl
      · nlinarith
      · have := hb2 rfl
        nlinarith
    have hlt' : (35 * |y| - 6 * |x|).natAbs < m := by
      rw [← hm, ← Int.natAbs_abs y]
      exact Int.natAbs_lt_natAbs_of_nonneg_of_lt hpos.le hlt
    exact ih _ hlt' (35 * |x| - 204 * |y|) (35 * |y| - 6 * |x|) rfl (by linear_combination hab)
  ext d
  simp only [Set.mem_sep_iff, Set.mem_insert_iff, Set.mem_singleton_iff]
  constructor
  · rintro ⟨⟨h1, hsq, x, y, hxy⟩, h37⟩
    interval_cases d
    all_goals first
      | (simp; done)
      | (refine absurd hsq (hnsf _ 2 le_rfl ?_); decide)
      | (refine absurd hsq (hnsf _ 3 (by norm_num) ?_); decide)
      | (refine absurd hsq (hnsf _ 5 (by norm_num) ?_); decide)
      | (refine absurd hxy (hcon 3 _ x y ?_ ?_); decide; decide)
      | (refine absurd hxy (hcon 7 _ x y ?_ ?_); decide; decide)
      | (refine absurd hxy (hcon 11 _ x y ?_ ?_); decide; decide)
      | (refine absurd hxy (hcon 19 _ x y ?_ ?_); decide; decide)
      | (refine absurd hxy (hcon 23 _ x y ?_ ?_); decide; decide)
      | (refine absurd hxy (hcon 31 _ x y ?_ ?_); decide; decide)
      | (exfalso
         rcases hxy with h | h
         · exact hdesc 1 (Or.inl rfl) _ x y rfl (by exact_mod_cast h)
         · exact hdesc 4 (Or.inr rfl) _ x y rfl (by exact_mod_cast h))
  · intro hd
    refine ⟨ms_14a_listed_in_negPellSet ?_, ?_⟩
    · simp only [Set.mem_insert_iff, Set.mem_singleton_iff]
      exact hd
    · rcases hd with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> norm_num

/-! ## L:MS-22 -/

/-- **L:MS-22** — (3.6): for a systole equal to 4 log φ (a hypothesis; the value is
L:MS-06 = L:RZ-06b, EFFORT): half of it is 2 log φ; 2 log φ is within 0.0005 of 0.962; and the
systole is not 2 log φ.

Served locus: §3.1, display (3.6) and the clause after it, PDF p09 (printed folio 8). PDF
sha256 prefix `b4841489`. -/
theorem ms_22_halfSystole (systole : ℝ) (h : systole = 4 * Real.log Real.goldenRatio) :
    systole / 2 = 2 * Real.log Real.goldenRatio ∧
    |2 * Real.log Real.goldenRatio - 0.962| < 0.0005 ∧
    systole ≠ 2 * Real.log Real.goldenRatio := by
  have hφ : Real.goldenRatio = (1 + Real.sqrt 5) / 2 := rfl
  have lower : (4811875 : ℝ) / 10000000 ≤ Real.log Real.goldenRatio := by
    rw [Real.le_log_iff_exp_le Real.goldenRatio_pos]
    have h := Real.exp_bound' (x := (4811875 : ℝ) / 10000000) (by norm_num) (by norm_num)
      (n := 8) (by norm_num)
    have hs : (2236 : ℝ) / 1000 ≤ Real.sqrt 5 := by
      rw [Real.le_sqrt (by norm_num)] <;> norm_num
    refine h.trans ?_
    simp only [Finset.sum_range_succ, Finset.sum_range_zero, Nat.factorial]
    norm_num
    linarith
  have upper : Real.log Real.goldenRatio < (4812125 : ℝ) / 10000000 := by
    rw [Real.log_lt_iff_lt_exp Real.goldenRatio_pos]
    have h := Real.sum_le_exp_of_nonneg (x := (4812125 : ℝ) / 10000000) (by norm_num) 10
    have hs : Real.sqrt 5 < (2236069 : ℝ) / 1000000 := by
      rw [Real.sqrt_lt' (by norm_num)]; norm_num
    refine lt_of_lt_of_le ?_ h
    simp only [Finset.sum_range_succ, Finset.sum_range_zero, Nat.factorial]
    norm_num
    linarith
  subst h
  refine ⟨by ring, ?_, ?_⟩
  · rw [abs_sub_lt_iff]
    constructor <;> norm_num <;> linarith
  · intro h
    linarith

/-! ## L:MS-24b -/

/-- **L:MS-24b** — (3.9): "g_c = 1/(√5 π) ≈ 0.14235", read at five decimals:
|g_c − 0.14235| < 5 × 10⁻⁶.

Served locus: §3.1, display (3.9), PDF p10 (printed folio 9). PDF sha256 prefix `b4841489`. -/
theorem ms_24b_geometryConstant_approx5 :
    |geometryConstant - 0.14235| < 0.000005 := by
  have h5u : Real.sqrt 5 < 2.236068 := by
    rw [Real.sqrt_lt' (by norm_num)]; norm_num
  have h5l : 2.236067 < Real.sqrt 5 := by
    rw [Real.lt_sqrt (by norm_num)]; norm_num
  have hπu := Real.pi_lt_d6
  have hπl := Real.pi_gt_d6
  have hPu : Real.sqrt 5 * Real.pi < 2.236068 * 3.141593 :=
    mul_lt_mul'' h5u hπu (by positivity) (by positivity)
  have hPl : 2.236067 * 3.141592 < Real.sqrt 5 * Real.pi :=
    mul_lt_mul'' h5l hπl (by norm_num) (by norm_num)
  have hP : 0 < Real.sqrt 5 * Real.pi := by positivity
  unfold geometryConstant
  rw [abs_sub_lt_iff]
  constructor
  · rw [sub_lt_iff_lt_add, div_lt_iff₀ hP]
    nlinarith
  · rw [sub_lt_comm, lt_div_iff₀ hP]
    nlinarith

/-! ## L:MS-25 -/

/-- **L:MS-25** — (3.10): g_c · √5 = 1/π and ln √5 + ln π + ln g_c = 0.

Served locus: §3.1, display (3.10), PDF p10 (printed folio 9). PDF sha256 prefix `b4841489`. -/
theorem ms_25_productRelation_logCollapse :
    geometryConstant * Real.sqrt 5 = 1 / Real.pi ∧
    Real.log (Real.sqrt 5) + Real.log Real.pi + Real.log geometryConstant = 0 := by
  have h5 : 0 < Real.sqrt 5 := by positivity
  have hπ : 0 < Real.pi := Real.pi_pos
  refine ⟨?_, ?_⟩
  · unfold geometryConstant
    field_simp
  · unfold geometryConstant
    rw [one_div, Real.log_inv, Real.log_mul h5.ne' hπ.ne']
    ring

/-! ## L:MS-32a -/

/-- MS §3.4 p13: the certificate written form-independently, g(d) = 1/(π√d). -/
noncomputable def ms32Gc (d : ℝ) : ℝ := 1 / (Real.pi * Real.sqrt d)

/-- **L:MS-32a** — the integer-ladder form: the fundamental discriminants in (1, 21] are
5, 8, 12, 13, 17, 21; g(D) ≤ g(5) for every fundamental discriminant D > 1, with equality only
at 5; g(8)/g(5) − 1 = √(5/8) − 1; and 100(√(5/8) − 1) is within 0.0005 of −20.943.
`ms13IsFundDisc` as in L:MS-13.

Served locus: §3.4, PDF p13 (printed folio 12). PDF sha256 prefix `b4841489`. -/
theorem ms_32a_certificate_max_and_next_rung :
    {D : ℕ | 1 < D ∧ D ≤ 21 ∧ ms13IsFundDisc D} = ({5, 8, 12, 13, 17, 21} : Set ℕ) ∧
    (∀ D : ℕ, 1 < D → ms13IsFundDisc D →
        ms32Gc D ≤ ms32Gc 5 ∧ (ms32Gc D = ms32Gc 5 ↔ D = 5)) ∧
    ms32Gc 8 / ms32Gc 5 - 1 = Real.sqrt (5 / 8) - 1 ∧
    |100 * (Real.sqrt (5 / 8) - 1) - (-20.943)| < 0.0005 := by
  have hsf : ∀ n : ℕ, 0 < n → (∀ k ∈ Finset.Icc 2 n, ¬ (k * k ∣ n)) → Squarefree n := by
    intro n hn h x hx
    rw [Nat.isUnit_iff]
    by_contra hx1
    have hx0 : x ≠ 0 := by
      rintro rfl
      simp at hx
      omega
    have hxn : x ≤ n := Nat.le_of_dvd hn (dvd_trans (dvd_mul_right x x) hx)
    exact h x (Finset.mem_Icc.mpr ⟨by omega, hxn⟩) hx
  have hπ : 0 < Real.pi := Real.pi_pos
  -- every fundamental discriminant D > 1 is at least 5
  have hge5 : ∀ D : ℕ, 1 < D → ms13IsFundDisc D → 5 ≤ D := by
    intro D h1 hD
    by_contra hlt
    rw [not_le] at hlt
    rcases hD with ⟨h4, -⟩ | ⟨m, rfl, hm, -⟩
    · unfold Nat.ModEq at h4
      interval_cases D <;> simp_all
    · unfold Nat.ModEq at hm
      have : m = 1 := by omega
      subst this
      simp at hm
  -- g is strictly decreasing on (0, ∞)
  have hg : ∀ a b : ℝ, 0 < a → a < b → ms32Gc b < ms32Gc a := by
    intro a b ha hab
    unfold ms32Gc
    have hsa : 0 < Real.sqrt a := Real.sqrt_pos.mpr ha
    have hsab : Real.sqrt a < Real.sqrt b := Real.sqrt_lt_sqrt ha.le hab
    exact one_div_lt_one_div_of_lt (by positivity) (by nlinarith)
  refine ⟨?_, ?_, ?_, ?_⟩
  · ext D
    simp only [Set.mem_ofPred_eq, Set.mem_insert_iff, Set.mem_singleton_iff]
    constructor
    · rintro ⟨h1, h21, hD⟩
      have h5 := hge5 D h1 hD
      rcases hD with ⟨h4, hsq⟩ | ⟨m, rfl, hm, -⟩
      · unfold Nat.ModEq at h4
        have : D = 5 ∨ D = 9 ∨ D = 13 ∨ D = 17 ∨ D = 21 := by omega
        rcases this with rfl | rfl | rfl | rfl | rfl
        · simp
        · have h9 := hsq 3 ⟨1, by norm_num⟩
          rw [Nat.isUnit_iff] at h9
          omega
        all_goals simp
      · unfold Nat.ModEq at hm
        have : m = 2 ∨ m = 3 := by omega
        rcases this with rfl | rfl <;> simp
    · rintro (rfl | rfl | rfl | rfl | rfl | rfl)
      · exact ⟨by norm_num, by norm_num, Or.inl ⟨rfl, hsf _ (by norm_num) (by decide)⟩⟩
      · exact ⟨by norm_num, by norm_num,
          Or.inr ⟨2, rfl, Or.inl rfl, hsf _ (by norm_num) (by decide)⟩⟩
      · exact ⟨by norm_num, by norm_num,
          Or.inr ⟨3, rfl, Or.inr rfl, hsf _ (by norm_num) (by decide)⟩⟩
      · exact ⟨by norm_num, by norm_num, Or.inl ⟨rfl, hsf _ (by norm_num) (by decide)⟩⟩
      · exact ⟨by norm_num, by norm_num, Or.inl ⟨rfl, hsf _ (by norm_num) (by decide)⟩⟩
      · exact ⟨by norm_num, by norm_num, Or.inl ⟨rfl, hsf _ (by norm_num) (by decide)⟩⟩
  · intro D h1 hD
    have h5 : (5 : ℝ) ≤ D := by exact_mod_cast hge5 D h1 hD
    rcases h5.lt_or_eq with hlt | heq
    · have := hg 5 D (by norm_num) hlt
      refine ⟨this.le, ?_⟩
      constructor
      · intro h; exact absurd h this.ne
      · intro h; subst h; norm_num at hlt
    · have hD5 : D = 5 := by exact_mod_cast heq.symm
      subst hD5
      exact ⟨by norm_num, by simp⟩
  · unfold ms32Gc
    rw [Real.sqrt_div (by norm_num : (0 : ℝ) ≤ 5)]
    have h5 : 0 < Real.sqrt 5 := by positivity
    have h8 : 0 < Real.sqrt 8 := by positivity
    field_simp
  · have hu : Real.sqrt (5 / 8) < 0.790575 := by
      rw [Real.sqrt_lt' (by norm_num)]; norm_num
    have hl : 0.790565 < Real.sqrt (5 / 8) := by
      rw [Real.lt_sqrt (by norm_num)]; norm_num
    rw [abs_sub_lt_iff]
    constructor <;> linarith

/-! ## L:MS-32b (OUT-OF-Q5, pending the wall) -/

/-- **L:MS-32b** — the field form: "g_c attains its maximum over the whole real-quadratic family
at d_K = 5" — the bound over every real quadratic K and its attainment. OUT-OF-Q5 (pending the
wall); inherits L:RZ-13. `ms32Gc` as in L:MS-32a.

Served locus: §3.4, PDF p13 (printed folio 12). PDF sha256 prefix `b4841489`. -/
theorem ms_32b_certificate_max_fields :
    (∀ (K : Type) [Field K] [NumberField K] [NumberField.IsTotallyReal K],
        Module.finrank ℚ K = 2 → ms32Gc (NumberField.discr K) ≤ ms32Gc 5) ∧
    (∃ (K : Type) (_ : Field K) (_ : NumberField K) (_ : NumberField.IsTotallyReal K),
        Module.finrank ℚ K = 2 ∧ NumberField.discr K = 5) := by
  open IntermediateField NumberField Polynomial in (
  refine ⟨?_, ?_⟩
  · intro K _ _ _ hK2
    -- the ∀ conjunct of L:RZ-13: copied from U9's `rz_13_min_real_quadratic_discr`
    -- (`RiemannZeta/Provenance/Solution.lean`, lines 1035–1160), the δ route
    have h5le : 5 ≤ NumberField.discr K := by
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
        rw [← sq, hδsq, show (D : K) = algebraMap ℚ K (D : ℚ) by simp, Algebra.trace_algebraMap,
          hK2]
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
    -- g is antitone in d > 0: g(d_K) ≤ g(5) from 5 ≤ d_K
    have h5R : (5 : ℝ) ≤ (NumberField.discr K : ℝ) := by exact_mod_cast h5le
    unfold ms32Gc
    apply one_div_le_one_div_of_le (by positivity)
    exact mul_le_mul_of_nonneg_left (Real.sqrt_le_sqrt h5R) Real.pi_pos.le
  · -- the attainment: ℚ(√5) ⊂ ℝ. Its `NumberField` instance is U9's `numberField_Q_sqrt5`
    -- (`RiemannZeta/Provenance/Solution.lean`, lines 33–37) as a local instance; the power
    -- basis and the real place are copied from U9's `rz_13_min_real_quadratic_discr`
    -- (lines 1163–1316), itself U4's `RiemannZeta/MatricesMobius/Solution.lean` 1831–1970.
    let _ : NumberField ℚ⟮(√5 : ℝ)⟯ :=
      { to_finiteDimensional := IntermediateField.adjoin.finiteDimensional
          (IsIntegral.of_pow (n := 2) (by norm_num)
            (by
              rw [Real.sq_sqrt (by norm_num)]
              simpa using isIntegral_algebraMap (R := ℚ) (A := ℝ) (x := 5))) }
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
    exact ⟨K, inferInstance, inferInstance, nrComplexPlaces_eq_zero_iff.mp hnrC, hfin, hdiscK⟩)

/-! ## L:MS-39 -/

/-- The classical Hurwitz zeta ζ(σ, a) = Σ_{n ≥ 0} (n + a)^{−σ} (a > 0). Local: mathlib's
`HurwitzZeta.hurwitzZeta` is 1-periodic in a and differs from this for a ∉ [0, 1]. -/
noncomputable def ms39HurwitzClassical (σ : ℂ) (a : ℝ) : ℂ :=
  ∑' n : ℕ, (((n : ℝ) + a : ℝ) : ℂ) ^ (-σ)

/-- **L:MS-39** — (4.4): for 1/2 < re s (supplied), with ℒ_s = `RZ.mayer s` (RZ (8.3),
L:RZ-53a; MS names the Mayer operator without its formula) and 1 the constant function:
(ℒ_s 1)(0) = Σ_{n ≥ 1} n^{−2s} = ζ(2s); (ℒ_s 1)(x) = ζ(2s, x + 1) (classical Hurwitz) on
[0, 1); 1/φ is a fixed point of the Gauss map; and (ℒ_s 1)(1/φ) = ζ(2s, φ) (classical).

Served locus: §4.2, display (4.4) and its parenthesis, PDF p15 (printed folio 14); the §5.2
echo, PDF p18 (printed folio 17). PDF sha256 prefix `b4841489`. -/
theorem ms_39_mayer_on_constant (s : ℂ) (hs : 1 / 2 < s.re) :
    RZ.mayer s (fun _ => 1) 0 = ∑' n : ℕ, 1 / ((n + 1 : ℂ)) ^ (2 * s) ∧
    ∑' n : ℕ, 1 / ((n + 1 : ℂ)) ^ (2 * s) = riemannZeta (2 * s) ∧
    (∀ x ∈ Set.Ico (0 : ℝ) 1,
        RZ.mayer s (fun _ => 1) x = ms39HurwitzClassical (2 * s) (x + 1)) ∧
    RZ.gaussMap (1 / Real.goldenRatio) = 1 / Real.goldenRatio ∧
    RZ.mayer s (fun _ => 1) (1 / Real.goldenRatio) =
        ms39HurwitzClassical (2 * s) Real.goldenRatio := by
  have hφ0 : Real.goldenRatio ≠ 0 := Real.goldenRatio_ne_zero
  have hφsq : Real.goldenRatio ^ 2 = Real.goldenRatio + 1 := Real.goldenRatio_sq
  -- 1/φ = φ − 1
  have hinv : 1 / Real.goldenRatio = Real.goldenRatio - 1 := by
    rw [div_eq_iff hφ0]
    linear_combination -hφsq
  refine ⟨?_, ?_, ?_, ?_, ?_⟩
  · unfold RZ.mayer
    refine tsum_congr fun n => ?_
    rw [mul_one, show -2 * s = -(2 * s) by ring, Complex.cpow_neg, one_div]
    congr 2
    push_cast
    ring
  · rw [zeta_eq_tsum_one_div_nat_add_one_cpow]
    simp only [Complex.mul_re, Complex.re_ofNat, Complex.im_ofNat, zero_mul, sub_zero]
    linarith
  · intro x _
    unfold RZ.mayer ms39HurwitzClassical
    refine tsum_congr fun n => ?_
    rw [mul_one, show -2 * s = -(2 * s) by ring]
    congr 2
    ring
  · unfold RZ.gaussMap
    rw [one_div, inv_inv, ← one_div, hinv, Int.fract]
    have hfl : ⌊Real.goldenRatio⌋ = 1 := by
      rw [Int.floor_eq_iff]
      exact ⟨by push_cast; exact Real.one_lt_goldenRatio.le,
        by push_cast; linarith [Real.goldenRatio_lt_two]⟩
    rw [hfl]
    push_cast
    ring
  · unfold RZ.mayer ms39HurwitzClassical
    refine tsum_congr fun n => ?_
    rw [mul_one, show -2 * s = -(2 * s) by ring]
    congr 2
    rw [hinv]
    ring

end ModularSurface.Now
