import Mathlib

/-!
# Unit U14 (`RiemannZeta/CorrectedReflections`) — statements

Statements of the corrected leg L:RZ-N2b of the paper *The Tetrahedral Structure of the Riemann
Zeta Function* (QRiemannian Research, April 2026, revised October 2026): the reflection clause
of §3, corrected as CC-13. Served PDF sha256
`6b89ce0e7ae0a71301a8d792b6e80f4cb850244df83f4731810377d70e3d2d12` (prefix `6b89ce0e`), the
corrected edition, served 2026-10-29. PDF page indices count the cover as p01. Each theorem
states one clause of the leg, from its spec `specs/RZ-N2b.md` (the section "M spec against the
corrected text (2026-10-29)", signed `V1-GREEN`); every proof here is `sorry`. The proofs live
in `RiemannZeta/CorrectedReflections/Solution.lean`.

Row: L:RZ-N2b, leg of L:RZ-N2. Siblings: L:RZ-N2a in U12 (`RiemannZeta/Accepted/Challenge.lean`,
`rz_N2a_rotation_invariant`); L:RZ-N2c is not a target.

Q7: the operator algebra is never a `structure` or `class`; Ê, Ŝ, Ĥ, D̂ are elements of an
arbitrary ring that is a ℂ-algebra, and the relations (3.2)–(3.5) appear only inline. The
anti-automorphism is read through mathlib's opposite ring `Aᵐᵒᵖ`. The unit defines nothing and
imports no other unit.
-/

namespace RiemannZeta.CorrectedReflections

universe u

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
  sorry

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
  sorry

end RiemannZeta.CorrectedReflections
