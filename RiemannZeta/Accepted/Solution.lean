import Mathlib

/-!
# Unit U12 (`RiemannZeta/Accepted`) — proofs

The Solution module of unit U12 (the NEW rows of the paper *The Tetrahedral Structure of the
Riemann Zeta Function*, QRiemannian Research, April 2026, revised October 2026, that the wall
accepted as Lean targets on 2026-10-28), served PDF sha256
`2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54` (prefix `2d5287e7`).
This module does NOT import `RiemannZeta.Accepted.Challenge`: it imports `Mathlib`, opens the
same namespace, restates the Challenge's non-theorem declarations (`scatteringRatio`,
`ms13IsFundDisc`) byte-identically, and proves each theorem under its Challenge name and
statement text (Challenge sha256 `43e639cc…`, signed by V₂).

Rows: L:RZ-N1 (`specs/RZ-N1.md`), L:RZ-N2a (`specs/RZ-N2a.md`), L:RZ-N4b (`specs/RZ-N4b.md`).

**Routes.** L:RZ-N1: `Real.strictMonoOn_arcosh` through t ↦ t/2; the fundamental discriminants
12 = 4·3 and 8 = 4·2 from the primes 3 and 2; the least traces by `interval_cases` below the
bound; the numerals through 2 arcosh 2 = 2 log(2 + √3) and 2 arcosh 3 = 2 log(3 + √8) with
rational brackets on √3, √8 and Taylor bounds on exp (`Real.exp_bound'` at half the argument,
squared, below; `Real.sum_le_exp_of_nonneg` above — the U2 numeral form of L:RZ-06a). L:RZ-N2a:
a reordering of the conjunction. L:RZ-N4b: on the line, 2s − 1 = 1 − conj(2s), so the functional
equation and Λ(conj w) = conj Λ(w) (assembled for Re w = 1 from ζ = Λ/Γ_ℝ, `riemannZeta_conj`,
`Complex.Gamma_conj`, `Complex.cpow_conj`) give φ(s) = conj Λ(2s)/Λ(2s), and Λ(2s) ≠ 0 because
ζ ≠ 0 on Re = 1.
-/

namespace RiemannZeta.Accepted

/-! ## Shared definitions (restated) -/

-- Restated byte-identically from U3 (`RiemannZeta/ZetaL/Challenge.lean`).
/-- The paper's φ(s) := Λ(2s−1)/Λ(2s), Λ = `completedRiemannZeta` (RZ (7.5), §7.4 p19). Named
apart from the golden ratio φ. Shared by L:RZ-46a and L:RZ-47. -/
noncomputable def scatteringRatio (s : ℂ) : ℂ :=
  completedRiemannZeta (2 * s - 1) / completedRiemannZeta (2 * s)

-- Restated byte-identically from U8 (`ModularSurface/Now/Challenge.lean`).
/-- Fundamental discriminant (positive form): D ≡ 1 (mod 4) squarefree, or D = 4m with
m ≡ 2, 3 (mod 4) squarefree. Local definition (none at the pin). -/
def ms13IsFundDisc (D : ℕ) : Prop :=
  (D ≡ 1 [MOD 4] ∧ Squarefree D) ∨
  (∃ m : ℕ, D = 4 * m ∧ (m ≡ 2 [MOD 4] ∨ m ≡ 3 [MOD 4]) ∧ Squarefree m)

/-! ## Auxiliary development (proof-side only; no statement uses these names) -/

section Aux

open ComplexConjugate

/-- Λ(conj w) = conj Λ(w) on Re w = 1 (no completed-zeta conjugation lemma at the pin): from
Λ = ζ·Γ_ℝ off the zeros of Γ_ℝ, `riemannZeta_conj`, and the conjugation of Γ_ℝ through
`Complex.Gamma_conj` and `Complex.cpow_conj` at the positive real base π. -/
theorem aux_completedRiemannZeta_conj (w : ℂ) (hw : w.re = 1) :
    completedRiemannZeta (conj w) = conj (completedRiemannZeta w) := by
  have hw0 : w ≠ 0 := by rintro rfl; simp at hw
  have hcw0 : conj w ≠ 0 := by simpa using hw0
  have hG : Complex.Gammaℝ w ≠ 0 := Complex.Gammaℝ_ne_zero_of_re_pos (by rw [hw]; norm_num)
  have hcG : Complex.Gammaℝ (conj w) ≠ 0 :=
    Complex.Gammaℝ_ne_zero_of_re_pos (by simp [hw])
  have hπ : ((Real.pi : ℂ)).arg ≠ Real.pi := by
    rw [Complex.arg_ofReal_of_nonneg Real.pi_pos.le]; exact Real.pi_pos.ne
  have hGc : Complex.Gammaℝ (conj w) = conj (Complex.Gammaℝ w) := by
    rw [Complex.Gammaℝ_def, Complex.Gammaℝ_def, map_mul, ← Complex.Gamma_conj]
    congr 1
    · rw [show -conj w / 2 = conj (-w / 2) by rw [map_div₀, map_neg, map_ofNat],
        Complex.cpow_conj _ _ hπ]
      simp
    · rw [map_div₀, map_ofNat]
  have hΛ : ∀ z : ℂ, z ≠ 0 → Complex.Gammaℝ z ≠ 0 →
      completedRiemannZeta z = riemannZeta z * Complex.Gammaℝ z := fun z hz hGz ↦ by
    rw [riemannZeta_def_of_ne_zero hz, div_mul_cancel₀ _ hGz]
  rw [hΛ _ hcw0 hcG, hΛ _ hw0 hG, riemannZeta_conj, hGc, map_mul]

/-- arcosh at the printed argument 4/2: log(2 + √3). -/
theorem aux_arcosh_two : Real.arcosh (4 / 2) = Real.log (2 + √3) := by
  rw [Real.arcosh]; norm_num

/-- arcosh at the printed argument 6/2: log(3 + √8). -/
theorem aux_arcosh_three : Real.arcosh (6 / 2) = Real.log (3 + √8) := by
  rw [Real.arcosh]; norm_num

/-- ℓ(t) = 2 arcosh(t/2) is strictly increasing on (2, ∞), from `Real.strictMonoOn_arcosh`. -/
theorem aux_strictMonoOn :
    StrictMonoOn (fun t : ℝ => 2 * Real.arcosh (t / 2)) (Set.Ioi 2) := by
  intro a ha b hb hab
  have ha' : (0 : ℝ) < a / 2 := by simp only [Set.mem_Ioi] at ha; linarith
  have hb' : (0 : ℝ) < b / 2 := by simp only [Set.mem_Ioi] at hb; linarith
  have := Real.strictMonoOn_arcosh ha' hb' (by linarith)
  simp only; linarith

/-- 4 is the least trace t > 2 with t² = 12·u² + 4, u ≥ 1. -/
theorem aux_least_twelve :
    IsLeast {t : ℕ | 2 < t ∧ ∃ u : ℕ, 0 < u ∧ t ^ 2 = 12 * u ^ 2 + 4} 4 := by
  refine ⟨⟨by norm_num, 1, by norm_num, by norm_num⟩, ?_⟩
  rintro t ⟨ht, u, hu, h⟩
  by_contra! hlt
  interval_cases t
  nlinarith

/-- 6 is the least trace t > 2 with t² = 8·u² + 4, u ≥ 1. -/
theorem aux_least_eight :
    IsLeast {t : ℕ | 2 < t ∧ ∃ u : ℕ, 0 < u ∧ t ^ 2 = 8 * u ^ 2 + 4} 6 := by
  refine ⟨⟨by norm_num, 2, by norm_num, by norm_num⟩, ?_⟩
  rintro t ⟨ht, u, hu, h⟩
  by_contra! hlt
  have hu2 : u ≤ 2 := by nlinarith
  interval_cases t <;> interval_cases u <;> omega

/-- |2 log(2 + √3) − 2.634| < 5·10⁻⁴, through 1.31675 < log(2 + √3) < 1.31725. -/
theorem aux_interval_two : |2 * Real.log (2 + √3) - 2.634| < 0.0005 := by
  have h3l : (1732 : ℝ) / 1000 ≤ √3 := by rw [Real.le_sqrt (by norm_num)] <;> norm_num
  have h3u : √3 < (17321 : ℝ) / 10000 := by rw [Real.sqrt_lt' (by norm_num)]; norm_num
  have hpos : (0 : ℝ) < 2 + √3 := by positivity
  -- lower: exp(1.31675) = exp(0.658375)², each factor below its Taylor sum plus remainder
  have lower : (131675 : ℝ) / 100000 < Real.log (2 + √3) := by
    rw [Real.lt_log_iff_exp_lt hpos]
    have h := Real.exp_bound' (x := (131675 : ℝ) / 200000) (by norm_num) (by norm_num)
      (n := 10) (by norm_num)
    have hsq : Real.exp ((131675 : ℝ) / 100000) = Real.exp ((131675 : ℝ) / 200000) ^ 2 := by
      rw [sq, ← Real.exp_add]; norm_num
    rw [hsq]
    have h0 : 0 ≤ Real.exp ((131675 : ℝ) / 200000) := (Real.exp_pos _).le
    simp only [Finset.sum_range_succ, Finset.sum_range_zero, Nat.factorial] at h
    norm_num at h
    nlinarith
  -- upper: 2 + √3 < (Taylor sum of order 14 at 1.31725) ≤ exp(1.31725)
  have upper : Real.log (2 + √3) < (131725 : ℝ) / 100000 := by
    rw [Real.log_lt_iff_lt_exp hpos]
    have h := Real.sum_le_exp_of_nonneg (x := (131725 : ℝ) / 100000) (by norm_num) 14
    refine lt_of_lt_of_le ?_ h
    simp only [Finset.sum_range_succ, Finset.sum_range_zero, Nat.factorial]
    norm_num
    linarith
  rw [abs_sub_lt_iff]; constructor <;> norm_num <;> linarith

/-- |2 log(3 + √8) − 3.525| < 5·10⁻⁴, through 1.76225 < log(3 + √8) < 1.76275 (the upper
margin is ≈ 2.8·10⁻⁶ in log(3 + √8), so √8 is bracketed to 10⁻⁷ and the Taylor sum runs to
order 18). -/
theorem aux_interval_three : |2 * Real.log (3 + √8) - 3.525| < 0.0005 := by
  have h8l : (2828 : ℝ) / 1000 ≤ √8 := by rw [Real.le_sqrt (by norm_num)] <;> norm_num
  have h8u : √8 < (28284272 : ℝ) / 10000000 := by rw [Real.sqrt_lt' (by norm_num)]; norm_num
  have hpos : (0 : ℝ) < 3 + √8 := by positivity
  -- lower: exp(1.76225) = exp(0.881125)², each factor below its Taylor sum plus remainder
  have lower : (176225 : ℝ) / 100000 < Real.log (3 + √8) := by
    rw [Real.lt_log_iff_exp_lt hpos]
    have h := Real.exp_bound' (x := (176225 : ℝ) / 200000) (by norm_num) (by norm_num)
      (n := 10) (by norm_num)
    have hsq : Real.exp ((176225 : ℝ) / 100000) = Real.exp ((176225 : ℝ) / 200000) ^ 2 := by
      rw [sq, ← Real.exp_add]; norm_num
    rw [hsq]
    have h0 : 0 ≤ Real.exp ((176225 : ℝ) / 200000) := (Real.exp_pos _).le
    simp only [Finset.sum_range_succ, Finset.sum_range_zero, Nat.factorial] at h
    norm_num at h
    nlinarith
  -- upper: 3 + √8 < (Taylor sum of order 18 at 1.76275) ≤ exp(1.76275)
  have upper : Real.log (3 + √8) < (176275 : ℝ) / 100000 := by
    rw [Real.log_lt_iff_lt_exp hpos]
    have h := Real.sum_le_exp_of_nonneg (x := (176275 : ℝ) / 100000) (by norm_num) 18
    refine lt_of_lt_of_le ?_ h
    simp only [Finset.sum_range_succ, Finset.sum_range_zero, Nat.factorial]
    norm_num
    linarith
  rw [abs_sub_lt_iff]; constructor <;> norm_num <;> linarith

end Aux

/-! ## L:RZ-N1 -/

/-- L:RZ-N1 — RZ §2.3, the parenthesis after (2.7), served p08 (sha256 2d5287e7…):
"geodesic length 2 arccosh(t/2) is monotone in the trace, not in the discriminant: d = 12,
t = 4, gives 2.634, shorter than d = 8, t = 6, at 3.525".

Served locus: §2.3, the sentence after display (2.7), PDF p08 (printed folio 7). PDF sha256
prefix `2d5287e7`. -/
theorem rz_N1_length_monotone_in_trace :
    StrictMonoOn (fun t : ℝ => 2 * Real.arcosh (t / 2)) (Set.Ioi 2) ∧
    (ms13IsFundDisc 12 ∧ ms13IsFundDisc 8) ∧
    IsLeast {t : ℕ | 2 < t ∧ ∃ u : ℕ, 0 < u ∧ t ^ 2 = 12 * u ^ 2 + 4} 4 ∧
    IsLeast {t : ℕ | 2 < t ∧ ∃ u : ℕ, 0 < u ∧ t ^ 2 = 8 * u ^ 2 + 4} 6 ∧
    ((8 : ℕ) < 12 ∧ 2 * Real.arcosh (4 / 2) < 2 * Real.arcosh (6 / 2)) ∧
    |2 * Real.arcosh (4 / 2) - 2.634| < 0.0005 ∧
    |2 * Real.arcosh (6 / 2) - 3.525| < 0.0005 := by
  refine ⟨aux_strictMonoOn, ⟨?_, ?_⟩, aux_least_twelve, aux_least_eight, ⟨by norm_num, ?_⟩, ?_, ?_⟩
  · -- 12 = 4·3, 3 ≡ 3 (mod 4), 3 prime
    exact Or.inr ⟨3, rfl, Or.inr rfl, Nat.prime_three.squarefree⟩
  · -- 8 = 4·2, 2 ≡ 2 (mod 4), 2 prime
    exact Or.inr ⟨2, rfl, Or.inl rfl, Nat.prime_two.squarefree⟩
  · exact aux_strictMonoOn (by norm_num : (4 : ℝ) ∈ Set.Ioi 2)
      (by norm_num : (6 : ℝ) ∈ Set.Ioi 2) (by norm_num)
  · rw [aux_arcosh_two]; exact aux_interval_two
  · rw [aux_arcosh_three]; exact aux_interval_three

/-! ## L:RZ-N2a -/

/-- L:RZ-N2a — RZ §3, the sentence after (3.5), served p09–p10 (sha256 2d5287e7…): the relation
set (3.2)–(3.5) is "invariant under that rotation", the edge 4-cycle Ê → Ŝ → Ĥ → D̂ → Ê.
Relations as hypotheses only (Q7).

Served locus: §3, the sentence after display (3.5), PDF p09–p10 (printed folios 8–9); the
relations (3.2)–(3.5) on PDF p09. PDF sha256 prefix `2d5287e7`. The row L:RZ-N2 enters T only
after CC-13's correction lands (its N2b leg is on the correction track). -/
theorem rz_N2a_rotation_invariant {A : Type*} [Ring A] [Algebra ℂ A] (E S H D : A) (ħ : ℝ) :
    (E * S - S * E = (Complex.I * (ħ : ℂ)) • (H * D) ∧     -- (3.2)
     S * H - H * S = (Complex.I * (ħ : ℂ)) • (D * E) ∧     -- (3.3)
     H * D - D * H = (Complex.I * (ħ : ℂ)) • (E * S) ∧     -- (3.4)
     D * E - E * D = (Complex.I * (ħ : ℂ)) • (S * H)) ↔   -- (3.5)
    (S * H - H * S = (Complex.I * (ħ : ℂ)) • (D * E) ∧     -- (3.2) at (S, H, D, E)
     H * D - D * H = (Complex.I * (ħ : ℂ)) • (E * S) ∧     -- (3.3) at (S, H, D, E)
     D * E - E * D = (Complex.I * (ħ : ℂ)) • (S * H) ∧     -- (3.4) at (S, H, D, E)
     E * S - S * E = (Complex.I * (ħ : ℂ)) • (H * D)) := by -- (3.5) at (S, H, D, E)
  constructor
  · rintro ⟨h2, h3, h4, h5⟩; exact ⟨h3, h4, h5, h2⟩
  · rintro ⟨h3, h4, h5, h2⟩; exact ⟨h2, h3, h4, h5⟩

/-! ## L:RZ-N4b -/

/-- L:RZ-N4b — RZ §7.4, the sentence after (7.5), served p19 (sha256 2d5287e7…): "the line
Re(s) = 1/2 on which |φ| = 1", φ = `scatteringRatio` = Λ(2s − 1)/Λ(2s). The point s = 1/2 (a
removable singularity of φ; mathlib's Λ is junk at 0 and 1) is excluded.

Served locus: §7.4, the sentence after display (7.5), PDF p19 (printed folio 18). PDF sha256
prefix `2d5287e7`. -/
theorem rz_N4b_scatteringRatio_norm_one (s : ℂ) (hs : s.re = 1 / 2) (h₀ : s ≠ 1 / 2) :
    ‖scatteringRatio s‖ = 1 := by
  -- h₀ is not needed: the identity below holds at every point of the line (at s = 1/2 through
  -- mathlib's junk values Λ(0) = Λ(1), a point the statement excludes); it is set aside here
  have _h₀ := h₀
  have hw : (2 * s).re = 1 := by simp [hs]
  have hw0 : 2 * s ≠ 0 := by intro h; rw [h] at hw; simp at hw
  -- Λ(2s) ≠ 0: ζ(2s) ≠ 0 on Re = 1, and ζ = Λ / Γ_ℝ off 0
  have hΛ0 : completedRiemannZeta (2 * s) ≠ 0 := by
    intro h
    apply riemannZeta_ne_zero_of_one_le_re hw.ge
    rw [riemannZeta_def_of_ne_zero hw0, h, zero_div]
  -- on the line 2s − 1 = 1 − conj(2s), so Λ(2s − 1) = Λ(conj(2s)) = conj Λ(2s)
  have hrefl : 2 * s - 1 = 1 - starRingEnd ℂ (2 * s) := by
    apply Complex.ext
    · simp [hs]
    · simp
  rw [scatteringRatio, hrefl, completedRiemannZeta_one_sub, aux_completedRiemannZeta_conj _ hw,
    norm_div, Complex.norm_conj, div_self (norm_ne_zero_iff.mpr hΛ0)]

end RiemannZeta.Accepted
