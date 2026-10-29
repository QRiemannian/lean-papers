import Mathlib

/-!
# Unit U14 (`RiemannZeta/CorrectedReflections`) — proofs

The Solution module of unit U14 (the corrected leg L:RZ-N2b of the paper *The Tetrahedral
Structure of the Riemann Zeta Function*, QRiemannian Research, April 2026, revised October 2026:
the reflection clause of §3, as corrected (CC-13)), served PDF sha256
`6b89ce0e7ae0a71301a8d792b6e80f4cb850244df83f4731810377d70e3d2d12` (prefix `6b89ce0e`, the
corrected edition). This module does NOT import `RiemannZeta.CorrectedReflections.Challenge`: it
imports `Mathlib` only, opens the same namespace, declares the same `universe u`, and proves each
theorem under its Challenge name and statement text (Challenge sha256 `b6fb5ea6…`, signed by V₂).
The unit defines nothing, so nothing is restated. The helper `aux_flip` sits in `section Aux`
and enters no statement.

Row: L:RZ-N2b (`specs/RZ-N2b.md`, the section "M spec against the corrected text (2026-10-29)").

**Routes.** (i): `MulOpposite.op_mul`, `op_sub`, `op_smul` folded backwards and `op_inj` turn
each Aᵐᵒᵖ relation into its anti-image in A, which is literally one of (3.2)–(3.5) (the spec's
§3 table); each iff is then a permutation of a conjunction (`tauto`). (ii)(a): `aux_flip`
(X Y − Y X = (−c) • Z W ⟺ Y X − X Y = c • Z W, by `neg_sub`, `neg_smul`, `neg_inj`) rewrites
the sign-and-order-reversed set into relations of the same shape as the reflected ones, and each
iff is again a permutation (`tauto`). (ii)(b): τ = (ħ + √(ħ² + 4))/2 with τ² = ħτ + 1
(`Real.sq_sqrt`); the witness E = diag(−τ², −1), S = e₂₁, H = diag(1, τ²), D = iτ e₂₁ (the
transpose of a model of (3.2)–(3.5)); the four relations entrywise, the one live entry (1, 0)
closed by `linear_combination` with τ² = ħτ + 1 and i² = −1; the sign-only (3.2) at entry (1, 0)
reads τ² − 1 = ħτ³, which with τ² − 1 = ħτ gives (ħτ)² = 0 against ħ ≠ 0, τ ≠ 0.
-/

namespace RiemannZeta.CorrectedReflections

universe u

/-! ## Helpers -/

section Aux

theorem aux_flip {A : Type*} [Ring A] [Algebra ℂ A] (X Y Z W : A) (c : ℂ) :
    (X * Y - Y * X = (-c) • (Z * W)) ↔ (Y * X - X * Y = c • (Z * W)) := by
  rw [neg_smul, ← neg_sub (Y * X) (X * Y), neg_inj]

end Aux

/-! ## L:RZ-N2b (i) — the reflections as anti-automorphisms -/

open MulOpposite in
/-- **L:RZ-N2b (i)** — RZ §3, the parenthesis after (3.5), as corrected (CC-13): "the reflections
of the 4-cycle, acting as anti-automorphisms — reversing the order of products — carry the four
relations to one another". For each of the four reflections σ of the square Ê–Ŝ–Ĥ–D̂ (the two
vertex reflections Ŝ ↔ D̂ and Ê ↔ Ĥ, the two edge reflections Ê ↔ Ŝ, Ĥ ↔ D̂ and Ŝ ↔ Ĥ, D̂ ↔ Ê),
in any ring A that is a ℂ-algebra: the relations (3.2)–(3.5) hold at (Ê, Ŝ, Ĥ, D̂) exactly when
they hold in the opposite ring Aᵐᵒᵖ (where op x * op y = op (y * x)) at the op of the reflected
tuple — the anti-automorphism extending σ, read as a homomorphism into Aᵐᵒᵖ. Unfolded, each
anti-image is a relation of the set itself, with no sign change. Relations inline only (Q7).

Served locus: §3, the sentence after display (3.5), PDF p09–p10 (printed folios 8–9); relations
(3.2)–(3.5) on PDF p09. PDF sha256 prefix `6b89ce0e` (the corrected edition, served 2026-10-29). -/
theorem rz_N2b_reflections_anti_automorphism {A : Type*} [Ring A] [Algebra ℂ A]
    (E S H D : A) (ħ : ℝ) :
    -- the vertex reflection fixing Ê, Ĥ (Ŝ ↔ D̂)
    ((E * S - S * E = (Complex.I * (ħ : ℂ)) • (H * D) ∧   -- (3.2)
      S * H - H * S = (Complex.I * (ħ : ℂ)) • (D * E) ∧   -- (3.3)
      H * D - D * H = (Complex.I * (ħ : ℂ)) • (E * S) ∧   -- (3.4)
      D * E - E * D = (Complex.I * (ħ : ℂ)) • (S * H))   -- (3.5)
      ↔
     (op E * op D - op D * op E = (Complex.I * (ħ : ℂ)) • (op H * op S) ∧   -- (3.2) in Aᵐᵒᵖ
      op D * op H - op H * op D = (Complex.I * (ħ : ℂ)) • (op S * op E) ∧   -- (3.3) in Aᵐᵒᵖ
      op H * op S - op S * op H = (Complex.I * (ħ : ℂ)) • (op E * op D) ∧   -- (3.4) in Aᵐᵒᵖ
      op S * op E - op E * op S = (Complex.I * (ħ : ℂ)) • (op D * op H))) ∧   -- (3.5) in Aᵐᵒᵖ
    -- the vertex reflection fixing Ŝ, D̂ (Ê ↔ Ĥ)
    ((E * S - S * E = (Complex.I * (ħ : ℂ)) • (H * D) ∧   -- (3.2)
      S * H - H * S = (Complex.I * (ħ : ℂ)) • (D * E) ∧   -- (3.3)
      H * D - D * H = (Complex.I * (ħ : ℂ)) • (E * S) ∧   -- (3.4)
      D * E - E * D = (Complex.I * (ħ : ℂ)) • (S * H))   -- (3.5)
      ↔
     (op H * op S - op S * op H = (Complex.I * (ħ : ℂ)) • (op E * op D) ∧   -- (3.2) in Aᵐᵒᵖ
      op S * op E - op E * op S = (Complex.I * (ħ : ℂ)) • (op D * op H) ∧   -- (3.3) in Aᵐᵒᵖ
      op E * op D - op D * op E = (Complex.I * (ħ : ℂ)) • (op H * op S) ∧   -- (3.4) in Aᵐᵒᵖ
      op D * op H - op H * op D = (Complex.I * (ħ : ℂ)) • (op S * op E))) ∧   -- (3.5) in Aᵐᵒᵖ
    -- the edge reflection Ê ↔ Ŝ, Ĥ ↔ D̂
    ((E * S - S * E = (Complex.I * (ħ : ℂ)) • (H * D) ∧   -- (3.2)
      S * H - H * S = (Complex.I * (ħ : ℂ)) • (D * E) ∧   -- (3.3)
      H * D - D * H = (Complex.I * (ħ : ℂ)) • (E * S) ∧   -- (3.4)
      D * E - E * D = (Complex.I * (ħ : ℂ)) • (S * H))   -- (3.5)
      ↔
     (op S * op E - op E * op S = (Complex.I * (ħ : ℂ)) • (op D * op H) ∧   -- (3.2) in Aᵐᵒᵖ
      op E * op D - op D * op E = (Complex.I * (ħ : ℂ)) • (op H * op S) ∧   -- (3.3) in Aᵐᵒᵖ
      op D * op H - op H * op D = (Complex.I * (ħ : ℂ)) • (op S * op E) ∧   -- (3.4) in Aᵐᵒᵖ
      op H * op S - op S * op H = (Complex.I * (ħ : ℂ)) • (op E * op D))) ∧   -- (3.5) in Aᵐᵒᵖ
    -- the edge reflection Ŝ ↔ Ĥ, D̂ ↔ Ê
    ((E * S - S * E = (Complex.I * (ħ : ℂ)) • (H * D) ∧   -- (3.2)
      S * H - H * S = (Complex.I * (ħ : ℂ)) • (D * E) ∧   -- (3.3)
      H * D - D * H = (Complex.I * (ħ : ℂ)) • (E * S) ∧   -- (3.4)
      D * E - E * D = (Complex.I * (ħ : ℂ)) • (S * H))   -- (3.5)
      ↔
     (op D * op H - op H * op D = (Complex.I * (ħ : ℂ)) • (op S * op E) ∧   -- (3.2) in Aᵐᵒᵖ
      op H * op S - op S * op H = (Complex.I * (ħ : ℂ)) • (op E * op D) ∧   -- (3.3) in Aᵐᵒᵖ
      op S * op E - op E * op S = (Complex.I * (ħ : ℂ)) • (op D * op H) ∧   -- (3.4) in Aᵐᵒᵖ
      op E * op D - op D * op E = (Complex.I * (ħ : ℂ)) • (op H * op S))) := by   -- (3.5) in Aᵐᵒᵖ
  simp only [← MulOpposite.op_mul, ← MulOpposite.op_sub, ← MulOpposite.op_smul,
    MulOpposite.op_inj]
  refine ⟨?_, ?_, ?_, ?_⟩ <;> tauto

/-! ## L:RZ-N2b (ii) — the reflections as automorphisms -/

/-- **L:RZ-N2b (ii)** — RZ §3, the parenthesis after (3.5), as corrected (CC-13): "while as
automorphisms they reverse the commutators' sign only up to the order of the product".
(a) For each of the four reflections σ (as in (i)), in any ring A that is a ℂ-algebra: the
relations (3.2)–(3.5) hold at the reflected tuple — the images of the four relations under the
automorphism extending σ — exactly when the four relations hold at (Ê, Ŝ, Ĥ, D̂) with iℏ
replaced by −iℏ AND each right-hand product reversed (ĤD̂ → D̂Ĥ, D̂Ê → ÊD̂, ÊŜ → ŜÊ, ŜĤ → ĤŜ);
that set is (3.2)–(3.5) read in Aᵐᵒᵖ at the op of (Ê, Ŝ, Ĥ, D̂).
(b) "only up to the order": for every real ℏ ≠ 0, some 2 × 2 complex matrices satisfy the
sign-and-order-reversed set and fail the set with the sign reversed and the order kept — so,
with (a), for every reflection the reflected relations are not the sign-reversed relations.
Relations inline only (Q7); the witness is RZ-81 (b)'s matrix form.

Served locus: §3, the sentence after display (3.5), PDF p09–p10 (printed folios 8–9); relations
(3.2)–(3.5) on PDF p09. PDF sha256 prefix `6b89ce0e` (the corrected edition, served 2026-10-29). -/
theorem rz_N2b_reflections_sign_up_to_order :
    (∀ {A : Type u} [Ring A] [Algebra ℂ A] (E S H D : A) (ħ : ℝ),
      -- the vertex reflection fixing Ê, Ĥ (Ŝ ↔ D̂)
      ((E * D - D * E = (Complex.I * (ħ : ℂ)) • (H * S) ∧   -- (3.2) under it
        D * H - H * D = (Complex.I * (ħ : ℂ)) • (S * E) ∧   -- (3.3) under it
        H * S - S * H = (Complex.I * (ħ : ℂ)) • (E * D) ∧   -- (3.4) under it
        S * E - E * S = (Complex.I * (ħ : ℂ)) • (D * H))   -- (3.5) under it
        ↔
       (E * S - S * E = (-(Complex.I * (ħ : ℂ))) • (D * H) ∧   -- (3.2), sign and order reversed
        S * H - H * S = (-(Complex.I * (ħ : ℂ))) • (E * D) ∧   -- (3.3), sign and order reversed
        H * D - D * H = (-(Complex.I * (ħ : ℂ))) • (S * E) ∧   -- (3.4), sign and order reversed
        D * E - E * D = (-(Complex.I * (ħ : ℂ))) • (H * S))) ∧   -- (3.5), sign and order reversed
      -- the vertex reflection fixing Ŝ, D̂ (Ê ↔ Ĥ)
      ((H * S - S * H = (Complex.I * (ħ : ℂ)) • (E * D) ∧   -- (3.2) under it
        S * E - E * S = (Complex.I * (ħ : ℂ)) • (D * H) ∧   -- (3.3) under it
        E * D - D * E = (Complex.I * (ħ : ℂ)) • (H * S) ∧   -- (3.4) under it
        D * H - H * D = (Complex.I * (ħ : ℂ)) • (S * E))   -- (3.5) under it
        ↔
       (E * S - S * E = (-(Complex.I * (ħ : ℂ))) • (D * H) ∧   -- (3.2), sign and order reversed
        S * H - H * S = (-(Complex.I * (ħ : ℂ))) • (E * D) ∧   -- (3.3), sign and order reversed
        H * D - D * H = (-(Complex.I * (ħ : ℂ))) • (S * E) ∧   -- (3.4), sign and order reversed
        D * E - E * D = (-(Complex.I * (ħ : ℂ))) • (H * S))) ∧   -- (3.5), sign and order reversed
      -- the edge reflection Ê ↔ Ŝ, Ĥ ↔ D̂
      ((S * E - E * S = (Complex.I * (ħ : ℂ)) • (D * H) ∧   -- (3.2) under it
        E * D - D * E = (Complex.I * (ħ : ℂ)) • (H * S) ∧   -- (3.3) under it
        D * H - H * D = (Complex.I * (ħ : ℂ)) • (S * E) ∧   -- (3.4) under it
        H * S - S * H = (Complex.I * (ħ : ℂ)) • (E * D))   -- (3.5) under it
        ↔
       (E * S - S * E = (-(Complex.I * (ħ : ℂ))) • (D * H) ∧   -- (3.2), sign and order reversed
        S * H - H * S = (-(Complex.I * (ħ : ℂ))) • (E * D) ∧   -- (3.3), sign and order reversed
        H * D - D * H = (-(Complex.I * (ħ : ℂ))) • (S * E) ∧   -- (3.4), sign and order reversed
        D * E - E * D = (-(Complex.I * (ħ : ℂ))) • (H * S))) ∧   -- (3.5), sign and order reversed
      -- the edge reflection Ŝ ↔ Ĥ, D̂ ↔ Ê
      ((D * H - H * D = (Complex.I * (ħ : ℂ)) • (S * E) ∧   -- (3.2) under it
        H * S - S * H = (Complex.I * (ħ : ℂ)) • (E * D) ∧   -- (3.3) under it
        S * E - E * S = (Complex.I * (ħ : ℂ)) • (D * H) ∧   -- (3.4) under it
        E * D - D * E = (Complex.I * (ħ : ℂ)) • (H * S))   -- (3.5) under it
        ↔
       (E * S - S * E = (-(Complex.I * (ħ : ℂ))) • (D * H) ∧   -- (3.2), sign and order reversed
        S * H - H * S = (-(Complex.I * (ħ : ℂ))) • (E * D) ∧   -- (3.3), sign and order reversed
        H * D - D * H = (-(Complex.I * (ħ : ℂ))) • (S * E) ∧   -- (3.4), sign and order reversed
        D * E - E * D = (-(Complex.I * (ħ : ℂ))) • (H * S)))) ∧   -- (3.5), sign and order reversed
    (∀ ħ : ℝ, ħ ≠ 0 → ∃ E S H D : Matrix (Fin 2) (Fin 2) ℂ,
      (E * S - S * E = (-(Complex.I * (ħ : ℂ))) • (D * H) ∧   -- (3.2), sign and order reversed
       S * H - H * S = (-(Complex.I * (ħ : ℂ))) • (E * D) ∧   -- (3.3), sign and order reversed
       H * D - D * H = (-(Complex.I * (ħ : ℂ))) • (S * E) ∧   -- (3.4), sign and order reversed
       D * E - E * D = (-(Complex.I * (ħ : ℂ))) • (H * S)) ∧   -- (3.5), sign and order reversed
      ¬
       (E * S - S * E = (-(Complex.I * (ħ : ℂ))) • (H * D) ∧   -- (3.2), sign only reversed
        S * H - H * S = (-(Complex.I * (ħ : ℂ))) • (D * E) ∧   -- (3.3), sign only reversed
        H * D - D * H = (-(Complex.I * (ħ : ℂ))) • (E * S) ∧   -- (3.4), sign only reversed
        D * E - E * D = (-(Complex.I * (ħ : ℂ))) • (S * H))) := by   -- (3.5), sign only reversed
  refine ⟨?_, ?_⟩
  · intro A _ _ E S H D ħ
    simp only [aux_flip]
    refine ⟨?_, ?_, ?_, ?_⟩ <;> tauto
  · intro ħ hħ
    obtain ⟨τ, hτ⟩ : ∃ τ : ℝ, τ ^ 2 = ħ * τ + 1 := by
      refine ⟨(ħ + Real.sqrt (ħ ^ 2 + 4)) / 2, ?_⟩
      have hs : Real.sqrt (ħ ^ 2 + 4) ^ 2 = ħ ^ 2 + 4 := Real.sq_sqrt (by positivity)
      linear_combination hs / 4
    have hτ0 : τ ≠ 0 := by
      rintro rfl
      norm_num at hτ
    have hτC : (τ : ℂ) ^ 2 = (ħ : ℂ) * τ + 1 := by exact_mod_cast hτ
    refine ⟨!![-(τ : ℂ) ^ 2, 0; 0, -1], !![0, 0; 1, 0], !![1, 0; 0, (τ : ℂ) ^ 2],
      !![0, 0; Complex.I * τ, 0], ⟨?_, ?_, ?_, ?_⟩, ?_⟩
    · ext i j
      fin_cases i <;> fin_cases j <;> simp
      linear_combination hτC + (ħ : ℂ) * τ * Complex.I_sq
    · ext i j
      fin_cases i <;> fin_cases j <;> simp
      linear_combination -hτC - (ħ : ℂ) * τ * Complex.I_sq
    · ext i j
      fin_cases i <;> fin_cases j <;> simp
      linear_combination Complex.I * τ * hτC
    · ext i j
      fin_cases i <;> fin_cases j <;> simp
      linear_combination -Complex.I * τ * hτC
    · rintro ⟨h2, -, -, -⟩
      have h : -1 + (τ : ℂ) ^ 2 = -(Complex.I * ħ * ((τ : ℂ) ^ 2 * (Complex.I * τ))) := by
        simpa using congrFun (congrFun h2 1) 0
      have hsq : ((ħ : ℂ) * τ) ^ 2 = 0 := by
        linear_combination (1 - (ħ : ℂ) * τ) * hτC - h + (ħ : ℂ) * τ ^ 3 * Complex.I_sq
      have hne : ((ħ : ℂ) * τ) ≠ 0 := by
        rw [← Complex.ofReal_mul]
        exact_mod_cast mul_ne_zero hħ hτ0
      exact hne (pow_eq_zero_iff two_ne_zero |>.mp hsq)

end RiemannZeta.CorrectedReflections
