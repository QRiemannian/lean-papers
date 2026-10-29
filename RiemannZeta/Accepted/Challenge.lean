import Mathlib

/-!
# Unit U12 (`RiemannZeta/Accepted`) — statements

Statements of the NEW rows of the paper *The Tetrahedral Structure of the Riemann Zeta Function*
(QRiemannian Research, April 2026, revised October 2026) that the wall accepted as Lean targets
on 2026-10-28 (night words, word 2), served PDF sha256
`2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54` (prefix `2d5287e7`).
PDF page indices count the cover as p01. Each theorem states one row of the claim ledger, from
its spec `specs/<ROW>.md` (signed `V1-GREEN`); every proof here is `sorry`. The proofs live in
`RiemannZeta/Accepted/Solution.lean`.

Rows: L:RZ-N1 (`specs/RZ-N1.md`), L:RZ-N2a (`specs/RZ-N2a.md`), L:RZ-N4b (`specs/RZ-N4b.md`).
L:RZ-N2a is built now, but its ROW (L:RZ-N2) enters T only after CC-13's correction lands: the
row's N2b leg (the reflection clause, = CC-13) is on the correction track and blocks it. The
other legs stay where the disposition sheet put them (`specs/_NEW-ROWS-2026-10-28.md`): N2b
CC-CANDIDATE, N2c NOT A TARGET pending the wall, N4a carried by U3's `rz_47_zero_gives_pole`,
N4c CITED.

Q7 (L:RZ-N2a): the operator algebra is never a `structure` or `class`; Ê, Ŝ, Ĥ, D̂ are elements
of an arbitrary ring that is a ℂ-algebra, and the relations (3.2)–(3.5) appear only inline, as
the two sides of an iff (U5's vocabulary).

The unit is self-contained (it imports no other unit): `scatteringRatio` is restated
byte-identically from U3 (`RiemannZeta/ZetaL/Challenge.lean`) and `ms13IsFundDisc`
byte-identically from U8 (`ModularSurface/Now/Challenge.lean`).
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
  sorry

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
  sorry

/-! ## L:RZ-N4b -/

/-- L:RZ-N4b — RZ §7.4, the sentence after (7.5), served p19 (sha256 2d5287e7…): "the line
Re(s) = 1/2 on which |φ| = 1", φ = `scatteringRatio` = Λ(2s − 1)/Λ(2s). The point s = 1/2 (a
removable singularity of φ; mathlib's Λ is junk at 0 and 1) is excluded.

Served locus: §7.4, the sentence after display (7.5), PDF p19 (printed folio 18). PDF sha256
prefix `2d5287e7`. -/
theorem rz_N4b_scatteringRatio_norm_one (s : ℂ) (hs : s.re = 1 / 2) (h₀ : s ≠ 1 / 2) :
    ‖scatteringRatio s‖ = 1 := by
  sorry

end RiemannZeta.Accepted
