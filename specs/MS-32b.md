# L:MS-32b — the field form: g_c = 1/(π√d_K) is maximal over the whole real-quadratic family at d_K = 5 — OUT-OF-Q5 (pending the wall)

## 1 · Header
- row: L:MS-32b (split from L:MS-32; sibling L:MS-32a in scope). **OUT-OF-Q5 (pending the wall)** — inherits L:RZ-13 (EFFORT, 12 pd).
- unit: U8 (`ModularSurface/Now`)
- paper: MS — *The Invariant Structure of the Modular Surface* (2026, revised October 2026)
- pdf_sha256: `b4841489ec6bea619f8d5525ce4c788b86e0109e51d6e9d2cb252690f5b13af5`
- locus: §3.4, served PDF p13 (printed folio 12). Re-key change class: UNCHANGED.
- spec_clock: 2026-10-28T17:39:11Z

## 2 · Printed statement, verbatim
§3.4 (p13): "Written form-independently, g_c = 1/(π√d_K) is a field certificate, and ℚ(√5) has the smallest discriminant of any real quadratic field — the ladder runs 5, 8, 12, 13, 17, 21, … [CV]. Hence g_c attains its maximum over the whole real-quadratic family at d_K = 5"

## 3 · Formal reading
- A real quadratic field: a number field K with [K : ℚ] = 2 that is totally real. d_K is its discriminant (`NumberField.discr K : ℤ`, positive for real quadratic K).
- Claims: (i) every real quadratic field has d_K ≥ 5, and ℚ(√5) has d_K = 5 (the "[CV]" premise — this is L:RZ-13's statement); (ii) hence g(d_K) ≤ g(5) for every real quadratic K, with g(d) = 1/(π√d) (`ms32Gc` of L:MS-32a).
- Why out of Q5: (i) needs the discriminant of every real quadratic field (d or 4d by the residue of the squarefree parameter mod 4), which is not at the pin (L:RZ-13's gap). Given (i), (ii) is one line of monotonicity.

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
| declaration | kind | module (file:line) |
|---|---|---|
| `NumberField` | class | Mathlib.NumberTheory.NumberField.Basic (Basic.lean:44) |
| `NumberField.discr` | abbrev | Mathlib.NumberTheory.NumberField.Discriminant.Defs (Defs.lean:36) |
| `NumberField.IsTotallyReal` | class | Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex (TotallyRealComplex.lean:47) |
| `Module.finrank` | def | Mathlib.LinearAlgebra.Dimension.Finrank (Finrank.lean:62) |
| `Real.sqrt_le_sqrt` | theorem | Mathlib.Analysis.Real.Sqrt (Sqrt.lean:209) |
**NEEDS-DEVELOPMENT** (inherited from L:RZ-13): the discriminant of a quadratic field (d or 4d) / the lower bound d_K ≥ 5 for real quadratic K, and the discriminant 5 of a concrete ℚ(√5) (the attainment conjunct) — absent at the pin. `QuadraticAlgebra` (Mathlib.Algebra.QuadraticAlgebra.Defs, Defs.lean:38) is present as a candidate model.

## 5 · Intended Lean statement
Prose: every real quadratic field K has g(d_K) ≤ g(5); and the maximum is attained — some real quadratic field has d_K = 5.

```lean
/-- L:MS-32b — MS §3.4, served p13 (sha256 b4841489…3af5), field form: "g_c attains its maximum
over the whole real-quadratic family at d_K = 5" — the bound and its attainment.
OUT-OF-Q5 (pending the wall); inherits L:RZ-13. `ms32Gc` as in L:MS-32a. -/
theorem ms_32b_certificate_max_fields :
    (∀ (K : Type) [Field K] [NumberField K] [NumberField.IsTotallyReal K],
        Module.finrank ℚ K = 2 → ms32Gc (NumberField.discr K) ≤ ms32Gc 5) ∧
    (∃ (K : Type) (_ : Field K) (_ : NumberField K) (_ : NumberField.IsTotallyReal K),
        Module.finrank ℚ K = 2 ∧ NumberField.discr K = 5) := by sorry
```
(The second conjunct is the printed attainment, stated here because its would-be carriers L:RZ-09 / L:RZ-13 have no spec on disk. Route for L, not a claim: a concrete model of ℚ(√5) — e.g. `QuadraticAlgebra ℚ 5 0` (Mathlib.Algebra.QuadraticAlgebra.Defs, Defs.lean:38) or the real subfield of ℚ(ζ₅) — with its discriminant computed; no discriminant of any quadratic field is at the pin, so this conjunct is NEEDS-DEVELOPMENT with the bound. The universe is fixed at `Type` so the existential is well-formed.)

## 6 · What the row does not claim
- Not the integer-ladder statement or the next-rung value (L:MS-32a).
- Not "a fact about the ordering of number fields, not about the modular surface" (reading).

## 7 · Status
SPEC-DRAFT 2026-10-28T17:39:11Z

V1: V1-SPLIT-OK + V1-DRIFT 2026-10-28T17:51:21Z — the split is right and OUT-OF-Q5 agreed (inherits L:RZ-13). DRIFT (weaker, uncounted): the print's "attains its maximum over the whole real-quadratic family at d_K = 5" carries attainment, and the spec's own §3 lists "ℚ(√5) has d_K = 5" as claim (i), but the Lean statement carries only the bound. The cited carriers L:RZ-09 / L:RZ-13 have no spec on disk. Back to M before any lift: add the attainment conjunct (a real quadratic K with discr K = 5) or name a specced carrier.

M-amend: 2026-10-28T17:56:09Z — restated per `_V1-U8.md` (MS-32b DRIFT, weaker than the print): the printed attainment ("attains its maximum … at d_K = 5") is added to the Lean statement as a second conjunct — a real quadratic K (`Type`, totally real, finrank 2) with `NumberField.discr K = 5` exists — because the carriers previously cited (L:RZ-09, L:RZ-13) have no spec on disk; the bound is restated as a ∀ over K in the same theorem. Scope unchanged: OUT-OF-Q5 (pending the wall), inherits L:RZ-13. The SPEC-DRAFT and V1 lines above are kept as written.

V1: V1-GREEN 2026-10-28T17:58:10Z — re-read served p13 (sha256 re-verified): "Hence g_c attains its maximum over the whole real-quadratic family at d_K = 5". The amended statement carries the bound and the attainment, no stronger and no weaker. The bound is ∀ totally real K with finrank ℚ K = 2, g(d_K) ≤ g(5) — "real quadratic" exactly. The attainment is ∃ such K with discr K = 5, which is "attains … at d_K = 5"; uniqueness is not printed and correctly not stated. That the field is ℚ(√5) is the [CV] premise (L:RZ-13), not the "Hence" clause. Typing: binding K at `Type` keeps the existential well-formed, and the field instances in the ∃ binders are local instances. OUT-OF-Q5 (inherits L:RZ-13) unchanged and agreed. The earlier DRIFT is closed.

V2: V2-GREEN 2026-10-28T18:07:40Z — (OUT-OF-Q5, stated) ms_32b_certificate_max_fields says what p13 prints in field form. For every real quadratic K (Type, totally real, finrank ℚ K = 2), g(d_K) ≤ g(5), and some such K has discr K = 5 ("attains its maximum … at d_K = 5"). Uniqueness of the field is not printed and not stated. Integer-form uniqueness lives in 32a, so the two rows do not disagree. The ∃-bound instance binders elaborate as local instances (BUILD-LOG inspect).

- **Note 2026-10-28T21:36:22Z (Orchestrator A, from the U9 proofs seat's return):** the bound this leg left frozen — excluding d_K = 4 for a real quadratic field — closed at the pin in U9's `rz_13_min_real_quadratic_discr` by a δ = den·(2α + c₁) route (δ integral, δ ∉ ℚ, δ² = D, discr(1, δ) = 4D = m²·d_K; see `RiemannZeta/Provenance/BUILD-LOG.md` §Proofs phase). ms_32b is a revisit candidate on the same route; its statement stays frozen as signed until an M/V₂ pass reopens it.

## M revisit — 2026-10-28T22:33:11Z (the wall's word 3, 2026-10-28)

Seat M, the authorized revisit ("One fresh M/V₂ pass re-freezes the statement on the δ route U9 found, then proof, V₃, gate"). Read before any Lean: served PDF sha256 `b4841489…3af5` re-checked with `shasum -a 256`; `pdftotext -layout` p13 prints "Hence 𝑔𝑐 attains its maximum over the whole real-quadratic family at 𝑑𝐾 = 5" after "ℚ(√5) has the smallest discriminant of any real quadratic field — the ladder runs 5, 8, 12, 13, 17, 21, … [CV]". `Challenge.lean` sha256 at this read: `648a9eecd38f30ab6be4905c53fee7d7f41e1fafb57930717037f44da308f2f2` (= `statement_sha256`).

### Decision: STANDS
The frozen `ms_32b_certificate_max_fields` stands byte for byte. No change to `Challenge.lean`, so `statement_sha256` and the V₂ signature are unchanged. The V₂ pass is a confirmation against the existing signature, and it needs no `_superseded` keys (the rz_46a precedent applies only to a changed statement). Reason, point by point:
- **Bound conjunct.** The bound reads `ms32Gc (NumberField.discr K) ≤ ms32Gc 5` over every K with `Field`, `NumberField`, `NumberField.IsTotallyReal` and `finrank ℚ K = 2`, which is "real quadratic" exactly. `ms32Gc` is L:MS-32a's g(d) = 1/(π√d), and `discr K : ℤ` is cast to ℝ. It is the printed maximum, with no strict inequality and no uniqueness, so it is neither stronger nor weaker than "attains its maximum … at d_K = 5". The δ route proves `5 ≤ discr K`, and the bound is that fact composed with antitonicity of g. The δ route's own conclusion is RZ-13's statement, not this row's, so nothing in it asks the statement to change.
- **Universe.** `K : Type` (universe 0) against RZ-13's `Type u`. It does not need to change. "The whole real-quadratic family" is a family of fields up to isomorphism, and every number field has an isomorphic copy in `Type` (for example inside ℂ, or as ℚ[X]/(f)). `NumberField.discr` is an isomorphism invariant, so the ∀ at `Type` covers every member of the printed family. The polymorphic form is a Lean-side generality the print does not ask for. It would also force the ∃ conjunct either into `ULift` or onto a separate universe, which costs a re-signature and gains no content. `Type` is U8's chosen convention, and it stands.
- **Attainment conjunct.** `∃ (K : Type) (_ : Field K) (_ : NumberField K) (_ : NumberField.IsTotallyReal K), finrank ℚ K = 2 ∧ discr K = 5` is the "Hence" clause's attainment. V₁'s 17:58:10Z reading still holds: that the field is ℚ(√5) belongs to the [CV] premise (L:RZ-13), not to the "Hence" clause. U9's concrete ℚ(√5) form is RZ-13's own statement. Here it is the witness the proof supplies, not a conjunct the row must carry. The instance binders elaborate as local instances (U8 BUILD-LOG, inspect, 18:00:22Z).

### Route for the proofs seat (U8 RESTATES and never imports; every helper a `have` inside the proof, no new top-level declaration, so the block comparison against Challenge keeps its shape)
A full proof assembled on this route elaborates at the pin. Probe: `<scratchpad>/m-ms32b/probe_full.lean`, sha256 `3b1b487c…7f24`. It holds `ms32Gc` plus the Challenge's docstring and statement for ms_32b taken from `Challenge.lean` by `sed`, and the proof. Run with `lake env lean` 22:32:53Z → 22:33:00Z: exit 0, no warnings, no errors, and `#print axioms` gives `[propext, Classical.choice, Quot.sound]`. The probe is a prototype. The proofs seat writes and builds the module itself.
1. **Opens inside the tactic block.** The Challenge carries no `open … in` before the theorem, so the proof body opens with `open IntermediateField NumberField Polynomial in (` and closes with `)`. The `ℚ⟮…⟯` notation and the unqualified `InfinitePlace`, `nrComplexPlaces_eq_zero_iff`, `X`, `C` resolve this way. Then `refine ⟨?_, ?_⟩`.
2. **Bound, the δ route.** `· intro K _ _ _ hK2`, then `have h5le : 5 ≤ NumberField.discr K := by` with the body copied verbatim from `RiemannZeta/Provenance/Solution.lean` **lines 1035–1160**, indented two more columns. That runs from `have hr2 …` through `linarith`: r₂ = 0, d_K > 0 by `sign_discr`, d_K ≥ 4 by `abs_discr_ge'`, `suffices discr K ≠ 4`, then the δ = den(D₀)·(2α + c₁) construction, Tr, discr(1, δ) = 4D = m²·d_K, and the contradiction. The copy is labelled in a comment as from U9's `rz_13_min_real_quadratic_discr` (∀ conjunct).
3. **Bound, monotonicity.** `have h5R : (5 : ℝ) ≤ (NumberField.discr K : ℝ) := by exact_mod_cast h5le`, `unfold ms32Gc`, `apply one_div_le_one_div_of_le (by positivity)`, `exact mul_le_mul_of_nonneg_left (Real.sqrt_le_sqrt h5R) Real.pi_pos.le`. Pin declarations (sitting-71 form, `grep -rn` under `.lake/packages/mathlib/Mathlib/`):
   - `one_div_le_one_div_of_le` (root namespace) — `Algebra/Order/Field/Basic.lean:69: theorem one_div_le_one_div_of_le (ha : 0 < a) (h : a ≤ b) : 1 / b ≤ 1 / a := by`
   - `Real.sqrt_le_sqrt` (namespace `Real`) — `Analysis/Real/Sqrt.lean:209: theorem sqrt_le_sqrt (h : x ≤ y) : √x ≤ √y := by`
   - `Real.pi_pos` (namespace `Real`) — `Analysis/SpecialFunctions/Trigonometric/Basic.lean:157: theorem pi_pos : 0 < π :=`
   - `mul_le_mul_of_nonneg_left` (root namespace) — `Algebra/Order/GroupWithZero/Defs.lean:226: theorem mul_le_mul_of_nonneg_left [PosMulMono α] (hbc : b ≤ c) (ha : 0 ≤ a) : a * b ≤ a * c :=`
   - `positivity` closes `0 < π * √5`, using `Real.sqrt_pos` at `Analysis/Real/Sqrt.lean:286` and `Real.pi_pos` through the positivity extension.
4. **Attainment, the local instance.** U8's Challenge has no `numberField_Q_sqrt5`, and the Solution adds no top-level declarations. So the instance enters as `let _ : NumberField ℚ⟮(√5 : ℝ)⟯ := { to_finiteDimensional := … }`, with the field body copied from `RiemannZeta/Provenance/Solution.lean` **lines 33–37** (U9's byte-identical restatement of U4's instance). Use `let`, not `letI`: the probe's first run raised the `linter.style.haveILetI` warning on `letI` ("the goal is a proposition, so `let` is preferred"), and the `let` form clears it.
5. **Attainment, the power basis and the real place.** Copy verbatim from `RiemannZeta/Provenance/Solution.lean` **lines 1163–1316**, from `have h5 …` through the `hnrC` block's `omega`. This is U4's power-basis computation, which U9 copied from `RiemannZeta/MatricesMobius/Solution.lean` 1831–1970: θ = (5 + √5)/2, Eisenstein at 5, ℤ[θ] = 𝓞_K, `hdiscK : NumberField.discr K = 5`, `hfin : finrank ℚ K = 2`, then `hreal` and `hnrC` for the real place. Line 1161's bullet comment is replaced by this unit's own comment. The `set K := ℚ⟮(√5 : ℝ)⟯ with hK` inside meets no K in the goal, because the goal's K is ∃-bound, so it is harmless.
6. **Close.** `exact ⟨K, inferInstance, inferInstance, nrComplexPlaces_eq_zero_iff.mp hnrC, hfin, hdiscK⟩)`. The second `inferInstance` picks up the step-4 `let`, the same instance `hdiscK` was stated under. In place of U9's line 1317 (`exact ⟨nrComplexPlaces_eq_zero_iff.mp hnrC, hfin, hdiscK⟩)`) the ∃ is packed.
7. **Records the proofs seat touches** (not this seat): Solution's module docstring drops ms_32b from the left-out list. `comparator.json` `theorem_names` gains `ModularSurface.Now.ms_32b_certificate_max_fields`. In `formalization.yaml` the L:MS-32b row goes STATED → PROVED with scope kept OUT-OF-Q5, its `statements_not_checked` entry is retired, `proofs_phase` counts move, and `statement_sha256` is unchanged. In the BUILD-LOG, the copy is declared as a departure with the two U9 line ranges and their own U4 provenance.

### Universe and attainment answers
- `ℚ⟮(√5 : ℝ)⟯` lives in `Type`. Probe output: `↥ℚ⟮√5⟯ : Type` (an `IntermediateField ℚ ℝ` coerced to its carrier, ℝ : Type). The ∃ at `Type` is met by U9's concrete field with no `ULift`.
- What U8 restates from U9 for the attainment: the instance body of `numberField_Q_sqrt5` (as a `let`, step 4) and the power-basis plus real-place steps (step 5). Nothing else: `RZ.phi` and `RZ.phiSq` are not needed.
- The bound uses only the universe-0 case of RZ-13's argument. The copied steps are universe-agnostic, and in the probe they elaborate at `K : Type` unchanged.

### Scope line
L:MS-32b lands in the **proved-beyond-scope class** (OUT-OF-Q5, proved), per the wall's word 3. The in-scope count is unchanged by it. OUT-OF-Q5 (pending the wall) stays as the scope label, and the row's status moves only when the proofs seat's build lands.

V1: M-REVISIT STANDS 2026-10-28T22:33:11Z — the δ route proves 5 ≤ d_K for every real quadratic K, and g antitone gives the signed bound g(d_K) ≤ g(5). ℚ(√5) : Type witnesses the signed ∃ (discr 5). `Type` covers the whole family up to isomorphism, and discr is invariant. Statement unchanged (`statement_sha256` 648a9eec…f2f2). Proved-beyond-scope, count unchanged. The full route elaborates in this seat's probe: exit 0, no warnings, axioms [propext, Classical.choice, Quot.sound].

- **Erratum 2026-10-28T22:36:49Z (Orchestrator A):** the V1-GREEN line of 17:58:10Z above carries the word "re-verified"; read "re-read" — the signed line stays as written, the lane's word rule is met by this note.

V2: V2-GREEN (revisit, reconfirmed) 2026-10-28T22:39:26Z — the wall's word 3, after M's STANDS: ms_32b_certificate_max_fields still says what p13 prints at the paper's strength — the bound g(d_K) ≤ g(5) over every real quadratic K (Type, totally real, finrank 2) and its attainment at d_K = 5, no uniqueness. Junk check: ms32Gc is 0 on d ≤ 0, but sign_discr makes d_K > 0 for every totally real K, so the default never carries the bound; on d > 0 the bound is 5 ≤ d_K. Statement unchanged, Challenge digest 648a9eec…f2f2 at open and signing. Sheet: specs/_V2-MS32b-revisit.md.
- **L-proofs: PROVED-BEYOND-SCOPE 2026-10-28T22:40:03Z** — seat L built `ms_32b_certificate_max_fields` in `ModularSurface/Now/Solution.lean` on M's δ route (U9 lines 33–37, 1035–1160, 1163–1316 copied as a local instance and `have`s; one line re-wrapped for the length linter); `lake build ModularSurface.Now.Solution` exit 0, zero warnings; axioms [propext, Classical.choice, Quot.sound]; Challenge unchanged at 648a9eec; `theorem_names` 16; yaml PROVED, OUT-OF-Q5 kept, `statements_not_checked: []`; in-scope count unchanged. Details: `ModularSurface/Now/BUILD-LOG.md` §"ms_32b revisit — proofs phase".

V3: V3-CLEAN 2026-10-28T22:44:07Z — post-proof fidelity, row-independent (sheet `specs/_V3-MS32b-revisit.md`). The bound is carried by 5 ≤ discr K on the δ route (d_K > 0 by `sign_discr`, ≥ 4 by Minkowski, ≠ 4 by the δ arithmetic) composed with 1/(π√d) antitone on d > 0, never by the `ms32Gc` default on d ≤ 0; the attainment is a genuine ℚ⟮√5⟯ : Type with finrank 2, one real place and discr 5 (Eisenstein at 5 on θ = (5 + √5)/2). Axioms [propext, Classical.choice, Quot.sound]; Challenge 648a9eec unchanged; proved beyond the agreed scope, in-scope count unchanged.
