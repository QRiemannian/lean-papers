import Mathlib

/-!
# Unit U13 (`ModularSurface/Accepted`) — statements

Statements of the NEW rows of the paper *The Invariant Structure of the Modular Surface*
(QRiemannian Research, 2026, revised October 2026) that the wall ACCEPTED as Lean targets
(2026-10-28, night words, word 2), served PDF sha256
`b4841489ec6bea619f8d5525ce4c788b86e0109e51d6e9d2cb252690f5b13af5` (prefix `b4841489`).
PDF page indices count the cover as p01. Each theorem states one row of the claim ledger, from
its spec `specs/<ROW>.md` (signed `V1-GREEN`; L:MS-N5a's drift closed by declaration); every
proof here is `sorry`. The proofs live in `ModularSurface/Accepted/Solution.lean`.

Rows: L:MS-N2a (`ms_N2a_closedForm_vanishes`), L:MS-N3 (`ms_N3_phi_from_systole`),
L:MS-N5a (`ms_N5a_figure1_nodes`). L:MS-N5a is NEEDS-DEVELOPMENT by the wall's word: stated and
frozen, in T and uncounted, with its declared gap — the "further" of "the one further node",
ζ(1/2)·L(1/2, χ₅) ≠ 0, is not at the pin — carried under `statements_not_checked`.

The unit is self-contained (it imports no other unit): `fact_prime_five` and `chi5` are restated
byte-identically from unit U10's `RiemannZeta.LValue` (`RiemannZeta/LValue/Challenge.lean`
lines 26–28 and 30–35, docstrings included); `heckePeriodClosedForm` is new, from
`specs/MS-N2a.md` §5, and shared by L:MS-N2a and L:MS-N5a. L:MS-N3 takes L:MS-22's hypothesis
form (systole = 4 log φ) and uses no local definition.
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
  sorry

/-! ## L:MS-N3 -/

/-- L:MS-N3 — MS §3.1, after (3.5), served p09, and §3.2, served p11 (sha256 b4841489…):
"φ = exp(¼ · systole)" and "log φ = ¼ · systole", for a systole equal to 4 log φ (the value is
L:MS-06 = L:RZ-06b, EFFORT; a hypothesis here, as in L:MS-22).

Served locus: §3.1, the "φ from the systole" bullet, the sentence after display (3.5), PDF
p09 (printed folio 8); §3.2, PDF p11 (printed folio 10). PDF sha256 prefix `b4841489`. -/
theorem ms_N3_phi_from_systole (systole : ℝ) (h : systole = 4 * Real.log Real.goldenRatio) :
    Real.goldenRatio = Real.exp (systole / 4) ∧
    Real.log Real.goldenRatio = systole / 4 := by
  sorry

/-! ## L:MS-N5a -/

/-- L:MS-N5a — MS Figure 1 caption, served p19 (sha256 b4841489…): "Every zero of
ζ_ℚ(√5)(s) = ζ(s)L(s, χ5) is a node"; "the cross at t = 0 marks the one further node, where the
pole of ζ(2s) at s = 1/2 sends the period to zero". Nodes read as limits 0 of the closed form.

Served locus: §5.2, Figure 1 and its caption, PDF p19 (printed folio 18). PDF sha256 prefix
`b4841489`. NEEDS-DEVELOPMENT by the wall's word (stated and frozen, uncounted): the "further"
of "the one further node", ζ(1/2)·L(1/2, χ₅) ≠ 0, is not at the pin and is not claimed. -/
theorem ms_N5a_figure1_nodes :
    (∀ s : ℂ, s.re = 1 / 2 →
        riemannZeta s * DirichletCharacter.LFunction chi5 s = 0 →
        Filter.Tendsto heckePeriodClosedForm (nhdsWithin s {s}ᶜ) (nhds 0)) ∧
    Filter.Tendsto heckePeriodClosedForm (nhdsWithin (1 / 2 : ℂ) {(1 / 2 : ℂ)}ᶜ) (nhds 0) ∧
    (∀ t : ℝ, 0 < t → t ≤ 40 →
        Filter.Tendsto heckePeriodClosedForm
          (nhdsWithin (1 / 2 + (t : ℂ) * Complex.I) {1 / 2 + (t : ℂ) * Complex.I}ᶜ) (nhds 0) →
        riemannZeta (1 / 2 + (t : ℂ) * Complex.I) *
          DirichletCharacter.LFunction chi5 (1 / 2 + (t : ℂ) * Complex.I) = 0) := by
  sorry

end ModularSurface.Accepted
