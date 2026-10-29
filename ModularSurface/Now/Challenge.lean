import Mathlib

/-!
# Unit U8 (`ModularSurface/Now`) — statements

Statements of the rows of unit U8 of the paper *The Invariant Structure of the Modular Surface*
(QRiemannian Research, 2026, revised October 2026), served PDF sha256
`b4841489ec6bea619f8d5525ce4c788b86e0109e51d6e9d2cb252690f5b13af5` (prefix `b4841489`).
PDF page indices count the cover as p01. Each theorem states one row of the claim ledger, from
its spec `specs/<ROW>.md` (signed `V1-GREEN` / `V1-SPLIT-OK`); every proof here is `sorry`.
The proofs live in `ModularSurface/Now/Solution.lean`.

Rows in scope: L:MS-02, L:MS-03, L:MS-05, L:MS-07, L:MS-09a, L:MS-13, L:MS-14a, L:MS-22,
L:MS-24b, L:MS-25, L:MS-32a, L:MS-39. OUT-OF-Q5 (pending the wall), stated: L:MS-09b,
L:MS-14b, L:MS-14c, L:MS-32b. The eight shared rows (L:MS-04, 08, 12, 24, 28, 41, 42, 44) count
by their RZ twins and carry no statement here.

The unit is self-contained (it imports no RiemannZeta unit): `geometryConstant` is restated
identically to `RiemannZeta.ZetaL.geometryConstant`, and `RZ.gaussMap`, `RZ.mayer` identically
to `RiemannZeta.MatricesMobius.RZ.gaussMap`, `RiemannZeta.MatricesMobius.RZ.mayer`.
-/

namespace ModularSurface.Now

/-! ## Shared definitions -/

/-- The geometry constant g_c = 1/(√5·π). Restated identically to unit U3's
`RiemannZeta.ZetaL.geometryConstant` (spec L:RZ-15; units do not import each other). Used by
L:MS-24b and L:MS-25. -/
noncomputable def geometryConstant : ℝ := 1 / (Real.sqrt 5 * Real.pi)

/-- RZ (8.2): the Gauss map T(x) = {1/x} (Lean's 0⁻¹ = 0 gives T 0 = 0) (L:RZ-53a).
Restated identically to unit U4's `RiemannZeta.MatricesMobius.RZ.gaussMap`; used by L:MS-39. -/
noncomputable def RZ.gaussMap (x : ℝ) : ℝ := Int.fract x⁻¹

/-- RZ (8.3): ℒ_s f(x) = Σ_{n ≥ 1} (x + n)^{−2s} f(1/(x + n)) (as a `tsum`) (L:RZ-53a).
Restated identically to unit U4's `RiemannZeta.MatricesMobius.RZ.mayer`; used by L:MS-39 (MS
names the Mayer operator without printing its formula; V₁: the RZ (8.3) import is accepted). -/
noncomputable def RZ.mayer (s : ℂ) (f : ℝ → ℂ) (x : ℝ) : ℂ :=
  ∑' n : ℕ, (((x + (n + 1) : ℝ) : ℂ) ^ (-2 * s)) * f (1 / (x + (n + 1)))

/-! ## L:MS-02 -/

/-- 1/r on the (2,3,r) family, with the printed convention 1/∞ = 0. -/
noncomputable def ms02InvOrder (r : ℕ∞) : ℝ := if r = ⊤ then 0 else 1 / (r.toNat : ℝ)
/-- MS §2.1 p05: area of the (2,3,r) member, 2π(1/6 − 1/r) (as printed). -/
noncomputable def ms02Area (r : ℕ∞) : ℝ := 2 * Real.pi * (1 / 6 - ms02InvOrder r)
/-- χ_orb of the (2,3,r) sphere orbifold, 1/r − 1/6 (supplied: standard formula). -/
noncomputable def ms02ChiOrb (r : ℕ∞) : ℝ := ms02InvOrder r - 1 / 6
/-- MS §2.1 p05: k = 1/(2|χ_orb|). -/
noncomputable def ms02K (r : ℕ∞) : ℝ := 1 / (2 * |ms02ChiOrb r|)

/-- **L:MS-02** — the (2, 3, r) triangle family on F = {r : ℕ∞ | 7 ≤ r}: area 2π(1/6 − 1/r)
strictly increasing; π/3 at r = ∞ the least upper bound of the finite members; π/21 at r = 7
the least; k = 1/(2|χ_orb|) from 21 down to 3, strictly decreasing, and k = 3 exactly at r = ∞.

Served locus: §2.1, paragraph "What kind of forcing the home claim is, and what it is not.",
PDF p05 (printed folio 4). PDF sha256 prefix `b4841489`. -/
theorem ms_02_triangleFamily :
    let F : Set ℕ∞ := {r | 7 ≤ r}
    StrictMonoOn ms02Area F ∧
    ms02Area ⊤ = Real.pi / 3 ∧
    IsLUB (ms02Area '' {r | 7 ≤ r ∧ r ≠ ⊤}) (Real.pi / 3) ∧
    ms02Area 7 = Real.pi / 21 ∧
    IsLeast (ms02Area '' F) (Real.pi / 21) ∧
    ms02K 7 = 21 ∧ ms02K ⊤ = 3 ∧ StrictAntiOn ms02K F ∧
    (∀ r ∈ F, ms02K r = 3 ↔ r = ⊤) := by
  sorry

/-! ## L:MS-03 -/

/-- Area of the (2, q, ∞) Hecke orbifold, π − 2π/q (supplied; the paper prints only the
values). -/
noncomputable def ms03HeckeArea (q : ℕ) : ℝ := Real.pi - 2 * Real.pi / q

/-- **L:MS-03** — the Hecke (2, q, ∞) family: the areas at q = 3, 4, 5, 6 are π/3, π/2, 3π/5,
2π/3, they run strictly upward in that order, and X(1) (q = 3) is area-minimal over q ≥ 3.

Served locus: §2.1, same paragraph as L:MS-02, PDF p05 (printed folio 4). PDF sha256 prefix
`b4841489`. -/
theorem ms_03_heckeFamily :
    ms03HeckeArea 3 = Real.pi / 3 ∧ ms03HeckeArea 4 = Real.pi / 2 ∧
    ms03HeckeArea 5 = 3 * Real.pi / 5 ∧ ms03HeckeArea 6 = 2 * Real.pi / 3 ∧
    Real.pi / 3 < Real.pi / 2 ∧ Real.pi / 2 < 3 * Real.pi / 5 ∧ 3 * Real.pi / 5 < 2 * Real.pi / 3 ∧
    IsLeast (ms03HeckeArea '' {q : ℕ | 3 ≤ q}) (Real.pi / 3) := by
  sorry

/-! ## L:MS-05 -/

open OnePoint in
/-- **L:MS-05** — the two fixed points of F² on ∂ℍ = ℝ ∪ {∞} are φ and −1/φ: the fixed-point
set of F² = (2 1; 1 1), acting on `OnePoint ℝ` by Möbius maps, is exactly {φ, −1/φ}.

Served locus: §2.2, the sentence after display (2.3), PDF p06 (printed folio 5). PDF sha256
prefix `b4841489`. -/
theorem ms_05_fixedPoints_F2 :
    let g : GL (Fin 2) ℝ :=
      Matrix.GeneralLinearGroup.mkOfDetNeZero !![2, 1; 1, 1] (by norm_num [Matrix.det_fin_two_of])
    {p : OnePoint ℝ | g • p = p} =
      {((Real.goldenRatio : ℝ) : OnePoint ℝ), ((-1 / Real.goldenRatio : ℝ) : OnePoint ℝ)} := by
  sorry

/-! ## L:MS-07 -/

/-- The Selberg norm N_Γ of a hyperbolic element of trace `t` (> 2): λ², λ = (t + √(t² − 4))/2
the eigenvalue of modulus > 1 (Selberg's normalisation, log N_Γ = translation length). -/
noncomputable def selbergNormOfTrace (t : ℝ) : ℝ := ((t + Real.sqrt (t ^ 2 - 4)) / 2) ^ 2

/-- **L:MS-07** — (2.6): with F² = (2 1; 1 1), λ = φ², the Selberg norm N_Γ(F²) = φ⁴, and
log N_Γ(F²) = 2 log λ (the (2.4) length) = 4 log φ.

Served locus: §2.2, display (2.6) and the clause after it, PDF p06 (printed folio 5). PDF
sha256 prefix `b4841489`. -/
theorem ms_07_selbergNorm_F2 :
    let F2 : Matrix (Fin 2) (Fin 2) ℝ := !![2, 1; 1, 1]
    (F2.trace + Real.sqrt (F2.trace ^ 2 - 4)) / 2 = Real.goldenRatio ^ 2 ∧   -- λ = φ²
    selbergNormOfTrace F2.trace = Real.goldenRatio ^ 4 ∧            -- (2.6)
    Real.log (selbergNormOfTrace F2.trace) = 2 * Real.log (Real.goldenRatio ^ 2) ∧  -- = ℓ of (2.4)
    2 * Real.log (Real.goldenRatio ^ 2) = 4 * Real.log Real.goldenRatio := by
  sorry

/-! ## L:MS-09a -/

/-- **L:MS-09a** — (2.8): φ² = (3 + √5)/2.

Served locus: §2.2, display (2.8), PDF p06 (printed folio 5). PDF sha256 prefix `b4841489`. -/
theorem ms_09a_goldenRatio_sq :
    Real.goldenRatio ^ 2 = (3 + Real.sqrt 5) / 2 := by
  sorry

/-! ## L:MS-09b (OUT-OF-Q5, pending the wall) -/

/-- **L:MS-09b** — "φ² = (3 + √5)/2 is the fundamental automorph", read as minimality (the
definite description): φ² is the least (t + u√5)/2 > 1 over integers t, u with t² − 5u² = 4,
attained at (3, 1). OUT-OF-Q5 pending the wall's re-weigh at the IsLeast cost.

Served locus: §2.2, the clause closing display (2.8), PDF p06 (printed folio 5). PDF sha256
prefix `b4841489`. -/
theorem ms_09b_fundamental_automorph :
    IsLeast {ε : ℝ | 1 < ε ∧ ∃ t u : ℤ, t ^ 2 - 5 * u ^ 2 = 4 ∧ ε = ((t : ℝ) + u * Real.sqrt 5) / 2}
      (Real.goldenRatio ^ 2) ∧
    ((3 : ℤ) ^ 2 - 5 * 1 ^ 2 = 4) ∧
    Real.goldenRatio ^ 2 = (((3 : ℤ) : ℝ) + ((1 : ℤ) : ℝ) * Real.sqrt 5) / 2 := by
  sorry

/-! ## L:MS-13 -/

/-- Fundamental discriminant (positive form): D ≡ 1 (mod 4) squarefree, or D = 4m with
m ≡ 2, 3 (mod 4) squarefree. Local definition (none at the pin). -/
def ms13IsFundDisc (D : ℕ) : Prop :=
  (D ≡ 1 [MOD 4] ∧ Squarefree D) ∨
  (∃ m : ℕ, D = 4 * m ∧ (m ≡ 2 [MOD 4] ∨ m ≡ 3 [MOD 4]) ∧ Squarefree m)

/-- **L:MS-13** — 5 is the least squarefree d > 1 with d ≡ 1 (mod 4), and the least fundamental
discriminant greater than 1.

Served locus: §2.4, PDF p07 (printed folio 6); echoed in §5.1, PDF p17 (printed folio 16).
PDF sha256 prefix `b4841489`. -/
theorem ms_13_smallest_fundDisc :
    IsLeast {d : ℕ | 1 < d ∧ Squarefree d ∧ d ≡ 1 [MOD 4]} 5 ∧
    IsLeast {D : ℕ | 1 < D ∧ ms13IsFundDisc D} 5 := by
  sorry

/-! ## L:MS-14a -/

/-- MS §2.4 p08: the squarefree d > 1 for which x² − dy² = −1 (or −4) is solvable. -/
def ms14NegPellSet : Set ℕ :=
  {d | 1 < d ∧ Squarefree d ∧
    ∃ x y : ℤ, x ^ 2 - (d : ℤ) * y ^ 2 = -1 ∨ x ^ 2 - (d : ℤ) * y ^ 2 = -4}

/-- **L:MS-14a** — the printed instance: {2, 5, 10, 13, 17, 26, 29, 37} ⊆ S, S the squarefree
d > 1 with x² − dy² = −1 or −4 solvable.

Served locus: §2.4, PDF p08 (printed folio 7). PDF sha256 prefix `b4841489`. -/
theorem ms_14a_listed_in_negPellSet :
    ({2, 5, 10, 13, 17, 26, 29, 37} : Set ℕ) ⊆ ms14NegPellSet := by
  sorry

/-! ## L:MS-14b (OUT-OF-Q5, pending the wall) -/

/-- **L:MS-14b** — "shared by infinitely many d": `ms14NegPellSet` is infinite. OUT-OF-Q5
(pending the wall).

Served locus: §2.4, PDF p08 (printed folio 7). PDF sha256 prefix `b4841489`. -/
theorem ms_14b_negPellSet_infinite : ms14NegPellSet.Infinite := by
  sorry

/-! ## L:MS-14c (OUT-OF-Q5, pending the wall) -/

/-- **L:MS-14c** — the listed values are the first eight members of `ms14NegPellSet`:
S ∩ [0, 37] = {2, 5, 10, 13, 17, 26, 29, 37}. OUT-OF-Q5 (pending the wall).

Served locus: §2.4, PDF p08 (printed folio 7). PDF sha256 prefix `b4841489`. -/
theorem ms_14c_negPellSet_initial :
    {d ∈ ms14NegPellSet | d ≤ 37} = ({2, 5, 10, 13, 17, 26, 29, 37} : Set ℕ) := by
  sorry

/-! ## L:MS-22 -/

/-- **L:MS-22** — (3.6): for a systole equal to 4 log φ (a hypothesis; the value is
L:MS-06 = L:RZ-06b, EFFORT): half of it is 2 log φ; 2 log φ is within 0.0005 of 0.962; and the
systole is not 2 log φ.

Served locus: §3.1, display (3.6) and the clause after it, PDF p09 (printed folio 8). PDF
sha256 prefix `b4841489`. -/
theorem ms_22_halfSystole (systole : ℝ) (h : systole = 4 * Real.log Real.goldenRatio) :
    systole / 2 = 2 * Real.log Real.goldenRatio ∧
    |2 * Real.log Real.goldenRatio - 0.962| < 0.0005 ∧
    systole ≠ 2 * Real.log Real.goldenRatio := by
  sorry

/-! ## L:MS-24b -/

/-- **L:MS-24b** — (3.9): "g_c = 1/(√5 π) ≈ 0.14235", read at five decimals:
|g_c − 0.14235| < 5 × 10⁻⁶.

Served locus: §3.1, display (3.9), PDF p10 (printed folio 9). PDF sha256 prefix `b4841489`. -/
theorem ms_24b_geometryConstant_approx5 :
    |geometryConstant - 0.14235| < 0.000005 := by
  sorry

/-! ## L:MS-25 -/

/-- **L:MS-25** — (3.10): g_c · √5 = 1/π and ln √5 + ln π + ln g_c = 0.

Served locus: §3.1, display (3.10), PDF p10 (printed folio 9). PDF sha256 prefix `b4841489`. -/
theorem ms_25_productRelation_logCollapse :
    geometryConstant * Real.sqrt 5 = 1 / Real.pi ∧
    Real.log (Real.sqrt 5) + Real.log Real.pi + Real.log geometryConstant = 0 := by
  sorry

/-! ## L:MS-32a -/

/-- MS §3.4 p13: the certificate written form-independently, g(d) = 1/(π√d). -/
noncomputable def ms32Gc (d : ℝ) : ℝ := 1 / (Real.pi * Real.sqrt d)

/-- **L:MS-32a** — the integer-ladder form: the fundamental discriminants in (1, 21] are
5, 8, 12, 13, 17, 21; g(D) ≤ g(5) for every fundamental discriminant D > 1, with equality only
at 5; g(8)/g(5) − 1 = √(5/8) − 1; and 100(√(5/8) − 1) is within 0.0005 of −20.943.
`ms13IsFundDisc` as in L:MS-13.

Served locus: §3.4, PDF p13 (printed folio 12). PDF sha256 prefix `b4841489`. -/
theorem ms_32a_certificate_max_and_next_rung :
    {D : ℕ | 1 < D ∧ D ≤ 21 ∧ ms13IsFundDisc D} = ({5, 8, 12, 13, 17, 21} : Set ℕ) ∧
    (∀ D : ℕ, 1 < D → ms13IsFundDisc D →
        ms32Gc D ≤ ms32Gc 5 ∧ (ms32Gc D = ms32Gc 5 ↔ D = 5)) ∧
    ms32Gc 8 / ms32Gc 5 - 1 = Real.sqrt (5 / 8) - 1 ∧
    |100 * (Real.sqrt (5 / 8) - 1) - (-20.943)| < 0.0005 := by
  sorry

/-! ## L:MS-32b (OUT-OF-Q5, pending the wall) -/

/-- **L:MS-32b** — the field form: "g_c attains its maximum over the whole real-quadratic family
at d_K = 5" — the bound over every real quadratic K and its attainment. OUT-OF-Q5 (pending the
wall); inherits L:RZ-13. `ms32Gc` as in L:MS-32a.

Served locus: §3.4, PDF p13 (printed folio 12). PDF sha256 prefix `b4841489`. -/
theorem ms_32b_certificate_max_fields :
    (∀ (K : Type) [Field K] [NumberField K] [NumberField.IsTotallyReal K],
        Module.finrank ℚ K = 2 → ms32Gc (NumberField.discr K) ≤ ms32Gc 5) ∧
    (∃ (K : Type) (_ : Field K) (_ : NumberField K) (_ : NumberField.IsTotallyReal K),
        Module.finrank ℚ K = 2 ∧ NumberField.discr K = 5) := by
  sorry

/-! ## L:MS-39 -/

/-- The classical Hurwitz zeta ζ(σ, a) = Σ_{n ≥ 0} (n + a)^{−σ} (a > 0). Local: mathlib's
`HurwitzZeta.hurwitzZeta` is 1-periodic in a and differs from this for a ∉ [0, 1]. -/
noncomputable def ms39HurwitzClassical (σ : ℂ) (a : ℝ) : ℂ :=
  ∑' n : ℕ, (((n : ℝ) + a : ℝ) : ℂ) ^ (-σ)

/-- **L:MS-39** — (4.4): for 1/2 < re s (supplied), with ℒ_s = `RZ.mayer s` (RZ (8.3),
L:RZ-53a; MS names the Mayer operator without its formula) and 1 the constant function:
(ℒ_s 1)(0) = Σ_{n ≥ 1} n^{−2s} = ζ(2s); (ℒ_s 1)(x) = ζ(2s, x + 1) (classical Hurwitz) on
[0, 1); 1/φ is a fixed point of the Gauss map; and (ℒ_s 1)(1/φ) = ζ(2s, φ) (classical).

Served locus: §4.2, display (4.4) and its parenthesis, PDF p15 (printed folio 14); the §5.2
echo, PDF p18 (printed folio 17). PDF sha256 prefix `b4841489`. -/
theorem ms_39_mayer_on_constant (s : ℂ) (hs : 1 / 2 < s.re) :
    RZ.mayer s (fun _ => 1) 0 = ∑' n : ℕ, 1 / ((n + 1 : ℂ)) ^ (2 * s) ∧
    ∑' n : ℕ, 1 / ((n + 1 : ℂ)) ^ (2 * s) = riemannZeta (2 * s) ∧
    (∀ x ∈ Set.Ico (0 : ℝ) 1,
        RZ.mayer s (fun _ => 1) x = ms39HurwitzClassical (2 * s) (x + 1)) ∧
    RZ.gaussMap (1 / Real.goldenRatio) = 1 / Real.goldenRatio ∧
    RZ.mayer s (fun _ => 1) (1 / Real.goldenRatio) =
        ms39HurwitzClassical (2 * s) Real.goldenRatio := by
  sorry

end ModularSurface.Now
