import Mathlib
import RiemannZeta.LValue.Solution

/-!
# Unit U2 (`RiemannZeta/Bridge`) — proofs

The Solution module of unit U2 (paper *The Tetrahedral Structure of the Riemann Zeta Function*,
served PDF sha256 prefix `2d5287e7`). Per the CO's ruling (Comparator README §"How it works",
step 4) this module does NOT import `RiemannZeta.Bridge.Challenge`: it imports `Mathlib`, opens the
same namespace, restates the Challenge's non-theorem declarations (`fact_prime_five`, `chi5`)
byte-identically, and proves each theorem under its Challenge name and statement text.

`rz_61c_weight_eq_two_L` (L:RZ-61c) rides L:RZ-58a: by the CO's ruled exception (2026-10-28,
`specs/_UNIT-U10.md`, decision 2) this module imports `RiemannZeta.LValue.Solution` — the one
cross-unit import, a Solution module and never a Challenge — and proves 61c from
`RiemannZeta.LValue.rz_58a_LFunction_chi5_one`; `Bridge.chi5` and `LValue.chi5` have
byte-identical bodies, so the step between them is definitional.
-/

namespace RiemannZeta.Bridge

/-- `Fact (Nat.Prime 5)`, declared once for the unit (mathlib's pin has no global instance for the
natural number 5). A provable fact supplied as an instance, not a hypothesis of any statement. -/
instance fact_prime_five : Fact (Nat.Prime 5) := ⟨by norm_num⟩

/-! ## L:RZ-03 -/

/-- **L:RZ-03** (i) — a hyperbolic element of SL(2, ℤ) has |tr| > 2 ("In SL(2, ℤ) a hyperbolic
element has integer trace with |t| > 2"); hyperbolic is mathlib's `Matrix.IsHyperbolic`
(`0 < discr`, `Matrix.discr`).

Served locus: §2.2, the two sentences leading into display (2.1), PDF p07 (printed folio 6).
PDF sha256 prefix `2d5287e7`. -/
theorem rz_03_two_lt_abs_trace_of_isHyperbolic (g : Matrix.SpecialLinearGroup (Fin 2) ℤ)
    (hg : (g : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic) :
    2 < |(g : Matrix (Fin 2) (Fin 2) ℤ).trace| := by
  have h : 0 < (g : Matrix (Fin 2) (Fin 2) ℤ).trace ^ 2 -
      4 * (g : Matrix (Fin 2) (Fin 2) ℤ).det := by
    rw [← Matrix.discr_fin_two]; exact hg
  rw [g.det_coe] at h
  have h2 : (2 : ℤ) ^ 2 < |(g : Matrix (Fin 2) (Fin 2) ℤ).trace| ^ 2 := by
    rw [sq_abs]; linarith
  exact lt_of_pow_lt_pow_left₀ 2 (abs_nonneg _) h2

/-- **L:RZ-03** (i), GL form — the same implication with hyperbolicity read through mathlib's
`Matrix.GeneralLinearGroup.IsHyperbolic` on the image of g under `Matrix.SpecialLinearGroup.toGL`.

Served locus: §2.2, the two sentences leading into display (2.1), PDF p07 (printed folio 6).
PDF sha256 prefix `2d5287e7`. -/
theorem rz_03_two_lt_abs_trace_of_isHyperbolic_GL (g : Matrix.SpecialLinearGroup (Fin 2) ℤ)
    (hg : Matrix.GeneralLinearGroup.IsHyperbolic (Matrix.SpecialLinearGroup.toGL g)) :
    2 < |(g : Matrix (Fin 2) (Fin 2) ℤ).trace| := by
  exact rz_03_two_lt_abs_trace_of_isHyperbolic g hg

/-- **L:RZ-03** (ii) — "the smallest available trace is t = 3": 3 is the least value of |tr g|
over hyperbolic g ∈ SL(2, ℤ) (bound and attainment; trace read in absolute value, the reading
V₁ confirmed).

Served locus: §2.2, the two sentences leading into display (2.1), PDF p07 (printed folio 6).
PDF sha256 prefix `2d5287e7`. -/
theorem rz_03_min_hyperbolic_abs_trace :
    IsLeast {t : ℤ | ∃ g : Matrix.SpecialLinearGroup (Fin 2) ℤ,
        (g : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic ∧
          |(g : Matrix (Fin 2) (Fin 2) ℤ).trace| = t} 3 := by
  constructor
  · refine ⟨⟨!![2, 1; 1, 1], by simp [Matrix.det_fin_two]⟩, ?_, ?_⟩
    · change 0 < Matrix.discr _
      rw [Matrix.discr_fin_two]; simp [Matrix.trace_fin_two, Matrix.det_fin_two]
    · simp [Matrix.trace_fin_two]
  · rintro t ⟨g, hg, rfl⟩
    have := rz_03_two_lt_abs_trace_of_isHyperbolic g hg
    omega

/-! ## L:RZ-04 -/

open Polynomial in
/-- **L:RZ-04** — the Fibonacci matrix F = (1 1; 1 0) has det −1 and characteristic polynomial
X² − X − 1 (over ℤ; mathlib's monic `charpoly`, the sign of the printed "λ² − λ − 1 = 0").

Served locus: §2.2, display (2.1) and the parenthesis after it, PDF p07 (printed folio 6); §9.1,
displays (9.1)–(9.2), PDF p23 (printed folio 22). PDF sha256 prefix `2d5287e7`. -/
theorem rz_04_fib_det_charpoly :
    (!![1, 1; 1, 0] : Matrix (Fin 2) (Fin 2) ℤ).det = -1 ∧
    (!![1, 1; 1, 0] : Matrix (Fin 2) (Fin 2) ℤ).charpoly = X ^ 2 - X - 1 := by
  refine ⟨by simp [Matrix.det_fin_two], ?_⟩
  rw [Matrix.charpoly_fin_two]
  simp [Matrix.trace_fin_two, Matrix.det_fin_two]
  ring

open Real in
/-- **L:RZ-04** — the eigenvalues of F = (1 1; 1 0) are exactly φ and −1/φ (the real spectrum
of F, as a set).

Served locus: §2.2, the parenthesis after display (2.1), PDF p07 (printed folio 6); §9.1, the
sentence carrying (9.1)–(9.2), PDF p23 (printed folio 22). PDF sha256 prefix `2d5287e7`. -/
theorem rz_04_fib_eigenvalues :
    spectrum ℝ (!![1, 1; 1, 0] : Matrix (Fin 2) (Fin 2) ℝ) = {goldenRatio, -1 / goldenRatio} := by
  ext x
  rw [Matrix.mem_spectrum_iff_isRoot_charpoly, Matrix.charpoly_fin_two, Polynomial.IsRoot.def]
  simp only [Matrix.trace_fin_two, Matrix.det_fin_two, Matrix.of_apply, Matrix.cons_val',
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.empty_val', Matrix.cons_val_fin_one,
    Polynomial.eval_add, Polynomial.eval_sub, Polynomial.eval_pow, Polynomial.eval_X,
    Polynomial.eval_mul, Polynomial.eval_C, Set.mem_insert_iff, Set.mem_singleton_iff]
  have key : ∀ a : ℝ, a ≠ 0 → a ^ 2 = a + 1 →
      x ^ 2 - (1 + 0) * x + (1 * 0 - 1 * 1) = (x - a) * (x - -1 / a) := by
    intro a ha h
    field_simp
    linear_combination x * h
  rw [key goldenRatio goldenRatio_ne_zero goldenRatio_sq, mul_eq_zero, sub_eq_zero, sub_eq_zero]

open Real in
/-- **L:RZ-04** — the eigenvalues of F² = (2 1; 1 1) are exactly φ² and φ⁻² (printed φ⁻² at
(2.1) and 1/φ² at (9.3); spelled `goldenRatio ^ (-2 : ℤ)`, the unit's one spelling).

Served locus: §2.2, display (2.1), PDF p07 (printed folio 6); §9.1, display (9.3) and the
sentence after it, PDF p23 (printed folio 22). PDF sha256 prefix `2d5287e7`. -/
theorem rz_04_fib_sq_eigenvalues :
    spectrum ℝ (!![2, 1; 1, 1] : Matrix (Fin 2) (Fin 2) ℝ) =
      {goldenRatio ^ 2, goldenRatio ^ (-2 : ℤ)} := by
  ext x
  rw [Matrix.mem_spectrum_iff_isRoot_charpoly, Matrix.charpoly_fin_two, Polynomial.IsRoot.def]
  simp only [Matrix.trace_fin_two, Matrix.det_fin_two, Matrix.of_apply, Matrix.cons_val',
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.empty_val', Matrix.cons_val_fin_one,
    Polynomial.eval_add, Polynomial.eval_sub, Polynomial.eval_pow, Polynomial.eval_X,
    Polynomial.eval_mul, Polynomial.eval_C, Set.mem_insert_iff, Set.mem_singleton_iff]
  have hz : goldenRatio ^ (-2 : ℤ) = 1 / goldenRatio ^ 2 := by
    rw [zpow_neg, one_div]; norm_cast
  have key : ∀ a : ℝ, a ≠ 0 → a ^ 2 = a + 1 →
      x ^ 2 - (2 + 1) * x + (2 * 1 - 1 * 1) = (x - a ^ 2) * (x - 1 / a ^ 2) := by
    intro a ha h
    field_simp
    linear_combination x * (a ^ 2 + a - 1) * h
  rw [hz, key goldenRatio goldenRatio_ne_zero goldenRatio_sq, mul_eq_zero, sub_eq_zero,
    sub_eq_zero]

/-! ## L:RZ-06a -/

open Real in
/-- **L:RZ-06a** (the ledger's own split of L:RZ-06; the computation leg) — 2·log(φ²) = 4·log φ,
the equality of (2.3) after "systole(X(1)) =" (the systole identification is L:RZ-06b, not
stated here).

Served locus: §2.2, display (2.3), PDF p07 (printed folio 6). PDF sha256 prefix `2d5287e7`. -/
theorem rz_06a_two_log_sq_eq : 2 * Real.log (goldenRatio ^ 2) = 4 * Real.log goldenRatio := by
  rw [Real.log_pow]; push_cast; ring

open Real in
/-- **L:RZ-06a** — "4 log φ ≈ 1.9248" read as correct four-decimal rounding:
1.92475 ≤ 4·log φ < 1.92485.

Served locus: §2.2, display (2.3), PDF p07 (printed folio 6). PDF sha256 prefix `2d5287e7`. -/
theorem rz_06a_four_log_phi_approx :
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

/-! ## L:RZ-12 -/

/-- **L:RZ-12** — the anchoring identity tr(F²)² − 4 = 3² − 4 = 5 for the printed integer matrix
F² = (2 1; 1 1). At det 1, tr² − 4 is `Matrix.discr` (`Matrix.discr_fin_two`); the display
prints tr² − 4 and the statement carries it as printed.

Served locus: §2.3, display (2.7), PDF p08 (printed folio 7). PDF sha256 prefix `2d5287e7`. -/
theorem rz_12_anchoring_identity :
    (Matrix.trace (!![2, 1; 1, 1] : Matrix (Fin 2) (Fin 2) ℤ)) ^ 2 - 4 = (3 : ℤ) ^ 2 - 4 ∧
    (3 : ℤ) ^ 2 - 4 = 5 := by
  refine ⟨?_, by norm_num⟩
  simp [Matrix.trace_fin_two]

/-! ## L:RZ-61a -/

open Real in
/-- **L:RZ-61a** (split leg of L:RZ-61) — with λ = φ² and N = λ² = φ⁴:
log N/(N^{1/2} − N^{−1/2}) = log(φ⁴)/(φ² − φ⁻²) = 4 log φ/√5 (N^{±1/2} as `Real.rpow`,
φ⁻² as zpow). The link "= 2·L(1, χ₅)" is L:RZ-61c.

Served locus: §9.5, display (9.7) and the sentence introducing it, PDF p24 (printed folio 23).
PDF sha256 prefix `2d5287e7`. -/
theorem rz_61a_weight_chain :
    (goldenRatio ^ 2) ^ 2 = goldenRatio ^ 4 ∧
    (let N : ℝ := goldenRatio ^ 4
     Real.log N / (N ^ ((1 : ℝ) / 2) - N ^ (-(1 : ℝ) / 2))
        = Real.log (goldenRatio ^ 4) / (goldenRatio ^ 2 - goldenRatio ^ (-2 : ℤ))) ∧
    Real.log (goldenRatio ^ 4) / (goldenRatio ^ 2 - goldenRatio ^ (-2 : ℤ))
        = 4 * Real.log goldenRatio / √5 := by
  have hφ : goldenRatio = (1 + √5) / 2 := rfl
  have hpos : 0 ≤ goldenRatio := goldenRatio_pos.le
  have hne : goldenRatio ≠ 0 := goldenRatio_ne_zero
  have hpow : ∀ r : ℝ, (goldenRatio ^ 4) ^ r = goldenRatio ^ (4 * r) := by
    intro r
    rw [show (goldenRatio ^ 4 : ℝ) = goldenRatio ^ (4 : ℝ) by norm_cast, ← Real.rpow_mul hpos]
  have hz : goldenRatio ^ (-2 : ℤ) = (goldenRatio ^ 2)⁻¹ := by
    rw [zpow_neg]; norm_cast
  have hdiff : goldenRatio ^ 2 - goldenRatio ^ (-2 : ℤ) = √5 := by
    rw [hz]
    have key : ∀ a : ℝ, a ≠ 0 → a ^ 2 = a + 1 → a ^ 2 - (a ^ 2)⁻¹ = 2 * a - 1 := by
      intro a ha h
      field_simp
      linear_combination (a ^ 2 - a + 1) * h
    rw [key goldenRatio hne goldenRatio_sq, hφ]; ring
  refine ⟨by ring, ?_, ?_⟩
  · change Real.log (goldenRatio ^ 4) / ((goldenRatio ^ 4) ^ ((1 : ℝ) / 2) -
        (goldenRatio ^ 4) ^ (-(1 : ℝ) / 2)) = _
    rw [hpow, hpow, hz]
    norm_num
  · rw [hdiff, Real.log_pow]; push_cast; ring

open Real in
/-- **L:RZ-61a** — "≈ 0.8608" (closing the equality chain of (9.7)) read as correct four-decimal
rounding of 4 log φ/√5: 0.86075 ≤ 4·log φ/√5 < 0.86085.

Served locus: §9.5, display (9.7), PDF p24 (printed folio 23). PDF sha256 prefix `2d5287e7`. -/
theorem rz_61a_weight_approx :
    (86075 : ℝ) / 100000 ≤ 4 * Real.log goldenRatio / √5 ∧
    4 * Real.log goldenRatio / √5 < (86085 : ℝ) / 100000 := by
  obtain ⟨h1, h2⟩ := rz_06a_four_log_phi_approx
  have hs0 : 0 < √5 := by positivity
  have hs1 : √5 ≤ (22361 : ℝ) / 10000 := by
    rw [Real.sqrt_le_left (by norm_num)]; norm_num
  have hs2 : (2236 : ℝ) / 1000 ≤ √5 := by
    rw [Real.le_sqrt (by norm_num)] <;> norm_num
  constructor
  · rw [le_div_iff₀ hs0]; nlinarith
  · rw [div_lt_iff₀ hs0]; nlinarith

/-! ## L:RZ-61b -/

open Real in
/-- **L:RZ-61b** (split leg of L:RZ-61; the ledger's RZ-62(a)) — **OUT-OF-Q5 (pending the wall)
— counted in T, not in N.** The arithmetic of the printed symbols: with ε = φ, ε₊ = φ², R = log φ,
N = φ⁴ taken as the real numbers the print equates them to, log N = 2 log ε₊ = 4 log φ = 4R;
log ε₊ / log ε = 2; and 4R/√5 = (log ε₊ / log ε)·(2R/√5), with 2R/√5 the right-hand side the
print gives for L(1, χ₅). The number-field meanings of these symbols (totally positive units,
regulator, geodesic–unit dictionary) are not part of this statement.

Served locus: §9.5, the three sentences after display (9.8), PDF p24 (printed folio 23).
PDF sha256 prefix `2d5287e7`. -/
theorem rz_61b_factor_two :
    let ε : ℝ := goldenRatio
    let εp : ℝ := goldenRatio ^ 2
    let R : ℝ := Real.log goldenRatio
    let N : ℝ := goldenRatio ^ 4
    (Real.log N = 2 * Real.log εp ∧ 2 * Real.log εp = 4 * Real.log goldenRatio ∧
      4 * Real.log goldenRatio = 4 * R) ∧
    Real.log εp / Real.log ε = 2 ∧
    4 * R / √5 = (Real.log εp / Real.log ε) * (2 * R / √5) := by
  intro ε εp R N
  have hL : Real.log goldenRatio ≠ 0 := (Real.log_pos one_lt_goldenRatio).ne'
  have hratio : Real.log εp / Real.log ε = 2 := by
    simp only [εp, ε, Real.log_pow]; field_simp; norm_num
  refine ⟨⟨?_, ?_, rfl⟩, hratio, ?_⟩
  · simp only [N, εp, Real.log_pow]; push_cast; ring
  · simp only [εp, Real.log_pow]; push_cast; ring
  · rw [hratio]; ring

/-- χ₅: the quadratic character mod 5, valued in ℂ, as a Dirichlet character of modulus 5 (the
Legendre symbol (·/5), which agrees with the paper's §9.2 Kronecker symbol (5/·) on every
integer, 5 ≡ 1 mod 4). Mathlib has no conductor-5 character object at the pin. **Candidate: the
binding definition is L:RZ-58's**; this is the same expression as unit U1's `chi5`
(`RiemannZeta.Pilot.chi5`), typed as `DirichletCharacter ℂ 5`. -/
noncomputable def chi5 : DirichletCharacter ℂ 5 :=
  (quadraticChar (ZMod 5)).ringHomComp (Int.castRingHom ℂ)

open Real in
/-- **L:RZ-61c** (split leg of L:RZ-61) — **GATED (L:RZ-58)**: the weight 4 log φ/√5 equals
2·L(1, χ₅), and does not equal L(1, χ₅) (L(1, χ₅) = `DirichletCharacter.LFunction chi5 1`, the
continuation at s = 1). Stated because χ₅ and `LFunction` elaborate at the pin; its proof waits
on L:RZ-58's closed form L(1, χ₅) = 2 log φ/√5.

Served locus: §9.5, display (9.7) (last equality) and the sentence after display (9.8), PDF p24
(printed folio 23); χ₅ defined in §9.2 after display (9.4), PDF p23 (printed folio 22). PDF sha256
prefix `2d5287e7`. -/
theorem rz_61c_weight_eq_two_L :
    ((4 * Real.log goldenRatio / √5 : ℝ) : ℂ) = 2 * DirichletCharacter.LFunction chi5 1 ∧
    ((4 * Real.log goldenRatio / √5 : ℝ) : ℂ) ≠ DirichletCharacter.LFunction chi5 1 := by
  have h : DirichletCharacter.LFunction chi5 1 = ((2 * Real.log goldenRatio / √5 : ℝ) : ℂ) :=
    RiemannZeta.LValue.rz_58a_LFunction_chi5_one
  have hpos : 0 < 2 * Real.log goldenRatio / √5 :=
    div_pos (mul_pos two_pos (Real.log_pos one_lt_goldenRatio)) (by positivity)
  rw [h]
  refine ⟨?_, fun heq => ?_⟩
  · push_cast; ring
  · have hre := congrArg Complex.re heq
    simp only [Complex.ofReal_re] at hre
    have h2 : 4 * Real.log goldenRatio / √5 = 2 * (2 * Real.log goldenRatio / √5) := by ring
    linarith

end RiemannZeta.Bridge
