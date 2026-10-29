import Mathlib

/-!
# Unit U1 (`RiemannZeta/Pilot`) — proofs

Proofs of the rows of unit U1 of the paper *The Tetrahedral Structure of the Riemann Zeta
Function* (QRiemannian Research, April 2026, revised October 2026), served PDF sha256
`2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54` (prefix `2d5287e7`).

This module does not import `RiemannZeta.Pilot.Challenge`. It restates the Challenge's
non-theorem declarations (`fact_prime_five`, `chi5`) byte-identically and proves each theorem under
the Challenge's name and statement text, so that Comparator can compare the two environments.

Rows: L:RZ-02, L:RZ-07a, L:RZ-07b (OUT-OF-Q5, pending the wall), L:RZ-11, L:RZ-20a, L:RZ-23,
L:RZ-66, L:RZ-67. L:RZ-20b is a CONCEPT leg and carries no statement.
-/

namespace RiemannZeta.Pilot

/-- `Fact (Nat.Prime 5)`, declared once for the unit (mathlib's pin has no global instance for the
natural number 5). A provable fact supplied as an instance, not a hypothesis of any statement. -/
instance fact_prime_five : Fact (Nat.Prime 5) := ⟨by norm_num⟩

/-! ## L:RZ-02 -/

/-- **L:RZ-02** — F² = (2 1; 1 1) for the Fibonacci matrix F = (1 1; 1 0); det 1, trace 3,
discriminant 5.

Served locus: §2.2, eq. (2.1), PDF p07 (printed folio 6); §9.1, eqs. (9.1) and (9.3), PDF p23
(printed folio 22). PDF sha256 prefix `2d5287e7`.

"Discriminant" of the matrix is mathlib's `Matrix.discr` (definitionally `charpoly.discr`, the
spec's charpoly form; `Matrix.discr_fin_two` gives tr² − 4·det), the paper's own (2.7)
convention. -/
theorem rz_02_fib_sq :
    let F : Matrix (Fin 2) (Fin 2) ℤ := !![1, 1; 1, 0]
    F ^ 2 = !![2, 1; 1, 1] ∧
    (!![2, 1; 1, 1] : Matrix (Fin 2) (Fin 2) ℤ).det = 1 ∧
    (!![2, 1; 1, 1] : Matrix (Fin 2) (Fin 2) ℤ).trace = 3 ∧
    (!![2, 1; 1, 1] : Matrix (Fin 2) (Fin 2) ℤ).discr = 5 := by
  intro F
  refine ⟨?_, ?_, ?_, ?_⟩
  · ext i j
    fin_cases i <;> fin_cases j <;> simp [F, sq, Matrix.mul_apply, Fin.sum_univ_two]
  · simp [Matrix.det_fin_two_of]
  · simp [Matrix.trace_fin_two_of]
  · rw [Matrix.discr_fin_two]
    simp [Matrix.det_fin_two_of, Matrix.trace_fin_two_of]

/-- **L:RZ-02** (second statement of the row) — "In SL(2, ℤ) … realized by F²": the matrix
(2 1; 1 1) underlies an element of SL(2, ℤ).

Served locus: §2.2, eq. (2.1), PDF p07 (printed folio 6); §9.1, eq. (9.3), PDF p23 (printed
folio 22). PDF sha256 prefix `2d5287e7`. -/
theorem rz_02_fib_sq_mem_SL :
    ∃ g : Matrix.SpecialLinearGroup (Fin 2) ℤ,
      (g : Matrix (Fin 2) (Fin 2) ℤ) = !![2, 1; 1, 1] := by
  exact ⟨⟨!![2, 1; 1, 1], by simp [Matrix.det_fin_two_of]⟩, rfl⟩

/-! ## L:RZ-07a -/

/-- **L:RZ-07a** (split leg of L:RZ-07) — the conjugate products of (2.4): φ·φ̄ = −1 and
φ²·φ̄² = +1 in ℝ, with φ̄ = (1 − √5)/2 the Galois conjugate (`Real.goldenConj`).

Served locus: §2.2, eq. (2.4) and the closing parenthesis of §2.2, PDF p07 (printed folio 6).
PDF sha256 prefix `2d5287e7`.

This leg is the conjugate products of (2.4); the field-norm identification N(x) = x·x̄ is the
other leg, L:RZ-07b. -/
theorem rz_07a_golden_conj_products :
    Real.goldenRatio * Real.goldenConj = -1 ∧
    Real.goldenRatio ^ 2 * Real.goldenConj ^ 2 = 1 := by
  refine ⟨Real.goldenRatio_mul_goldenConj, ?_⟩
  rw [← mul_pow, Real.goldenRatio_mul_goldenConj]
  norm_num

/-! ## L:RZ-07b -/

open QuadraticAlgebra in
/-- **L:RZ-07b** (split leg of L:RZ-07; **OUT-OF-Q5, pending the wall** — stated, counted only if
the wall admits it) — with N the field norm of ℚ(√5) = ℚ(φ), modelled as `QuadraticAlgebra ℚ 1 1`
(ω² = 1 + ω, ω the model of φ, `star ω` its conjugate): N(φ) = φφ̄, N(φ) = −1, N(φ²) = +1.

Served locus: §2.2, eq. (2.4) and the closing parenthesis of §2.2 ("N is the field norm in
(2.4)"), PDF p07 (printed folio 6). PDF sha256 prefix `2d5287e7`. -/
theorem rz_07b_field_norm :
    algebraMap ℚ (QuadraticAlgebra ℚ 1 1) (Algebra.norm ℚ (ω : QuadraticAlgebra ℚ 1 1))
        = (ω : QuadraticAlgebra ℚ 1 1) * star (ω : QuadraticAlgebra ℚ 1 1) ∧
    Algebra.norm ℚ (ω : QuadraticAlgebra ℚ 1 1) = -1 ∧
    Algebra.norm ℚ ((ω : QuadraticAlgebra ℚ 1 1) ^ 2) = 1 := by
  -- `Algebra.norm` (det of left multiplication) is mathlib's `QuadraticAlgebra.norm`
  have hn : ∀ z : QuadraticAlgebra ℚ 1 1, Algebra.norm ℚ z = QuadraticAlgebra.norm z := by
    intro z
    rw [Algebra.norm_apply, ← QuadraticAlgebra.det_toLinearMap_eq_norm]
    rfl
  have hω : QuadraticAlgebra.norm (ω : QuadraticAlgebra ℚ 1 1) = -1 := by
    rw [QuadraticAlgebra.norm_def]
    simp
  refine ⟨?_, ?_, ?_⟩
  · rw [hn, QuadraticAlgebra.algebraMap_norm_eq_mul_star]
  · rw [hn, hω]
  · rw [hn, map_pow, hω]
    norm_num

/-! ## L:RZ-11 -/

/-- χ₅: the quadratic character mod 5, valued in ℂ (the Legendre symbol (·/5); on residues mod 5
it agrees with the paper's §9.2 Kronecker symbol (5/·)). Mathlib has no conductor-5 character
object at the pin; this is the spec's local definition. -/
noncomputable def chi5 : MulChar (ZMod 5) ℂ :=
  (quadraticChar (ZMod 5)).ringHomComp (Int.castRingHom ℂ)

/-- **L:RZ-11** — τ(χ₅) = √5: the quadratic Gauss sum mod 5, with its sign, for the standard
additive character ψ(a) = e^{2πia/5} (`ZMod.stdAddChar`); the target is the positive real root.

Served locus: §2.3, eq. (2.6), PDF p07 (printed folio 6). PDF sha256 prefix `2d5287e7`. -/
theorem rz_11_gaussSum_chi5 :
    gaussSum chi5 (ZMod.stdAddChar (N := 5)) = (Real.sqrt 5 : ℂ) := by
  -- the standard additive character at `k`, as `cos + i sin` of `2πk/5`
  have hψ : ∀ k : ℕ, ZMod.stdAddChar (N := 5) (k : ZMod 5) =
      (Real.cos (2 * Real.pi * k / 5) : ℂ) + (Real.sin (2 * Real.pi * k / 5) : ℂ) * Complex.I := by
    intro k
    rw [ZMod.stdAddChar_apply, ZMod.toCircle_natCast]
    rw [show 2 * (Real.pi : ℂ) * Complex.I * (k : ℂ) / ((5 : ℕ) : ℂ)
        = ((2 * Real.pi * k / 5 : ℝ) : ℂ) * Complex.I by push_cast; ring]
    rw [Complex.exp_mul_I, ← Complex.ofReal_cos, ← Complex.ofReal_sin]
  have h1 := hψ 1
  have h2 := hψ 2
  have h3 := hψ 3
  have h4 := hψ 4
  simp only [Nat.cast_one, Nat.cast_ofNat] at h1 h2 h3 h4
  -- the quadratic character mod 5 on the residues 0, 1, 2, 3, 4: 0, 1, −1, −1, 1
  have q0 : quadraticChar (ZMod 5) 0 = 0 := quadraticChar_zero
  have q1 : quadraticChar (ZMod 5) 1 = 1 := map_one _
  have q2 : quadraticChar (ZMod 5) 2 = -1 := by
    rw [quadraticChar_neg_one_iff_not_isSquare]; decide
  have q3 : quadraticChar (ZMod 5) 3 = -1 := by
    rw [quadraticChar_neg_one_iff_not_isSquare]; decide
  have q4 : quadraticChar (ZMod 5) 4 = 1 := by
    rw [quadraticChar_one_iff_isSquare (by decide)]; decide
  have hχ : ∀ a : ZMod 5, chi5 a = ((quadraticChar (ZMod 5) a : ℤ) : ℂ) := fun _ => rfl
  -- the trigonometric values
  have hs5 : Real.sqrt 5 ^ 2 = 5 := Real.sq_sqrt (by norm_num)
  have hc1 : Real.cos (2 * Real.pi * 1 / 5) = (Real.sqrt 5 - 1) / 4 := by
    rw [show 2 * Real.pi * 1 / 5 = 2 * (Real.pi / 5) by ring, Real.cos_two_mul,
      Real.cos_pi_div_five]
    linear_combination (1 / 8 : ℝ) * hs5
  have hc2 : Real.cos (2 * Real.pi * 2 / 5) = -(1 + Real.sqrt 5) / 4 := by
    rw [show 2 * Real.pi * 2 / 5 = Real.pi - Real.pi / 5 by ring, Real.cos_pi_sub,
      Real.cos_pi_div_five]
    ring
  have hc3 : Real.cos (2 * Real.pi * 3 / 5) = Real.cos (2 * Real.pi * 2 / 5) := by
    rw [show 2 * Real.pi * 3 / 5 = 2 * Real.pi - 2 * Real.pi * 2 / 5 by ring, Real.cos_two_pi_sub]
  have hc4 : Real.cos (2 * Real.pi * 4 / 5) = Real.cos (2 * Real.pi * 1 / 5) := by
    rw [show 2 * Real.pi * 4 / 5 = 2 * Real.pi - 2 * Real.pi * 1 / 5 by ring, Real.cos_two_pi_sub]
  have hs3 : Real.sin (2 * Real.pi * 3 / 5) = -Real.sin (2 * Real.pi * 2 / 5) := by
    rw [show 2 * Real.pi * 3 / 5 = 2 * Real.pi - 2 * Real.pi * 2 / 5 by ring, Real.sin_two_pi_sub]
  have hs4 : Real.sin (2 * Real.pi * 4 / 5) = -Real.sin (2 * Real.pi * 1 / 5) := by
    rw [show 2 * Real.pi * 4 / 5 = 2 * Real.pi - 2 * Real.pi * 1 / 5 by ring, Real.sin_two_pi_sub]
  -- expand the sum over the five residues
  have hsum : ∀ f : ZMod 5 → ℂ, ∑ a, f a = f 0 + f 1 + f 2 + f 3 + f 4 :=
    fun f => Fin.sum_univ_five f
  rw [gaussSum, hsum]
  simp only [hχ, q0, q1, q2, q3, q4, h1, h2, h3, h4]
  rw [hc3, hc4, hs3, hs4, hc1, hc2]
  push_cast
  ring

/-! ## L:RZ-20a -/

open Real in
/-- **L:RZ-20a** (split leg of L:RZ-20) — for n ≥ 1,
ζ(2n) = (−1)^{n+1} B_{2n} (2π)^{2n} / (2·(2n)!), B the Bernoulli numbers of t/(e^t − 1)
(mathlib's `bernoulli`).

Served locus: §4.1, eq. (4.1), PDF p10 (printed folio 9); §4.4, Theorem 4.1(i), eq. (4.7), PDF
p12 (printed folio 11). PDF sha256 prefix `2d5287e7`. -/
theorem rz_20a_zeta_two_mul_nat {n : ℕ} (hn : n ≠ 0) :
    riemannZeta (2 * (n : ℂ)) =
      (-1) ^ (n + 1) * (bernoulli (2 * n) : ℂ) * (2 * (π : ℂ)) ^ (2 * n)
        / (2 * ((2 * n).factorial : ℂ)) := by
  rw [riemannZeta_two_mul_nat hn]
  obtain ⟨m, rfl⟩ : ∃ m, n = m + 1 := Nat.exists_eq_succ_of_ne_zero hn
  have h2 : 2 * (m + 1) - 1 = 2 * m + 1 := by omega
  rw [h2, mul_pow]
  have hf : ((2 * (m + 1)).factorial : ℂ) ≠ 0 := by exact_mod_cast Nat.factorial_ne_zero _
  field_simp
  ring

open Real in
/-- **L:RZ-20a** (second statement of the leg) — "yielding rational multiples of π^{2n}": for
n ≥ 1 there is q ∈ ℚ with ζ(2n) = q·π^{2n}.

Served locus: §4.1, PDF p10 (printed folio 9); §4.4, Theorem 4.1(i), PDF p12 (printed folio 11).
PDF sha256 prefix `2d5287e7`. -/
theorem rz_20a_zeta_two_mul_nat_rat_mul_pi_pow {n : ℕ} (hn : n ≠ 0) :
    ∃ q : ℚ, riemannZeta (2 * (n : ℂ)) = (q : ℂ) * (π : ℂ) ^ (2 * n) := by
  refine ⟨(-1) ^ (n + 1) * 2 ^ (2 * n - 1) * bernoulli (2 * n) / (2 * n).factorial, ?_⟩
  rw [riemannZeta_two_mul_nat hn]
  push_cast
  ring

/-! ## L:RZ-23 -/

/-- **L:RZ-23** — B_{2n+1} = 0 for n ≥ 1 (Bernoulli numbers of t/(e^t − 1), mathlib's
`bernoulli`; identical to `bernoulli'` at these indices).

Served locus: §4.1, PDF p10 (printed folio 9); §4.2, Proposition 4.1, PDF p11 (printed folio 10).
PDF sha256 prefix `2d5287e7`. -/
theorem rz_23_bernoulli_odd_eq_zero {n : ℕ} (hn : 1 ≤ n) :
    bernoulli (2 * n + 1) = 0 := by
  exact bernoulli_eq_zero_of_odd (odd_two_mul_add_one n) (by omega)

/-! ## L:RZ-66 -/

/-- **L:RZ-66** — the (signed) discriminant of the fifth cyclotomic field ℚ(ζ₅) is 125 = 5³; stated
for every K with `IsCyclotomicExtension {5} ℚ K` (all ℚ-isomorphic).

Served locus: §10.2, the sentence carrying (10.1), PDF p26 (printed folio 25). PDF sha256 prefix
`2d5287e7`. -/
theorem rz_66_discr_cyclotomic_five (K : Type*) [Field K] [NumberField K]
    [IsCyclotomicExtension {5} ℚ K] :
    NumberField.discr K = 125 := by
  rw [IsCyclotomicExtension.Rat.discr_prime 5 K]
  norm_num

/-! ## L:RZ-67 -/

/-- **L:RZ-67** — the class number of the fifth cyclotomic field ℚ(ζ₅) is 1; stated for every K
with `IsCyclotomicExtension {5} ℚ K` (all ℚ-isomorphic).

Served locus: §10.2, the sentence carrying (10.1), PDF p26 (printed folio 25). PDF sha256 prefix
`2d5287e7`. -/
theorem rz_67_classNumber_cyclotomic_five (K : Type*) [Field K] [NumberField K]
    [IsCyclotomicExtension {5} ℚ K] :
    NumberField.classNumber K = 1 := by
  exact NumberField.classNumber_eq_one_iff.mpr (IsCyclotomicExtension.Rat.five_pid K)

end RiemannZeta.Pilot
