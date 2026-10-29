# L:RZ-14b — vol(X(1)) = π/3 as the area of the quotient SL(2, ℤ)\ℍ; the Gauss–Bonnet value for the (2, 3, ∞) orbifold

## 1 · Header
- row: L:RZ-14b (the ledger's own a/b split of RZ-14; **a** = the area of 𝒟 as an integral, this unit's `specs/RZ-14a.md`). This row is **SPLIT for V₁'s sign-off into a reachable leg and a cited leg** (unit summary): **(i) reachable** — 𝒟 is a measure-theoretic fundamental domain for the faithful action of SL(2, ℤ)/{±1} on ℍ, and the covolume of that action (mathlib's `MeasureTheory.covolume`: the area of any fundamental domain) is π/3; plus the arithmetic of "the Gauss–Bonnet value": −2π·χ(2, 3, ∞) = π/3 with χ the orbifold Euler characteristic −1/6 (L:RZ-44a's number); **(ii) CITED, NOT CHECKED** — the orbifold Gauss–Bonnet theorem itself (area = −2π·χ_orb for a finite-area hyperbolic 2-orbifold), not at the pin and not built here (E4).
- unit: U9 (`RiemannZeta/Provenance`)
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: 2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54
- locus: §2.4 "𝜋 from the area", displays (2.8)–(2.9) and the clause between them, PDF p08 (printed folio 7). Change class UNCHANGED.
- spec_clock: 2026-10-28T20:39:06Z

## 2 · Printed statement, verbatim (served edition, `pdftotext -layout`, p08)
> The hyperbolic area of the modular surface is
>
> vol(𝑋(1)) = 𝜋/3,  (2.8)
>
> the Gauss–Bonnet value for the (2, 3, ∞) orbifold; equivalently
>
> 𝜋 = 3 ⋅ vol(𝑋(1))  [CV].  (2.9)

This row takes "vol(X(1)) = π/3" as a statement about the quotient, and "the Gauss–Bonnet value for the (2, 3, ∞) orbifold". (2.9) is L:RZ-15's (CHECKED).

## 3 · Formal reading
- **X(1) and its area (convention named).** X(1) = SL(2, ℤ)\ℍ. Since −1 acts trivially on ℍ, the group that acts on ℍ is SL(2, ℤ)/{±1} = PSL(2, ℤ); mathlib's `IsFundamentalDomain` asks the translates g·s (g ≠ 1) to be a.e. disjoint from s, which fails for g = −1 in SL(2, ℤ) itself. The statement therefore uses **the image of SL(2, ℤ) in PGL(2, ℝ)**: `RZ.modularPGL` := range of SL(2, ℤ) →(`Matrix.SpecialLinearGroup.mapGL ℝ`) GL(2, ℝ) →(`Matrix.ProjGenLinGroup.mk`) PGL(2, ℝ) — a subgroup isomorphic to PSL(2, ℤ) (kernel {±1}, cf. `Matrix.SpecialLinearGroup.toPGL_ker`), acting on ℍ through mathlib's `MulAction PGL(2, ℝ) ℍ` instance. The area of the quotient is `MeasureTheory.covolume RZ.modularPGL ℍ` for the hyperbolic measure (`volume` on ℍ, dx dy / y²): the measure of a chosen fundamental domain, and 0 if none exists (FundamentalDomain.lean:680). Stating it equal to π/3 (≠ 0) therefore also asserts a fundamental domain exists; by `IsFundamentalDomain.measure_eq` / `covolume_eq_volume` every fundamental domain then has area π/3, which is what "the area of the quotient" means independently of 𝒟.
- **𝒟 is a fundamental domain.** `MeasureTheory.IsFundamentalDomain RZ.modularPGL ModularGroup.fd` (null-measurable; a.e. covered by translates — `ModularGroup.exists_smul_mem_fd` gives every point; translates by g ≠ 1 a.e. disjoint from 𝒟 — `ModularGroup.eq_one_or_neg_one_of_mem_fdo_mem_fd` on the interior, the boundary being null). Stated as the first conjunct so the link to L:RZ-14a's integral is explicit.
- **"the Gauss–Bonnet value for the (2, 3, ∞) orbifold" (split).** Orbifold Gauss–Bonnet: the area of a finite-area hyperbolic 2-orbifold of genus g with cone points of orders mᵢ and n cusps is −2π·χ, χ = 2 − 2g − Σ(1 − 1/mᵢ) − n. For (2, 3, ∞) — genus 0, cone orders 2, 3, one cusp — χ = −1/6 and −2π·χ = π/3. **Reachable leg:** that arithmetic, with `orbEulerChar` restated identically to U7's (`RiemannZeta/SmallArith/Challenge.lean:28`; units restate, they do not import), so the number is tied to the same definition L:RZ-44a checks (`orbEulerChar 0 [2, 3] 1 = −1/6`). **Cited leg:** the theorem "area = −2π·χ" for orbifolds — not at the pin (no orbifold, no Gauss–Bonnet for surfaces with cone points or cusps; ledger: "orbifold Gauss–Bonnet not found"); stays CITED, NOT CHECKED. The reachable leg (i) gives vol(X(1)) = π/3 by direct integration, so the cited theorem is not needed for the value — only for the name "the Gauss–Bonnet value".

## 4 · Target mathlib declarations (pin db584cd6d46c92f209a44c0f1c829460d327499d; governor-71 grep, namespace from the file's `namespace`/`end` lines)
| declaration | kind | file:line · namespace |
|---|---|---|
| `MeasureTheory.IsFundamentalDomain` | structure | MeasureTheory/Group/FundamentalDomain.lean:69 · `MeasureTheory` |
| `MeasureTheory.covolume` | def — volume of some fundamental domain, else 0 | FundamentalDomain.lean:680 · `MeasureTheory` (not `ZLattice.covolume`, Algebra/Module/ZLattice/Covolume.lean:72, a different object) |
| `MeasureTheory.IsFundamentalDomain.covolume_eq_volume`, `.measure_eq` (proof aids) | lemma; theorem | FundamentalDomain.lean:696, :318 · `MeasureTheory` |
| `MeasureTheory.IsFundamentalDomain.mk''` (proof aid: cover + a.e.-disjointness for g ≠ 1) | theorem | FundamentalDomain.lean:98 · `MeasureTheory.IsFundamentalDomain` |
| `Matrix.ProjGenLinGroup` (notation `PGL(n, R)`), `Matrix.ProjGenLinGroup.mk` | def; def (`GL n R →* PGL(n, R)`) | LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean:41, :55 · `Matrix`, `Matrix.ProjGenLinGroup` |
| `Matrix.SpecialLinearGroup.mapGL` | def (monoid hom) | LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:284 · `Matrix.SpecialLinearGroup` |
| `Matrix.SpecialLinearGroup.toPGL`, `Matrix.SpecialLinearGroup.toPGL_ker` (named; kernel = centre) | abbrev; lemma | Projective.lean:100, :102 · `Matrix.SpecialLinearGroup` (`toPGL_ker` is for SL(n, R) → PGL(n, R) at one ring R; the kernel of SL(2, ℤ) → PGL(2, ℝ) is the same {±1}, a proof step) |
| `MulAction PGL(2, ℝ) ℍ` instance, `UpperHalfPlane.pglMk_smul` | instance; theorem | Analysis/Complex/UpperHalfPlane/MoebiusAction.lean:270, :274 · `UpperHalfPlane` |
| `SMulInvariantMeasure (GL (Fin 2) ℝ) ℍ volume` (proof aid: transported to the subgroup) | instance | Analysis/Complex/UpperHalfPlane/Measure.lean:89 · `UpperHalfPlane` |
| `ModularGroup.fd`, `ModularGroup.fdo`, `ModularGroup.exists_smul_mem_fd`, `ModularGroup.eq_one_or_neg_one_of_mem_fdo_mem_fd`, `ModularGroup.fd_eq_closure_fdo` | defs; theorems | NumberTheory/Modular.lean:367, :371, :426, :778, :909 · `ModularGroup` |
| `MonoidHom.range`, `Subgroup` (the submonoid `SMul` instance, Algebra/Group/Submonoid/MulAction.lean:34) | def; instance | standard |
| `ENNReal.ofReal`, `Real.pi` | defs | standard |

Ledger: "`MeasureTheory.IsFundamentalDomain` for SL(2, ℤ) on ℍ not found (loogle: 0 hits)" — still true at the pin (grep of NumberTheory/ and Analysis/Complex/ for `IsFundamentalDomain`: no hit); it is this row's NEEDS-DEVELOPMENT, and the pieces it needs (cover, interior uniqueness up to ±1, invariant measure, `covolume`) are all present. "orbifold Gauss–Bonnet not found" — still true; that clause is CITED.

## 5 · Intended Lean statement
**Prose.** (i) 𝒟 is a fundamental domain for the action of SL(2, ℤ)/{±1} on ℍ with the hyperbolic measure, and the area of the quotient (the covolume) is π/3. (ii-arith) The orbifold Euler characteristic of (2, 3, ∞) is −1/6 and −2π times it is π/3. (ii-thm, cited) Gauss–Bonnet for the orbifold — not stated.

**Shared definitions (restated in U9's `Challenge.lean`):**
```lean
open scoped MatrixGroups in
/-- The modular group acting on ℍ faithfully: the image of SL(2, ℤ) in PGL(2, ℝ) (≅ PSL(2, ℤ)). -/
noncomputable def RZ.modularPGL : Subgroup PGL(2, ℝ) :=
  (Matrix.ProjGenLinGroup.mk.comp (Matrix.SpecialLinearGroup.mapGL ℝ :
    SL(2, ℤ) →* GL (Fin 2) ℝ)).range

/-- Restated identically to U7's `orbEulerChar` (SmallArith/Challenge.lean:28). -/
def orbEulerChar (g : ℕ) (cones : List ℕ) (n : ℕ) : ℚ :=
  2 - 2 * g - (cones.map fun m : ℕ => 1 - 1 / (m : ℚ)).sum - n
```

**Proposed signatures.**
```lean
/-- **L:RZ-14b (i)** — RZ §2.4, (2.8): the standard domain 𝒟 is a fundamental domain for the
modular group acting on ℍ (as its image in PGL(2, ℝ), so that −1 acts as 1), and vol(X(1)) — the
covolume of that action for the measure dx dy / y² — is π/3. -/
theorem rz_14b_vol_X1 :
    MeasureTheory.IsFundamentalDomain RZ.modularPGL ModularGroup.fd ∧
    MeasureTheory.covolume RZ.modularPGL ℍ = ENNReal.ofReal (Real.pi / 3) := by
  sorry

/-- **L:RZ-14b (ii), arithmetic leg** — "the Gauss–Bonnet value for the (2, 3, ∞) orbifold":
χ(2, 3, ∞) = −1/6 and −2π·χ = π/3. The orbifold Gauss–Bonnet theorem (area = −2π·χ) is CITED,
NOT CHECKED. -/
theorem rz_14b_gaussBonnet_value :
    orbEulerChar 0 [2, 3] 1 = -1 / 6 ∧
    -2 * Real.pi * (orbEulerChar 0 [2, 3] 1 : ℝ) = Real.pi / 3 := by
  sorry
```
(The first conjunct of the second theorem repeats `rz_44a_orbifold_euler_arith`'s first conjunct on the restated definition, so the value −2π·χ is tied to the checked χ; CO may drop it if the restated definition is judged enough.)

**Proof route for L.** (i): `IsFundamentalDomain.mk''` — null-measurability (𝒟 closed, `ModularGroup.isClosed_fd`, Modular.lean:812); cover from `exists_smul_mem_fd`; for g ≠ 1 in the image, g·𝒟 ∩ 𝒟 ⊆ boundary of 𝒟 by `eq_one_or_neg_one_of_mem_fdo_mem_fd` (both ±1 map to 1), and the boundary (two vertical half-lines and an arc) is null; quasi-measure-preservation from the GL-invariance instance. Then `covolume_eq_volume` (needs `Countable`, `MeasurableConstSMul`, `SMulInvariantMeasure` for the subgroup — supplied by L) and L:RZ-14a. (ii): `norm_num [orbEulerChar]`.

## 6 · What the row does not claim
- **The orbifold Gauss–Bonnet theorem** — CITED, NOT CHECKED (above). Nor that X(1) is an orbifold with cone points of orders 2, 3 and one cusp as a geometric object (the stabilizer orders are L:RZ-43/55, U4).
- **(2.9) π = 3·vol(X(1))** — L:RZ-15 (`rz_15_geometryConstant_writings`, CHECKED with vol as a hypothesis; this row discharges that hypothesis).
- **The integral itself** — L:RZ-14a.
- **"The Harmonic eigenvalue π is thus read off the area of the home surface"**, "object-intrinsic … exactly generic", "the least field-distinctive of the four provenances" — interpretive.
- X(1) as "the moduli space of elliptic curves" — L:RZ-01 (EFFORT-FAR).

## 7 · Status
SPEC-DRAFT 2026-10-28T20:39:06Z

V1: V1-GREEN (i) + V1-GREEN (ii-arith) + V1-SPLIT-OK 2026-10-28T20:46:10Z — read against served p08 (2.8)–(2.9) before the spec. **(i) Judgment on the reading:** the covolume leg says what "vol(X(1)) = π/3" prints. The group is the image of SL(2, ℤ) in PGL(2, ℝ) (≅ PSL(2, ℤ), acting through the PGL instance, MoebiusAction.lean:270, with pglMk_smul agreeing with SLAction). That is X(1) = SL(2, ℤ)\ℍ with −1 acting trivially. The first conjunct (𝒟 is a fundamental domain) rules out covolume's "0 if none exists" default, and under the measure's invariance (true; transported from the GL(2, ℝ) instance, Measure.lean:89) every fundamental domain has the same area. So covolume = π/3 is the domain-independent area of the quotient, which is the printed claim. It needs no Gauss–Bonnet. **(ii) Split:** "the Gauss–Bonnet value for the (2, 3, ∞) orbifold" splits faithfully. The number −2π·χ(0; 2, 3; 1) = −2π(−1/6) = π/3 is reachable, on orbEulerChar restated identically to U7 (SmallArith/Challenge.lean:28). With (i) it gives vol(X(1)) = −2π·χ as numbers. What stays CITED, NOT CHECKED is the general orbifold Gauss–Bonnet theorem; that label should also name X(1)'s signature (genus 0, one cusp, beyond the stabilizer orders L:RZ-43/55 carry), which the spec's §6 already disclaims (a label refinement, not a drift). Guards: π/3 = 1.0471975511965977…, equal to −2π(−1/6) and to the 14a integral. Note for L, not blocking: L:RZ-15's hypothesis is a real vol, so the discharge goes through (covolume …).toReal = π/3.

V2: V2-GREEN (i) + V2-GREEN (ii-arith) 2026-10-28T21:03:32Z — rz_14b_vol_X1: IsFundamentalDomain ↥RZ.modularPGL fd volume ∧ covolume ↥RZ.modularPGL ℍ volume = ofReal (π/3). The covolume (FundamentalDomain.lean:680) is 'some fundamental domain's volume, else 0'; the first conjunct and π/3 ≠ 0 exclude the default, and GL-invariance (Measure.lean:89) makes the value domain-independent, so this is vol(X(1)) as printed at p08. The subgroup acts by Subgroup.instMulAction, g • z = (g : PGL) • z (rfl probe), via mulActionOfGL (MoebiusAction.lean:270). rz_14b_gaussBonnet_value: orbEulerChar 0 [2, 3] 1 = −1/6 ∧ −2π·χ = π/3, on orbEulerChar byte-identical to U7. (ii-thm) orbifold Gauss–Bonnet for X(1) of signature (0; 2, 3; 1) is CITED, NOT CHECKED, with no theorem; the label is carried in the module doc, the (ii-arith) docstring, the yaml cited: block and the BUILD-LOG. Theorem texts = spec §5. Guards: χ = −1/6, −2πχ = π/3. Signed digest b2552d65.

L-proofs: PROVED 2026-10-28T21:35:28Z — `rz_14b_vol_X1` (IsFundamentalDomain.mk'': cover, boundary null on two lines and the unit circle, GL-invariance; covolume_eq_volume with `rz_14a_area_fd`) and `rz_14b_gaussBonnet_value` (`norm_num`) in `RiemannZeta/Provenance/Solution.lean`; (ii-thm) stays CITED, NOT CHECKED; axioms [propext, Classical.choice, Quot.sound] each; BUILD-LOG §Proofs phase.

V3: V3-CLEAN 2026-10-28T21:42:04Z — rz_14b_vol_X1 is a real fundamental domain for the faithful action (PSL(2, ℤ) as the image in PGL(2, ℝ); −1 is quotiented, not degenerate), with GL-invariance and a null boundary, so covolume = area of 𝒟 = π/3 and the junk 0 is excluded. rz_14b_gaussBonnet_value is arithmetic on orbEulerChar only. No theorem claims area = −2πχ, and (ii-thm) stays CITED, NOT CHECKED, with its label carried. Axioms standard. Sheet `specs/_V3-U9.md`.
