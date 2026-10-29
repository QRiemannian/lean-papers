# UNIT U9 — `RiemannZeta/Provenance` (the zeta paper's EFFORT provenance cluster) — seat M summary

- unit: U9 · seat: M (statement author), dispatched by Orchestrator A ≈20:25Z under the wall's WORD 2026-10-28 (`priority/inbox/WORD-wall-2026-10-28-now-wave-words.md`, lane 3); template `lean-scoping/seats/TEMPLATE-M-statement-author.md` with its governor-71 addendum
- paper: RZ, served edition sha256 2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54 (re-read with `shasum -a 256` at the seat's start, 2026-10-28T20:21Z; matches)
- mathlib pin: db584cd6d46c92f209a44c0f1c829460d327499d (`lake-manifest.json`, mathlib `rev`)
- pages read from the served PDF by `pdftotext -layout` (cover = p01): p07, p08, p18, p22, p23, p25
- summary_clock: 2026-10-28T20:40:40Z
- plan order (FAN-OUT-PLAN-v1 §9 step 4): **RZ-14a → RZ-05 → RZ-06b → RZ-09 → RZ-13 → RZ-14b**; each row boundary clean-resumable

## Rows specced (6 spec files for 6 ledger rows; one row split into reachable/cited legs)

| spec | ledger row | locus (served) | status | carried / split |
|---|---|---|---|---|
| `specs/RZ-14a.md` | L:RZ-14a | §2.4 (2.8), p08 | SPEC-DRAFT | the ledger's own a/b split; a = area of 𝒟 |
| `specs/RZ-05.md` | L:RZ-05 | §2.2 (2.2), p07; §7.2 text, p18 | SPEC-DRAFT | **CARRIED IN SUBSTANCE** by `rz_63b_geometric` conj. 1 (U4, PROVED beyond scope); delta = the eigenvalue form ℓ = 2 log \|λ\| |
| `specs/RZ-06b.md` | L:RZ-06b | §2.2 (2.3), p07; §8.5 sentence after (8.9), p22 | SPEC-DRAFT | **ALREADY CARRIED** (value + attainment at trace 3) by `rz_63b_geometric` conj. 2–3; delta = F² itself, τ(F²) = 2 log(φ²), `IsLeast` at F² |
| `specs/RZ-09.md` | L:RZ-09 | §2.3 first sentence, p07; §9.1 sentence after (9.3), p23 | SPEC-DRAFT | clauses (a) 𝓞 = ℤ[φ], (b) d = 5 **carried in substance** by `rz_64c_conductor_one` (U4, PROVED beyond scope); (c) h = 1, (d) fundamental unit, (e) N(φ) = −1 new; **no clause CITED** |
| `specs/RZ-13.md` | L:RZ-13 | §2.3 after (2.7), p08; §9.5 after (9.9), p25 | SPEC-DRAFT, **NEEDS-DEVELOPMENT** (one local lemma: d_K ≠ 4) | integer form **ALREADY CARRIED** by `ms_13_smallest_fundDisc` (U8, CHECKED); spec states the field form the RZ print uses |
| `specs/RZ-14b.md` | L:RZ-14b | §2.4 (2.8)–(2.9), p08 | SPEC-DRAFT, **NEEDS-DEVELOPMENT** (the modular group's fundamental domain in mathlib's sense) | **SPLIT**: (i) reachable — fundamental domain + covolume = π/3 (`rz_14b_vol_X1`); (ii-arith) reachable — −2π·χ(2,3,∞) = π/3 (`rz_14b_gaussBonnet_value`); (ii-thm) **CITED, NOT CHECKED** — orbifold Gauss–Bonnet |

**The split of L:RZ-14b, for V₁'s sign-off.** "vol(X(1)) = π/3" as the area of the quotient is reachable at the pin and is proved by integration (14a) plus the fundamental-domain property — no Gauss–Bonnet needed for the value. "the Gauss–Bonnet value for the (2, 3, ∞) orbifold" splits: its arithmetic (χ = −1/6, −2πχ = π/3, on U7's `orbEulerChar` restated) is E0; the orbifold Gauss–Bonnet theorem is not at the pin (E4) and stays CITED, NOT CHECKED. (2.9) is L:RZ-15 (CHECKED, vol as a hypothesis — which (i) discharges).

## CC-CANDIDATE rows
**None.** Every printed statement read true at the served edition under its stated reading. The one reading-dependent point: (2.2) "with eigenvalue λ … ℓ = 2 log λ" is negative for the contracting eigenvalue; the paper's use (λ = φ²) and the word "length" fix the expanding one. RZ-05 states it with 1 < |λ| and 2 log |λ| (identical to the print for λ > 1). Not a CC-candidate; V₁ to confirm.

## A premise of the brief, corrected from disk
**The Dedekind zeta IS at the pin**, with the analytic class-number formula in residue form: `NumberField.dedekindZeta` (def, Mathlib/NumberTheory/NumberField/DedekindZeta.lean:47), `NumberField.dedekindZeta_residue` (:54, = 2^{r₁}(2π)^{r₂} R_K h_K / (w_K √|d_K|)), `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` (:75, "Dirichlet class number formula"). RZ-09's printed text contains no class-number formula (it lists 𝓞, d, h, ε, N(ε)), so nothing of RZ-09 is scoped against it, and no RZ-09 clause is CITED. **For L:RZ-58 (lane 3's standalone, not this unit):** what the pin lacks on the residue route is the factorization ζ_K(s) = ζ(s)·L(s, χ5) (no file but DedekindZeta.lean mentions `dedekindZeta`); R_K = log φ is reachable from RZ-09 (d) with `NumberField.Units.regulator` (Units/Regulator.lean:266); h_K = 1, d_K = 5, w_K = 2 from RZ-09. The ledger's own RZ-58 row already names `dedekindZeta_residue_def` as present.

## Mathlib names not found at the pin (each after the governor-71 grep, namespace read)
- **A translation-length lemma** (inf_z d(z, γz) for hyperbolic γ) — not in mathlib; **present in this repository** inside `rz_63b_geometric`'s proof (U4 `Solution.lean`). RZ-05/06b rest on the sibling, not on new development.
- **`IsFundamentalDomain` for the modular group on ℍ** — no hit under NumberTheory/ or Analysis/Complex/ (RZ-14b NEEDS-DEVELOPMENT; every ingredient is present: `exists_smul_mem_fd`, `eq_one_or_neg_one_of_mem_fdo_mem_fd`, the GL(2, ℝ)-invariant measure, `MeasureTheory.covolume`). **No `MulAction PSL(2, ℤ) ℍ`** — the statement uses the image of SL(2, ℤ) in PGL(2, ℝ), which acts by mathlib's `MulAction PGL(2, ℝ) ℍ` (MoebiusAction.lean:270).
- **Orbifold Gauss–Bonnet** — not at the pin (RZ-14b (ii-thm), CITED).
- **A quadratic-field discriminant formula, Stickelberger's congruence** — not at the pin (RZ-13 NEEDS-DEVELOPMENT: only d_K ≠ 4 is missing, since `NumberField.abs_discr_ge'` already gives d_K ≥ 4 for a real quadratic field).
- **A "fundamental unit" predicate** — none at the pin (`NumberField.Units.fundSystem` is a choice); RZ-09 (d) states the definition directly.
- **Ledger names, all present:** `UpperHalfPlane.volume_def`, `UpperHalfPlane.volume_eq_lintegral`, `ModularGroup.coe_fd`, `UpperHalfPlane.dist_eq`, `ModularGroup.exists_smul_mem_fd`, `ModularGroup.fd_eq_closure_fdo`, `NumberField.discr`, `NumberField.classNumber`, `NumberField.classNumber_eq_one_iff`, `NumberField.Units.regulator`.

**The name check on the real tree, one hit pasted with its namespace:** `Mathlib/Analysis/Complex/UpperHalfPlane/Measure.lean:77:lemma volume_eq_lintegral (s : Set ℍ) :` — innermost namespace `UpperHalfPlane` (opened :31, closed :116), so the name is `UpperHalfPlane.volume_eq_lintegral`. A second, showing the addendum's point about `abbrev`: `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean:36:noncomputable abbrev discr : ℤ := …` inside `namespace NumberField` (:31–:67).

## The mathlib names table (declarations each row targets; full file:line in each spec's §4)
| row | targets |
|---|---|
| RZ-14a | `UpperHalfPlane` `MeasureSpace` instance, `UpperHalfPlane.volume_def`, `UpperHalfPlane.volume_eq_lintegral`, `ModularGroup.fd`, `ModularGroup.coe_fd`; aids `Complex.measurableEquivRealProd`, `Complex.volume_preserving_equiv_real_prod`, `MeasureTheory.lintegral_prod`, `integral_Ioi_rpow_of_lt`, `Real.deriv_arcsin`, `Real.arcsin_sin`, `Real.sin_pi_div_six` |
| RZ-05 | `UpperHalfPlane.SLAction`, `UpperHalfPlane.cosh_dist`, `UpperHalfPlane.dist_eq`, `Matrix.IsHyperbolic`, `spectrum`; aids `Matrix.mem_spectrum_iff_isRoot_charpoly`, `Matrix.charpoly_fin_two`, `Matrix.SpecialLinearGroup.det_coe`, `Real.sinh_log`, `Real.sinh_injective`, `Real.log_abs`; sibling `rz_63b_geometric` |
| RZ-06b | `Matrix.SpecialLinearGroup.map`, `Int.castRingHom`, `Matrix.IsHyperbolic`, `IsLeast`, `Set.range`, `Real.goldenRatio`, `Real.log`; siblings `rz_63b_geometric`, `rz_04_fib_sq_eigenvalues`, `rz_06a_two_log_sq_eq`, `rz_03_min_hyperbolic_abs_trace` |
| RZ-09 | `NumberField.RingOfIntegers` (𝓞), `NumberField.discr`, `NumberField.classNumber`, `Algebra.adjoin`, `Algebra.norm`, `IntermediateField.adjoin`; aids `RingOfIntegers.isPrincipalIdealRing_of_abs_discr_lt`, `NumberField.classNumber_eq_one_iff`, `adjoin_eq_top_of_conductor_eq_top`, `NumberField.discr_eq_discr`, `NumberField.isUnit_iff_norm`; sibling `rz_64c_conductor_one` |
| RZ-13 | `NumberField.discr`, `NumberField.IsTotallyReal`, `Module.finrank`; aids `NumberField.abs_discr_ge'`, `NumberField.sign_discr`, `NumberField.nrComplexPlaces_eq_zero_iff`; sibling `ms_13_smallest_fundDisc` |
| RZ-14b | `MeasureTheory.IsFundamentalDomain`, `MeasureTheory.covolume`, `Matrix.ProjGenLinGroup` (`PGL`), `Matrix.ProjGenLinGroup.mk`, `Matrix.SpecialLinearGroup.mapGL`, `MonoidHom.range`, the `MulAction PGL(2, ℝ) ℍ` instance, `ModularGroup.fd`; aids `IsFundamentalDomain.mk''`, `.covolume_eq_volume`, `.measure_eq`, `ModularGroup.eq_one_or_neg_one_of_mem_fdo_mem_fd`, `ModularGroup.exists_smul_mem_fd`, `ModularGroup.isClosed_fd`, `SMulInvariantMeasure (GL (Fin 2) ℝ) ℍ volume` |

## Shared definitions to restate in `RiemannZeta/Provenance/Challenge.lean` (units restate; they do not import)
| name | used by | source |
|---|---|---|
| τ as a hypothesis `(τ : SL(2, ℝ) → ℝ) (hτ : ∀ γ, τ γ = ⨅ z : ℍ, dist z (γ • z))` | RZ-05, RZ-06b | the U4 form of `rz_63b_geometric`, verbatim |
| `RZ.F2 : SL(2, ℤ)` := (2 1; 1 1) with its det proof | RZ-06b | new (det 1 is L:RZ-02's) |
| `instance numberField_Q_sqrt5 : NumberField ℚ⟮(√5 : ℝ)⟯` | RZ-09, RZ-13 | U4 `Challenge.lean:293`, verbatim |
| `RZ.phi : 𝓞 ℚ⟮(√5 : ℝ)⟯` | RZ-09 | U4's `RZ.phiSq` construction at exponent 1 |
| `RZ.phiUnit : (𝓞 ℚ⟮(√5 : ℝ)⟯)ˣ` (inverse φ − 1) | RZ-09 | new |
| `RZ.modularPGL : Subgroup PGL(2, ℝ)` (image of SL(2, ℤ)) | RZ-14b | new |
| `orbEulerChar` | RZ-14b (ii) | U7 `SmallArith/Challenge.lean:28`, verbatim |
Header opens as U4: `open scoped MatrixGroups`, `open UpperHalfPlane`; `open IntermediateField NumberField` per theorem.

## CC-CANDIDATE line
CC-CANDIDATE: none.

## Cost table (ledger figures are the scope's count; the seat's estimates are human-scale and unmeasured — FAN-OUT-PLAN-v1 §2 converts them by measurement, not by this table)
| row | ledger class · pd | seat's class after the siblings | seat's estimate (pd) | where the cost sits |
|---|---|---|---|---|
| RZ-14a | E2 · 6 | E2 | 3–6 | the iterated integral on ℂ ≅ ℝ², Tonelli, ∫(1 − x²)^{−1/2} = 2 arcsin(1/2) |
| RZ-05 | E3 · 15 | **E1** (delta) | ≈ 0.5 | the E3 work is spent inside `rz_63b_geometric`'s proof; left: t = l + l⁻¹, `sinh_log`, injectivity |
| RZ-06b | E2 · 3 | **E0–E1** (delta) | ≈ 0.5 | RZ-05 at l = φ²; `IsLeast` from rz_63b conj. 2 |
| RZ-09 | E3 · 20 | **E2** | 4–6 | (a)(b) from rz_64c, E0–E1; (c) Minkowski, E1; **(d) the unit group, E2** (φ minimal among units > 1, by hand); (e) E1 |
| RZ-13 | E3 · 12 | E3 (NEEDS-DEVELOPMENT) | 4–8 | d_K ≥ 4 is at the pin; **excluding d_K = 4** needs a basis {1, ω} of 𝓞_K for an arbitrary quadratic K |
| RZ-14b | E3 · 20 | E2–E3 (NEEDS-DEVELOPMENT); (ii-arith) E0; (ii-thm) E4 CITED | 5–8 | fundamental domain in mathlib's sense: null boundary, subgroup action, measure invariance on the subgroup, `covolume_eq_volume`'s instances |
| **cluster** | **76** (the plan's 91.0 includes RZ-58's 15) | | **≈ 17–29** | the drop is the U4 siblings' proofs (63b, 64c) plus mathlib's Minkowski route |

## The one thing V₁ should look hardest at, per row
- **RZ-14a:** that the row states only "area of 𝒟 = π/3" (as `ENNReal.ofReal (π/3)` for mathlib's dx dy/y² measure) and leaves "= vol(X(1))" to 14b — faithful as the ledger's a-leg, with a ∪ b covering (2.8).
- **RZ-05:** the eigenvalue reading — "with eigenvalue λ … ℓ = 2 log λ" stated as 1 < |λ| ⇒ τ = 2 log |λ| over SL(2, ℝ). Identical to the print for λ > 1; is the |·| form (covering negative trace) or the SL(2, ℝ) generality stronger than the print? The sentence is general ("a hyperbolic element"), and −γ acts on ℍ as γ does.
- **RZ-06b:** whether "delta only" (F² named, τ(F²) = 2 log(φ²), `IsLeast` at F²) plus the cited siblings (`rz_63b_geometric` conj. 2–3, `rz_06a_two_log_sq_eq`) together say exactly (2.3) + the §8.5 sentence — no clause of the print left unowned (the "fixed point x = 1/φ" clause is named as unowned by the v0.2 ledger, for CO).
- **RZ-09:** clause (d): "fundamental unit ε = φ" formalised as φ unit, φ > 1, (𝓞_K)ˣ = {±φⁿ}, avoiding `fundSystem`. And clause (e) as the field norm (RZ-07 holds the real-number φφ̄ = −1). And the corrected premise: no CITED clause, the class-number formula being RZ-58's.
- **RZ-13:** the field reading (∀ real quadratic K, 5 ≤ d_K; attained at ℚ(√5)) against the integer reading ms_13 already checks; "real quadratic" as `IsTotallyReal K ∧ finrank ℚ K = 2`; the universe-polymorphic ∀ inside a conjunction.
- **RZ-14b:** the group: the image of SL(2, ℤ) in PGL(2, ℝ) in place of SL(2, ℤ) (whose −1 breaks `IsFundamentalDomain`); `MeasureTheory.covolume`'s "0 if no fundamental domain" semantics making "covolume = π/3" carry existence; and the split — that (ii-arith) on the restated `orbEulerChar` is a faithful reachable piece of "the Gauss–Bonnet value", with the theorem CITED.

## Notes for CO
- **Counting.** RZ-05, RZ-06b and RZ-09 (a)(b) are carried in substance by `rz_63b_geometric` and `rz_64c_conductor_one`, which the wall counted (word 5) under *proved beyond the agreed scope*. Whether the in-scope rows then count as CHECKED by their delta theorems (each delta + its named sibling) is a ledger reading for CO / the wall; this seat states the delta and names the sibling, nothing more.
- **Import.** The delta proofs are shortest if U9's `Solution.lean` may cite U4's proved theorems; the units' convention so far restates rather than imports (U7's note). If restating, L copies the relevant proof steps from U4's `Solution.lean` (the 63b τ computation; the 64c power-basis computation).
- **The theorem names proposed:** `rz_14a_area_fd`, `rz_05_translation_length`, `rz_06b_systole_at_F2`, `rz_09_Q_sqrt5_invariants`, `rz_13_min_real_quadratic_discr`, `rz_14b_vol_X1`, `rz_14b_gaussBonnet_value`.

No git run, no web, no Lean compiled, nothing under the lab's non-public research trees read. Scratch: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/u9/` (page dumps only; no later stage needs them).

## CO decisions at M's return (2026-10-28T20:41:53Z, Orchestrator A)
1. **Counting a row through a delta plus a sibling:** a row whose printed statement is carried by its own delta theorem TOGETHER with a named sibling theorem that the gate has already passed (rz_63b, rz_64c — proved, in the manifest, counted under the beyond-scope label) reads CHECKED in `ledger/STATUS.md` with BOTH theorems named in the evidence column ("by `rz_05_…` with `rz_63b_geometric` (U4)"). Reversible by a ledger line; the wall sees the form at its next read.
2. **Import:** U9 restates and never imports (the ruled exception is Bridge → LValue for rz_61c only). L copies the needed proof steps from U4's `Solution.lean` and says so in the BUILD-LOG.
3. **RZ-14b (ii-thm):** orbifold Gauss–Bonnet stays CITED, NOT CHECKED; (i) and (ii-arith) are built. The row counts only if the wall reads the covolume leg as the printed "vol(X(1)) = π/3" — V₁ judges the reading, the wall the count.
4. **The brief's false premise** ("the Dedekind zeta is NOT at the pin") is corrected from disk by M: `NumberField.dedekindZeta` and its residue theorem exist at `db584cd6`. Noted for the U10 chain (an alternative residue route for RZ-58 if the finite formula stalls).
