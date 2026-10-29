import Mathlib

/-!
# Unit U10 (`RiemannZeta/LValue`) — proofs

The Solution module of unit U10 (L(1, χ₅) and the binding definition of χ₅) of the paper
*The Tetrahedral Structure of the Riemann Zeta Function* (QRiemannian Research, April 2026,
revised October 2026), served PDF sha256
`2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54` (prefix `2d5287e7`).
This module does NOT import `RiemannZeta.LValue.Challenge`: it imports `Mathlib`, opens the same
namespace, restates the Challenge's non-theorem declarations (`fact_prime_five`, `chi5`)
byte-identically, and proves each theorem under its Challenge name and statement text
(Challenge sha256 `ed3c5e79…`, signed by V₂).

Rows: L:RZ-58a, L:RZ-58b, L:RZ-58c (`specs/RZ-58.md`).

**The route for L:RZ-58a** (`specs/RZ-58.md` §5, A0–A8). L(1, χ₅) is
`DirichletCharacter.LFunction chi5 1`, the continuation's value at s = 1. For real σ > 1 the
L-series is regrouped by residue class mod 5 into the blocks
b_m(σ) = (5m+1)^{−σ} − (5m+2)^{−σ} − (5m+3)^{−σ} + (5m+4)^{−σ};
Tannery's theorem (bound 4/(m+1)² for 1 ≤ σ ≤ 2) carries σ → 1⁺ inside the sum, and
continuity of the entire continuation (χ₅ ≠ 1) carries it outside, so L(1, χ₅) = Σ b_m(1).
The real series is then evaluated through b_m = ∫₀¹ t^{5m}(1 − t − t² + t³) dt: the partial
sums equal ∫₀¹ (1 − t²)/Q minus an error at most 1/(M+1) (Q = 1 + t + t² + t³ + t⁴), and
∫₀¹ (1 − t²)/Q = F(1) − F(0) = 2 log φ/√5 with
F(t) = (log(t² + φt + 1) − log(t² + ψt + 1))/√5. The conditionally convergent series
Σ χ₅(n)/n never appears as a `tsum` over n (it is 0 at the pin); only the grouped, absolutely
summable blocks do.
-/

namespace RiemannZeta.LValue

/-- `Fact (Nat.Prime 5)`, declared once for the unit (mathlib's pin has no global instance for the
natural number 5). A provable fact supplied as an instance, not a hypothesis of any statement. -/
instance fact_prime_five : Fact (Nat.Prime 5) := ⟨by norm_num⟩

/-- χ₅ — **the binding definition** (L:RZ-58b states what it is): the quadratic character mod 5
(the Legendre symbol (·/5)), valued in ℂ, as a Dirichlet character of modulus 5. Its body is
byte-identical to unit U2's `RiemannZeta.Bridge.chi5` and to unit U1's `RiemannZeta.Pilot.chi5`
(typed there as `MulChar (ZMod 5) ℂ`, which `DirichletCharacter ℂ 5` abbreviates). -/
noncomputable def chi5 : DirichletCharacter ℂ 5 :=
  (quadraticChar (ZMod 5)).ringHomComp (Int.castRingHom ℂ)

/-! ## Auxiliary development (proof-side only; no statement uses these names) -/

section Aux

open Real Filter Topology

/-- the grouped block at s = 1: b_m = 1/(5m+1) − 1/(5m+2) − 1/(5m+3) + 1/(5m+4) -/
noncomputable def aux_bterm (m : ℕ) : ℝ :=
  1 / (5 * (m : ℝ) + 1) - 1 / (5 * (m : ℝ) + 2) - 1 / (5 * (m : ℝ) + 3)
    + 1 / (5 * (m : ℝ) + 4)

lemma aux_Q_pos (t : ℝ) : 0 < t ^ 4 + t ^ 3 + t ^ 2 + t + 1 := by
  nlinarith [sq_nonneg (t ^ 2 + t / 2), sq_nonneg (t + 2 / 3)]

lemma aux_bterm_eq_integral (m : ℕ) :
    aux_bterm m = ∫ t in (0:ℝ)..1, t ^ (5 * m) * (1 - t - t ^ 2 + t ^ 3) := by
  have h : ∀ t : ℝ, t ^ (5 * m) * (1 - t - t ^ 2 + t ^ 3)
      = t ^ (5 * m) - t ^ (5 * m + 1) - t ^ (5 * m + 2) + t ^ (5 * m + 3) := by
    intro t; ring
  simp_rw [h]
  have hi : ∀ n : ℕ, IntervalIntegrable (fun t : ℝ => t ^ n) MeasureTheory.volume 0 1 :=
    fun n => (continuous_pow n).intervalIntegrable _ _
  rw [intervalIntegral.integral_add ((hi _).sub (hi _) |>.sub (hi _)) (hi _),
    intervalIntegral.integral_sub ((hi _).sub (hi _)) (hi _),
    intervalIntegral.integral_sub (hi _) (hi _),
    integral_pow, integral_pow, integral_pow, integral_pow]
  simp only [aux_bterm, one_pow, ne_eq, add_eq_zero, one_ne_zero, and_false, not_false_eq_true,
    zero_pow, sub_zero]
  push_cast
  ring

lemma aux_partial_identity (M : ℕ) (t : ℝ) :
    ∑ m ∈ Finset.range M, t ^ (5 * m) * (1 - t - t ^ 2 + t ^ 3)
      = (1 - t ^ 2) / (t ^ 4 + t ^ 3 + t ^ 2 + t + 1)
        - t ^ (5 * M) * ((1 - t ^ 2) / (t ^ 4 + t ^ 3 + t ^ 2 + t + 1)) := by
  have hQ := (aux_Q_pos t).ne'
  rw [← Finset.sum_mul]
  simp_rw [pow_mul]
  have hS := geom_sum_mul_neg (t ^ 5) M
  rw [show (1 - t ^ 2) / (t ^ 4 + t ^ 3 + t ^ 2 + t + 1)
        - (t ^ 5) ^ M * ((1 - t ^ 2) / (t ^ 4 + t ^ 3 + t ^ 2 + t + 1))
        = ((1 - (t ^ 5) ^ M) * (1 - t ^ 2)) / (t ^ 4 + t ^ 3 + t ^ 2 + t + 1) by ring,
    eq_div_iff hQ, ← hS]
  ring


/-- the integrand (1 − t²)/Q(t) -/
noncomputable def aux_gfun (t : ℝ) : ℝ := (1 - t ^ 2) / (t ^ 4 + t ^ 3 + t ^ 2 + t + 1)

lemma aux_gfun_continuous : Continuous aux_gfun := by
  unfold aux_gfun
  exact Continuous.div (by fun_prop) (by fun_prop) (fun t => (aux_Q_pos t).ne')

lemma aux_gfun_nonneg {t : ℝ} (h0 : 0 ≤ t) (h1 : t ≤ 1) : 0 ≤ aux_gfun t := by
  unfold aux_gfun
  apply div_nonneg _ (aux_Q_pos t).le
  nlinarith

lemma aux_gfun_le_one {t : ℝ} (h0 : 0 ≤ t) : aux_gfun t ≤ 1 := by
  unfold aux_gfun
  rw [div_le_one (aux_Q_pos t)]
  nlinarith [pow_nonneg h0 3, pow_nonneg h0 4]

lemma aux_powg_continuous (n : ℕ) : Continuous (fun t : ℝ => t ^ n * aux_gfun t) :=
  (continuous_pow n).mul aux_gfun_continuous

lemma aux_partial_sum_eq (M : ℕ) :
    ∑ m ∈ Finset.range M, aux_bterm m
      = (∫ t in (0:ℝ)..1, aux_gfun t) - ∫ t in (0:ℝ)..1, t ^ (5 * M) * aux_gfun t := by
  simp_rw [aux_bterm_eq_integral]
  rw [← intervalIntegral.integral_finsetSum (fun m _ =>
      (Continuous.intervalIntegrable (by fun_prop) _ _)),
    ← intervalIntegral.integral_sub (aux_gfun_continuous.intervalIntegrable _ _)
      ((aux_powg_continuous _).intervalIntegrable _ _)]
  congr 1
  ext t
  rw [aux_partial_identity]
  rfl

lemma aux_error_tendsto :
    Tendsto (fun M : ℕ => ∫ t in (0:ℝ)..1, t ^ (5 * M) * aux_gfun t) atTop (𝓝 0) := by
  have hle : ∀ M : ℕ,
      ∫ t in (0:ℝ)..1, t ^ (5 * M) * aux_gfun t ≤ 1 / ((M : ℝ) + 1) := by
    intro M
    have h1 : ∫ t in (0:ℝ)..1, t ^ (5 * M) * aux_gfun t
        ≤ ∫ t in (0:ℝ)..1, t ^ (5 * M) := by
      apply intervalIntegral.integral_mono_on zero_le_one
        ((aux_powg_continuous _).intervalIntegrable _ _)
        ((continuous_pow _).intervalIntegrable _ _)
      intro t ht
      have := aux_gfun_le_one ht.1
      have hp : 0 ≤ t ^ (5 * M) := pow_nonneg ht.1 _
      nlinarith
    rw [integral_pow] at h1
    refine h1.trans ?_
    simp only [one_pow, ne_eq, add_eq_zero, one_ne_zero, and_false, not_false_eq_true,
      zero_pow, sub_zero]
    apply one_div_le_one_div_of_le (by positivity)
    push_cast
    have : (0:ℝ) ≤ M := M.cast_nonneg
    linarith
  have hnn : ∀ M : ℕ, 0 ≤ ∫ t in (0:ℝ)..1, t ^ (5 * M) * aux_gfun t := by
    intro M
    apply intervalIntegral.integral_nonneg zero_le_one
    intro t ht
    exact mul_nonneg (pow_nonneg ht.1 _) (aux_gfun_nonneg ht.1 ht.2)
  exact squeeze_zero hnn hle tendsto_one_div_add_atTop_nhds_zero_nat

lemma aux_bterm_nonneg (m : ℕ) : 0 ≤ aux_bterm m := by
  rw [aux_bterm_eq_integral]
  apply intervalIntegral.integral_nonneg zero_le_one
  intro t ht
  have h0 := ht.1
  have h1 := ht.2
  have : 0 ≤ 1 - t - t ^ 2 + t ^ 3 := by
    nlinarith [mul_nonneg (mul_nonneg (sub_nonneg.2 h1) (sub_nonneg.2 h1)) h0]
  exact mul_nonneg (pow_nonneg h0 _) this

lemma aux_hasSum_bterm_integral : HasSum aux_bterm (∫ t in (0:ℝ)..1, aux_gfun t) := by
  rw [hasSum_iff_tendsto_nat_of_nonneg aux_bterm_nonneg]
  simp_rw [aux_partial_sum_eq]
  simpa using (tendsto_const_nhds (x := ∫ t in (0:ℝ)..1, aux_gfun t)).sub aux_error_tendsto


lemma aux_quad_pos (c t : ℝ) (hc1 : -2 < c) (hc2 : c < 2) : 0 < t ^ 2 + c * t + 1 := by
  nlinarith [sq_nonneg (t + c / 2)]

lemma aux_phi_lt_two : goldenRatio < 2 := by
  have : √5 < 3 := by rw [Real.sqrt_lt' (by norm_num)]; norm_num
  change (1 + √5) / 2 < 2
  linarith

/-- the antiderivative F(t) = (log(t² + φt + 1) − log(t² + ψt + 1))/√5 -/
noncomputable def aux_Ffun (t : ℝ) : ℝ :=
  (Real.log (t ^ 2 + goldenRatio * t + 1) - Real.log (t ^ 2 + goldenConj * t + 1)) / √5

lemma aux_hasDerivAt_Ffun (t : ℝ) : HasDerivAt aux_Ffun (aux_gfun t) t := by
  have hφ1 : -2 < goldenRatio := by linarith [goldenRatio_pos]
  have hφ2 := aux_phi_lt_two
  have hψ1 : -2 < goldenConj := by linarith [neg_one_lt_goldenConj]
  have hψ2 : goldenConj < 2 := by linarith [goldenConj_neg]
  have hA := (aux_quad_pos goldenRatio t hφ1 hφ2).ne'
  have hB := (aux_quad_pos goldenConj t hψ1 hψ2).ne'
  have hdA : HasDerivAt (fun t : ℝ => t ^ 2 + goldenRatio * t + 1) (2 * t + goldenRatio) t := by
    exact (((hasDerivAt_pow 2 t).add ((hasDerivAt_id' t).const_mul goldenRatio)).add_const
      1).congr_deriv (by push_cast; ring)
  have hdB : HasDerivAt (fun t : ℝ => t ^ 2 + goldenConj * t + 1) (2 * t + goldenConj) t := by
    exact (((hasDerivAt_pow 2 t).add ((hasDerivAt_id' t).const_mul goldenConj)).add_const
      1).congr_deriv (by push_cast; ring)
  have h := ((hdA.log hA).sub (hdB.log hB)).div_const √5
  refine h.congr_deriv ?_
  have hs : √5 ^ 2 = 5 := Real.sq_sqrt (by norm_num)
  have hs0 : √5 ≠ 0 := by positivity
  have hQ := (aux_Q_pos t).ne'
  unfold aux_gfun
  rw [div_sub_div _ _ hA hB, div_div, div_eq_div_iff (mul_ne_zero (mul_ne_zero hA hB) hs0) hQ]
  simp only [goldenRatio, goldenConj]
  linear_combination (√5 * (1 - t ^ 2) * t ^ 2 / 4) * hs


lemma aux_integral_gfun : ∫ t in (0:ℝ)..1, aux_gfun t = 2 * Real.log goldenRatio / √5 := by
  rw [intervalIntegral.integral_eq_sub_of_hasDerivAt (fun t _ => aux_hasDerivAt_Ffun t)
    (aux_gfun_continuous.intervalIntegrable _ _)]
  unfold aux_Ffun
  have h2ψ : 0 < 2 + goldenConj := by linarith [neg_one_lt_goldenConj]
  have hkey : 2 + goldenRatio = goldenRatio ^ 2 * (2 + goldenConj) := by
    have h := goldenRatio_mul_goldenConj
    have hs : √5 ^ 2 = 5 := Real.sq_sqrt (by norm_num)
    linear_combination (-1 : ℝ) * goldenRatio_sq - goldenRatio * h + (-1 / 4 : ℝ) * hs
  have hlog : Real.log (2 + goldenRatio)
      = 2 * Real.log goldenRatio + Real.log (2 + goldenConj) := by
    rw [hkey, Real.log_mul (by positivity) h2ψ.ne', Real.log_pow]
    push_cast; ring
  simp only [one_pow, mul_one, zero_pow (two_ne_zero), mul_zero, zero_add, Real.log_one, sub_zero,
    zero_div]
  rw [show (1 : ℝ) + goldenRatio + 1 = 2 + goldenRatio by ring,
    show (1 : ℝ) + goldenConj + 1 = 2 + goldenConj by ring, hlog]
  ring

lemma aux_hasSum_bterm : HasSum aux_bterm (2 * Real.log goldenRatio / √5) :=
  aux_integral_gfun ▸ aux_hasSum_bterm_integral

lemma aux_q_vals : quadraticChar (ZMod 5) 0 = 0 ∧ quadraticChar (ZMod 5) 1 = 1 ∧
    quadraticChar (ZMod 5) 2 = -1 ∧ quadraticChar (ZMod 5) 3 = -1 ∧
    quadraticChar (ZMod 5) 4 = 1 := by
  refine ⟨quadraticChar_zero, map_one _, ?_, ?_, ?_⟩
  · rw [quadraticChar_neg_one_iff_not_isSquare]; decide
  · rw [quadraticChar_neg_one_iff_not_isSquare]; decide
  · rw [quadraticChar_one_iff_isSquare (by decide)]; decide

lemma aux_chi5_apply (a : ZMod 5) : chi5 a = ((quadraticChar (ZMod 5) a : ℤ) : ℂ) := rfl

/-- the grouped block at real exponent σ -/
noncomputable def aux_bs (σ : ℝ) (m : ℕ) : ℝ :=
  1 / (5 * (m : ℝ) + 1) ^ σ - 1 / (5 * (m : ℝ) + 2) ^ σ - 1 / (5 * (m : ℝ) + 3) ^ σ
    + 1 / (5 * (m : ℝ) + 4) ^ σ

/-- one residue class of the L-series, written as a real number -/
noncomputable def aux_gk (σ : ℝ) (k m : ℕ) : ℝ :=
  ((quadraticChar (ZMod 5) (k : ZMod 5) : ℤ) : ℝ) * (1 / (5 * (m : ℝ) + k) ^ σ)

lemma aux_term_eq (σ : ℝ) (k m : ℕ) (hk : k ≠ 0) :
    LSeries.term (fun n : ℕ => chi5 n) σ (k + 5 * m) = ((aux_gk σ k m : ℝ) : ℂ) := by
  rw [LSeries.term_of_ne_zero (by omega)]
  have hc : (((k + 5 * m : ℕ)) : ZMod 5) = (k : ZMod 5) := by
    push_cast
    rw [show (5 : ZMod 5) = 0 from rfl]; ring
  have hx : (0 : ℝ) ≤ 5 * (m : ℝ) + k := by positivity
  have hd : ((k + 5 * m : ℕ) : ℂ) ^ (σ : ℂ) = (((5 * (m : ℝ) + k) ^ σ : ℝ) : ℂ) := by
    rw [Complex.ofReal_cpow hx]; push_cast; ring_nf
  simp only [hc, hd, aux_chi5_apply, aux_gk]
  push_cast
  ring

lemma aux_term_zero_class (σ : ℝ) (m : ℕ) :
    LSeries.term (fun n : ℕ => chi5 n) σ (5 * m) = 0 := by
  rw [LSeries.term_def]
  split_ifs
  · rfl
  · have hc : (((5 * m : ℕ)) : ZMod 5) = 0 := by
      push_cast
      rw [show (5 : ZMod 5) = 0 from rfl]; ring
    rw [hc, aux_chi5_apply, aux_q_vals.1]; simp

lemma aux_LFunction_eq_tsum_bs {σ : ℝ} (hσ : 1 < σ) :
    DirichletCharacter.LFunction chi5 (σ : ℂ) = ((∑' m, aux_bs σ m : ℝ) : ℂ) := by
  have hre : 1 < (σ : ℂ).re := by simpa using hσ
  have hf : Summable (LSeries.term (fun n : ℕ => chi5 n) σ) :=
    DirichletCharacter.LSeriesSummable_of_one_lt_re chi5 hre
  rw [DirichletCharacter.LFunction_eq_LSeries chi5 hre, LSeries,
    Nat.sumByResidueClasses hf 5]
  have hsum : ∀ F : ZMod 5 → ℂ, ∑ a, F a = F 0 + F 1 + F 2 + F 3 + F 4 :=
    fun F => Fin.sum_univ_five F
  rw [hsum]
  have v0 : (0 : ZMod 5).val = 0 := rfl
  have v1 : (1 : ZMod 5).val = 1 := rfl
  have v2 : (2 : ZMod 5).val = 2 := rfl
  have v3 : (3 : ZMod 5).val = 3 := rfl
  have v4 : (4 : ZMod 5).val = 4 := rfl
  simp only [v0, v1, v2, v3, v4, zero_add, aux_term_zero_class, tsum_zero]
  have hs : ∀ k : ℕ, k ≠ 0 → Summable (aux_gk σ k) := by
    intro k hk
    have hinj : Function.Injective (fun m : ℕ => k + 5 * m) := fun a b h => by
      simp only at h; omega
    have := hf.comp_injective hinj
    rw [← Complex.summable_ofReal]
    have heq : (fun m : ℕ => ((aux_gk σ k m : ℝ) : ℂ))
        = (LSeries.term (fun n : ℕ => chi5 n) σ ∘ fun m : ℕ => k + 5 * m) :=
      funext fun m => (aux_term_eq σ k m hk).symm
    rw [heq]; exact this
  simp only [fun k m => aux_term_eq σ k m, ne_eq, OfNat.ofNat_ne_zero, not_false_eq_true,
    one_ne_zero]
  rw [← Complex.ofReal_tsum, ← Complex.ofReal_tsum, ← Complex.ofReal_tsum,
    ← Complex.ofReal_tsum]
  rw [← Complex.ofReal_add, ← Complex.ofReal_add, ← Complex.ofReal_add]
  congr 1
  rw [← (hs 1 one_ne_zero).tsum_add (hs 2 two_ne_zero),
    ← ((hs 1 one_ne_zero).add (hs 2 two_ne_zero)).tsum_add (hs 3 three_ne_zero),
    ← (((hs 1 one_ne_zero).add (hs 2 two_ne_zero)).add (hs 3 three_ne_zero)).tsum_add
      (hs 4 four_ne_zero)]
  congr 1
  ext m
  obtain ⟨_, q1, q2, q3, q4⟩ := aux_q_vals
  simp only [aux_gk, aux_bs, Nat.cast_one, Nat.cast_ofNat, q1, q2, q3, q4]
  push_cast
  ring


lemma aux_diff_bound {x σ : ℝ} (hx : 1 ≤ x) (hσ1 : 1 ≤ σ) (hσ2 : σ ≤ 2) :
    0 ≤ 1 / x ^ σ - 1 / (x + 1) ^ σ ∧ 1 / x ^ σ - 1 / (x + 1) ^ σ ≤ 2 / x ^ 2 := by
  have hx0 : 0 < x := by linarith
  have hA : 0 < x ^ σ := Real.rpow_pos_of_pos hx0 σ
  have hB : 0 < (x + 1) ^ σ := Real.rpow_pos_of_pos (by linarith) σ
  have hAB : x ^ σ ≤ (x + 1) ^ σ := Real.rpow_le_rpow hx0.le (by linarith) (by linarith)
  constructor
  · have := one_div_le_one_div_of_le hA hAB
    linarith
  · -- r = x/(x+1) ∈ (0, 1); r^σ ≥ r²
    have hr0 : 0 < x / (x + 1) := by positivity
    have hr1 : x / (x + 1) ≤ 1 := by rw [div_le_one (by linarith)]; linarith
    have hrσ : (x / (x + 1)) ^ (2 : ℝ) ≤ (x / (x + 1)) ^ σ :=
      Real.rpow_le_rpow_of_exponent_ge hr0 hr1 hσ2
    rw [Real.rpow_two, Real.div_rpow hx0.le (by linarith)] at hrσ
    -- x ≤ x^σ
    have hxA : x ≤ x ^ σ := by
      have := Real.rpow_le_rpow_of_exponent_le hx hσ1
      rwa [Real.rpow_one] at this
    -- D = (1/A) (1 - A/B)
    have hD : 1 / x ^ σ - 1 / (x + 1) ^ σ = (1 / x ^ σ) * (1 - x ^ σ / (x + 1) ^ σ) := by
      field_simp
    rw [hD]
    have h1 : 1 - x ^ σ / (x + 1) ^ σ ≤ 1 - (x / (x + 1)) ^ 2 := by linarith
    have h2 : 0 ≤ 1 - x ^ σ / (x + 1) ^ σ := by
      rw [sub_nonneg, div_le_one hB]; exact hAB
    have h3 : 1 / x ^ σ ≤ 1 / x := one_div_le_one_div_of_le hx0 hxA
    calc (1 / x ^ σ) * (1 - x ^ σ / (x + 1) ^ σ) ≤ (1 / x) * (1 - (x / (x + 1)) ^ 2) :=
          mul_le_mul h3 h1 h2 (by positivity)
      _ ≤ 2 / x ^ 2 := by
          rw [div_pow, one_sub_div (by positivity), div_mul_div_comm, div_le_div_iff₀
            (by positivity) (by positivity)]
          nlinarith [sq_nonneg x, pow_pos hx0 3]

lemma aux_bs_abs_le {σ : ℝ} (hσ1 : 1 ≤ σ) (hσ2 : σ ≤ 2) (m : ℕ) :
    |aux_bs σ m| ≤ 4 / ((m : ℝ) + 1) ^ 2 := by
  have hm : (0 : ℝ) ≤ m := m.cast_nonneg
  obtain ⟨a0, a1⟩ := aux_diff_bound (x := 5 * (m : ℝ) + 1) (by linarith) hσ1 hσ2
  obtain ⟨b0, b1⟩ := aux_diff_bound (x := 5 * (m : ℝ) + 3) (by linarith) hσ1 hσ2
  have e1 : (5 * (m : ℝ) + 1) + 1 = 5 * (m : ℝ) + 2 := by ring
  have e3 : (5 * (m : ℝ) + 3) + 1 = 5 * (m : ℝ) + 4 := by ring
  rw [e1] at a0 a1
  rw [e3] at b0 b1
  have hb : aux_bs σ m = (1 / (5 * (m : ℝ) + 1) ^ σ - 1 / (5 * (m : ℝ) + 2) ^ σ)
      - (1 / (5 * (m : ℝ) + 3) ^ σ - 1 / (5 * (m : ℝ) + 4) ^ σ) := by
    unfold aux_bs; ring
  have c1 : 2 / (5 * (m : ℝ) + 1) ^ 2 ≤ 2 / ((m : ℝ) + 1) ^ 2 := by
    apply div_le_div_of_nonneg_left (by norm_num) (by positivity)
    nlinarith
  have c3 : 2 / (5 * (m : ℝ) + 3) ^ 2 ≤ 2 / ((m : ℝ) + 1) ^ 2 := by
    apply div_le_div_of_nonneg_left (by norm_num) (by positivity)
    nlinarith
  have h4 : 4 / ((m : ℝ) + 1) ^ 2 = 2 / ((m : ℝ) + 1) ^ 2 + 2 / ((m : ℝ) + 1) ^ 2 := by ring
  rw [hb, abs_le, h4]
  constructor <;> linarith

lemma aux_summable_bound : Summable (fun m : ℕ => 4 / ((m : ℝ) + 1) ^ 2) := by
  have h := (summable_nat_add_iff 1).mpr (Real.summable_one_div_nat_pow.mpr one_lt_two)
  exact (h.mul_left 4).congr fun m => by push_cast; ring

lemma aux_bs_continuous (m : ℕ) : Continuous (fun σ : ℝ => aux_bs σ m) := by
  have hc : ∀ c : ℝ, 0 < c → Continuous (fun σ : ℝ => 1 / c ^ σ) := by
    intro c hc
    exact continuous_const.div (continuous_const.rpow continuous_id fun _ => Or.inl hc.ne')
      fun σ => (Real.rpow_pos_of_pos hc σ).ne'
  unfold aux_bs
  have hm : (0 : ℝ) ≤ m := m.cast_nonneg
  exact (((hc _ (by linarith)).sub (hc _ (by linarith))).sub (hc _ (by linarith))).add
    (hc _ (by linarith))

lemma aux_tendsto_tsum_bs :
    Tendsto (fun σ : ℝ => ∑' m, aux_bs σ m) (𝓝[>] 1) (𝓝 (∑' m, aux_bs 1 m)) := by
  apply tendsto_tsum_of_dominated_convergence aux_summable_bound
  · intro m
    exact ((aux_bs_continuous m).tendsto 1).mono_left nhdsWithin_le_nhds
  · have h : Set.Ioo (1 : ℝ) 2 ∈ 𝓝[>] (1 : ℝ) := Ioo_mem_nhdsGT (by norm_num)
    filter_upwards [h] with σ hσ m
    rw [Real.norm_eq_abs]
    exact aux_bs_abs_le hσ.1.le hσ.2.le m

lemma aux_chi5_ne_one : chi5 ≠ 1 := by
  intro h
  have h2 : chi5 2 = (1 : DirichletCharacter ℂ 5) 2 := by rw [h]
  rw [MulChar.one_apply (by decide), aux_chi5_apply, aux_q_vals.2.2.1] at h2
  norm_num at h2

lemma aux_LFunction_chi5_one_eq_tsum :
    DirichletCharacter.LFunction chi5 1 = ((∑' m, aux_bs 1 m : ℝ) : ℂ) := by
  have hcont : ContinuousAt (DirichletCharacter.LFunction chi5) 1 :=
    (DirichletCharacter.differentiable_LFunction aux_chi5_ne_one).continuous.continuousAt
  have h1 : Tendsto (fun σ : ℝ => DirichletCharacter.LFunction chi5 (σ : ℂ)) (𝓝[>] 1)
      (𝓝 (DirichletCharacter.LFunction chi5 1)) := by
    have := hcont.tendsto.comp (Complex.continuous_ofReal.tendsto (1 : ℝ))
    exact this.mono_left nhdsWithin_le_nhds
  have h2 : Tendsto (fun σ : ℝ => ((∑' m, aux_bs σ m : ℝ) : ℂ)) (𝓝[>] 1)
      (𝓝 ((∑' m, aux_bs 1 m : ℝ) : ℂ)) :=
    (Complex.continuous_ofReal.tendsto _).comp aux_tendsto_tsum_bs
  have heq : (fun σ : ℝ => ((∑' m, aux_bs σ m : ℝ) : ℂ)) =ᶠ[𝓝[>] 1]
      (fun σ : ℝ => DirichletCharacter.LFunction chi5 (σ : ℂ)) := by
    filter_upwards [self_mem_nhdsWithin] with σ hσ
    exact (aux_LFunction_eq_tsum_bs hσ).symm
  exact tendsto_nhds_unique h1 (h2.congr' heq)

/-- the four-decimal bounds of 4 log φ (the U2 argument of L:RZ-06a, restated in-unit) -/
lemma aux_four_log_phi_bounds :
    (192475 : ℝ) / 100000 ≤ 4 * Real.log goldenRatio ∧
    4 * Real.log goldenRatio < (192485 : ℝ) / 100000 := by
  have hφ : goldenRatio = (1 + √5) / 2 := rfl
  -- lower: exp(0.4811875) ≤ φ, from the Taylor sum of order 8 plus mathlib's remainder bound
  have lower : (4811875 : ℝ) / 10000000 ≤ Real.log goldenRatio := by
    rw [Real.le_log_iff_exp_le goldenRatio_pos]
    have h := Real.exp_bound' (x := (4811875 : ℝ) / 10000000) (by norm_num) (by norm_num)
      (n := 8) (by norm_num)
    have hs : (2236 : ℝ) / 1000 ≤ √5 := by
      rw [Real.le_sqrt (by norm_num)] <;> norm_num
    refine h.trans ?_
    simp only [Finset.sum_range_succ, Finset.sum_range_zero, Nat.factorial]
    norm_num
    linarith
  -- upper: φ < (Taylor sum of order 10 at 0.4812125) ≤ exp(0.4812125)
  have upper : Real.log goldenRatio < (4812125 : ℝ) / 10000000 := by
    rw [Real.log_lt_iff_lt_exp goldenRatio_pos]
    have h := Real.sum_le_exp_of_nonneg (x := (4812125 : ℝ) / 10000000) (by norm_num) 10
    have hs : √5 < (2236069 : ℝ) / 1000000 := by
      rw [Real.sqrt_lt' (by norm_num)]; norm_num
    refine lt_of_lt_of_le ?_ h
    simp only [Finset.sum_range_succ, Finset.sum_range_zero, Nat.factorial]
    norm_num
    linarith
  constructor <;> linarith

end Aux

/-! ## L:RZ-58a -/

open Real in
/-- **L:RZ-58a** (split leg of L:RZ-58, the target) — L(1, χ₅) = 2 log φ/√5, with L(1, χ₅) read
as `DirichletCharacter.LFunction chi5 1`, the continuation's value at s = 1.

Served locus: §9.2, display (9.5), PDF p23 (printed folio 22); §9.5, display (9.8), PDF p24
(printed folio 23); §9.5, display (9.9), PDF p24–p25 (printed folios 23–24). PDF sha256 prefix
`2d5287e7`. -/
theorem rz_58a_LFunction_chi5_one :
    DirichletCharacter.LFunction chi5 1 = ((2 * Real.log goldenRatio / √5 : ℝ) : ℂ) := by
  rw [aux_LFunction_chi5_one_eq_tsum]
  congr 1
  have h : (fun m => aux_bs 1 m) = aux_bterm := by
    funext m
    simp only [aux_bs, aux_bterm, Real.rpow_one]
  rw [h]
  exact aux_hasSum_bterm.tsum_eq

/-! ## L:RZ-58b -/

/-- **L:RZ-58b** (split leg of L:RZ-58) — χ₅ is the Kronecker symbol (5/·), stated through its
defining values: J(5 | n) on odd n, χ₈(5) = (5/2) at 2, and +1 = (5/−1) at −1 (with complete
multiplicativity and χ₅ 0 = 0 these fix (5/·) on every integer).

Served locus: §9.2, the sentence after display (9.4), PDF p23 (printed folio 22). PDF sha256
prefix `2d5287e7`. -/
theorem rz_58b_chi5_kronecker :
    (∀ n : ℕ, Odd n → chi5 (n : ZMod 5) = ((jacobiSym 5 n : ℤ) : ℂ)) ∧
    chi5 (2 : ZMod 5) = ((ZMod.χ₈ (5 : ZMod 8) : ℤ) : ℂ) ∧
    chi5 (-1 : ZMod 5) = 1 := by
  obtain ⟨_, _, q2, _, q4⟩ := aux_q_vals
  refine ⟨?_, ?_, ?_⟩
  · intro n hn
    have h := jacobiSym.quadratic_reciprocity_one_mod_four (a := 5) (b := n) (by norm_num) hn
    rw [Nat.cast_ofNat] at h
    rw [h, ← jacobiSym.legendreSym.to_jacobiSym 5 (n : ℤ), aux_chi5_apply, legendreSym,
      Int.cast_natCast]
  · rw [aux_chi5_apply, q2, show ZMod.χ₈ (5 : ZMod 8) = -1 from rfl]
  · rw [aux_chi5_apply, show (-1 : ZMod 5) = 4 from rfl, q4]
    simp

/-- **L:RZ-58b** (split leg of L:RZ-58) — χ₅ is real-valued (every value has imaginary part 0),
primitive, and of conductor 5.

Served locus: §9.2, the sentence after display (9.4), PDF p23 (printed folio 22). PDF sha256
prefix `2d5287e7`. -/
theorem rz_58b_chi5_real_primitive_conductor :
    (∀ a : ZMod 5, (chi5 a).im = 0) ∧ chi5.IsPrimitive ∧ chi5.conductor = 5 := by
  have hc : chi5.conductor = 5 := by
    rcases (Nat.prime_five.eq_one_or_self_of_dvd _ chi5.conductor_dvd_level) with h | h
    · exact absurd (DirichletCharacter.eq_one_iff_conductor_eq_one.mpr h) aux_chi5_ne_one
    · exact h
  refine ⟨fun a => ?_, (DirichletCharacter.isPrimitive_def chi5).mpr hc, hc⟩
  rw [aux_chi5_apply]
  simp

/-- **L:RZ-58b** (split leg of L:RZ-58) — χ₅ is the unique real-valued primitive Dirichlet
character of modulus 5 ("the unique real primitive Dirichlet character of conductor 5").

Served locus: §9.2, the sentence after display (9.4), PDF p23 (printed folio 22). PDF sha256
prefix `2d5287e7`. -/
theorem rz_58b_chi5_unique (χ : DirichletCharacter ℂ 5)
    (hreal : ∀ a : ZMod 5, (χ a).im = 0) (hprim : χ.IsPrimitive) : χ = chi5 := by
  obtain ⟨q0, q1, q2, q3, q4⟩ := aux_q_vals
  have hne : χ ≠ 1 := by
    intro h
    rw [DirichletCharacter.isPrimitive_def, h, DirichletCharacter.conductor_one] at hprim
    norm_num at hprim
  -- the values of χ are powers of χ 2 (2 generates (ZMod 5)ˣ)
  have e0 : χ 0 = 0 := MulChar.map_zero χ
  have e1 : χ 1 = 1 := map_one χ
  have e4 : χ 4 = χ 2 ^ 2 := by
    rw [sq, ← map_mul]; rfl
  have e3 : χ 3 = χ 2 ^ 3 := by
    rw [pow_succ, sq, ← map_mul, ← map_mul]; rfl
  have e16 : χ 2 ^ 4 = 1 := by
    rw [← map_pow, show (2 : ZMod 5) ^ 4 = 1 from rfl, map_one]
  -- χ 2 is real, so it is ±1
  set x := (χ 2).re with hxdef
  have hx : χ 2 = (x : ℂ) := Complex.ext rfl (by simp [hreal 2])
  have hx4 : x ^ 4 = 1 := by
    rw [hx] at e16; exact_mod_cast e16
  have hx2 : x = 1 ∨ x = -1 := by
    have : (x ^ 2 - 1) * (x ^ 2 + 1) = 0 := by linear_combination hx4
    rcases mul_eq_zero.mp this with h | h
    · have : (x - 1) * (x + 1) = 0 := by linear_combination h
      rcases mul_eq_zero.mp this with h' | h'
      · left; linarith
      · right; linarith
    · nlinarith [sq_nonneg x]
  have hcases : ∀ a : ZMod 5, a = 0 ∨ a = 1 ∨ a = 2 ∨ a = 3 ∨ a = 4 := by decide
  rcases hx2 with h | h
  · -- χ 2 = 1 forces χ = 1, which is not primitive
    exfalso
    apply hne
    apply MulChar.ext'
    intro a
    rcases hcases a with rfl | rfl | rfl | rfl | rfl
    · rw [e0, MulChar.map_zero]
    · rw [e1, map_one]
    · rw [hx, h, MulChar.one_apply (by decide)]; simp
    · rw [e3, hx, h, MulChar.one_apply (by decide)]; simp
    · rw [e4, hx, h, MulChar.one_apply (by decide)]; simp
  · apply MulChar.ext'
    intro a
    rcases hcases a with rfl | rfl | rfl | rfl | rfl
    · rw [e0, aux_chi5_apply, q0]; simp
    · rw [e1, map_one]
    · rw [hx, h, aux_chi5_apply, q2]; simp
    · rw [e3, hx, h, aux_chi5_apply, q3]; norm_num
    · rw [e4, hx, h, aux_chi5_apply, q4]; simp

/-! ## L:RZ-58c -/

open Real in
/-- **L:RZ-58c** (split leg of L:RZ-58) — the numeral "≈ 0.4304": 2 log φ/√5 lies in
[0.43035, 0.43045), i.e. it is 0.4304 to four decimals.

Served locus: the "≈ 0.4304" of displays (9.5) (PDF p23), (9.8) (PDF p24) and (9.9) (PDF p25).
PDF sha256 prefix `2d5287e7`. -/
theorem rz_58c_value_approx :
    (43035 : ℝ) / 100000 ≤ 2 * Real.log goldenRatio / √5 ∧
    2 * Real.log goldenRatio / √5 < (43045 : ℝ) / 100000 := by
  obtain ⟨h1, h2⟩ := aux_four_log_phi_bounds
  have hs0 : 0 < √5 := by positivity
  have hs1 : √5 ≤ (22361 : ℝ) / 10000 := by
    rw [Real.sqrt_le_left (by norm_num)]; norm_num
  have hs2 : (2236 : ℝ) / 1000 ≤ √5 := by
    rw [Real.le_sqrt (by norm_num)] <;> norm_num
  constructor
  · rw [le_div_iff₀ hs0]; nlinarith
  · rw [div_lt_iff₀ hs0]; nlinarith

end RiemannZeta.LValue
