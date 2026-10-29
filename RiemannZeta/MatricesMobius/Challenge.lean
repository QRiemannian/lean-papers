import Mathlib

/-!
# Unit U4 (`RiemannZeta/MatricesMobius`) — statements

Statements of the rows of unit U4 (the matrix and Möbius rows of §7.1–§7.2, §8.1–§8.3, §9.5 and
§13.5) of the paper *The Tetrahedral Structure of the Riemann Zeta Function* (QRiemannian
Research, April 2026, revised October 2026), served PDF sha256
`2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54` (prefix `2d5287e7`).
PDF page indices count the cover as p01. Each theorem states one row of the claim ledger, from
its spec `specs/<ROW>.md` (signed `V1-GREEN` / `V1-SPLIT-OK`); every proof here is `sorry`.
The proofs live in `RiemannZeta/MatricesMobius/Solution.lean`.

Rows in scope: L:RZ-41a, L:RZ-43a, L:RZ-43b (in scope under L:RZ-43), L:RZ-53a, L:RZ-55,
L:RZ-63a, L:RZ-64a, L:RZ-83. OUT-OF-Q5 (pending the wall), stated: L:RZ-41c, L:RZ-53c,
L:RZ-63b, L:RZ-64b, L:RZ-64c. Not stated here: L:RZ-41b (V1-CC, on the correction track) and
L:RZ-53b (NEEDS-DEVELOPMENT: its objects are not at the pin).

Conventions across the unit: the types of a 2×2 matrix are mathlib's discriminant predicates
`Matrix.IsHyperbolic` (`0 < discr`), `Matrix.IsElliptic` (`discr < 0`), `Matrix.IsParabolic`
(`discr = 0` and not scalar), with `Matrix.discr` = tr² − 4·det; PSL(2, ℤ) is mathlib's
SL(2, ℤ) ⧸ centre and PSL-stabilizers are images of SL(2, ℤ)-stabilizers under
`QuotientGroup.mk'`; ∂ℍ = `OnePoint ℝ` with GL(2, ℝ) acting by Möbius maps; φ =
`Real.goldenRatio`; the geometry constant g_c = 1/(√5·π) is written out, no `def`.
-/

open scoped MatrixGroups
open UpperHalfPlane

namespace RiemannZeta.MatricesMobius

/-! ## L:RZ-41a -/

/-- **L:RZ-41a** — RZ §7.1 table, Hyperbolic and Elliptic rows: for γ ∈ SL(2, ℤ), (i) hyperbolic
⇔ |tr γ| > 2 and elliptic ⇔ |tr γ| < 2; (ii) both types are conjugation-invariant ("Conjugacy
class"); (iii) a hyperbolic γ fixes no point of ℍ and exactly two points of ℝ ∪ {∞};
(iv) an elliptic γ fixes exactly one point of ℍ and none of ℝ ∪ {∞}.

Served locus: §7.1 "The key identification", the sentence introducing the table and its
Hyperbolic and Elliptic rows, PDF p17 (printed folio 16). PDF sha256 prefix `2d5287e7`. -/
theorem rz_41a_hyperbolic_elliptic (γ : SL(2, ℤ)) :
    let m : Matrix (Fin 2) (Fin 2) ℤ := γ
    let g : GL (Fin 2) ℝ := Matrix.SpecialLinearGroup.mapGL ℝ γ
    (m.IsHyperbolic ↔ 2 < |m.trace|) ∧ (m.IsElliptic ↔ |m.trace| < 2) ∧
    (∀ h : SL(2, ℤ),
       (((h * γ * h⁻¹ : SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic ↔ m.IsHyperbolic) ∧
       (((h * γ * h⁻¹ : SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ).IsElliptic ↔ m.IsElliptic)) ∧
    (m.IsHyperbolic →
       (∀ z : ℍ, γ • z ≠ z) ∧
       ∃ p q : OnePoint ℝ, p ≠ q ∧ ∀ c : OnePoint ℝ, g • c = c ↔ c = p ∨ c = q) ∧
    (m.IsElliptic →
       (∃! z : ℍ, γ • z = z) ∧ ∀ c : OnePoint ℝ, g • c ≠ c) := by
  sorry

/-! ## L:RZ-41c (OUT-OF-Q5, pending the wall) -/

/-- **L:RZ-41c** — RZ §7.1 table, action column: hyperbolic elements are dilations along a
geodesic, elliptic elements rotations about a fixed point, read as SL(2, ℝ) normal forms
(conjugate to ±diag(λ, λ⁻¹) with λ > 1, resp. to a rotation with sin θ ≠ 0).
**OUT-OF-Q5 (pending the wall).**

Served locus: §7.1 table, "Action on ℍ" column, Hyperbolic and Elliptic rows, PDF p17 (printed
folio 16); the same words recur in §7.2, PDF p18. PDF sha256 prefix `2d5287e7`. -/
theorem rz_41c_normal_forms (γ : SL(2, ℤ)) :
    let m : Matrix (Fin 2) (Fin 2) ℤ := γ
    let γR : SL(2, ℝ) := Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ) γ
    (m.IsHyperbolic → ∃ h : SL(2, ℝ), ∃ lam : ℝ, 1 < lam ∧
       (((h * γR * h⁻¹ : SL(2, ℝ)) : Matrix (Fin 2) (Fin 2) ℝ) = !![lam, 0; 0, lam⁻¹] ∨
        ((h * γR * h⁻¹ : SL(2, ℝ)) : Matrix (Fin 2) (Fin 2) ℝ) = -!![lam, 0; 0, lam⁻¹])) ∧
    (m.IsElliptic → ∃ h : SL(2, ℝ), ∃ θ : ℝ, Real.sin θ ≠ 0 ∧
       ((h * γR * h⁻¹ : SL(2, ℝ)) : Matrix (Fin 2) (Fin 2) ℝ)
         = !![Real.cos θ, -Real.sin θ; Real.sin θ, Real.cos θ]) := by
  sorry

/-! ## L:RZ-43 (legs 43a and 43b, both in scope) -/

/-- **L:RZ-43a** — RZ §7.2 "Elliptic → Harmonic": for SL(2, ℤ) the elliptic elements have orders
3, 4 and 6; the only element of order 2 is −I, central and not elliptic; the centre is {±1}
(so mathlib's PSL(2, ℤ) is the printed SL(2, ℤ)/{±I}); their images in PSL(2, ℤ) have orders
2 and 3.

Served locus: §7.2 "Verification of the mapping", paragraph "Elliptic → Harmonic", the first two
sentences after the lead, PDF p18 (printed folio 17). PDF sha256 prefix `2d5287e7`. -/
theorem rz_43a_elliptic_orders :
    {n : ℕ | ∃ γ : SL(2, ℤ), (γ : Matrix (Fin 2) (Fin 2) ℤ).IsElliptic ∧ orderOf γ = n}
      = {3, 4, 6} ∧
    (∀ γ : SL(2, ℤ), orderOf γ = 2 ↔ γ = -1) ∧
    ((-1 : SL(2, ℤ)) ∈ Subgroup.center SL(2, ℤ) ∧
      ¬ ((-1 : SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ).IsElliptic) ∧
    ((Subgroup.center SL(2, ℤ) : Set SL(2, ℤ)) = {1, -1}) ∧
    {n : ℕ | ∃ γ : SL(2, ℤ), (γ : Matrix (Fin 2) (Fin 2) ℤ).IsElliptic ∧
        orderOf (QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) γ) = n} = {2, 3} := by
  sorry

/-- **L:RZ-43b** — RZ §7.2 "Elliptic → Harmonic": the stabilizers of the two orbifold points in
PSL(2, ℤ) are ℤ/2 and ℤ/3, giving cone angles π and 2π/3 — angular deficits π and 4π/3.
(i) every point of ℍ whose SL(2, ℤ)-stabilizer is not inside the centre lies in the orbit of i
or of ρ, and these orbits are distinct; (ii) the PSL-images of the stabilizers of i and ρ are
ℤ/2 and ℤ/3; (iii) cone angle := 2π / order of the stabilizer, deficit := 2π − cone angle
(definitions, no metric fact). In scope under L:RZ-43.

Served locus: §7.2 "Verification of the mapping", paragraph "Elliptic → Harmonic", third
sentence, PDF p18 (printed folio 17). PDF sha256 prefix `2d5287e7`. -/
theorem rz_43b_orbifold_points :
    let q := QuotientGroup.mk' (Subgroup.center SL(2, ℤ))
    ((∀ z : ℍ, ¬ (MulAction.stabilizer SL(2, ℤ) z ≤ Subgroup.center SL(2, ℤ)) →
        ∃ g : SL(2, ℤ), g • z = I ∨ g • z = ρ) ∧
      ¬ ∃ g : SL(2, ℤ), g • I = ρ) ∧
    Nonempty ((MulAction.stabilizer SL(2, ℤ) I).map q ≃* Multiplicative (ZMod 2)) ∧
    Nonempty ((MulAction.stabilizer SL(2, ℤ) ρ).map q ≃* Multiplicative (ZMod 3)) ∧
    (2 * Real.pi / Nat.card ((MulAction.stabilizer SL(2, ℤ) I).map q) = Real.pi ∧
      2 * Real.pi / Nat.card ((MulAction.stabilizer SL(2, ℤ) ρ).map q) = 2 * Real.pi / 3 ∧
      2 * Real.pi - 2 * Real.pi / Nat.card ((MulAction.stabilizer SL(2, ℤ) I).map q) = Real.pi ∧
      2 * Real.pi - 2 * Real.pi / Nat.card ((MulAction.stabilizer SL(2, ℤ) ρ).map q)
        = 4 * Real.pi / 3) := by
  sorry

/-! ## L:RZ-53a — the definitions (8.1)–(8.3) -/

/-- RZ (8.1): the hyperbolic Laplacian Δ = −y²(∂²/∂x² + ∂²/∂y²), z = x + iy (L:RZ-53a). -/
noncomputable def RZ.hypLaplacian (f : ℂ → ℂ) (z : ℂ) : ℂ :=
  -((z.im : ℂ) ^ 2) *
    (iteratedFDeriv ℝ 2 f z ![1, 1] + iteratedFDeriv ℝ 2 f z ![Complex.I, Complex.I])

/-- RZ (8.2): the Gauss map T(x) = {1/x} (Lean's 0⁻¹ = 0 gives T 0 = 0) (L:RZ-53a). -/
noncomputable def RZ.gaussMap (x : ℝ) : ℝ := Int.fract x⁻¹

/-- RZ (8.3): ℒ_s f(x) = Σ_{n ≥ 1} (x + n)^{−2s} f(1/(x + n)) (as a `tsum`) (L:RZ-53a). -/
noncomputable def RZ.mayer (s : ℂ) (f : ℝ → ℂ) (x : ℝ) : ℂ :=
  ∑' n : ℕ, (((x + (n + 1) : ℝ) : ℂ) ^ (-2 * s)) * f (1 / (x + (n + 1)))

/-- **L:RZ-53a** — RZ (8.1)–(8.3) as the definitions `RZ.hypLaplacian`, `RZ.gaussMap`,
`RZ.mayer` above; the theorem is the typing printed with (8.2): T : [0, 1) → [0, 1).

Served locus: §8.1 display (8.1), PDF p20 (printed folio 19); §8.2 display (8.2), PDF p20;
display (8.3), PDF p21 (printed folio 20). PDF sha256 prefix `2d5287e7`. -/
theorem rz_53a_gaussMap_mapsTo :
    Set.MapsTo RZ.gaussMap (Set.Ico 0 1) (Set.Ico 0 1) := by
  sorry

/-- **L:RZ-53a** (second theorem, the spec's optional identity) — the definition
`RZ.hypLaplacian` of (8.1) read through mathlib's Laplacian on ℂ: Δ_hyp f(z) = −(Im z)² · Δ f(z).
States the same definition through mathlib's operator, nothing new.

Served locus: §8.1 display (8.1), PDF p20 (printed folio 19). PDF sha256 prefix `2d5287e7`. -/
theorem rz_53a_hypLaplacian_eq (f : ℂ → ℂ) (z : ℂ) :
    RZ.hypLaplacian f z = -((z.im : ℂ) ^ 2) * Laplacian.laplacian f z := by
  sorry

/-! ## L:RZ-53c (OUT-OF-Q5, pending the wall) -/

/-- **L:RZ-53c** (C1) — RZ §8.2: the Gauss map generates the continued-fraction expansion, read
through mathlib's `GenContFract.IntFractPair.stream`: for v ∈ [0, 1) the stream starts at ⟨0, v⟩
and its (n + 1)-st term, when it exists, has integer part ⌊1/Tⁿ(v)⌋ and fractional part Tⁿ⁺¹(v).
**OUT-OF-Q5 (pending the wall).**

Served locus: §8.2, the sentence carrying (8.2) and (8.3), PDF p20–p21 (printed folios 19–20).
PDF sha256 prefix `2d5287e7`. -/
theorem rz_53c_gauss_generates_cf (v : ℝ) (hv : v ∈ Set.Ico (0 : ℝ) 1) :
    GenContFract.IntFractPair.stream v 0 = some ⟨0, v⟩ ∧
    ∀ (n : ℕ) (p : GenContFract.IntFractPair ℝ),
      GenContFract.IntFractPair.stream v (n + 1) = some p →
        p.b = ⌊(RZ.gaussMap^[n] v)⁻¹⌋ ∧ p.fr = RZ.gaussMap^[n + 1] v := by
  sorry

/-- **L:RZ-53c** (C2) — RZ §8.2: (8.3) is the transfer operator of T, with the weight
|T′|^{−s} (not printed; named as the reading): for x ∈ (0, 1), the preimages of x under T in
(0, 1) are the points 1/(x + n), n ≥ 1; T′(1/(x + n)) = −(x + n)²; and ℒ_s f(x) is the sum over
those preimages y of |T′(y)|^{−s} f(y). **OUT-OF-Q5 (pending the wall).**

Served locus: §8.2, the sentence carrying (8.2) and (8.3), PDF p21 (printed folio 20).
PDF sha256 prefix `2d5287e7`. -/
theorem rz_53c_mayer_is_transfer (s : ℂ) (f : ℝ → ℂ) (x : ℝ) (hx : x ∈ Set.Ioo (0 : ℝ) 1) :
    {y : ℝ | y ∈ Set.Ioo 0 1 ∧ RZ.gaussMap y = x} = Set.range (fun n : ℕ => 1 / (x + (n + 1))) ∧
    (∀ n : ℕ, HasDerivAt RZ.gaussMap (-(x + (n + 1)) ^ 2) (1 / (x + (n + 1)))) ∧
    RZ.mayer s f x =
      ∑' y : {y : ℝ // y ∈ Set.Ioo 0 1 ∧ RZ.gaussMap y = x},
        (((|deriv RZ.gaussMap y|) : ℝ) : ℂ) ^ (-s) * f y := by
  sorry

/-! ## L:RZ-55 -/

open Real in
/-- **L:RZ-55** — RZ §8.3, (8.6)–(8.7): each Gauss-map branch is x ↦ 1/(x + n) (an inverse
branch of T on [0, 1)), given by (0 1; 1 n) acting on ℝ ∪ {∞}, of determinant −1, the
composition of STⁿ with the reflection x ↦ −x (reflection applied last, R·(S·Tⁿ)); even products
of branch matrices have determinant 1; the n = 1 fixed point is (−1 + √5)/2 = 1/φ; S² = −I, and
S has order 2 in PSL(2, ℤ), generating the stabilizer of i there.

Served locus: §8.3, displays (8.6)–(8.7) and the sentences around them, PDF p21–p22 (printed
folios 20–21). PDF sha256 prefix `2d5287e7`. -/
theorem rz_55_gauss_branches :
    (∀ n : ℕ, 0 < n → ∀ x ∈ Set.Ico (0 : ℝ) 1, Int.fract ((1 / (x + n))⁻¹) = x) ∧
    (∀ n : ℕ, 0 < n → ∀ x : ℝ, x + n ≠ 0 →
       (Matrix.GeneralLinearGroup.mkOfDetNeZero !![(0 : ℝ), 1; 1, n]
           (by simp [Matrix.det_fin_two_of])) •
         (x : OnePoint ℝ) = ((1 / (x + n) : ℝ) : OnePoint ℝ)) ∧
    (∀ n : ℕ, (!![0, 1; 1, (n : ℤ)]).det = -1) ∧
    (∀ n : ℕ, !![0, 1; 1, (n : ℤ)]
        = !![-1, 0; 0, 1] * ((ModularGroup.S : Matrix (Fin 2) (Fin 2) ℤ) *
            ((ModularGroup.T ^ (n : ℤ) : SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ))) ∧
    (∀ l : List ℕ, Even l.length →
       ((l.map fun n : ℕ => !![0, 1; 1, (n : ℤ)]).prod).det = 1) ∧
    ((∀ x : ℝ, x ≠ -1 → (x = 1 / (x + 1) ↔ x ^ 2 + x - 1 = 0)) ∧
     (∀ x ∈ Set.Ico (0 : ℝ) 1, x = 1 / (x + 1) ↔ x = (-1 + √5) / 2) ∧
     (-1 + √5) / 2 = Real.goldenRatio⁻¹) ∧
    (ModularGroup.S * ModularGroup.S = -1 ∧
     orderOf (QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) ModularGroup.S) = 2 ∧
     (MulAction.stabilizer SL(2, ℤ) UpperHalfPlane.I).map
         (QuotientGroup.mk' (Subgroup.center SL(2, ℤ)))
       = Subgroup.zpowers (QuotientGroup.mk' (Subgroup.center SL(2, ℤ)) ModularGroup.S)) := by
  sorry

/-! ## L:RZ-63a -/

open Real in
/-- **L:RZ-63a** — RZ §9.5, (9.9a): for a hyperbolic element with trace t and multiplier λ
(|λ| > 1), √(t² − 4) = 2 sinh(ℓ/2) with ℓ = 2 log |λ|; at t = 3, σ = 4 log φ (σ the number),
√5 = 2 sinh(σ/2), so the geometry constant g_c = 1/(√5·π) equals 1/(2π sinh(σ/2)).

Served locus: §9.5, paragraph "The metric twin, and what it does not buy.", display (9.9a),
PDF p25 (printed folio 24); g_c = 1/(√5·π) from the abstract, PDF p02. PDF sha256 prefix
`2d5287e7`. -/
theorem rz_63a_sinh_identity :
    (∀ γ : SL(2, ℝ), (γ : Matrix (Fin 2) (Fin 2) ℝ).IsHyperbolic →
      ∀ lam : ℝ, lam ^ 2 - (γ : Matrix (Fin 2) (Fin 2) ℝ).trace * lam + 1 = 0 → 1 < |lam| →
        √((γ : Matrix (Fin 2) (Fin 2) ℝ).trace ^ 2 - 4)
          = 2 * Real.sinh ((2 * Real.log |lam|) / 2)) ∧
    (√((3 : ℝ) ^ 2 - 4) = √5 ∧
      (Real.goldenRatio ^ 2) ^ 2 - 3 * Real.goldenRatio ^ 2 + 1 = 0 ∧
      1 < Real.goldenRatio ^ 2 ∧
      2 * Real.log (Real.goldenRatio ^ 2) = 4 * Real.log Real.goldenRatio ∧
      √5 = 2 * Real.sinh ((4 * Real.log Real.goldenRatio) / 2)) ∧
    1 / (√5 * Real.pi) = 1 / (2 * Real.pi * Real.sinh ((4 * Real.log Real.goldenRatio) / 2)) := by
  sorry

/-! ## L:RZ-63b (OUT-OF-Q5, pending the wall) -/

open Real in
/-- **L:RZ-63b** — RZ §9.5, (9.9a): with ℓ the hyperbolic translation length
τ(γ) = inf_z d(z, γz), √(t² − 4) = 2 sinh(ℓ/2); the systole of X(1) (the infimum of τ over
hyperbolic elements of SL(2, ℤ)) is 4 log φ, attained at an element of trace 3 (F² = (2 1; 1 1)).
**OUT-OF-Q5 (pending the wall)**; inherits L:RZ-05 and L:RZ-06b.

Served locus: §9.5, paragraph "The metric twin, and what it does not buy.", display (9.9a),
PDF p25 (printed folio 24). PDF sha256 prefix `2d5287e7`. -/
theorem rz_63b_geometric (τ : SL(2, ℝ) → ℝ)
    (hτ : ∀ γ, τ γ = ⨅ z : ℍ, dist z (γ • z)) :
    (∀ γ : SL(2, ℝ), (γ : Matrix (Fin 2) (Fin 2) ℝ).IsHyperbolic →
        √((γ : Matrix (Fin 2) (Fin 2) ℝ).trace ^ 2 - 4) = 2 * Real.sinh (τ γ / 2)) ∧
    (⨅ γ : {γ : SL(2, ℤ) // (γ : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic},
        τ (Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ) γ.1))
      = 4 * Real.log Real.goldenRatio ∧
    (∃ γ : SL(2, ℤ), (γ : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic ∧
        (γ : Matrix (Fin 2) (Fin 2) ℤ).trace = 3 ∧
        τ (Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ) γ)
          = 4 * Real.log Real.goldenRatio) := by
  sorry

/-! ## L:RZ-64a -/

open Real in
/-- **L:RZ-64a** — RZ §9.5: at Γ(2) the minimal hyperbolic trace is t = 6 (read with |t|, since
−I ∈ Γ(2)), giving √(t² − 4) = √32; the multiplier of trace 6 is 3 + 2√2.

Served locus: §9.5, the sentence after display (9.9a), PDF p25 (printed folio 24). PDF sha256
prefix `2d5287e7`. -/
theorem rz_64a_gamma2_min_trace :
    (∃ γ ∈ CongruenceSubgroup.Gamma 2,
        (γ : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic ∧ (γ : Matrix (Fin 2) (Fin 2) ℤ).trace = 6) ∧
    (∀ γ ∈ CongruenceSubgroup.Gamma 2, (γ : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic →
        6 ≤ |(γ : Matrix (Fin 2) (Fin 2) ℤ).trace|) ∧
    √((6 : ℝ) ^ 2 - 4) = √32 ∧
    ((3 + 2 * √2 : ℝ) ^ 2 - 6 * (3 + 2 * √2) + 1 = 0 ∧ (1 : ℝ) < 3 + 2 * √2) := by
  sorry

/-! ## L:RZ-64b, L:RZ-64c (OUT-OF-Q5, pending the wall) -/

open IntermediateField in
/-- ℚ(√2) ⊂ ℝ is a number field: √2 is integral over ℚ (a root of X² − 2), so ℚ⟮√2⟯ is
finite-dimensional over ℚ. The instance L:RZ-64b's spec asks `Challenge.lean` to supply, so that
the statement is not conditional on it. -/
instance numberField_Q_sqrt2 : NumberField ℚ⟮(√2 : ℝ)⟯ where
  to_finiteDimensional := IntermediateField.adjoin.finiteDimensional
    (IsIntegral.of_pow (n := 2) (by norm_num)
      (by
        rw [Real.sq_sqrt (by norm_num)]
        simpa using isIntegral_algebraMap (R := ℚ) (A := ℝ) (x := 2)))

open IntermediateField in
/-- ℚ(√5) ⊂ ℝ is a number field: √5 is integral over ℚ (a root of X² − 5). The instance
L:RZ-64c's spec asks `Challenge.lean` to supply. -/
instance numberField_Q_sqrt5 : NumberField ℚ⟮(√5 : ℝ)⟯ where
  to_finiteDimensional := IntermediateField.adjoin.finiteDimensional
    (IsIntegral.of_pow (n := 2) (by norm_num)
      (by
        rw [Real.sq_sqrt (by norm_num)]
        simpa using isIntegral_algebraMap (R := ℚ) (A := ℝ) (x := 5)))

open IntermediateField in
/-- **L:RZ-64b** — RZ §9.5: the quadratic field of the multiplier 3 + 2√2 is ℚ(√2) (as
intermediate fields of ℝ/ℚ), with d_K = 8 (√d_K = √8). **OUT-OF-Q5 (pending the wall)**; rides
L:RZ-13.

Served locus: §9.5, the sentence after display (9.9a), PDF p25 (printed folio 24). PDF sha256
prefix `2d5287e7`. -/
theorem rz_64b_disc_Q_sqrt2 :
    ℚ⟮((3 + 2 * √2 : ℝ))⟯ = ℚ⟮(√2 : ℝ)⟯ ∧ NumberField.discr ℚ⟮(√2 : ℝ)⟯ = 8 := by
  sorry

open IntermediateField NumberField in
/-- φ² as an element of the ring of integers 𝓞 of ℚ(√5) ⊂ ℝ: φ² = ((1 + √5)/2)² lies in ℚ⟮√5⟯,
and it is integral over ℤ (φ is a root of X² − X − 1). The element L:RZ-64c's spec asks
`Challenge.lean` to construct ("the systolic element's multiplier"), rather than take it as a
hypothesis. -/
noncomputable def RZ.phiSq : 𝓞 ℚ⟮(√5 : ℝ)⟯ :=
  ⟨⟨Real.goldenRatio ^ 2, pow_mem (div_mem (add_mem (one_mem _) (mem_adjoin_simple_self ℚ _))
      (by exact_mod_cast IntermediateField.natCast_mem ℚ⟮(√5 : ℝ)⟯ 2)) 2⟩,
    (isIntegral_algHom_iff ((ℚ⟮(√5 : ℝ)⟯).val.restrictScalars ℤ) Subtype.val_injective).mp
      (IsIntegral.pow ⟨Polynomial.X ^ 2 - Polynomial.X - 1, by monicity!,
        by simp [Real.goldenRatio_sq]⟩ 2)⟩

open IntermediateField NumberField in
/-- **L:RZ-64c** — RZ §9.5: on X(1) the two writings agree, √(3² − 4) = √d_K with K = ℚ(√5),
and the systolic element's multiplier φ² has conductor 1 — read as mathlib's conductor ideal
`conductor ℤ φ² = ⊤` in 𝓞_K (equivalently ℤ[φ²] = 𝓞_K). The first conjunct records which element
`RZ.phiSq` is (the spec's pinning hypothesis, made unconditional). "only because" is not taken as
a formal claim. **OUT-OF-Q5 (pending the wall)**; rides L:RZ-09.

Served locus: §9.5, the sentence after display (9.9a), final clause, PDF p25 (printed folio 24).
PDF sha256 prefix `2d5287e7`. -/
theorem rz_64c_conductor_one :
    ((RZ.phiSq : ℚ⟮(√5 : ℝ)⟯) : ℝ) = Real.goldenRatio ^ 2 ∧
    √((3 : ℝ) ^ 2 - 4) = √(NumberField.discr ℚ⟮(√5 : ℝ)⟯ : ℝ) ∧
    conductor ℤ RZ.phiSq = ⊤ := by
  sorry

/-! ## L:RZ-83 -/

/-- **L:RZ-83** — RZ §13.5: the product of two hyperbolic elements can be hyperbolic, elliptic,
or parabolic (in SL(2, ℤ), the trace formula's group; parabolic = discriminant 0 and not ±I,
mathlib's `Matrix.IsParabolic`).

Served locus: §13.5, PDF p33. PDF sha256 prefix `2d5287e7`. -/
theorem rz_83_hyperbolic_products :
    (∃ A B : SL(2, ℤ), (A : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic ∧
        (B : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic ∧
        ((A * B : SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic) ∧
    (∃ A B : SL(2, ℤ), (A : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic ∧
        (B : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic ∧
        ((A * B : SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ).IsElliptic) ∧
    (∃ A B : SL(2, ℤ), (A : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic ∧
        (B : Matrix (Fin 2) (Fin 2) ℤ).IsHyperbolic ∧
        ((A * B : SL(2, ℤ)) : Matrix (Fin 2) (Fin 2) ℤ).IsParabolic) := by
  sorry

end RiemannZeta.MatricesMobius
