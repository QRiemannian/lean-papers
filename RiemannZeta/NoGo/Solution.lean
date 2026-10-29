import Mathlib

/-!
# Unit U5 (`RiemannZeta/NoGo`) — proofs

Proofs of the rows of unit U5 (§13, the no-go results on the operator algebra's grading and its
replacement) of the paper *The Tetrahedral Structure of the Riemann Zeta Function* (QRiemannian
Research, April 2026, revised October 2026), served PDF sha256
`2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54` (prefix `2d5287e7`).

This module does not import `RiemannZeta.NoGo.Challenge`. It restates the Challenge's
non-theorem declarations (the `universe u` line, the local definition `symmTraceless2`, and the
local-instance line `LieRing.ofAssociativeRing` before L:RZ-82a) byte-identically and proves each
in-scope theorem under the Challenge's name and statement text, so that Comparator can compare
the two environments.

Rows proved here: L:RZ-80, L:RZ-81, L:RZ-82a. L:RZ-82b (OUT-OF-Q5, pending the wall;
NEEDS-DEVELOPMENT — no Cartan involution at the pin) is NOT PROVED and is left out of this module.
-/

namespace RiemannZeta.NoGo

universe u

/-! ## L:RZ-80 -/

/-- **L:RZ-80** — §13.2: under a multiplicative ℤ₂ grading (a `GradedAlgebra` indexed by
`ZMod 2`) with Ĥ even and Ê, Ŝ, D̂ odd, relation (3.2) [Ê, Ŝ] = iℏ ĤD̂ holds only with both
sides zero: [Ê, Ŝ] = 0 and ĤD̂ = 0 (the printed parity mismatch, stated as its consequence).
Relation (3.2) is a hypothesis only (Q7); ℏ ≠ 0 is implicit in print.

Served locus: §13.2, displays (13.1)–(13.2) and the paragraph after them, PDF p31 (printed
folio 30); relation (3.2) from §3, PDF p09 (printed folio 8). PDF sha256 prefix `2d5287e7`. -/
theorem rz_80_z2_grading_incompatible
    {A : Type*} [Ring A] [Algebra ℂ A]
    (𝒜 : ZMod 2 → Submodule ℂ A) [GradedAlgebra 𝒜]
    (E S H D : A) (ħ : ℝ) (hħ : ħ ≠ 0)
    (hH : H ∈ 𝒜 0) (hE : E ∈ 𝒜 1) (hS : S ∈ 𝒜 1) (hD : D ∈ 𝒜 1)
    (h32 : E * S - S * E = (Complex.I * (ħ : ℂ)) • (H * D)) :
    E * S - S * E = 0 ∧ H * D = 0 := by
  have h11 : (1 : ZMod 2) + 1 = 0 := by decide
  have hES : E * S ∈ 𝒜 0 := h11 ▸ SetLike.mul_mem_graded hE hS
  have hSE : S * E ∈ 𝒜 0 := h11 ▸ SetLike.mul_mem_graded hS hE
  have hHD : H * D ∈ 𝒜 1 := by simpa using SetLike.mul_mem_graded hH hD
  have hL0 : E * S - S * E ∈ 𝒜 0 := Submodule.sub_mem _ hES hSE
  have hL1 : E * S - S * E ∈ 𝒜 1 := h32 ▸ Submodule.smul_mem _ _ hHD
  have hzero : E * S - S * E = 0 := by
    rw [← DirectSum.decompose_of_mem_same 𝒜 hL0]
    exact DirectSum.decompose_of_mem_ne 𝒜 hL1 (by decide)
  have hc : Complex.I * (ħ : ℂ) ≠ 0 :=
    mul_ne_zero Complex.I_ne_zero (Complex.ofReal_ne_zero.mpr hħ)
  refine ⟨hzero, ?_⟩
  rw [hzero, eq_comm, smul_eq_zero] at h32
  exact h32.resolve_left hc

/-! ## L:RZ-81 -/

/-- **L:RZ-81** — §13.3, one theorem with the printed conjunction:
(a) in any complex algebra, the four relations (3.2)–(3.5) and BOTH proposed relations (13.3),
with ℏ ≠ 0, give (13.5) D̂ÊĤ = 0, and in a nontrivial algebra D̂, Ê, Ĥ are not all invertible;
(b) for every ℏ the six relations are satisfied by nonzero 2 × 2 complex matrices, so (13.5) is
a constraint and not an outright contradiction. The six relations are hypotheses only (Q7); the
derivation uses both relations of (13.3) (the print names only [Ê, Ĥ] = iℏ ŜD̂) and all four of
(3.2)–(3.5).

Served locus: §13.3, displays (13.3)–(13.5) and the sentence after (13.5), PDF p32 (printed
folio 31); relations (3.2)–(3.5) from §3, PDF p09 (printed folio 8). PDF sha256 prefix
`2d5287e7`. -/
theorem rz_81_jacobi_forces_DEH_zero :
    (∀ {A : Type u} [Ring A] [Algebra ℂ A] (E S H D : A) (ħ : ℝ), ħ ≠ 0 →
      E * S - S * E = (Complex.I * (ħ : ℂ)) • (H * D) →   -- (3.2)
      S * H - H * S = (Complex.I * (ħ : ℂ)) • (D * E) →   -- (3.3)
      H * D - D * H = (Complex.I * (ħ : ℂ)) • (E * S) →   -- (3.4)
      D * E - E * D = (Complex.I * (ħ : ℂ)) • (S * H) →   -- (3.5)
      E * H - H * E = (Complex.I * (ħ : ℂ)) • (S * D) →   -- (13.3), first
      S * D - D * S = (Complex.I * (ħ : ℂ)) • (E * H) →   -- (13.3), second
      D * E * H = 0 ∧ (Nontrivial A → ¬ (IsUnit D ∧ IsUnit E ∧ IsUnit H))) ∧
    (∀ ħ : ℝ, ∃ E S H D : Matrix (Fin 2) (Fin 2) ℂ,
      E ≠ 0 ∧ S ≠ 0 ∧ H ≠ 0 ∧ D ≠ 0 ∧
      E * S - S * E = (Complex.I * (ħ : ℂ)) • (H * D) ∧
      S * H - H * S = (Complex.I * (ħ : ℂ)) • (D * E) ∧
      H * D - D * H = (Complex.I * (ħ : ℂ)) • (E * S) ∧
      D * E - E * D = (Complex.I * (ħ : ℂ)) • (S * H) ∧
      E * H - H * E = (Complex.I * (ħ : ℂ)) • (S * D) ∧
      S * D - D * S = (Complex.I * (ħ : ℂ)) • (E * H)) := by
  refine ⟨?_, ?_⟩
  · intro A _ _ E S H D ħ hħ h32 h33 h34 h35 h133a h133b
    set c : ℂ := Complex.I * (ħ : ℂ) with hc_def
    have hc : c ≠ 0 := mul_ne_zero Complex.I_ne_zero (Complex.ofReal_ne_zero.mpr hħ)
    -- the Jacobi triple (D, E, H), each commutator replaced by its relation
    have F1 := congrArg (D * ·) h133a
    have F2 := congrArg (· * D) h133a
    have F3 := congrArg (E * ·) h34
    have F4 := congrArg (· * E) h34
    have F5 := congrArg (H * ·) h35
    have F6 := congrArg (· * H) h35
    -- the three commutators left after the substitution
    have G1 := congrArg (· * D) h133b
    have G2 := congrArg (E * ·) h32
    have G3 := congrArg (· * H) h33
    simp only [mul_sub, sub_mul, mul_smul_comm, smul_mul_assoc, mul_assoc]
      at F1 F2 F3 F4 F5 F6 G1 G2 G3
    have key : (c * c) • (D * (E * H)) = 0 := by
      linear_combination (norm := module) F1 - F2 + F3 - F4 + F5 - F6 - c • G1 + c • G2 - c • G3
    have hDEH : D * E * H = 0 := by
      rw [mul_assoc]
      exact (smul_eq_zero.mp key).resolve_left (mul_ne_zero hc hc)
    refine ⟨hDEH, fun _ ⟨hDu, hEu, hHu⟩ => ?_⟩
    exact ((hDu.mul hEu).mul hHu).ne_zero hDEH
  · intro ħ
    let N : Matrix (Fin 2) (Fin 2) ℂ := !![0, 1; 0, 0]
    have hNN : N * N = 0 := by
      ext i j
      fin_cases i <;> fin_cases j <;> simp [N, Matrix.mul_apply, Fin.sum_univ_two]
    have hN : N ≠ 0 := by
      intro h
      have := congrFun (congrFun h 0) 1
      simp [N] at this
    refine ⟨N, N, N, N, hN, hN, hN, hN, ?_⟩
    simp [hNN]

/-! ## L:RZ-82a -/

/-- The symmetric traceless real 2 × 2 matrices (the paper's 𝔭 for SL(2, ℝ), §13.4): Xᵀ = X
(`selfAdjointMatricesSubmodule 1`) and trace X = 0. Local definition of L:RZ-82a; a submodule of
the matrix space, not the operator algebra (Q7). -/
def symmTraceless2 : Submodule ℝ (Matrix (Fin 2) (Fin 2) ℝ) :=
  selfAdjointMatricesSubmodule (1 : Matrix (Fin 2) (Fin 2) ℝ) ⊓
    LinearMap.ker (Matrix.traceLinearMap (Fin 2) ℝ ℝ)

-- mathlib's own convention (`Mathlib.Algebra.Lie.Classical`): the matrix Lie ring is the
-- commutator ring `LieRing.ofAssociativeRing`, a local instance at the pin.
attribute [local instance 100] LieRing.ofAssociativeRing in
/-- **L:RZ-82a** (split leg of L:RZ-82; the SL(2, ℝ) instance, keeps the ledger figure) — with
𝔨 = 𝔰𝔬(2) (skew-symmetric) and 𝔭 the symmetric traceless matrices: 𝔰𝔩(2, ℝ) = 𝔨 ⊕ 𝔭; the
inclusions (13.6) [𝔨, 𝔨] ⊂ 𝔨, [𝔨, 𝔭] ⊂ 𝔭, [𝔭, 𝔭] ⊂ 𝔨 element-wise for the matrix commutator
(kept as ⊂, as printed); dim 𝔰𝔩(2, ℝ) = 3 and dim 𝔭 = 2.

Served locus: §13.4, display (13.6), PDF p32 (printed folio 31); the SL(2, ℝ) sentences and the
dimension sentence, PDF p33 (printed folio 32). PDF sha256 prefix `2d5287e7`. -/
theorem rz_82a_cartan_sl2 :
    let 𝔨 := (LieAlgebra.Orthogonal.so (Fin 2) ℝ).toSubmodule
    let 𝔭 := symmTraceless2
    let 𝔰𝔩 := (LieAlgebra.SpecialLinear.sl (Fin 2) ℝ).toSubmodule
    (𝔨 ⊔ 𝔭 = 𝔰𝔩 ∧ 𝔨 ⊓ 𝔭 = ⊥) ∧
    (∀ X ∈ 𝔨, ∀ Y ∈ 𝔨, X * Y - Y * X ∈ 𝔨) ∧
    (∀ X ∈ 𝔨, ∀ Y ∈ 𝔭, X * Y - Y * X ∈ 𝔭) ∧
    (∀ X ∈ 𝔭, ∀ Y ∈ 𝔭, X * Y - Y * X ∈ 𝔨) ∧
    Module.finrank ℝ 𝔰𝔩 = 3 ∧ Module.finrank ℝ 𝔭 = 2 := by
  intro 𝔨 𝔭 𝔰𝔩
  have hk : ∀ X, X ∈ 𝔨 ↔ X.transpose = -X := fun X => by
    simp only [𝔨, LieSubalgebra.mem_toSubmodule, LieAlgebra.Orthogonal.mem_so]
  have hp : ∀ X, X ∈ 𝔭 ↔ X.transpose = X ∧ X.trace = 0 := fun X => by
    simp [𝔭, symmTraceless2, Matrix.IsSelfAdjoint, Matrix.IsAdjointPair]
  have hsl : ∀ X, X ∈ 𝔰𝔩 ↔ X.trace = 0 := fun X => Iff.rfl
  have hskew_tr : ∀ X : Matrix (Fin 2) (Fin 2) ℝ, X.transpose = -X → X.trace = 0 := by
    intro X h
    have h1 := Matrix.trace_transpose X
    rw [h, Matrix.trace_neg] at h1
    linarith
  have hcomm_tr : ∀ X Y : Matrix (Fin 2) (Fin 2) ℝ, (X * Y - Y * X).trace = 0 := by
    intro X Y
    rw [Matrix.trace_sub, Matrix.trace_mul_comm, sub_self]
  refine ⟨⟨?_, ?_⟩, ?_, ?_, ?_, ?_, ?_⟩
  · -- 𝔨 ⊔ 𝔭 = 𝔰𝔩
    apply le_antisymm
    · refine sup_le (fun X hX => ?_) (fun X hX => ?_)
      · exact (hsl X).mpr (hskew_tr X ((hk X).mp hX))
      · exact (hsl X).mpr ((hp X).mp hX).2
    · intro X hX
      have htr := (hsl X).mp hX
      rw [Submodule.mem_sup]
      refine ⟨(1 / 2 : ℝ) • (X - X.transpose), (hk _).mpr ?_,
        (1 / 2 : ℝ) • (X + X.transpose), (hp _).mpr ⟨?_, ?_⟩, ?_⟩
      · rw [Matrix.transpose_smul, Matrix.transpose_sub, Matrix.transpose_transpose]
        module
      · rw [Matrix.transpose_smul, Matrix.transpose_add, Matrix.transpose_transpose, add_comm]
      · rw [Matrix.trace_smul, Matrix.trace_add, Matrix.trace_transpose, htr]
        simp
      · module
  · -- 𝔨 ⊓ 𝔭 = ⊥
    rw [Submodule.eq_bot_iff]
    intro X hX
    rw [Submodule.mem_inf] at hX
    have h1 := (hk X).mp hX.1
    have h2 := ((hp X).mp hX.2).1
    rw [h2] at h1
    have : (2 : ℝ) • X = 0 := by rw [two_smul]; nth_rewrite 1 [h1]; exact neg_add_cancel X
    exact (smul_eq_zero.mp this).resolve_left two_ne_zero
  · -- [𝔨, 𝔨] ⊂ 𝔨
    intro X hX Y hY
    rw [hk] at hX hY ⊢
    rw [Matrix.transpose_sub, Matrix.transpose_mul, Matrix.transpose_mul, hX, hY]
    noncomm_ring
  · -- [𝔨, 𝔭] ⊂ 𝔭
    intro X hX Y hY
    rw [hk] at hX
    rw [hp] at hY ⊢
    refine ⟨?_, hcomm_tr X Y⟩
    rw [Matrix.transpose_sub, Matrix.transpose_mul, Matrix.transpose_mul, hX, hY.1]
    noncomm_ring
  · -- [𝔭, 𝔭] ⊂ 𝔨
    intro X hX Y hY
    rw [hp] at hX hY
    rw [hk]
    rw [Matrix.transpose_sub, Matrix.transpose_mul, Matrix.transpose_mul, hX.1, hY.1]
    noncomm_ring
  · -- dim 𝔰𝔩(2, ℝ) = 3: the basis E₁₁ − E₂₂, E₁₂, E₂₁ through coordinates (X₀₀, X₀₁, X₁₀)
    let e : 𝔰𝔩 ≃ₗ[ℝ] (Fin 3 → ℝ) :=
      { toFun := fun X => ![X.1 0 0, X.1 0 1, X.1 1 0]
        invFun := fun v =>
          ⟨!![v 0, v 1; v 2, -v 0], (hsl _).mpr (by simp [Matrix.trace_fin_two])⟩
        map_add' := fun X Y => by ext i; fin_cases i <;> rfl
        map_smul' := fun r X => by ext i; fin_cases i <;> rfl
        left_inv := fun X => by
          have htr := (hsl X.1).mp X.2
          rw [Matrix.trace_fin_two] at htr
          apply Subtype.ext
          ext i j
          fin_cases i <;> fin_cases j <;> simp
          linarith
        right_inv := fun v => by ext i; fin_cases i <;> rfl }
    rw [Module.finrank_eq_card_basis (Module.Basis.ofEquivFun e), Fintype.card_fin]
  · -- dim 𝔭 = 2: the basis E₁₁ − E₂₂, E₁₂ + E₂₁ through coordinates (X₀₀, X₀₁)
    let e : 𝔭 ≃ₗ[ℝ] (Fin 2 → ℝ) :=
      { toFun := fun X => ![X.1 0 0, X.1 0 1]
        invFun := fun v => ⟨!![v 0, v 1; v 1, -v 0], (hp _).mpr ⟨by
            ext i j; fin_cases i <;> fin_cases j <;> rfl, by simp [Matrix.trace_fin_two]⟩⟩
        map_add' := fun X Y => by ext i; fin_cases i <;> rfl
        map_smul' := fun r X => by ext i; fin_cases i <;> rfl
        left_inv := fun X => by
          obtain ⟨hT, htr⟩ := (hp X.1).mp X.2
          rw [Matrix.trace_fin_two] at htr
          have h10 : X.1 1 0 = X.1 0 1 := by
            have := congrFun (congrFun hT 0) 1
            simpa using this
          apply Subtype.ext
          ext i j
          fin_cases i <;> fin_cases j <;> simp [h10]
          linarith
        right_inv := fun v => by ext i; fin_cases i <;> rfl }
    rw [Module.finrank_eq_card_basis (Module.Basis.ofEquivFun e), Fintype.card_fin]

end RiemannZeta.NoGo
