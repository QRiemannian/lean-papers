import Mathlib

/-!
# Unit U3 (`RiemannZeta/ZetaL`) — proofs

Statements of the rows of unit U3 of the paper *The Tetrahedral Structure of the Riemann Zeta
Function* (QRiemannian Research, April 2026, revised October 2026), served PDF sha256
`2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54` (prefix `2d5287e7`).
PDF page indices count the cover as p01. PROOFS module: does not import
`RiemannZeta.ZetaL.Challenge`; the four shared definitions below are restated byte-identically from
`Challenge.lean` (sha256 `7200988e…`), and every theorem carries the identical name and statement.

Rows: L:RZ-15, L:RZ-16, L:RZ-17, L:RZ-21, L:RZ-32a, L:RZ-32b (OUT-OF-Q5, pending the wall),
L:RZ-33a, L:RZ-34, L:RZ-46a, L:RZ-47, L:RZ-49, L:RZ-60. L:RZ-33b is on the correction track
(V1-CC) and carries no statement.
-/

namespace RiemannZeta.ZetaL

/-! ## Shared definitions -/

/-- The geometry constant g_c = 1/(√5·π) (RZ §2.5 (2.10), §9.6 (9.10)); the first "=" of (2.10)
is this definition. Shared by L:RZ-15, L:RZ-16, L:RZ-17; placed once for the unit. -/
noncomputable def geometryConstant : ℝ := 1 / (Real.sqrt 5 * Real.pi)

/-- The standard factor of the asymmetric functional equation,
χ(s) = 2^s π^(s−1) sin(πs/2) Γ(1−s). Supplied by the spec: the served text prints χ(s) in (5.2)
without defining it (L:RZ-33a §3; V₁ ruling: definite enough — χ = ζ(s)/ζ(1−s) is forced). -/
noncomputable def zetaChi (s : ℂ) : ℂ :=
  2 ^ s * (Real.pi : ℂ) ^ (s - 1) * Complex.sin (Real.pi * s / 2) * Complex.Gamma (1 - s)

/-- The paper's φ(s) := Λ(2s−1)/Λ(2s), Λ = `completedRiemannZeta` (RZ (7.5), §7.4 p19). Named
apart from the golden ratio φ. Shared by L:RZ-46a and L:RZ-47. -/
noncomputable def scatteringRatio (s : ℂ) : ℂ :=
  completedRiemannZeta (2 * s - 1) / completedRiemannZeta (2 * s)

/-- The paper's ξ(s) = ½ s(s−1) Λ(s) (RZ §7.4, (12.4)); mathlib has no ξ at the pin.

Note (V₁, non-blocking): this local form equals the paper's entire ξ only off {0, 1} (here it
takes the value 0 at s = 0, 1, while ξ(0) = ξ(1) = 1/2). L:RZ-46a (iii) uses it only as the
meromorphic identity the spec states, with s ≠ 0, 1/2, 1. -/
noncomputable def riemannXiRZ (s : ℂ) : ℂ := s * (s - 1) / 2 * completedRiemannZeta s

/-! ## L:RZ-15 -/

/-- **L:RZ-15** — the three writings of the geometry constant:
g_c = 1/(√5·π) = 1/(√d_K·π) ≡ 3·vol(X(1))/(π²·√d_K), with vol(X(1)) = π/3, d_K = 5; and
"3 · vol = π exactly".

Served locus: §2.5, display (2.10), PDF p08 (printed folio 7); §9.6, display (9.10), PDF p25
(printed folio 24). PDF sha256 prefix `2d5287e7`.

vol(X(1)) and d_K enter as hypotheses, as the display's own "with …" clause states them
(L:RZ-14 and L:RZ-09 are not imported). -/
theorem rz_15_geometryConstant_writings (vol dK : ℝ) (hvol : vol = Real.pi / 3) (hdK : dK = 5) :
    geometryConstant = 1 / (Real.sqrt dK * Real.pi) ∧
    1 / (Real.sqrt dK * Real.pi) = 3 * vol / (Real.pi ^ 2 * Real.sqrt dK) ∧
    3 * vol = Real.pi := by
  subst hvol hdK
  have h5 : Real.sqrt 5 ≠ 0 := by positivity
  have hπ : Real.pi ≠ 0 := Real.pi_ne_zero
  refine ⟨rfl, ?_, by ring⟩
  field_simp

/-! ## L:RZ-16 -/

/-- **L:RZ-16** — "g_c = 1/(√5 · π) ≈ 0.1424", read at its four printed decimals:
|g_c − 0.1424| < 0.00005.

Served locus: §2.5, the sentence after (2.10), PDF p08 (printed folio 7); echoed in the §3
table, PDF p09 (printed folio 8). PDF sha256 prefix `2d5287e7`. -/
theorem rz_16_geometryConstant_approx :
    |geometryConstant - 0.1424| < 0.00005 := by
  have h5u : Real.sqrt 5 < 2.236068 := by
    rw [Real.sqrt_lt' (by norm_num)]; norm_num
  have h5l : 2.236 < Real.sqrt 5 := by
    rw [Real.lt_sqrt (by norm_num)]; norm_num
  have hπu := Real.pi_lt_d6
  have hπl := Real.pi_gt_d6
  have hPu : Real.sqrt 5 * Real.pi < 2.236068 * 3.141593 :=
    mul_lt_mul'' h5u hπu (by positivity) (by positivity)
  have hPl : 2.236 * 3.141592 < Real.sqrt 5 * Real.pi :=
    mul_lt_mul'' h5l hπl (by norm_num) (by norm_num)
  have hP : 0 < Real.sqrt 5 * Real.pi := by positivity
  unfold geometryConstant
  rw [abs_sub_lt_iff]
  constructor
  · rw [sub_lt_iff_lt_add, div_lt_iff₀ hP]
    nlinarith
  · rw [sub_lt_comm, lt_div_iff₀ hP]
    nlinarith

/-! ## L:RZ-17 -/

/-- **L:RZ-17** — the argument-less quaternary product (3.1): φ·√5·π·g_c = φ·√5·π·1/(√5·π) = φ,
φ the golden ratio. This Λ is NOT the completed zeta Λ(s) (the paper's own notation note, p19).

Served locus: §3, display (3.1), PDF p09 (printed folio 8). PDF sha256 prefix `2d5287e7`. -/
theorem rz_17_quaternary_product :
    Real.goldenRatio * Real.sqrt 5 * Real.pi * geometryConstant =
      Real.goldenRatio * Real.sqrt 5 * Real.pi * (1 / (Real.sqrt 5 * Real.pi)) ∧
    Real.goldenRatio * Real.sqrt 5 * Real.pi * (1 / (Real.sqrt 5 * Real.pi)) =
      Real.goldenRatio := by
  have h5 : Real.sqrt 5 ≠ 0 := by positivity
  have hπ : Real.pi ≠ 0 := Real.pi_ne_zero
  refine ⟨rfl, ?_⟩
  field_simp

/-! ## L:RZ-21 -/

/-- **L:RZ-21** — "(e.g. ζ(2) = π²/6, ζ(4) = π⁴/90)".

Served locus: §4.1, the sentence after display (4.1), PDF p10 (printed folio 9). PDF sha256
prefix `2d5287e7`. -/
theorem rz_21_zeta_two_four :
    riemannZeta 2 = (Real.pi : ℂ) ^ 2 / 6 ∧ riemannZeta 4 = (Real.pi : ℂ) ^ 4 / 90 := by
  exact ⟨riemannZeta_two, riemannZeta_four⟩

/-! ## L:RZ-32a -/

/-- **L:RZ-32a** (split leg of L:RZ-32) — the q-rewriting of Ramanujan's correction series,
q = e^{−2π}: termwise for every k ≥ 1, 1/(k³(e^{2πk} − 1)) = q^k/(k³(1 − q^k)), hence the two
series over k ≥ 1 agree (the sums are re-indexed k ↦ k + 1).

Served locus: (4.3), §4.3, PDF p11 (printed folio 10) ↔ (5.1), §5.3, PDF p14 (printed folio 13);
the identity is implicit between the two displays. PDF sha256 prefix `2d5287e7`. -/
theorem rz_32a_correction_q_form :
    let q : ℝ := Real.exp (-(2 * Real.pi))
    (∀ k : ℕ, 1 ≤ k →
      1 / ((k : ℝ) ^ 3 * (Real.exp (2 * Real.pi * k) - 1)) = q ^ k / ((k : ℝ) ^ 3 * (1 - q ^ k))) ∧
    (∑' k : ℕ, 1 / (((k : ℝ) + 1) ^ 3 * (Real.exp (2 * Real.pi * ((k : ℝ) + 1)) - 1)) =
      ∑' k : ℕ, q ^ (k + 1) / (((k : ℝ) + 1) ^ 3 * (1 - q ^ (k + 1)))) := by
  intro q
  have key : ∀ k : ℕ,
      1 / ((k : ℝ) ^ 3 * (Real.exp (2 * Real.pi * k) - 1)) =
        q ^ k / ((k : ℝ) ^ 3 * (1 - q ^ k)) := by
    intro k
    have hq : q ^ k = (Real.exp (2 * Real.pi * k))⁻¹ := by
      simp only [q, ← Real.exp_nat_mul, ← Real.exp_neg]
      congr 1; ring
    rw [hq]
    have hE : Real.exp (2 * Real.pi * k) ≠ 0 := (Real.exp_pos _).ne'
    rw [show (k : ℝ) ^ 3 * (1 - (Real.exp (2 * Real.pi * k))⁻¹) =
        ((k : ℝ) ^ 3 * (Real.exp (2 * Real.pi * k) - 1)) * (Real.exp (2 * Real.pi * k))⁻¹ by
      field_simp]
    rw [div_mul_cancel_right₀ (inv_ne_zero hE), one_div]
  refine ⟨fun k _ ↦ key k, ?_⟩
  congr 1
  funext k
  have := key (k + 1)
  push_cast at this
  exact this

/-! ## L:RZ-32b — OUT-OF-Q5, NOT PROVED: Ramanujan's ζ(3) formula is not at the pin;
the theorem `rz_32b_zeta_three_q_form` is left out of this module (an unproved placeholder
here fails the check). -/


/-! ## L:RZ-33a -/

/-- **L:RZ-33a** (split leg of L:RZ-33) — "The functional equation ζ(s) = χ(s) ζ(1 − s)", with
χ = `zetaChi` the standard factor (supplied by the spec), for every complex s not a natural
number (the pointwise shadow of the meromorphic identity at the pin).

Served locus: §5.4, display (5.2), PDF p14 (printed folio 13). PDF sha256 prefix `2d5287e7`.
The clause "with fixed locus Re(s) = 1/2" is L:RZ-33b (correction track) and is not stated. -/
theorem rz_33a_functional_equation (s : ℂ) (hs : ∀ n : ℕ, s ≠ n) :
    riemannZeta s = zetaChi s * riemannZeta (1 - s) := by
  have hs0 : s ≠ 0 := by simpa using hs 0
  have h1 : ∀ n : ℕ, 1 - s ≠ -n := by
    intro n h
    apply hs (n + 1)
    push_cast
    linear_combination -h
  have h1' : 1 - s ≠ 1 := by
    intro h; apply hs0; linear_combination -h
  have hFE := riemannZeta_one_sub h1 h1'
  rw [sub_sub_cancel] at hFE
  rw [hFE]
  unfold zetaChi
  have hcos : Complex.cos (Real.pi * (1 - s) / 2) = Complex.sin (Real.pi * s / 2) := by
    rw [← Complex.cos_pi_div_two_sub]; congr 1; ring
  have hsplit : (2 * (Real.pi : ℂ)) ^ (-(1 - s)) =
      (2 : ℂ) ^ (-(1 - s)) * (Real.pi : ℂ) ^ (-(1 - s)) := by
    have := Complex.mul_cpow_ofReal_nonneg (a := 2) (b := Real.pi) (by norm_num) Real.pi_pos.le
      (-(1 - s))
    simpa using this
  have h2s : (2 : ℂ) ^ s = 2 * (2 : ℂ) ^ (-(1 - s)) := by
    rw [show s = 1 + (-(1 - s)) by ring, Complex.cpow_add _ _ (by norm_num), Complex.cpow_one]
    congr 2; ring
  rw [hcos, hsplit, h2s, show -(1 - s) = s - 1 by ring]
  ring

/-! ## L:RZ-34 -/

/-- **L:RZ-34** — the Euler product (5.3): for 1 < Re s, the product over the primes of
(1 − p^{−s})⁻¹ converges to ζ(s) (`HasProd`: convergence and value). The domain 1 < Re s is
supplied by the spec (omitted in print; a wording note, not a CC).

Served locus: §5.5, display (5.3), PDF p14 (printed folio 13). PDF sha256 prefix `2d5287e7`. -/
theorem rz_34_euler_product (s : ℂ) (hs : 1 < s.re) :
    HasProd (fun p : Nat.Primes ↦ (1 - (p : ℂ) ^ (-s))⁻¹) (riemannZeta s) := by
  exact riemannZeta_eulerProduct_hasProd hs

/-! ## L:RZ-46a -/

/-- **L:RZ-46a (o)** — the paper's Λ(s) := π^{−s/2} Γ(s/2) ζ(s) is `completedRiemannZeta`, off
the even non-positive integers.

Served locus: §7.4, the definition paragraph before (7.5), PDF p19 (printed folio 18). PDF
sha256 prefix `2d5287e7`. -/
theorem rz_46a_o_lambda_convention (s : ℂ) (hs : ∀ n : ℕ, s ≠ -(2 * n)) :
    completedRiemannZeta s = (Real.pi : ℂ) ^ (-s / 2) * Complex.Gamma (s / 2) * riemannZeta s := by
  have hs0 : s ≠ 0 := by simpa using hs 0
  have hG : Complex.Gammaℝ s ≠ 0 := by
    rw [Ne, Complex.Gammaℝ_eq_zero_iff]
    rintro ⟨n, hn⟩
    exact hs n hn
  rw [riemannZeta_def_of_ne_zero hs0, ← Complex.Gammaℝ_def, mul_div_cancel₀ _ hG]

/-- **L:RZ-46a (i)** — the expansion (7.5):
φ(s) = Λ(2s − 1)/Λ(2s) = π^{−s+1/2} Γ(s − 1/2) ζ(2s − 1) / (π^{−s} Γ(s) ζ(2s)), for s off the
poles of Γ(s) and Γ(s − 1/2).

Served locus: §7.4, display (7.5), PDF p19 (printed folio 18). PDF sha256 prefix `2d5287e7`. -/
theorem rz_46a_i_expansion (s : ℂ) (h₁ : ∀ n : ℕ, s ≠ -n) (h₂ : ∀ n : ℕ, s ≠ 1 / 2 - n) :
    scatteringRatio s =
      (Real.pi : ℂ) ^ (-s + 1 / 2) * Complex.Gamma (s - 1 / 2) * riemannZeta (2 * s - 1) /
        ((Real.pi : ℂ) ^ (-s) * Complex.Gamma s * riemannZeta (2 * s)) := by
  have ha : ∀ n : ℕ, 2 * s - 1 ≠ -(2 * n) := by
    intro n h; apply h₂ n; linear_combination h / 2
  have hb : ∀ n : ℕ, 2 * s ≠ -(2 * n) := by
    intro n h; apply h₁ n; linear_combination h / 2
  unfold scatteringRatio
  rw [rz_46a_o_lambda_convention _ ha, rz_46a_o_lambda_convention _ hb]
  rw [show -(2 * s - 1) / 2 = -s + 1 / 2 by ring, show (2 * s - 1) / 2 = s - 1 / 2 by ring,
    show -(2 * s) / 2 = -s by ring, show 2 * s / 2 = s by ring]

/-- **L:RZ-46a (ii)–(iii)** — the ½s(s−1) prefactors contribute
(2s − 2)(2s − 1)/[(2s)(2s − 1)] = (s − 1)/s, and the ξ-ratio is that factor times the Λ-ratio:
ξ(2s − 1)/ξ(2s) = ((s − 1)/s) · φ(s). Stated as the meromorphic identity of the spec
(s ≠ 0, 1/2, 1).

Served locus: §7.4, the parenthesis before (7.5), PDF p19 (printed folio 18). PDF sha256 prefix
`2d5287e7`. -/
theorem rz_46a_ii_iii_xi_factor (s : ℂ) (h₀ : s ≠ 0) (h₁ : s ≠ 1 / 2) (hs1 : s ≠ 1) :
    (2 * s - 2) * (2 * s - 1) / ((2 * s) * (2 * s - 1)) = (s - 1) / s ∧
    riemannXiRZ (2 * s - 1) / riemannXiRZ (2 * s) = (s - 1) / s * scatteringRatio s := by
  have h2 : (2 : ℂ) * s - 1 ≠ 0 := by
    intro h; apply h₁; linear_combination h / 2
  have hfac : (2 * s - 2) * (2 * s - 1) / ((2 * s) * (2 * s - 1)) = (s - 1) / s := by
    field_simp
  refine ⟨hfac, ?_⟩
  unfold riemannXiRZ scatteringRatio
  rw [mul_div_mul_comm]
  congr 1
  rw [← hfac]
  field_simp
  ring

/-! ## L:RZ-47 -/

/-- **L:RZ-47** — a non-trivial zero ρ of ζ (in `RiemannHypothesis`'s vocabulary: ζ(ρ) = 0, ρ not
a trivial zero, ρ ≠ 1) contributes a pole of φ(s) = Λ(2s − 1)/Λ(2s) at s = ρ/2; under RH,
Re(ρ/2) = 1/4; unconditionally 0 < Re(ρ/2) < 1/2 (proved, not assumed); so Re(ρ/2) ≠ 1/2.

Served locus: §7.4, the sentence after (7.5), PDF p19 (printed folio 18); echo §5.4, PDF p14
(printed folio 13). PDF sha256 prefix `2d5287e7`. -/
theorem rz_47_zero_gives_pole (ρ : ℂ) (hζ : riemannZeta ρ = 0)
    (hnt : ¬ ∃ n : ℕ, ρ = -2 * (n + 1)) (h1 : ρ ≠ 1) :
    Filter.Tendsto scatteringRatio (nhdsWithin (ρ / 2) {ρ / 2}ᶜ) (Bornology.cobounded ℂ) ∧
    (RiemannHypothesis → (ρ / 2).re = 1 / 4) ∧
    (0 < (ρ / 2).re ∧ (ρ / 2).re < 1 / 2) ∧
    (ρ / 2).re ≠ 1 / 2 := by
  -- ρ ≠ 0, and Γℝ(ρ) ≠ 0 (ρ is not a trivial zero)
  have hρ0 : ρ ≠ 0 := by
    rintro rfl; rw [riemannZeta_zero] at hζ; norm_num at hζ
  have hGρ : Complex.Gammaℝ ρ ≠ 0 := by
    rw [Ne, Complex.Gammaℝ_eq_zero_iff]
    rintro ⟨n, hn⟩
    rcases n with _ | m
    · apply hρ0; simpa using hn
    · apply hnt; exact ⟨m, by rw [hn]; push_cast; ring⟩
  -- Λ(ρ) = 0
  have hΛρ : completedRiemannZeta ρ = 0 := by
    have := riemannZeta_def_of_ne_zero hρ0
    rw [hζ, eq_comm, div_eq_zero_iff] at this
    exact this.resolve_right hGρ
  -- the critical strip, unconditionally
  have hre1 : ρ.re < 1 := by
    by_contra h
    exact riemannZeta_ne_zero_of_one_le_re (not_lt.mp h) hζ
  have hre0 : 0 < ρ.re := by
    by_contra h
    replace h := not_lt.mp h
    have h1r : 1 ≤ (1 - ρ).re := by simp; linarith
    have hne : (1 - ρ) ≠ 0 := by intro h'; apply h1; linear_combination -h'
    have hG : Complex.Gammaℝ (1 - ρ) ≠ 0 := Complex.Gammaℝ_ne_zero_of_re_pos (by linarith)
    apply riemannZeta_ne_zero_of_one_le_re h1r
    rw [riemannZeta_def_of_ne_zero hne, completedRiemannZeta_one_sub, hΛρ, zero_div]
  have hre2 : (ρ / 2).re = ρ.re / 2 := by simp
  refine ⟨?_, fun hRH ↦ ?_, ⟨by rw [hre2]; linarith, by rw [hre2]; linarith⟩,
    by rw [hre2]; linarith⟩
  swap
  · rw [hre2, hRH ρ hζ hnt h1]; norm_num
  -- the numerator Λ(2s − 1) is continuous at ρ/2 with a nonzero value Λ(ρ − 1) = Λ(2 − ρ)
  have hN0 : completedRiemannZeta (ρ - 1) ≠ 0 := by
    have hre : 1 < (2 - ρ).re := by simp; linarith
    have hne : (2 - ρ) ≠ 0 := by
      intro h; have := congrArg Complex.re h; simp at this; linarith
    have hG : Complex.Gammaℝ (2 - ρ) ≠ 0 := Complex.Gammaℝ_ne_zero_of_re_pos (by linarith)
    rw [show ρ - 1 = 1 - (2 - ρ) by ring, completedRiemannZeta_one_sub]
    intro h0
    apply riemannZeta_ne_zero_of_one_lt_re hre
    rw [riemannZeta_def_of_ne_zero hne, h0, zero_div]
  have hNc : ContinuousAt (fun s : ℂ ↦ completedRiemannZeta (2 * s - 1)) (ρ / 2) := by
    have hd : DifferentiableAt ℂ completedRiemannZeta (2 * (ρ / 2) - 1) := by
      apply differentiableAt_completedZeta
      · intro h; apply h1; linear_combination h
      · intro h
        have := congrArg Complex.re h
        simp at this; linarith
    have hc : ContinuousAt (fun s : ℂ ↦ 2 * s - 1) (ρ / 2) := by fun_prop
    exact ContinuousAt.comp (g := completedRiemannZeta) hd.continuousAt hc
  have hN : Filter.Tendsto (fun s : ℂ ↦ completedRiemannZeta (2 * s - 1))
      (nhdsWithin (ρ / 2) {ρ / 2}ᶜ) (nhds (completedRiemannZeta (ρ - 1))) := by
    have := hNc.tendsto
    rw [show 2 * (ρ / 2) - 1 = ρ - 1 by ring] at this
    exact this.mono_left nhdsWithin_le_nhds
  -- the denominator Λ(2s) tends to 0 and is eventually nonzero: isolated zeros of the entire
  -- function H(s) = 2s(1 − 2s)Λ₀(2s) − 1, which equals 2s(1 − 2s)Λ(2s) off {0, 1/2}
  set H : ℂ → ℂ := fun s ↦ 2 * s * (1 - 2 * s) * completedRiemannZeta₀ (2 * s) - 1 with hHdef
  have hHd : Differentiable ℂ H := by
    have := differentiable_completedZeta₀
    fun_prop
  have hH0 : H 0 ≠ 0 := by simp [H]
  have hHev : ∀ᶠ s in nhdsWithin (ρ / 2) {ρ / 2}ᶜ, H s ≠ 0 := by
    rcases (hHd.analyticAt (ρ / 2)).eventually_eq_zero_or_eventually_ne_zero with h | h
    · exfalso
      have hA : AnalyticOnNhd ℂ H Set.univ := fun z _ ↦ hHd.analyticAt z
      have := hA.eqOn_zero_of_preconnected_of_eventuallyEq_zero
        isPreconnected_univ (Set.mem_univ _) h (Set.mem_univ 0)
      exact hH0 this
    · exact h
  have hne0 : ∀ᶠ s in nhds (ρ / 2), 2 * s ≠ 0 := by
    have : ContinuousAt (fun s : ℂ ↦ 2 * s) (ρ / 2) := by fun_prop
    exact this.eventually_ne (by intro h; apply hρ0; linear_combination h)
  have hne1 : ∀ᶠ s in nhds (ρ / 2), 2 * s ≠ 1 := by
    have : ContinuousAt (fun s : ℂ ↦ 2 * s) (ρ / 2) := by fun_prop
    exact this.eventually_ne (by intro h; apply h1; linear_combination h)
  have hDev : ∀ᶠ s in nhdsWithin (ρ / 2) {ρ / 2}ᶜ, completedRiemannZeta (2 * s) ≠ 0 := by
    filter_upwards [hHev, nhdsWithin_le_nhds hne0, nhdsWithin_le_nhds hne1] with s hH h0 h1s
    intro hΛ
    apply hH
    have h1s' : 1 - 2 * s ≠ 0 := by intro h; apply h1s; linear_combination -h
    have hs0 : s ≠ 0 := by rintro rfl; simp at h0
    have : H s = 2 * s * (1 - 2 * s) * completedRiemannZeta (2 * s) := by
      simp only [H, completedRiemannZeta_eq]
      field_simp
      ring
    rw [this, hΛ, mul_zero]
  have hDc : ContinuousAt (fun s : ℂ ↦ completedRiemannZeta (2 * s)) (ρ / 2) := by
    have hd : DifferentiableAt ℂ completedRiemannZeta (2 * (ρ / 2)) := by
      apply differentiableAt_completedZeta
      · intro h; apply hρ0; linear_combination h
      · intro h; apply h1; linear_combination h
    have hc : ContinuousAt (fun s : ℂ ↦ 2 * s) (ρ / 2) := by fun_prop
    exact ContinuousAt.comp (g := completedRiemannZeta) hd.continuousAt hc
  have hD : Filter.Tendsto (fun s : ℂ ↦ completedRiemannZeta (2 * s))
      (nhdsWithin (ρ / 2) {ρ / 2}ᶜ) (nhdsWithin 0 {0}ᶜ) := by
    apply tendsto_nhdsWithin_of_tendsto_nhds_of_eventually_within
    · have := hDc.tendsto
      rw [show 2 * (ρ / 2) = ρ by ring, hΛρ] at this
      exact this.mono_left nhdsWithin_le_nhds
    · exact hDev
  -- assemble: ‖φ(s)‖ = ‖Λ(2s − 1)‖ · ‖Λ(2s)‖⁻¹ → ∞
  have hinv : Filter.Tendsto (fun s : ℂ ↦ ‖completedRiemannZeta (2 * s)‖⁻¹)
      (nhdsWithin (ρ / 2) {ρ / 2}ᶜ) Filter.atTop :=
    (tendsto_norm_nhdsNE_zero.comp hD).inv_tendsto_nhdsGT_zero
  have hnorm : Filter.Tendsto (fun s : ℂ ↦ ‖completedRiemannZeta (2 * s - 1)‖ *
      ‖completedRiemannZeta (2 * s)‖⁻¹) (nhdsWithin (ρ / 2) {ρ / 2}ᶜ) Filter.atTop :=
    Filter.Tendsto.pos_mul_atTop (norm_pos_iff.mpr hN0) hN.norm hinv
  rw [← tendsto_norm_atTop_iff_cobounded]
  refine hnorm.congr fun s ↦ ?_
  simp only [scatteringRatio, norm_mul, norm_inv, div_eq_mul_inv]

/-! ## L:RZ-49 -/

/-- **L:RZ-49** — "|(s − 1)/s| = 1 on Re(s) = 1/2" (the modulus as mathlib's norm).

Served locus: §7.4, PDF p19 (printed folio 18). PDF sha256 prefix `2d5287e7`. -/
theorem rz_49_norm_factor_eq_one (s : ℂ) (hs : s.re = 1 / 2) :
    ‖(s - 1) / s‖ = 1 := by
  have hs0 : s ≠ 0 := by
    intro h; rw [h] at hs; norm_num at hs
  rw [norm_div, div_eq_one_iff_eq (norm_ne_zero_iff.mpr hs0)]
  rw [Complex.norm_def, Complex.norm_def]
  congr 1
  simp only [Complex.normSq_apply, Complex.sub_re, Complex.sub_im, Complex.one_re,
    Complex.one_im, hs]
  ring

/-! ## L:RZ-60 -/

/-- **L:RZ-60** — the "using …" clause after (9.7), φ the golden ratio:
φ² − φ⁻² = φ + 1/φ = √5; φ − 1/φ is 1, not √5; log(φ⁴) = 4 log φ = 2 log(φ²).

Served locus: §9.5, the sentence completing display (9.7), PDF p24 (printed folio 23). PDF
sha256 prefix `2d5287e7`. -/
theorem rz_60_golden_identities :
    Real.goldenRatio ^ 2 - (Real.goldenRatio ^ 2)⁻¹ = Real.goldenRatio + Real.goldenRatio⁻¹ ∧
    Real.goldenRatio + Real.goldenRatio⁻¹ = Real.sqrt 5 ∧
    Real.goldenRatio - Real.goldenRatio⁻¹ = 1 ∧
    Real.goldenRatio - Real.goldenRatio⁻¹ ≠ Real.sqrt 5 ∧
    Real.log (Real.goldenRatio ^ 4) = 4 * Real.log Real.goldenRatio ∧
    Real.log (Real.goldenRatio ^ 4) = 2 * Real.log (Real.goldenRatio ^ 2) := by
  have hinv : Real.goldenRatio⁻¹ = -Real.goldenConj := Real.inv_goldenRatio
  have hsq : Real.goldenRatio ^ 2 = Real.goldenRatio + 1 := Real.goldenRatio_sq
  have hsq' : (Real.goldenRatio ^ 2)⁻¹ = Real.goldenConj ^ 2 := by
    rw [← inv_pow, hinv]; ring
  have hc : Real.goldenConj ^ 2 = Real.goldenConj + 1 := Real.goldenConj_sq
  have hsub : Real.goldenRatio - Real.goldenConj = Real.sqrt 5 := Real.goldenRatio_sub_goldenConj
  have hadd : Real.goldenRatio + Real.goldenConj = 1 := Real.goldenRatio_add_goldenConj
  have h51 : (1 : ℝ) ≠ Real.sqrt 5 := by
    intro h
    have := congrArg (· ^ 2) h
    simp only [one_pow, Real.sq_sqrt (show (0:ℝ) ≤ 5 by norm_num)] at this
    norm_num at this
  have hlog4 : Real.log (Real.goldenRatio ^ 4) = 4 * Real.log Real.goldenRatio := by
    rw [Real.log_pow]; norm_num
  refine ⟨?_, ?_, ?_, ?_, hlog4, ?_⟩
  · rw [hsq', hc, hsq, hinv]; ring
  · rw [hinv]; linarith
  · rw [hinv]; linarith
  · rw [hinv, sub_neg_eq_add, hadd]; exact h51
  · rw [hlog4, Real.log_pow]; push_cast; ring

end RiemannZeta.ZetaL
