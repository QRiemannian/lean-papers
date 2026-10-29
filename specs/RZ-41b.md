# CC-CANDIDATE — L:RZ-41b — the §7.1 table's Parabolic row and "its elements classify into three types"

**CC-CANDIDATE: γ = ±I ∈ SL(2, ℤ) have |tr(γ)| = 2 but act on ℍ as the identity — they fix every point of ℍ and of ∂ℍ, not "a single boundary point" — so the printed Parabolic row (|tr(γ)| = 2 ⇒ fixes a single boundary point) and the claim that SL(2, ℤ)'s elements classify into the three types are false at ±I.** The row is stopped here, not repaired; it stays OPEN and uncounted pending the correction track (plan §4 step 3).

1. **Header**
   - row: `L:RZ-41b` (split from `L:RZ-41`; siblings `L:RZ-41a` (Hyperbolic and Elliptic rows, specced), `L:RZ-41c` (action normal forms, OUT-OF-Q5 pending the wall))
   - unit: U4 `RiemannZeta/MatricesMobius`
   - paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
   - pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
   - locus: §7.1 "The key identification", the sentence introducing the table and the table's Parabolic row; served PDF p17 (printed folio 16).
   - spec_clock: 2026-10-28T17:17:25Z

2. **Printed statement, verbatim**

   > The modular group SL(2, ℤ) acts on ℍ = {z ∈ ℂ : Im(z) > 0} by Möbius transformations; its elements classify into three types by fixed-point behavior:
   >
   > | Conjugacy class | Condition | Action on ℍ |
   > |---|---|---|
   > | … | … | … |
   > | Parabolic | \|tr(γ)\| = 2 | Fixes a single boundary point (cusp) |

3. **The defect, with its witness (not a repair)**
   - I and −I lie in SL(2, ℤ), have trace 2 and −2, so |tr| = 2: by the Condition column they are Parabolic.
   - Both act on ℍ (and on ∂ℍ) as the identity map: mathlib `UpperHalfPlane.forall_smul_eq_self_iff_mem_center` (Mathlib.Analysis.Complex.UpperHalfPlane.FixedPoints) — a matrix acts trivially on ℍ iff it is central (scalar); on `OnePoint ℝ`, `Matrix.GeneralLinearGroup.fixpointPolynomial_eq_zero_iff` (FinTwo.lean) — the fixed-point polynomial vanishes identically iff the matrix is scalar. So ±I fix every boundary point, not a single one.
   - Hence, read as printed — every element of SL(2, ℤ) belongs to one of three types characterised by the Condition column and the Action column — the statement fails at γ = ±I. mathlib's own `Matrix.IsParabolic` (FinTwo.lean:40) carries the exclusion explicitly: `m ∉ Set.range (scalar _) ∧ m.discr = 0`.
   - Kin in the same paper: §7.2 (`L:RZ-43a`) already prints that −I "is central and not elliptic"; the §7.1 table does not carry the matching exclusion for the |tr| = 2 row.
   - The one-directional statement "a parabolic element (non-scalar, |tr| = 2) fixes exactly one point of ∂ℍ and none of ℍ" is true (mathlib `Matrix.GeneralLinearGroup.IsParabolic.smul_eq_self_iff`, ProjectiveLine.lean:191); whether the correction prints "for γ ≠ ±I", or restricts the classification to non-central elements, or works in PSL(2, ℤ) with ±I identified, is the correction track's choice, not this seat's.

4.–6. Not written: the row is stopped at CC-CANDIDATE (brief rule: "write CC-CANDIDATE at the top of its spec with the one-line defect, stop the row").

7. **Status line**
   - `STOPPED — CC-CANDIDATE 2026-10-28T17:17:25Z` (OPEN, uncounted; listed in `specs/_UNIT-U4.md`)

V1: V1-CC 2026-10-28T17:29:27Z — AGREE with M's CC-CANDIDATE. Served p17 prints 'its elements classify into three types by fixed-point behavior' with Parabolic := '|tr(γ)| = 2 — Fixes a single boundary point (cusp)'; ±I ∈ SL(2, ℤ) have |tr| = 2 and fix every point. A defect of the printed text, not an implicit convention the track waves through: (1) the sentence quantifies over 'its elements'; (2) the served edition itself does not hold the non-scalar convention implicitly — it prints the −I exclusion explicitly two paragraphs later (§7.2, 'the only element of order 2, −I, is central and not elliptic', the CC-2 repair) and §7.5 lists 'the identity contribution' as a fourth term beside the three class types, so the §7.1 table is the one place where ±I falls into a row and makes a false fixed-point claim. Minimal repair for the track: 'its non-central elements (γ ≠ ±I)'. Echo for the track: §7.2 'Parabolic → Dimensional. Parabolic elements fix a single boundary point' (p18) inherits the table's definition and is true once the table is repaired; RZ-83's non-scalar reading depends on the same repair. OPEN, uncounted.

V2: N/A — no theorem 2026-10-28T17:50:42Z — V1-CC (CC-16), on the correction track; nothing in Challenge.lean to read for this row, uncounted.

## M — the corrected claim (2026-10-28T22:40:59Z; the wall's word of 2026-10-28, lane 1)

*Seat M (statement author) for the corrected leg, dispatched by Orchestrator A under `Orchestrator/Chat-Design/cc-handoff/projects/priority/inbox/WORD-wall-2026-10-28-night-words.md`, lane 1. The CC-CANDIDATE text above is kept as written; this section specs the claim as the RZ draft seat is correcting it (CC-16). Unit: **U11 `RiemannZeta/Corrected`** (new; see `specs/_UNIT-U11.md`), not an amendment of U4. The flip of this row waits on the wall's read of the correction drafts.*

### 1 · Header
- row: L:RZ-41b (sub-row of L:RZ-41; siblings L:RZ-41a CHECKED in U4, L:RZ-41c proved beyond the agreed scope in U4)
- unit: **U11** `RiemannZeta/Corrected`
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256 (the edition read): `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54` (re-hashed by this seat at 2026-10-28T22:35:43Z, match). **The corrected edition is not yet served**; its sha256 replaces this one in the docstring and in V₁'s read when the republish lands.
- locus: §7.1 "The key identification", the sentence introducing the table and the table's Parabolic row, PDF p17 (printed folio 16); echo §7.2 "Parabolic → Dimensional", PDF p18
- spec_clock: 2026-10-28T22:40:59Z

### 2 · Printed statement — the corrected wording, verbatim
As served at `2d5287e7` (p17): "The modular group SL(2, ℤ) acts on ℍ = {z ∈ ℂ : Im(z) > 0} by Möbius transformations; its elements classify into three types by fixed-point behavior:" … "Parabolic | |tr(γ)| = 2 | Fixes a single boundary point (cusp)".

As corrected (CC-16; the wording the RZ draft seat is applying, corroborated by V₃-U4 W1):
> "The modular group SL(2, ℤ) acts on ℍ = {z ∈ ℂ : Im(z) > 0} by Möbius transformations; its elements other than ±I classify into three types by fixed-point behavior:"
>
> | Conjugacy class | Condition | Action on ℍ |
> |---|---|---|
> | Hyperbolic (generic) | \|tr(γ)\| > 2 | Dilation along a geodesic |
> | Elliptic | \|tr(γ)\| < 2 | Rotation about a fixed point |
> | Parabolic | \|tr(γ)\| = 2, γ ≠ ±I | Fixes a single boundary point (cusp) |

V₁ reads the corrected text against the republished edition when it lands; if the served wording differs, the spec is re-read against it before the flip.

### 3 · Formal reading
- **Carrier, action, types:** as L:RZ-41a (frozen in U4): γ ∈ SL(2, ℤ) acting on ℍ through `UpperHalfPlane.SLAction` (= Möbius action of `Matrix.SpecialLinearGroup.mapGL ℝ γ`), and on ∂ℍ = ℝ ∪ {∞} = `OnePoint ℝ` through `g := mapGL ℝ γ` (`OnePoint.instGLAction`); types are mathlib's discriminant predicates on the integer matrix m of γ: `Matrix.IsHyperbolic` (0 < discr), `Matrix.IsElliptic` (discr < 0), `Matrix.IsParabolic` (discr = 0 ∧ m not scalar) — mathlib's own parabolic predicate carries the non-scalar clause, which on SL(2, ℤ) is exactly γ ≠ ±I.
- **"its elements other than ±I classify into three types"** = for γ ≠ 1, γ ≠ −1: **exhaustive** (γ is hyperbolic, parabolic or elliptic) and **exclusive** (no two at once).
- **"by … Condition"** = the trichotomy is read by trace: for non-central γ, hyperbolic ⇔ |tr| > 2, parabolic ⇔ |tr| = 2, elliptic ⇔ |tr| < 2. The hyperbolic and elliptic equivalences restate L:RZ-41a (i) under the extra hypothesis; they are carried so the row states the trichotomy by its printed Condition column in one place.
- **"Conjugacy class"** header, Parabolic row: parabolicity is invariant under conjugation in SL(2, ℤ) (for every γ; no hypothesis needed).
- **"Fixes a single boundary point (cusp)", "by fixed-point behavior"**, read with the standard counts as in L:RZ-41a: a parabolic γ fixes **no point of ℍ** and **exactly one point of ∂ℍ**, and that point is **a cusp of SL(2, ℤ)**, i.e. lies in ℚ ∪ {∞} = ℙ¹(ℚ) (the cusp set of the modular group). The cusp clause is read as the parenthesis's content; it is the one part of this reading beyond the counts, and it is true (the fixed point is ∞ when the lower-left entry is 0, else (a − d)/(2c) ∈ ℚ; mathlib's `parabolicFixedPoint` is exactly this formula).
- **The boundary action is at the pin** (`OnePoint.instGLAction`, ProjectiveLine.lean:128; `Matrix.GeneralLinearGroup.IsParabolic.smul_eq_self_iff`, :191). So the fixed-point reading is **stated in Lean**, not left to the docstring; no part of the printed row is carried as a gloss.
- **What the leg adds beyond L:RZ-41a:** (1) the Parabolic row for non-central γ — its Condition (|tr| = 2), its class invariance, and its fixed-point behaviour (none in ℍ, exactly one on ∂ℍ, a cusp); (2) the trichotomy — exhaustiveness and exclusivity of the three types on SL(2, ℤ) ∖ {±I}, read by trace. L:RZ-41a carried only the hyperbolic and elliptic rows and made no claim that the types exhaust the elements.
- Check of the reading (not a proof): every γ ∈ SL(2, ℤ) with entries in [−6, 6], |tr| = 2 and γ ≠ ±I (104 elements) has a fixed-point quadratic of discriminant 0 when c ≠ 0, and a = d, b ≠ 0 when c = 0 — one boundary fixed point, rational or ∞ (`<scratchpad>/m-u11/check_chi.py`, second half).

### 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`; sitting-71 name form, namespaces confirmed and each `#check`ed through `lake env lean` on a scratch probe)
| declaration | kind | file:line | namespace |
|---|---|---|---|
| `Matrix.IsParabolic` | def | LinearAlgebra/Matrix/GeneralLinearGroup/FinTwo.lean:40 | `Matrix` (:33–:307) |
| `Matrix.IsHyperbolic` | def | FinTwo.lean:137 | `Matrix` |
| `Matrix.IsElliptic` | def | FinTwo.lean:140 | `Matrix` |
| `Matrix.isParabolic_conj_iff` | lemma | FinTwo.lean:46 | `Matrix` (GL-conjugation; `Matrix.GeneralLinearGroup.isParabolic_conj_iff` at :212 is the GL form) |
| `Matrix.GeneralLinearGroup.IsParabolic` | abbrev | FinTwo.lean:210 | `Matrix.GeneralLinearGroup` (:188–:305) |
| `Matrix.GeneralLinearGroup.fixpointPolynomial_eq_zero_iff` | lemma | FinTwo.lean:233 | `Matrix.GeneralLinearGroup` |
| `Matrix.discr_fin_two` | lemma | LinearAlgebra/Matrix/Charpoly/Disc.lean:42 | `Matrix` |
| `Matrix.discr_conj` | lemma | Charpoly/Disc.lean:29 | `Matrix` |
| `Matrix.trace_fin_two` | theorem | LinearAlgebra/Matrix/Trace.lean:220 | `Matrix` |
| `Matrix.det_fin_two` | theorem | LinearAlgebra/Matrix/Determinant/Basic.lean:807 | `Matrix` |
| `Matrix.SpecialLinearGroup.det_coe` | theorem | LinearAlgebra/Matrix/SpecialLinearGroup.lean:162 | `Matrix.SpecialLinearGroup` |
| `Matrix.SpecialLinearGroup.coe_mul` | theorem | LinearAlgebra/Matrix/SpecialLinearGroup.lean | `Matrix.SpecialLinearGroup` (`#check`ed) |
| `Matrix.SpecialLinearGroup.mapGL` | def | LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:284 | `Matrix.SpecialLinearGroup` |
| `UpperHalfPlane.SLAction` | instance | Analysis/Complex/UpperHalfPlane/MoebiusAction.lean:285 | `UpperHalfPlane` (`MulAction.compHom ℍ (mapGL ℝ)`) |
| `UpperHalfPlane.gl_smul_eq_self_iff_quadratic` | theorem | Analysis/Complex/UpperHalfPlane/FixedPoints.lean:115 | `UpperHalfPlane` (:38–:214) |
| `UpperHalfPlane.isElliptic_of_exists_smul_eq_self` | theorem | FixedPoints.lean:122 | `UpperHalfPlane` |
| `OnePoint.instGLAction` | instance | Topology/Compactification/OnePoint/ProjectiveLine.lean:128 | `OnePoint` (:77–:165) |
| `OnePoint.smul_infty_eq_ite`, `OnePoint.smul_some_eq_ite` | lemmas | ProjectiveLine.lean:142, :151 | `OnePoint` |
| `Matrix.GeneralLinearGroup.parabolicFixedPoint` | def | ProjectiveLine.lean:188 | `Matrix.GeneralLinearGroup` (:167–:244) |
| `Matrix.GeneralLinearGroup.IsParabolic.smul_eq_self_iff` | lemma | ProjectiveLine.lean:191 | `Matrix.GeneralLinearGroup` |

Name-check hit pasted with its namespace (sitting-71 form, real tree): `Mathlib/Topology/Compactification/OnePoint/ProjectiveLine.lean:191:lemma IsParabolic.smul_eq_self_iff {g : GL (Fin 2) K} (hg : g.IsParabolic) [NeZero (2 : K)]`, innermost namespace `Matrix.GeneralLinearGroup` (opened :167, closed :244) → `Matrix.GeneralLinearGroup.IsParabolic.smul_eq_self_iff`; `#check`: `g.IsParabolic → ∀ [NeZero 2] {c : OnePoint K}, g • c = c ↔ c = g.parabolicFixedPoint`. Not at the pin: `Matrix.SpecialLinearGroup.center_eq_bot_or` (probe: unknown constant) — not needed; ±I is handled by entries. No gap.

### 5 · Intended Lean statement
Prose: for γ ∈ SL(2, ℤ) with γ ≠ I and γ ≠ −I, with integer matrix m and real image g: γ is exactly one of hyperbolic, parabolic, elliptic; hyperbolic ⇔ |tr| > 2, parabolic ⇔ |tr| = 2, elliptic ⇔ |tr| < 2; parabolicity is conjugation-invariant in SL(2, ℤ); and a parabolic γ fixes no point of ℍ and exactly one point of ℝ ∪ {∞}, which is ∞ or rational.

```lean
/-- **L:RZ-41b** — RZ §7.1, as corrected (CC-16): "its elements other than ±I classify into three
types by fixed-point behavior", and the Parabolic row "|tr(γ)| = 2, γ ≠ ±I — Fixes a single
boundary point (cusp)". For γ ∈ SL(2, ℤ), γ ≠ ±I: exactly one of hyperbolic / parabolic /
elliptic holds, read by trace (|tr| > 2 / = 2 / < 2); parabolicity is a conjugacy-class
property; a parabolic γ fixes no point of ℍ and exactly one point of ℝ ∪ {∞}, a cusp (∞ or
rational).

Served locus: §7.1 "The key identification", the sentence introducing the table and its
Parabolic row, PDF p17 (printed folio 16). PDF sha256 prefix `2d5287e7` (the edition read; the
corrected edition's prefix replaces it at the republish). -/
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
```
(with `open scoped MatrixGroups` and `open UpperHalfPlane`, as in U4.) Compiled with `sorry` through `lake env lean` on a scratch probe (`<scratchpad>/m-u11/Probe.lean`, namespace `RiemannZeta.Corrected`): elaborates, only the `sorry` warning.

### 6 · What the row does not claim
- Not that ±I belong to any type, and not that they belong to none (the corrected sentence excludes them; it says nothing about them — mathlib's predicates happen to put ±I in no type, but the row does not state it).
- Not the hyperbolic/elliptic fixed-point counts or their class invariance (L:RZ-41a, frozen in U4), and not the action column as normal forms (L:RZ-41c).
- Not "cusp" in any sense beyond "a point of ℚ ∪ {∞}": not that every point of ℚ ∪ {∞} is fixed by some parabolic, not the single cusp of X(1), not cusp widths.
- Not the §7.2 echo "Parabolic elements fix a single boundary point — the cusp" or the cusp-filling conditional after it (other rows).
- Not the three-types-plus-distinguished-element pairing with the four operators ([C]; L:RZ-42), nor "(generic)" in any density sense.

### 7 · Proof route for L
1. Setup (mirror U4's `rz_41a` Solution block, Solution.lean:44–55): `hdetγ : m.det = 1` from `γ.2`; `hdisc : ∀ k : SL(2, ℤ), (k : Mat).discr = (k : Mat).trace ^ 2 - 4` by `Matrix.discr_fin_two` and `k.2`; `hconjtr` (trace conjugation-invariant) by `Matrix.trace_mul_comm` exactly as there.
2. Non-scalar ⇔ non-central: `hns : ∀ k : SL(2, ℤ), (k : Mat) ∈ Set.range (Matrix.scalar _) ↔ k = 1 ∨ k = -1` — (→) m = scalar r gives det = r² = 1 over ℤ, so r = ±1, then `Subtype.ext`; (←) r = ±1. Hence `m ∉ range scalar` from h₁, h₂.
3. Trace trichotomy over ℤ: with t = tr m, t² − 4 > 0 ⇔ 2 < |t|, = 0 ⇔ |t| = 2, < 0 ⇔ |t| < 2 (`sq_abs`, `abs_nonneg`, `nlinarith`/`Int` case split). Gives the three `↔` conjuncts (parabolic via 2's non-scalarity), then exhaustiveness (`lt_trichotomy` on the discriminant) and exclusivity (`lt_irrefl`, `lt_asymm` on the discriminant).
4. Conjugation: for h : SL(2, ℤ), (h γ h⁻¹).IsParabolic ↔ discr = 0 ∧ hγh⁻¹ ≠ ±1 (step 2 at k = hγh⁻¹); discr by `hdisc` and `hconjtr`; h γ h⁻¹ = ±1 ↔ γ = ±1 by group algebra (`mul_inv_eq_one`, `-1` central in SL(2, ℤ) — `neg_one` commutes with h). (Alternative: `Matrix.isParabolic_conj_iff` with `g := Matrix.SpecialLinearGroup.toGL h`, rewriting `(↑g)⁻¹` through `Matrix.coe_units_inv`.)
5. Transfer to ℝ: g = mapGL ℝ γ has entries the integer casts; `(g : Mat ℝ).discr = ((m.discr : ℤ) : ℝ)` (`Matrix.discr_fin_two`, `trace_fin_two`, `det_fin_two`, `push_cast`); g non-scalar (entries injective under the cast). So `g.IsParabolic` (GL form, FinTwo.lean:210) from `m.IsParabolic`.
6. No fixed point in ℍ: γ • z = g • z (`MulAction.compHom_smul_def`); by `UpperHalfPlane.gl_smul_eq_self_iff_quadratic` (det = 1 > 0), C z² + (D − A) z − B = 0. If C ≠ 0: (2Cz + (D − A))² = (D − A)² + 4BC = discr = 0, so z = (A − D)/(2C) ∈ ℝ, contradicting `z.im_pos`. If C = 0: discr = 0 forces A = D, then B = 0, so g scalar — contradicts step 5. (Alternative: `UpperHalfPlane.isElliptic_of_exists_smul_eq_self` with g ∉ centre, contradicting discr = 0.)
7. Exactly one boundary fixed point: c := `Matrix.GeneralLinearGroup.parabolicFixedPoint g`; `IsParabolic.smul_eq_self_iff` (ProjectiveLine.lean:191, `NeZero (2 : ℝ)` by `inferInstance`) gives `∀ c', g • c' = c' ↔ c' = c`. Watch the `DecidableEq ℝ` instance: the statement's action and `parabolicFixedPoint` both take one; if they elaborate to different instances, close with `convert … using 2` / `Subsingleton.elim`.
8. The cusp clause: unfold `parabolicFixedPoint`: if g 1 0 = 0 then `∞` (left disjunct); else the point is ((A − D)/(2C) : ℝ) with A, C, D integer casts — take q := ((m 0 0 − m 1 1 : ℤ) : ℚ) / (2 * (m 1 0 : ℚ)) and `push_cast` (right disjunct).
9. Assemble. Class E1 (0.5–1 pd); every lemma at the pin, the U4 Solution supplies the trace/conjugation pattern.

### 8 · Status
SPEC-DRAFT (corrected claim) 2026-10-28T22:40:59Z — unit U11; the flip waits on the wall's read of the correction drafts and on the republish. V₁ appends its own line.

## M — note at the landed draft (2026-10-28T22:46:46Z)
The RZ draft seat's landed text (`Orchestrator/Chat-Design/cc-handoff/projects/priority/outbox/CORRECTION-WAVE-2026-10-28/RZ-APPLIED.md`, CC-16 (a)/(b); draft PDF `RZ-DRAFT-riemann-zeta-tetrahedral-2026-10-28.pdf`, sha256 `1b2af75cc5975dea65088d6742aa55ef422afd9f5b0dedf0cf572c88af04c4e2`, read by `pdftotext -layout` p17–18) prints exactly the wording quoted in §2 of the section above: "its elements other than ±I classify into three types by fixed-point behavior:" (draft p17) and the Parabolic row "|tr(γ)| = 2, γ ≠ ±I — Fixes a single boundary point (cusp)", which in the draft breaks onto p18 under a repeated header (typography only; RZ-APPLIED item 2). The statement, reading and route above stand unchanged; at the republish the locus reads p17–18 if the break survives the ship build.

V1: V1-GREEN 2026-10-28T22:55:14Z — read against the correction DRAFT `1b2af75c` p17–18 (not served; re-read at the republish). Draft: "its elements other than ±I classify into three types by fixed-point behavior" and Parabolic "|tr(γ)| = 2, γ ≠ ±I — Fixes a single boundary point (cusp)". The hypotheses γ ≠ 1, γ ≠ −1 are the printed exclusion (±I fall in no mathlib type: discr 0 and scalar, probe-checked); exhaustive + exclusive is "classify into three types"; the trace equivalences carry the Condition column over mathlib's discriminant predicates; parabolic conjugation-invariance is the "Conjugacy class" header; no fixed point in ℍ and exactly one on OnePoint ℝ read as for the frozen rz_41a (same carrier, same transparent `let`s). Cusp decision: the ℚ ∪ {∞} clause is the parenthesis's content, not an added claim — the paper's X(1) has one cusp (§7.2, n_cusp = 1), whose boundary points are ℙ¹(ℚ), and §16 (draft p37) itself says "rational numbers correspond to the parabolic (cusp) data"; kept in Lean. Locus becomes p17–18 if the table break survives the ship build. Detail: `specs/_V1-U11.md`. The flip waits on the wall's read.

V2: V2-GREEN 2026-10-28T23:10:29Z — read against the correction DRAFT pass 2 `8346ab41` p17–18 (folios 16–17; not served — re-read at the republish), served `2d5287e7` p17–18 read first. "its elements other than ±I classify into three types by fixed-point behavior" = γ ≠ 1, γ ≠ −1 with exhaustive and pairwise-exclusive types; the Condition column = the three trace equivalences over mathlib's discriminant predicates (±I lie in no type, probe-checked); "Conjugacy class" = parabolic conjugation-invariance; the Parabolic row = no fixed point in ℍ and exactly one point of OnePoint ℝ, which is ∞ or rational — the cusp reading AGREED (§7.2 n_cusp = 1; §16.3 "rational numbers correspond to the parabolic (cusp) data"). Transparent `let`s. Signed at statement_sha256 `7f9a7838…8b1`. Detail: `specs/_V2-U11.md`. The flip waits on the wall's read.

L-proofs: PROVED 2026-10-28T23:21:00Z — `rz_41b_noncentral_trichotomy` in `RiemannZeta/Corrected/Solution.lean` (sha256 ce4df2f0…): discr = tr² − 4; the scalar elements of SL(2, ℤ) are exactly ±1 (det r² = 1); the three types, their exclusions and the trace readings from the sign of the discriminant; conjugation keeps the trace and {±1}; the ℍ and boundary claims by U4's rz_41a coordinate steps (a fixed point in ℍ forces a scalar matrix; the boundary fixed point is ∞ when c = 0, else (a − d)/(2c), rational) — the GL/parabolicFixedPoint route was not needed, so the DecidableEq question did not arise. Build exit 0, no warning; axioms [propext, Classical.choice, Quot.sound]. The row flip waits on the wall's read. Log: `RiemannZeta/Corrected/BUILD-LOG.md` §Proofs phase.

V3: V3-CLEAN 2026-10-28T23:27:56Z — post-proof fidelity, row-independent, against the served `2d5287e7` p17–18 and the correction DRAFT pass 2 `8346ab41` p17–18 (not served; re-read at the republish). True for the paper's reason: discr = tr² − 4 read by sign; the scalars of SL(2, ℤ) exactly ±1 (det r² = 1), which is where γ ≠ ±I enters (non-scalarity in `IsParabolic`); exhaustive and pairwise exclusive; conjugation keeps the trace and {±1}; a fixed point in ℍ forces a scalar matrix (division only by the proved-nonzero cz + d); the boundary fixed point is ∞ when c = 0, else (a − d)/(2c) ∈ ℚ, with uniqueness proved (∀ c', g • c' = c' ↔ c' = c), under mathlib's genuine Möbius action `OnePoint.instGLAction`. The prover's coordinate route in place of the spec's `parabolicFixedPoint` route changes nothing: the statement is byte-identical to the frozen Challenge (own script). Axioms standard. Detail: `specs/_V3-U11.md`. The flip waits on the wall's read.
