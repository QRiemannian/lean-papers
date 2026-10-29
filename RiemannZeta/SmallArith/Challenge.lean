import Mathlib

/-!
# Unit U7 (`RiemannZeta/SmallArith`) — statements

Statements of the rows of unit U7 of the paper *The Tetrahedral Structure of the Riemann Zeta
Function* (QRiemannian Research, April 2026, revised October 2026), served PDF sha256
`2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54` (prefix `2d5287e7`).
PDF page indices count the cover as p01. Each theorem states one row of the claim ledger, from
its spec `specs/<ROW>.md` (signed `V1-GREEN` / `V1-SPLIT-OK`); every proof here is `sorry`.
The proofs live in `RiemannZeta/SmallArith/Solution.lean`.

Rows: L:RZ-24, L:RZ-38, L:RZ-44a, L:RZ-76a, L:RZ-77a. L:RZ-76b is NOT A LEAN TARGET (no
theorem); L:RZ-77b is OUT-OF-Q5 and NEEDS-DEVELOPMENT (no Casimir element, no principal-series
representation at the pin) and carries no statement.
-/

namespace RiemannZeta.SmallArith

/-! ## Local definitions -/

/-- The Bernoulli generating function t/(eᵗ − 1) on ℝ, with its removable value 1 at t = 0. -/
noncomputable def bernoulliGF (t : ℝ) : ℝ := if t = 0 then 1 else t / (Real.exp t - 1)

/-- The orbifold Euler characteristic of a 2-orbifold of genus `g` with cone points of orders
`cones` and `n` cusps: 2 − 2g − Σ (1 − 1/m) − n (standard convention; RZ §7.2 uses it without
the formula). -/
def orbEulerChar (g : ℕ) (cones : List ℕ) (n : ℕ) : ℚ :=
  2 - 2 * g - (cones.map fun m : ℕ => 1 - 1 / (m : ℚ)).sum - n

/-- The paper's ξ(s) = ½ s(s−1) Λ(s) (RZ §7.4, (12.4)); mathlib has no ξ at the pin.
Restated identically to unit U3's `RiemannZeta.ZetaL.riemannXiRZ` (units do not import each
other); L:RZ-76a names its prefactor s(s − 1)/2 — the theorem states that prefactor as the
polynomial the spec writes, so this definition is the name only.

Note (V₁, non-blocking, from L:RZ-46a): this local form equals the paper's entire ξ only off
{0, 1} (here it takes the value 0 at s = 0, 1, while ξ(0) = ξ(1) = 1/2). -/
noncomputable def riemannXiRZ (s : ℂ) : ℂ := s * (s - 1) / 2 * completedRiemannZeta s

/-! ## L:RZ-24 -/

/-- L:RZ-24 · RZ §4.2, Proposition 4.1, (4.2), served p11 (corrected print, CC-1 landed).
The Bernoulli generating function satisfies f(−t) − f(t) = t; f + t/2 is even; the same symmetry
holds for the formal generating function `bernoulliPowerSeries` (convention `bernoulli`, B₁ = −1/2);
and the symmetry kills every odd coefficient beyond the first.

Served locus: §4.2, Proposition 4.1, display (4.2), PDF p11 (printed folio 10).
PDF sha256 prefix `2d5287e7`. -/
theorem rz_24_bernoulli_gf_symmetry :
    (∀ t : ℝ, bernoulliGF (-t) - bernoulliGF t = t) ∧
    Function.Even (fun t : ℝ => bernoulliGF t + t / 2) ∧
    PowerSeries.evalNegHom (bernoulliPowerSeries ℚ) - bernoulliPowerSeries ℚ = PowerSeries.X ∧
    (∀ Q : PowerSeries ℚ, PowerSeries.evalNegHom Q - Q = PowerSeries.X →
      ∀ n : ℕ, Odd n → 1 < n → PowerSeries.coeff n Q = 0) := by
  sorry

/-! ## L:RZ-38 -/

/-- L:RZ-38 · RZ §6.1, (6.4), served p15. For H_cl = xp, with Hamilton's equations
ẋ = ∂H/∂p, ṗ = −∂H/∂x: the classical trajectories are x(t) = x₀eᵗ, p(t) = p₀e^{−t};
they lie on the level hyperbola xp = x₀p₀, and (away from the fixed point at the origin)
never return.

Served locus: §6.1 "The program and its central obstruction", display (6.4), PDF p15 (printed
folio 14). PDF sha256 prefix `2d5287e7`. -/
theorem rz_38_xp_trajectories :
    (∀ x p : ℝ, HasDerivAt (fun q => x * q) x p ∧ HasDerivAt (fun y => y * p) p x) ∧
    ∀ x₀ p₀ : ℝ,
      -- (a) (6.4) solves ẋ = x, ṗ = −p with initial point (x₀, p₀)
      ((x₀ * Real.exp 0 = x₀ ∧ p₀ * Real.exp (-0) = p₀) ∧
       ∀ t : ℝ, HasDerivAt (fun s => x₀ * Real.exp s) (x₀ * Real.exp t) t ∧
                HasDerivAt (fun s => p₀ * Real.exp (-s)) (-(p₀ * Real.exp (-t))) t) ∧
      -- (b) and is the only solution with that initial point
      (∀ x p : ℝ → ℝ, (∀ t, HasDerivAt x (x t) t) → (∀ t, HasDerivAt p (-(p t)) t) →
         x 0 = x₀ → p 0 = p₀ →
         ∀ t, x t = x₀ * Real.exp t ∧ p t = p₀ * Real.exp (-t)) ∧
      -- (c) "hyperbolic": the trajectory stays on the level set xp = x₀p₀
      (∀ t : ℝ, (x₀ * Real.exp t) * (p₀ * Real.exp (-t)) = x₀ * p₀) ∧
      -- (d) "they never return"
      ((x₀, p₀) ≠ (0, 0) →
         Function.Injective (fun t : ℝ => (x₀ * Real.exp t, p₀ * Real.exp (-t)))) := by
  sorry

/-! ## L:RZ-44a -/

/-- L:RZ-44a · RZ §7.2 "Parabolic → Dimensional", served p18. For genus 0, cone orders (2, 3)
and one cusp: χ_orb = −1/6; filling the cusp with a smooth point gives +5/6 > 0; filling it with
a cone point of order m ≥ 7 gives a negative χ_orb.

Served locus: §7.2 "Verification of the mapping", paragraph "Parabolic → Dimensional",
sentences 3–5, PDF p18 (printed folio 17); no equation tag. PDF sha256 prefix `2d5287e7`. -/
theorem rz_44a_orbifold_euler_arith :
    orbEulerChar 0 [2, 3] 1 = -1 / 6 ∧
    orbEulerChar 0 [2, 3] 0 = 5 / 6 ∧ (0 : ℚ) < 5 / 6 ∧
    ∀ m : ℕ, 7 ≤ m → orbEulerChar 0 [2, 3, m] 0 < 0 := by
  sorry

/-! ## L:RZ-76a -/

open Real in
/-- L:RZ-76a · RZ §12.2–12.3, (12.2)–(12.6), served p29: the arithmetic of the decomposition
7/8 = 1 − 1/8 and of the three appearances of 1/8 (Path A −π/8 → −1/8, Path B −1/8,
Path C +1/8). The prefactor in Path B is that of `riemannXiRZ` (L:RZ-46a).

Served locus: §12.2 "Decomposition of 7/8", display (12.2); §12.3 "Three appearances of 1/8",
displays (12.3)–(12.6), PDF p29 (printed folio 28). PDF sha256 prefix `2d5287e7`.
L:RZ-76b (the roles of the three paths) is NOT A LEAN TARGET and carries no statement. -/
theorem rz_76a_seven_eighths_arith :
    (7 / 8 : ℚ) = 1 - 1 / 8 ∧
    ((1 / 4 - 1 / 2) * (π / 2) = -π / 8 ∧ (-π / 8) / π = -1 / 8) ∧
    ((fun s : ℂ => s * (s - 1) / 2) (1 / 2) = (1 / 2) * (-1 / 2) / 2 ∧
       (1 / 2 : ℂ) * (-1 / 2) / 2 = -1 / 8) ∧
    1 / (4 * 2 * Real.sin (π / 2)) = 1 / 8 := by
  sorry

/-! ## L:RZ-77a -/

/-- L:RZ-77a · RZ §12.4, (12.7)–(12.9) and the table, served p30: σ(1 − σ)/2 at 1/2 is 1/8, it is
half of s(1 − s), whose value at 1/2 is 1/4; the table's Maslov values 0, 1/8, 0 at σ = 0, 1/2, 1;
and σ(1 − σ)/2 is maximized at σ = 1/2.

Served locus: §12.4 "The Casimir connection", displays (12.7)–(12.9), the spin/Maslov table and
the sentence after it, PDF p30 (printed folio 29). PDF sha256 prefix `2d5287e7`.
L:RZ-77b (s(1 − s) as the Casimir eigenvalue on the principal series) is OUT-OF-Q5 and
NEEDS-DEVELOPMENT and carries no statement. -/
theorem rz_77a_casimir_arith :
    let M : ℝ → ℝ := fun σ => σ * (1 - σ) / 2
    let lam : ℝ → ℝ := fun s => s * (1 - s)
    M (1 / 2) = 1 / 8 ∧
    (∀ σ, M σ = lam σ / 2) ∧
    (lam (1 / 2) = 1 / 4 ∧ lam (1 / 2) / 2 = 1 / 8) ∧
    (M 0 = 0 ∧ M 1 = 0) ∧
    IsMaxOn M Set.univ (1 / 2) := by
  sorry

end RiemannZeta.SmallArith
