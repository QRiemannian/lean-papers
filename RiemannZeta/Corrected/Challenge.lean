import Mathlib

/-!
# Unit U11 (`RiemannZeta/Corrected`) — statements

Statements of the two corrected legs of the paper *The Tetrahedral Structure of the Riemann Zeta
Function* (QRiemannian Research, April 2026, revised October 2026): L:RZ-33b (CC-15, §5.4) and
L:RZ-41b (CC-16, §7.1). Served PDF sha256
`2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54` (prefix `2d5287e7`).
PDF page indices count the cover as p01. Each theorem states one row leg of the claim ledger,
from its spec `specs/<ROW>.md` (signed `V1-GREEN`, read against the correction draft); every
proof here is `sorry`. The proofs live in `RiemannZeta/Corrected/Solution.lean`.

**These legs formalize the corrected edition, which is not yet served.** The specs were read
against the correction draft (sha256 prefix `1b2af75c` at the M read; pass 2 is `8346ab41`);
the corrected edition's republish waits on the wall's read of CORRECTION-WAVE-2026-10-28, and
so does the flip of both rows. Until then the rows stay STATED and uncounted; at the republish
the corrected edition's sha256 replaces `2d5287e7` in the docstrings.

Rows: L:RZ-33b (`specs/RZ-33b.md`, the M-amend section), L:RZ-41b (`specs/RZ-41b.md`, the
"M — the corrected claim" section). Their siblings stay frozen where they are: L:RZ-33a in U3
(`RiemannZeta/ZetaL/Challenge.lean`), L:RZ-41a and L:RZ-41c in U4
(`RiemannZeta/MatricesMobius/Challenge.lean`).

Conventions: as U4 for L:RZ-41b — the types of a 2×2 matrix are mathlib's discriminant
predicates `Matrix.IsHyperbolic` / `Matrix.IsParabolic` / `Matrix.IsElliptic`, SL(2, ℤ) acts on
ℍ through `Matrix.SpecialLinearGroup.mapGL ℝ`, and ∂ℍ = `OnePoint ℝ` with GL(2, ℝ) acting by
Möbius maps; nothing is restated from U4. The unit restates one definition, `zetaChi`,
byte-identically from U3 (the U10 decision-2 pattern); it imports no other unit.
-/

open scoped MatrixGroups
open UpperHalfPlane

namespace RiemannZeta.Corrected

/-! ## Shared definition (restated) -/

-- Restated byte-identically from U3 (`RiemannZeta/ZetaL/Challenge.lean`); the corrected
-- edition prints this χ beside (5.2) (correction draft `1b2af75c`, p14).
/-- The standard factor of the asymmetric functional equation,
χ(s) = 2^s π^(s−1) sin(πs/2) Γ(1−s). Supplied by the spec: the served text prints χ(s) in (5.2)
without defining it (L:RZ-33a §3; V₁ ruling: definite enough — χ = ζ(s)/ζ(1−s) is forced). -/
noncomputable def zetaChi (s : ℂ) : ℂ :=
  2 ^ s * (Real.pi : ℂ) ^ (s - 1) * Complex.sin (Real.pi * s / 2) * Complex.Gamma (1 - s)

/-! ## L:RZ-33b -/

/-- **L:RZ-33b** — RZ §5.4, as corrected (CC-15): "The functional equation ζ(s) = χ(s) ζ(1 − s),
χ(s) = 2^s π^(s−1) sin(πs/2) Γ(1 − s), (5.2) has reflection symmetry s ↔ 1 − s with fixed point
s = 1/2 [CV] … Together with ζ(s̄) = conj ζ(s) it makes the non-trivial zeros symmetric about the
line Re(s) = 1/2, the line fixed by s ↦ 1 − s̄ [CV]." (0) off ℤ, χ(s)χ(1 − s) = 1 and (5.2) holds
at s and at 1 − s, so s ↦ 1 − s carries the equation to itself; (i) s ↦ 1 − s is an involution
with fixed-point set {1/2}; (ii) s ↦ 1 − s̄ fixes exactly the line Re s = 1/2 and maps non-trivial
zeros (ρ ≠ −2, −4, …) to non-trivial zeros. The full zero set is NOT symmetric (−2n ↦ 1 + 2n).

Served locus: §5.4, display (5.2) and the clause after it, PDF p14 (printed folio 13). PDF sha256
prefix `2d5287e7` (the edition served). The leg formalizes the corrected edition (correction
draft `1b2af75c` at the M read; pass 2 is `8346ab41`), whose republish waits on the wall's
read. -/
theorem rz_33b_reflection_fixed_point :
    (∀ s : ℂ, (∀ n : ℤ, s ≠ n) →
      zetaChi s * zetaChi (1 - s) = 1 ∧
      riemannZeta s = zetaChi s * riemannZeta (1 - s) ∧
      riemannZeta (1 - s) = zetaChi (1 - s) * riemannZeta s) ∧
    Function.Involutive (fun s : ℂ ↦ 1 - s) ∧
    Function.fixedPoints (fun s : ℂ ↦ 1 - s) = {1 / 2} ∧
    Function.fixedPoints (fun s : ℂ ↦ 1 - starRingEnd ℂ s) = {s : ℂ | s.re = 1 / 2} ∧
    ∀ ρ : ℂ, riemannZeta ρ = 0 → (∀ n : ℕ, ρ ≠ -2 * (n + 1)) →
      riemannZeta (1 - starRingEnd ℂ ρ) = 0 ∧ ∀ n : ℕ, 1 - starRingEnd ℂ ρ ≠ -2 * (n + 1) := by
  sorry

/-! ## L:RZ-41b -/

/-- **L:RZ-41b** — RZ §7.1, as corrected (CC-16): "its elements other than ±I classify into three
types by fixed-point behavior", and the Parabolic row "|tr(γ)| = 2, γ ≠ ±I — Fixes a single
boundary point (cusp)". For γ ∈ SL(2, ℤ), γ ≠ ±I: exactly one of hyperbolic / parabolic /
elliptic holds, read by trace (|tr| > 2 / = 2 / < 2); parabolicity is a conjugacy-class
property; a parabolic γ fixes no point of ℍ and exactly one point of ℝ ∪ {∞}, a cusp (∞ or
rational).

Served locus: §7.1 "The key identification", the sentence introducing the table and its
Parabolic row, PDF p17–18 (printed folios 16–17; the correction draft breaks the table onto
p18). PDF sha256 prefix `2d5287e7` (the edition served). The leg formalizes the corrected
edition (correction draft `1b2af75c` at the M read; pass 2 is `8346ab41`), whose republish waits
on the wall's read. -/
theorem rz_41b_noncentral_trichotomy (γ : SL(2, ℤ)) (h₁ : γ ≠ 1) (h₂ : γ ≠ -1) :
    let m : Matrix (Fin 2) (Fin 2) ℤ := γ
    let g : GL (Fin 2) ℝ := Matrix.SpecialLinearGroup.mapGL ℝ γ
    (m.IsHyperbolic ∨ m.IsParabolic ∨ m.IsElliptic) ∧
    ¬ (m.IsHyperbolic ∧ m.IsParabolic) ∧ ¬ (m.IsHyperbolic ∧ m.IsElliptic) ∧
    ¬ (m.IsParabolic ∧ m.IsElliptic) ∧
    (m.IsHyperbolic ↔ 2 < |m.trace|) ∧ (m.IsParabolic ↔ |m.trace| = 2) ∧
    (m.IsElliptic ↔ |m.trace| < 2) ∧
    (∀ h : SL(2, ℤ),
       (((h * γ * h⁻¹ : SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ).IsParabolic ↔ m.IsParabolic)) ∧
    (m.IsParabolic →
       (∀ z : ℍ, γ • z ≠ z) ∧
       ∃ c : OnePoint ℝ, (c = OnePoint.infty ∨ ∃ q : ℚ, c = ((q : ℝ) : OnePoint ℝ)) ∧
         ∀ c' : OnePoint ℝ, g • c' = c' ↔ c' = c) := by
  sorry

end RiemannZeta.Corrected
