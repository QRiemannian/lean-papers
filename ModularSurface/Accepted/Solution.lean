import Mathlib

/-!
# Unit U13 (`ModularSurface/Accepted`) — proofs

The Solution module of unit U13 (the NEW rows of *The Invariant Structure of the Modular
Surface*, QRiemannian Research, 2026, revised October 2026, that the wall accepted as Lean
targets), served PDF sha256
`b4841489ec6bea619f8d5525ce4c788b86e0109e51d6e9d2cb252690f5b13af5` (prefix `b4841489`).
This module does NOT import `ModularSurface.Accepted.Challenge`: it imports `Mathlib`, opens the
same namespace, restates the Challenge's non-theorem declarations (`fact_prime_five`, `chi5`,
`heckePeriodClosedForm`) byte-identically, and proves two theorems under their Challenge names
and statement text (Challenge sha256 `d7307749…`, signed by V₂).

Rows proved: L:MS-N2a (`ms_N2a_closedForm_vanishes`), L:MS-N3 (`ms_N3_phi_from_systole`).
L:MS-N5a (`ms_N5a_figure1_nodes`) is NEEDS-DEVELOPMENT by the wall's word: it stays frozen and
unproved in the Challenge and is not restated here.

**The route for L:MS-N2a** (`specs/MS-N2a.md` §3). Write the closed form as N(s) · Γ(s)⁻¹ ·
ζ(2s)⁻¹ with N(s) = 5^{s/2} Γ(s/2)² ζ(s) L(s, χ₅). At a zero ρ of ζ with Re ρ ≥ 1/2 and ρ ≠ 1,
N is differentiable at ρ (Γ has no pole at ρ/2 since Re ρ > 0; ζ is differentiable away from 1;
L(·, χ₅) is entire since χ₅ ≠ 1) with N(ρ) = 0; Γ⁻¹ is entire; and ζ(2s)⁻¹ has a finite limit on
the punctured neighbourhood: ζ(2ρ)⁻¹ when 2ρ ≠ 1 (ζ(2ρ) ≠ 0 as Re 2ρ ≥ 1), and 0 when
2ρ = 1 (the pole of ζ at 1, from `riemannZeta_residue_one`; no ζ(1/2) ≠ 0 lemma is used). The
product tends to 0. Under RH every nontrivial zero has Re ρ = 1/2, which reduces the second
conjunct to the first.

**The route for L:MS-N3.** systole / 4 = log φ, and exp (log φ) = φ since φ > 0.
-/

namespace ModularSurface.Accepted

/-! ## Restated and shared definitions -/

-- Restated byte-identically from RiemannZeta/LValue/Challenge.lean:26–28 (unit U10).
/-- `Fact (Nat.Prime 5)`, declared once for the unit (mathlib's pin has no global instance for the
natural number 5). A provable fact supplied as an instance, not a hypothesis of any statement. -/
instance fact_prime_five : Fact (Nat.Prime 5) := ⟨by norm_num⟩

-- Restated byte-identically from RiemannZeta/LValue/Challenge.lean:30–35 (unit U10).
/-- χ₅ — **the binding definition** (L:RZ-58b states what it is): the quadratic character mod 5
(the Legendre symbol (·/5)), valued in ℂ, as a Dirichlet character of modulus 5. Its body is
byte-identical to unit U2's `RiemannZeta.Bridge.chi5` and to unit U1's `RiemannZeta.Pilot.chi5`
(typed there as `MulChar (ZMod 5) ℂ`, which `DirichletCharacter ℂ 5` abbreviates). -/
noncomputable def chi5 : DirichletCharacter ℂ 5 :=
  (quadraticChar (ZMod 5)).ringHomComp (Int.castRingHom ℂ)

-- New in this unit: specs/MS-N2a.md §5 (shared by L:MS-N2a and L:MS-N5a).
/-- The right side of MS (5.2a): 5^{s/2} Γ(s/2)² ζ(s) L(s, χ₅) / (Γ(s) ζ(2s)). Shared by
L:MS-N2a and L:MS-N5a. -/
noncomputable def heckePeriodClosedForm (s : ℂ) : ℂ :=
  (5 : ℂ) ^ (s / 2) * Complex.Gamma (s / 2) ^ 2 * riemannZeta s *
      DirichletCharacter.LFunction chi5 s / (Complex.Gamma s * riemannZeta (2 * s))

section Aux

open Filter Topology

/-- The values of the quadratic character of `ZMod 5` (U10's `aux_q_vals`). -/
lemma aux_q_vals : quadraticChar (ZMod 5) 0 = 0 ∧ quadraticChar (ZMod 5) 1 = 1 ∧
    quadraticChar (ZMod 5) 2 = -1 ∧ quadraticChar (ZMod 5) 3 = -1 ∧
    quadraticChar (ZMod 5) 4 = 1 := by
  refine ⟨quadraticChar_zero, map_one _, ?_, ?_, ?_⟩
  · rw [quadraticChar_neg_one_iff_not_isSquare]; decide
  · rw [quadraticChar_neg_one_iff_not_isSquare]; decide
  · rw [quadraticChar_one_iff_isSquare (by decide)]; decide

lemma aux_chi5_apply (a : ZMod 5) : chi5 a = ((quadraticChar (ZMod 5) a : ℤ) : ℂ) := rfl

/-- χ₅ is not the trivial character: χ₅(2) = −1 (U10's `aux_chi5_ne_one`). -/
lemma aux_chi5_ne_one : chi5 ≠ 1 := by
  intro h
  have h2 : chi5 2 = (1 : DirichletCharacter ℂ 5) 2 := by rw [h]
  rw [MulChar.one_apply (by decide), aux_chi5_apply, aux_q_vals.2.2.1] at h2
  norm_num at h2

/-- The numerator 5^{s/2} Γ(s/2)² ζ(s) L(s, χ₅) of the closed form. -/
noncomputable def aux_num (s : ℂ) : ℂ :=
  (5 : ℂ) ^ (s / 2) * Complex.Gamma (s / 2) ^ 2 * riemannZeta s *
    DirichletCharacter.LFunction chi5 s

lemma aux_closedForm_eq (s : ℂ) :
    heckePeriodClosedForm s = aux_num s * ((Complex.Gamma s)⁻¹ * (riemannZeta (2 * s))⁻¹) := by
  rw [heckePeriodClosedForm, aux_num, div_eq_mul_inv, mul_inv]

/-- The numerator is continuous at ρ when ρ ≠ 1 and Re ρ > 0. -/
lemma aux_num_continuousAt {ρ : ℂ} (h1 : ρ ≠ 1) (hre : 0 < ρ.re) : ContinuousAt aux_num ρ := by
  have hG : ∀ m : ℕ, ρ / 2 ≠ -m := by
    intro m hm
    have h := congrArg Complex.re hm
    simp only [Complex.div_re, Complex.neg_re, Complex.natCast_re] at h
    norm_num at h
    have : (0 : ℝ) ≤ m := Nat.cast_nonneg m
    nlinarith
  have d1 : DifferentiableAt ℂ (fun s : ℂ => (5 : ℂ) ^ (s / 2)) ρ :=
    (differentiableAt_id.div_const 2).const_cpow (Or.inl (by norm_num))
  have d2 : DifferentiableAt ℂ (fun s : ℂ => Complex.Gamma (s / 2)) ρ :=
    (Complex.differentiableAt_Gamma (ρ / 2) hG).comp ρ (differentiableAt_id.div_const 2)
  have d3 : DifferentiableAt ℂ riemannZeta ρ := differentiableAt_riemannZeta h1
  have d4 : DifferentiableAt ℂ (DirichletCharacter.LFunction chi5) ρ :=
    DirichletCharacter.differentiable_LFunction aux_chi5_ne_one ρ
  exact (((d1.mul (d2.pow 2)).mul d3).mul d4).continuousAt

/-- ζ(w)⁻¹ → 0 as w → 1 (the pole of ζ at 1). -/
lemma aux_inv_zeta_tendsto_one : Tendsto (fun w : ℂ => (riemannZeta w)⁻¹) (𝓝[≠] 1) (𝓝 0) := by
  have hlin : Tendsto (fun w : ℂ => w - 1) (𝓝[≠] 1) (𝓝 0) := by
    have : Tendsto (fun w : ℂ => w - 1) (𝓝 1) (𝓝 (1 - 1)) :=
      (continuous_id.sub continuous_const).tendsto 1
    rw [sub_self] at this
    exact this.mono_left nhdsWithin_le_nhds
  have hprod := hlin.mul (riemannZeta_residue_one.inv₀ one_ne_zero)
  rw [zero_mul] at hprod
  refine hprod.congr' ?_
  filter_upwards [self_mem_nhdsWithin] with w hw
  have hw1 : w - 1 ≠ 0 := sub_ne_zero.mpr hw
  rw [mul_inv, ← mul_assoc, mul_inv_cancel₀ hw1, one_mul]

/-- ζ(2s)⁻¹ has a finite limit on the punctured neighbourhood of ρ when Re ρ ≥ 1/2. -/
lemma aux_inv_zeta_two_tendsto {ρ : ℂ} (hre : 1 / 2 ≤ ρ.re) :
    ∃ c : ℂ, Tendsto (fun s : ℂ => (riemannZeta (2 * s))⁻¹) (𝓝[≠] ρ) (𝓝 c) := by
  have hcont : Tendsto (fun s : ℂ => 2 * s) (𝓝 ρ) (𝓝 (2 * ρ)) :=
    (continuous_const.mul continuous_id).tendsto ρ
  by_cases h : 2 * ρ = 1
  · refine ⟨0, aux_inv_zeta_tendsto_one.comp ?_⟩
    refine tendsto_nhdsWithin_of_tendsto_nhds_of_eventually_within _
      (h ▸ hcont.mono_left nhdsWithin_le_nhds) ?_
    filter_upwards [self_mem_nhdsWithin] with s hs
    intro h2
    apply hs
    have : 2 * s = 2 * ρ := by rw [h, h2]
    exact mul_left_cancel₀ two_ne_zero this
  · refine ⟨(riemannZeta (2 * ρ))⁻¹, ?_⟩
    have hre2 : 1 ≤ (2 * ρ).re := by
      simp only [Complex.mul_re, Complex.re_ofNat, Complex.im_ofNat, zero_mul, sub_zero]
      linarith
    have hne : riemannZeta (2 * ρ) ≠ 0 := riemannZeta_ne_zero_of_one_le_re hre2
    have hz : ContinuousAt riemannZeta (2 * ρ) := (differentiableAt_riemannZeta h).continuousAt
    exact ((hz.tendsto.comp hcont).inv₀ hne).mono_left nhdsWithin_le_nhds

/-- The core: the closed form tends to 0 at a zero ρ of ζ with ρ ≠ 1 and Re ρ ≥ 1/2. -/
lemma aux_closedForm_tendsto_zero {ρ : ℂ} (hz : riemannZeta ρ = 0) (h1 : ρ ≠ 1)
    (hre : 1 / 2 ≤ ρ.re) : Tendsto heckePeriodClosedForm (𝓝[≠] ρ) (𝓝 0) := by
  have hN : Tendsto aux_num (𝓝[≠] ρ) (𝓝 0) := by
    have h := (aux_num_continuousAt h1 (by linarith)).tendsto
    have h0 : aux_num ρ = 0 := by rw [aux_num, hz]; ring
    rw [h0] at h
    exact h.mono_left nhdsWithin_le_nhds
  have hG : Tendsto (fun s : ℂ => (Complex.Gamma s)⁻¹) (𝓝[≠] ρ) (𝓝 (Complex.Gamma ρ)⁻¹) :=
    (Complex.differentiable_one_div_Gamma.continuous.tendsto ρ).mono_left nhdsWithin_le_nhds
  obtain ⟨c, hc⟩ := aux_inv_zeta_two_tendsto hre
  have h := hN.mul (hG.mul hc)
  rw [zero_mul] at h
  refine h.congr' (Eventually.of_forall fun s => ?_)
  exact (aux_closedForm_eq s).symm

end Aux

/-! ## L:MS-N2a -/

/-- L:MS-N2a — MS §5.2, the sentence after (5.2a), served p19 (sha256 b4841489…): the closed
form of Hecke's period "vanishes at every nontrivial zero ρ with Re ρ ≥ 1/2 — under RH, at all
of them"; vanishing read as the limit 0 at ρ (the pointwise value is empty in Lean).

Served locus: §5.2, the sentence after display (5.2a), PDF p19 (printed folio 18); echoes
abstract p02, §1 p03, §5.4 p21, Claim 6 table p26. PDF sha256 prefix `b4841489`. -/
theorem ms_N2a_closedForm_vanishes :
    (∀ ρ : ℂ, riemannZeta ρ = 0 → (¬ ∃ n : ℕ, ρ = -2 * (n + 1)) → ρ ≠ 1 → 1 / 2 ≤ ρ.re →
        Filter.Tendsto heckePeriodClosedForm (nhdsWithin ρ {ρ}ᶜ) (nhds 0)) ∧
    (RiemannHypothesis →
      ∀ ρ : ℂ, riemannZeta ρ = 0 → (¬ ∃ n : ℕ, ρ = -2 * (n + 1)) → ρ ≠ 1 →
        Filter.Tendsto heckePeriodClosedForm (nhdsWithin ρ {ρ}ᶜ) (nhds 0)) := by
  refine ⟨fun ρ hz _ h1 hre => aux_closedForm_tendsto_zero hz h1 hre, ?_⟩
  intro hRH ρ hz hn h1
  exact aux_closedForm_tendsto_zero hz h1 (le_of_eq (hRH ρ hz hn h1).symm)

/-! ## L:MS-N3 -/

/-- L:MS-N3 — MS §3.1, after (3.5), served p09, and §3.2, served p11 (sha256 b4841489…):
"φ = exp(¼ · systole)" and "log φ = ¼ · systole", for a systole equal to 4 log φ (the value is
L:MS-06 = L:RZ-06b, EFFORT; a hypothesis here, as in L:MS-22).

Served locus: §3.1, the "φ from the systole" bullet, the sentence after display (3.5), PDF
p09 (printed folio 8); §3.2, PDF p11 (printed folio 10). PDF sha256 prefix `b4841489`. -/
theorem ms_N3_phi_from_systole (systole : ℝ) (h : systole = 4 * Real.log Real.goldenRatio) :
    Real.goldenRatio = Real.exp (systole / 4) ∧
    Real.log Real.goldenRatio = systole / 4 := by
  have hl : systole / 4 = Real.log Real.goldenRatio := by rw [h]; ring
  exact ⟨by rw [hl, Real.exp_log Real.goldenRatio_pos], hl.symm⟩

end ModularSurface.Accepted
