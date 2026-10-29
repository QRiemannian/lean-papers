# BUILD-LOG — unit U9 (`RiemannZeta/Provenance`)

Seat L (Lean coder), PHASE STATEMENTS, dispatched by Orchestrator A 2026-10-28 (≈21:00Z brief clock) under the L template `lean-scoping/seats/TEMPLATE-L-lean-coder.md` (with its governor-71 addendum). Clocks from `date -u`. No git, no web, nothing under the lab's non-public research trees. Scratch: `<scratchpad>/l-u9/` only.

- seat opened 2026-10-28T20:48:45Z; this file (first artefact) 2026-10-28T20:49:43Z
- inputs read: the L template; `specs/_UNIT-U9.md` (with the CO decisions at its foot, 20:41:53Z); `specs/_V1-U9.md`; the six specs `RZ-14a`, `RZ-05`, `RZ-06b`, `RZ-09`, `RZ-13`, `RZ-14b` (each V1-GREEN 20:46:10Z; 14a and 14b also V1-SPLIT-OK); sibling files for shape and for the shared declarations: `RiemannZeta/MatricesMobius/{Challenge.lean, comparator.json, formalization.yaml, BUILD-LOG.md}` (U4), `RiemannZeta/SmallArith/Challenge.lean` (U7).
- plan order: RZ-14a → RZ-05 → RZ-06b → RZ-09 → RZ-13 → RZ-14b (two theorems; its (ii-thm) leg CITED, NOT CHECKED, no theorem).
- CO decision 2 (U9 restates, never imports): the shared declarations are restated byte-identically from their home units.

## Builds
- **proto** 2026-10-28T20:50:03Z → 20:50:41Z — the new defs (`RZ.F2`, `RZ.phi`, `RZ.phiUnit`, `RZ.modularPGL`) and the RZ-14b (i) statement prototyped in a scratchpad file outside the repo (`<scratchpad>/l-u9/proto1.lean`, `lake env lean`), three passes: (1) exit 1, `RZ.phiUnit`'s inverse proofs unsolved (term-mode `coe_injective (val_injective …)`); (2) exit 1, `NumberField.RingOfIntegers.coe_mul` unknown; (3) exit 0 with the proofs `apply RingOfIntegers.coe_injective; apply Subtype.val_injective; show φ·(φ − 1) = 1; linear_combination Real.goldenRatio_sq`. `#print axioms` on `RZ.F2`, `RZ.phiUnit`, `RZ.modularPGL`: `[propext, Classical.choice, Quot.sound]` each (no `sorryAx` in a definition). The `IsFundamentalDomain` / `covolume` statement elaborated with the subgroup's inherited action and `volume` on ℍ.
- **B1** 2026-10-28T20:51:43Z → 20:52:01Z — `lake build RiemannZeta.Provenance.Challenge` · exit **0** · `Build completed successfully (8706 jobs)`, Challenge 15 s · first error: none · warnings: 7 × `declaration uses 'sorry'` (one per theorem) + 2 × `linter.style.show` (lines 81, 86: `show` changed the goal inside `RZ.phiUnit`'s proofs) · fix: `show` → `change` (same goal, no other edit).
- **B2** 2026-10-28T20:52:13Z → 20:52:23Z — `lake build RiemannZeta.Provenance.Challenge` · exit **0** · `Build completed successfully (8706 jobs)`, Challenge 6.7 s · first error: none · warnings: 7 × `declaration uses 'sorry'`, nothing else.
- **inspect 1** 2026-10-28T20:52:32Z → 20:52:36Z — scratch file (`<scratchpad>/l-u9/inspect1.lean`, outside the repo) `import RiemannZeta.Provenance.Challenge` + `#check` of all seven theorems with `pp.fullNames` and `pp.universes`: each elaborates to its spec's statement (`√` → `Real.sqrt`; `.IsHyperbolic` → `Matrix.IsHyperbolic`; `dist` on ℍ is the `MetricSpace ℍ` instance; `volume` is `MeasureSpace.volume` on ℍ in both 14a and 14b; `IsFundamentalDomain`/`covolume` take the subgroup `↥RZ.modularPGL` with its inherited action; `NumberField.discr ↥ℚ⟮√5⟯` finds the file's instance). `#print axioms` on the seven non-theorem declarations (`RZ.F2`, `RZ.phi`, `RZ.phiUnit`, `RZ.phiSq`, `RZ.modularPGL`, `numberField_Q_sqrt5`, `orbEulerChar`): `[propext, Classical.choice, Quot.sound]` each — no `sorryAx` in any definition. (The file's last `example` failed to parse — `ℚ⟮…⟯` notation not opened in the scratch file; re-run as inspect 2.)
- **inspect 2** 2026-10-28T20:52:48Z → 20:52:52Z — scratch `<scratchpad>/l-u9/inspect2.lean`, exit 0: `((RZ.phi : K) : ℝ) = φ` and `(((RZ.phiUnit : 𝓞 K) : K) : ℝ) = φ` by `rfl`; `(RZ.F2 : Matrix …) = !![2, 1; 1, 1]` by `rfl`; `dist` on ℍ typechecks against `UpperHalfPlane.dist_eq` (the hyperbolic metric).
- **text checks** 2026-10-28T20:52:52Z — by script: the three restated declarations (`numberField_Q_sqrt5`, `RZ.phiSq` from U4; `orbEulerChar` from U7) occur in `Provenance/Challenge.lean` byte-identically, docstring and body (463, 753, 325 bytes); every theorem's text from `theorem` to `:= by` is byte-identical to its spec's §5 signature (7 of 7), and so are `RZ.F2`, `RZ.modularPGL` and `orbEulerChar` against the spec blocks.
- **index** 2026-10-28T20:53:09Z — `RiemannZeta.lean` re-read immediately before the append (it then carried Pilot, ZetaL, Bridge, NoGo, SmallArith, Cyclotomic, MatricesMobius, LValue); `import RiemannZeta.Provenance.Challenge` appended as a new last line, existing lines kept.
- **B3** 2026-10-28T20:53:14Z → 20:53:24Z — `lake build RiemannZeta` · exit **0** · `Build completed successfully (8723 jobs)` · first error: none · warnings: 86 × `declaration uses 'sorry'` across the units + 2 pre-existing linter lines in files this seat did not touch (`RiemannZeta.lean:1`, the index's header comment, longLine; `RiemannZeta/ZetaL/Challenge.lean:1:1`) — left as found.
- **B4** 2026-10-28T20:53:30Z → 20:53:33Z — `lake build RiemannZeta.Provenance.Challenge` · exit **0** · `Build completed successfully (8706 jobs)` (replay) · first error: none · warnings: 7 × `declaration uses 'sorry'`, nothing else. **Final.**

## The universe-polymorphic ∀ (RZ-13), as landed
Written exactly as the spec: `theorem rz_13_min_real_quadratic_discr.{u} : (∀ (K : Type u) [Field K] [NumberField K] [IsTotallyReal K], Module.finrank ℚ K = 2 → 5 ≤ NumberField.discr K) ∧ IsTotallyReal ℚ⟮(√5 : ℝ)⟯ ∧ Module.finrank ℚ ℚ⟮(√5 : ℝ)⟯ = 2 ∧ NumberField.discr ℚ⟮(√5 : ℝ)⟯ = 5`. It elaborates with no change: `#print` shows the theorem universe-polymorphic in `u` (`rz_13_min_real_quadratic_discr.{u}`), the ∀ binding `K : Type u` with the three instance binders inside the first conjunct, `Module.finrank.{0, u} ℚ K`, `NumberField.discr.{u} K`; the attainment conjuncts at universe 0. A use at a specific K instantiates `u` at the call site.

## Departures from the specs' text (each with its reason)
1. **Docstrings** — each theorem's docstring is the spec's, with a second paragraph added carrying the served locus and the PDF sha256 prefix (the L template asks the docstring to carry the row id, the served locus and the prefix). Statement text unchanged.
2. **`RZ.phi` body** — the spec writes "… -- the construction of U4's `RZ.phiSq` at exponent 1"; written out as exactly that: U4's term with `Real.goldenRatio ^ 2` → `Real.goldenRatio`, `pow_mem (…) 2` dropped, `IsIntegral.pow ⟨…⟩ 2` → `⟨…⟩`. Docstring: the spec's sentence, plus "U4's construction of `RZ.phiSq` at exponent 1."
3. **`RZ.phiUnit` body** — the spec writes `⟨RZ.phi, RZ.phi - 1, …, …⟩`; the two elided proofs (φ·(φ − 1) = 1, (φ − 1)·φ = 1 in 𝓞 K) are written as `apply RingOfIntegers.coe_injective; apply Subtype.val_injective; change …; linear_combination Real.goldenRatio_sq`. A definition body carries no `sorry` (axioms print above).
4. **`orbEulerChar` docstring** — the spec offers a new docstring ("Restated identically to U7's …"); the file keeps U7's docstring verbatim, so the declaration is byte-identical to its home, and states the provenance in a `--` comment above it. Same for `numberField_Q_sqrt5` and `RZ.phiSq` (U4's docstrings verbatim, provenance comment above).
5. **`rz_14b_gaussBonnet_value` docstring** — the spec's text, with "applied to X(1) with signature (0; 2, 3; 1)" added to the CITED sentence, per V₁'s label request (`_V1-U9.md`, RZ-14b split: the cited label names orbifold Gauss–Bonnet and X(1)'s signature). The theorem's text is the spec's; the first conjunct (χ = −1/6, repeating rz_44a's) is kept, as written.
6. **Placement** — the shared and local definitions sit in one section at the top of the file (as U7 does) rather than before their first use (as U4 does); the theorems run in plan order.

No statement departs from its spec. No `axiom`, no `native_decide`, no weakening `set_option`.

## Notes for the proofs phase (not departures)
- **L:RZ-15 discharge** (V₁'s note): rz_15 takes a real `vol` with `vol = π/3`; from `rz_14b_vol_X1` it is `(MeasureTheory.covolume RZ.modularPGL ℍ).toReal = Real.pi / 3` by `ENNReal.toReal_ofReal` (π/3 ≥ 0).
- **CO decision 2**: U9's `Solution.lean` restates and never imports — the 63b τ computation and the 64c power-basis computation are copied from U4's `Solution.lean`, and the copy is to be said so here.
- `RZ.phiSq` is restated for the 64c route (ℤ[φ²] = 𝓞_K); no U9 statement mentions it.

## Digest (statements phase)
- `Challenge.lean` sha256 `b2552d657d053ceb2a70b04d60599f2f900fb2bd3df5c5d9d16cf32094871d48` (taken 20:53:33Z, after B4) → `formalization.yaml` `statement_sha256_draft:` (V₂ signs `statement_sha256:`).
- `comparator.json` (Day-0 schema as U4's: seven fully-qualified theorem names, `permitted_axioms` [propext, Quot.sound, Classical.choice], `enable_nanoda` false) and `formalization.yaml` written 20:53:58Z; names cross-checked across the files 20:54:02Z (7 = 7 = 7).

## Row table
| row | status | theorem(s) |
|---|---|---|
| L:RZ-14a | STATED | `rz_14a_area_fd` |
| L:RZ-05 | STATED | `rz_05_translation_length` |
| L:RZ-06b | STATED | `rz_06b_systole_at_F2` (+ def `RZ.F2`) |
| L:RZ-09 | STATED | `rz_09_Q_sqrt5_invariants` (+ instance `numberField_Q_sqrt5`, defs `RZ.phi`, `RZ.phiUnit`; `RZ.phiSq` restated) |
| L:RZ-13 | STATED | `rz_13_min_real_quadratic_discr` |
| L:RZ-14b (i) | STATED | `rz_14b_vol_X1` (+ def `RZ.modularPGL`) |
| L:RZ-14b (ii-arith) | STATED | `rz_14b_gaussBonnet_value` (+ def `orbEulerChar`, restated from U7) |
| L:RZ-14b (ii-thm) | CITED, NOT CHECKED — orbifold Gauss–Bonnet, X(1) of signature (0; 2, 3; 1); no theorem | — |

- seat closed 2026-10-28T20:54:34Z. Scratch files (none needed by a later stage): `<scratchpad>/l-u9/{proto1,inspect1,inspect2}.lean`, `b1–b4.txt` (build outputs).

## Proofs phase (seat L, prover) — 2026-10-28

- seat opened 2026-10-28T21:06:01Z (scratch folder created); dispatched by Orchestrator A under the FROZEN statements: V₂ signed `Challenge.lean` at sha256 `b2552d657d053ceb2a70b04d60599f2f900fb2bd3df5c5d9d16cf32094871d48` (21:03:10Z). `Challenge.lean` re-hashed at 21:33:50Z: unchanged. No git, no web, nothing under the lab's non-public research trees. Scratch: `<scratchpad>/l-u9-proofs/` only.
- inputs read: `specs/_UNIT-U9.md` (with the CO decisions, decision 2: U9 restates and never imports), the six row specs, `specs/_V1-U9.md`, `specs/_V2-U9.md`, this unit's `Challenge.lean`, `formalization.yaml`, `comparator.json` and this log; worked examples `RiemannZeta/MatricesMobius/Solution.lean` (U4), `RiemannZeta/SmallArith/Solution.lean` (U7), `RiemannZeta/Bridge/Solution.lean`; `tools/check.sh` (read, not run).

### Verdict: seven of seven PROVED
`rz_14a_area_fd`, `rz_05_translation_length`, `rz_06b_systole_at_F2`, `rz_09_Q_sqrt5_invariants`, `rz_13_min_real_quadratic_discr`, `rz_14b_vol_X1`, `rz_14b_gaussBonnet_value`. None left frozen; `comparator.json` `theorem_names` keeps all seven, unchanged; no `statements_not_checked` entry. L:RZ-14b (ii-thm), orbifold Gauss–Bonnet, stays CITED, NOT CHECKED, with no theorem (untouched).

### The file
`RiemannZeta/Provenance/Solution.lean` (new, 1442 lines, sha256 `1c386dc787bedae104aec9e4a84f8267aef0ce5608ad5d4f3467e149fa10fd32` at 21:33:50Z): `import Mathlib`, its own module docstring, then the Challenge's text from `open scoped MatrixGroups` up to the first theorem section byte-identical (script: 3775 bytes, equal), then each Challenge theorem block (section header, docstring, statement from `theorem` through `:= by`) verbatim with the `sorry` replaced by a proof (script: all seven blocks occur verbatim; the seven `theorem … := by` texts equal). No auxiliary declarations (the convention of the other Solutions: every helper is a `have` inside its proof). No `sorry`, `admit`, `native_decide`, `axiom`, `opaque`, `set_option` (grep: 0 each). One theorem cites another of the same file: `rz_14b_vol_X1` closes with `rz_14a_area_fd` (both in this module, both proved).

### Route per theorem
- **RZ-14a** (`rz_14a_area_fd`) — the spec's route. `UpperHalfPlane.volume_eq_lintegral` turns the area into ∫⁻ over the image of 𝒟 in ℂ of (1/|im z|)²; `ModularGroup.coe_fd` names that image {0 < im, 1 ≤ ‖z‖, |re| ≤ 1/2}; the integral moves to ℝ × ℝ through `Complex.measurableEquivRealProd.symm` (measure preserving, `MeasurePreserving.lintegral_comp_emb`), and Tonelli (`MeasureTheory.lintegral_prod`, measurability from the closed image `ModularGroup.isClosed_coe_fd`). Each slice x with |x| ≤ 1/2 is the ray y ≥ √(1 − x²) (empty slice otherwise), and ∫_a^∞ y⁻² dy = 1/a by `integral_Ioi_rpow_of_lt` at exponent −2 with `ofReal_integral_eq_lintegral_ofReal`. The outer integral ∫_{−1/2}^{1/2} (1 − x²)^{−1/2} dx = arcsin(1/2) − arcsin(−1/2) = π/3 by `intervalIntegral.integral_eq_sub_of_hasDerivAt` with `Real.hasDerivAt_arcsin`, `Real.arcsin_sin`, `Real.sin_pi_div_six`, `Real.arcsin_neg`.
- **RZ-05** (`rz_05_translation_length`) — the spec's route. τ γ = 2 arsinh(√(t² − 4)/2) (U4's step, copied); l in the spectrum gives l² − t·l + 1 = 0 (`Matrix.mem_spectrum_iff_isRoot_charpoly`, `Matrix.charpoly_fin_two`, det 1), so t = l + l⁻¹ and t² − 4 = (|l| − |l|⁻¹)²; √ of it is |l| − |l|⁻¹ (|l| > 1) = 2 sinh(log |l|) by `Real.sinh_log`, and `Real.arsinh_sinh` closes.
- **RZ-06b** (`rz_06b_systole_at_F2`) — the spec's route, with U4's lower bound. RZ.F2 has trace 3 (`Matrix.trace_fin_two_of`), hence hyperbolic; τ(F²) = 4 log φ (U4's steps, copied); 2 log(φ²) = 4 log φ by `Real.log_pow`; `IsLeast`: membership at ⟨F², hyperbolic⟩, and every hyperbolic γ has τ ≥ 4 log φ (U4's `hlower`, copied: |t| ≥ 3 and arsinh monotone).
- **RZ-09** (`rz_09_Q_sqrt5_invariants`) — (a) and (b) from U4's power-basis computation (copied): 𝓞 K has the ℤ-power basis generated by θ = (5 + √5)/2 = φ + 2 (X² − 5X + 5, Eisenstein at 5), so ℤ[φ] ⊇ ℤ[θ] = 𝓞 K, and d_K = 5. (c) Minkowski: K is totally real (one real place — the inclusion into ℝ, `ComplexEmbedding.isReal_iff` — and r₁ + 2r₂ = 2 by `InfinitePlace.card_add_two_mul_card_eq_rank`, so r₂ = 0); `RingOfIntegers.isPrincipalIdealRing_of_abs_discr_lt` at 5 < (2·2²/2!)² = 16, then `NumberField.classNumber_eq_one_iff`. (e) a ℚ-power basis of K generated by φ (minpoly X² − X − 1, degree 2 from finrank 2), `Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly`: N(φ) = (−1)²·(−1) = −1. (d) the spec's elementary route, no Dirichlet: every element of 𝓞 K has real value a + bφ (a, b ∈ ℤ) by `Algebra.adjoin_induction` over (a); for a unit, its inverse c + dφ and the irrationality of φ (`Real.goldenRatio_irrational`) give ac + bd = 1, ad + bc + bd = 0, so (a² + ab − b²)(c² + cd − d²) = 1 and the norm form is ±1; with the conjugate x' = a + b(1 − φ), x·x' = ±1, (x − x')² = 5b², (x + x')² = (2a + b)²; so 1 ≤ x² < φ² forces |b| ≤ 1, |2a + b| ≤ 2 and a nine-case check leaves x² = 1. A unit u is moved into [1, φ) by φ^(−n) (`exists_mem_Ico_zpow`), lands on ±1 (injectivity of 𝓞 K → ℝ), and u = ±φⁿ.
- **RZ-13** (`rz_13_min_real_quadratic_discr`) — the ∀ conjunct, the spec's NEEDS-DEVELOPMENT closed by a different construction than its sketch (departure 1 below). For K real quadratic: r₂ = 0 (`NumberField.nrComplexPlaces_eq_zero_iff`), so d_K > 0 (`NumberField.sign_discr`) and d_K ≥ 4 (`NumberField.abs_discr_ge'` at n = 2, r₂ = 0); d_K = 4 is excluded thus: a primitive element α (`Field.exists_primitive_element`) has minpoly X² + c₁X + c₀; δ = den(c₁² − 4c₀)·(2α + c₁) is an algebraic integer, δ ∉ ℚ, δ² = D ∈ ℤ; minpoly ℚ δ = X² − D, so Tr δ = 0 (`trace_eq_finrank_mul_minpoly_nextCoeff`), Tr 1 = 2, Tr δ² = 2D and discr ℚ ![1, δ] = 4D; ![1, δ] has integral coordinates in an integral basis (`NumberField.integralBasis_repr_apply`), so `Algebra.discr_of_matrix_vecMul` with `Module.Basis.toMatrix_map_vecMul` and `NumberField.coe_discr` give 4D = m²·d_K for an integer m; d_K = 4 would make D = m² and δ = ±m rational. The attainment conjuncts: U4's power-basis computation (finrank 2, d = 5, copied) and the real-place argument of RZ-09 (c).
- **RZ-14b (i)** (`rz_14b_vol_X1`) — the spec's route through `MeasureTheory.IsFundamentalDomain.mk''`. Each element of `RZ.modularPGL` is mk(mapGL γ) and acts on ℍ as mapGL γ ∈ GL(2, ℝ) (`UpperHalfPlane.pglMk_smul`), so it preserves `volume` (`MeasureTheory.measurePreserving_smul` with mathlib's GL-invariance instance); from that the subgroup's `MeasurableConstSMul` and `SMulInvariantMeasure` instances are built in the proof, and `Countable` from SL(2, ℤ) ↪ (Fin 2 → Fin 2 → ℤ). Cover: `ModularGroup.exists_smul_mem_fd`. Disjointness: for g ≠ 1, g•𝒟 ∩ 𝒟 ⊆ g•(𝒟 \ 𝒟ᵒ) (a point of 𝒟ᵒ carried into 𝒟 forces γ = ±1 by `ModularGroup.eq_one_or_neg_one_of_mem_fdo_mem_fd`, and mk(mapGL(±1)) = 1 since −1 is central, `Matrix.ProjGenLinGroup.ker_mk`), and 𝒟 \ 𝒟ᵒ is null: its image in ℂ lies on the lines re = ±1/2 (null through ℝ × ℝ, `Real.volume_singleton`) and the unit circle (`MeasureTheory.Measure.addHaar_sphere`), so `MeasureTheory.setLIntegral_measure_zero`, with `MeasureTheory.measure_smul`. Covolume: `IsFundamentalDomain.covolume_eq_volume`, then `rz_14a_area_fd`.
- **RZ-14b (ii-arith)** (`rz_14b_gaussBonnet_value`) — `norm_num [orbEulerChar]` gives −1/6; the second conjunct by rewriting and `ring`.

### Copied steps (CO decision 2: restate, never import), with their source lines
- `rz_05_translation_length`: `hcosh`, `hlen` — U4 `RiemannZeta/MatricesMobius/Solution.lean` lines 1386–1512 (proof of `rz_63b_geometric`), verbatim.
- `rz_06b_systole_at_F2`: `hcosh` … `hlower` — U4 lines 1386–1573 (same proof), verbatim; U4's local `let F2` replaced by the restated `RZ.F2`.
- `rz_09_Q_sqrt5_invariants`: `h5` … `hgenval` — U4 lines 1831–1974 (proof of `rz_64c_conductor_one`), verbatim; the step `hg` (generator = φ + 2) is U4's `hg` (generator = φ² + 1) adapted to RZ.phi.
- `rz_13_min_real_quadratic_discr` (second conjunct): `h5` … `hdiscK` — U4 lines 1831–1970, verbatim.
Each copy is marked by a comment at its head in `Solution.lean`. Nothing copied from U7 (the (ii-arith) proof is one `norm_num`).

### Departures from the specs' routes (each with the reason)
1. **RZ-13, the d_K ≠ 4 step.** The spec sketched "1 is primitive in 𝓞_K, so 𝓞_K has a basis {1, ω}". Taken instead: any integral δ ∉ ℚ with δ² ∈ ℤ, and the index relation discr(1, δ) = m²·d_K read off `Algebra.discr_of_matrix_vecMul`; it needs no basis extension (not at the pin) and no Stickelberger. Same mathematics (d_K is a field discriminant, so not a square), shorter at the pin.
2. **RZ-09 (c).** Total reality is shown by counting places (one real place, r₁ + 2r₂ = 2) rather than through the embeddings' images; this supplies the r₂ = 0 that `isPrincipalIdealRing_of_abs_discr_lt` needs.
3. **RZ-09 (e).** The spec offered "the norm of a root of X² − X − 1 is its constant term"; done exactly so, through a second ℚ-power basis generated by φ (U4's construction pattern with φ for θ).
4. **RZ-14b (i).** The boundary's nullity is proved by covering the boundary's image with two lines and a circle rather than by `fd_eq_closure_fdo`; the spec named the boundary as null without fixing how.
5. **RZ-14a.** None: the spec's integral, by Tonelli on ℂ ≅ ℝ².
6. **RZ-06b.** U4's lower bound used directly (the spec's first option), not the arccosh-monotone alternative.

### Name checks (the governor-71 form: grep of the declaration line, namespace read from the file's `namespace`/`end` lines; pin `db584cd6`)
- `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:209:theorem abs_discr_ge' :` · namespace `NumberField` → `NumberField.abs_discr_ge'`
- `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:57:theorem sign_discr :` · `NumberField`
- `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean:38:theorem coe_discr : (discr K : ℚ) = Algebra.discr ℚ (integralBasis K) :=` · `NumberField`
- `Mathlib/NumberTheory/NumberField/Basic.lean:406:theorem integralBasis_repr_apply (x : (𝓞 K)) (i : Free.ChooseBasisIndex ℤ (𝓞 K)) :` · `NumberField`
- `Mathlib/FieldTheory/PrimitiveElement.lean:209:theorem exists_primitive_element : ∃ α : E, F⟮α⟯ = ⊤ := by` · `Field`
- `Mathlib/RingTheory/Trace/Basic.lean:140:theorem trace_eq_finrank_mul_minpoly_nextCoeff [FiniteDimensional K L] (x : L) :` · root (no namespace; `Algebra.trace_eq_finrank_mul_minpoly_nextCoeff` does not exist — first attempt failed on that name)
- `Mathlib/RingTheory/Discriminant.lean:107:theorem discr_of_matrix_vecMul (b : ι → B) (P : Matrix ι ι A) :` · `Algebra`
- `Mathlib/LinearAlgebra/Matrix/Basis.lean:115:theorem toMatrix_map_vecMul …` · `Module.Basis`; `Mathlib/LinearAlgebra/Basis/Defs.lean:198:theorem repr_reindex_apply (i' : ι') : (b.reindex e).repr x i' = b.repr x (e.symm i') :=` · `Module.Basis` (`Module.Basis.reindex_repr` does not exist — first attempt failed on that name)
- `Mathlib/NumberTheory/NumberField/ClassNumber.lean:200:theorem isPrincipalIdealRing_of_abs_discr_lt` · `RingOfIntegers` (opened :102, closed :212); `:74:theorem classNumber_eq_one_iff : classNumber K = 1 ↔ IsPrincipalIdealRing (𝓞 K) :=` · `NumberField`
- `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean:474:theorem card_add_two_mul_card_eq_rank :` · `NumberField.InfinitePlace`; `…/TotallyRealComplex.lean:52:theorem nrComplexPlaces_eq_zero_iff [NumberField K] :` · `NumberField`
- `Mathlib/RingTheory/Norm/Basic.lean:65:theorem PowerBasis.norm_gen_eq_coeff_zero_minpoly (pb : PowerBasis R S) :` · `Algebra`
- `Mathlib/NumberTheory/Real/GoldenRatio.lean:120:theorem goldenRatio_irrational : Irrational φ := by` · `Real`; `Mathlib/Algebra/Order/Archimedean/Basic.lean:226:theorem exists_mem_Ico_zpow …` · root
- `Mathlib/LinearAlgebra/Matrix/Charpoly/Eigs.lean:80:theorem mem_spectrum_iff_isRoot_charpoly …` · `Matrix`; `…/Charpoly/Coeff.lean:229:lemma charpoly_fin_two …` · `Matrix`; `Mathlib/Analysis/SpecialFunctions/Log/Basic.lean:123:theorem sinh_log …` · `Real`
- `Mathlib/Analysis/Complex/UpperHalfPlane/Measure.lean:77:lemma volume_eq_lintegral (s : Set ℍ) :` · `UpperHalfPlane`; `Mathlib/NumberTheory/Modular.lean:828:lemma coe_fd …`, `:839:lemma isClosed_coe_fd …`, `:426:theorem exists_smul_mem_fd …`, `:778:theorem eq_one_or_neg_one_of_mem_fdo_mem_fd …` · `ModularGroup`
- `Mathlib/Analysis/SpecialFunctions/Trigonometric/InverseDeriv.lean:53:theorem hasDerivAt_arcsin …` · `Real`; `Mathlib/Analysis/SpecialFunctions/ImproperIntegrals.lean:172:theorem integral_Ioi_rpow_of_lt …`, `:130:theorem integrableOn_Ioi_rpow_of_lt …` · root
- `Mathlib/MeasureTheory/Group/FundamentalDomain.lean:98:theorem mk'' …` · `MeasureTheory.IsFundamentalDomain`; `:696:lemma IsFundamentalDomain.covolume_eq_volume (ν : Measure α) [Countable G]` · `MeasureTheory`
- `Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean:527:theorem addHaar_sphere [Nontrivial E] (x : E) (r : ℝ) : μ (sphere x r) = 0 := by` · `MeasureTheory.Measure`; `Mathlib/MeasureTheory/Group/Action.lean:178:theorem measurePreserving_smul …`, `:102:theorem measure_smul (c : G) (s : Set α) : μ (c • s) = μ s := by` · `MeasureTheory`
- `Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean:274:theorem pglMk_smul (g : GL (Fin 2) ℝ) (z : ℍ) :` · `UpperHalfPlane`; `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean:69:theorem ker_mk : mk.ker = Subgroup.center (GL n R) := QuotientGroup.ker_mk' _` · `Matrix.ProjGenLinGroup`
- One name the brief's notes suggested and the seat did not need: `ModularGroup.fd_eq_closure_fdo` (departure 4).

### Builds
- **scratch iterations** 21:10Z–21:31Z — each theorem prototyped in `<scratchpad>/l-u9-proofs/test_*.lean` (the Challenge's declarations + one proof, `lake env lean`), outside the repo: easy trio (05, 06b, ii-arith) 21:11Z, one `linear_combination` coefficient fix; RZ-09 21:13Z–21:20Z (one `Fintype` instance needed `classical`; a first `hsep` closing by `field_simp` failed, replaced by `eq_div_iff` + `linear_combination`; the whole proof first hit the default heartbeat budget, measured as fitting at 400000 — the seat then cut the cost instead of raising the option: the nine-case arithmetic was moved into a context-free `have` and its `nlinarith` calls were replaced by linear steps; final proof inside the default 200000, no `set_option`); RZ-13 21:21Z–21:26Z (two names corrected, above; `nextCoeff` by its definition); RZ-14a 21:26Z–21:28Z; RZ-14b 21:29Z–21:31Z (`Countable SL(2, ℤ)` supplied by injection; pointwise `•` on sets via `open scoped Pointwise in` inside the tactic block).
- **S1** 2026-10-28T21:32:08Z → 21:32:30Z — `lake build RiemannZeta.Provenance.Solution` · exit **0** · `Build completed successfully (8706 jobs)`, Solution 19 s · warnings: 3 × `linter.style.longLine` · fix: three statement lines inside proofs wrapped.
- **S2** 2026-10-28T21:32:43Z → 21:33:00Z — `lake build RiemannZeta.Provenance.Solution` · exit **0** · `✔ [8706/8706] Built RiemannZeta.Provenance.Solution (15s)` · `Build completed successfully (8706 jobs).` · no warnings, no `sorry` warning. **Final.**
- **axioms** 2026-10-28T21:33:10Z — `<scratchpad>/l-u9-proofs/axioms.lean` (`import RiemannZeta.Provenance.Solution` + seven `#print axioms`), `lake env lean`, exit 0:
  - `'RiemannZeta.Provenance.rz_14a_area_fd' depends on axioms: [propext, Classical.choice, Quot.sound]`
  - `'RiemannZeta.Provenance.rz_05_translation_length' depends on axioms: [propext, Classical.choice, Quot.sound]`
  - `'RiemannZeta.Provenance.rz_06b_systole_at_F2' depends on axioms: [propext, Classical.choice, Quot.sound]`
  - `'RiemannZeta.Provenance.rz_09_Q_sqrt5_invariants' depends on axioms: [propext, Classical.choice, Quot.sound]`
  - `'RiemannZeta.Provenance.rz_13_min_real_quadratic_discr' depends on axioms: [propext, Classical.choice, Quot.sound]`
  - `'RiemannZeta.Provenance.rz_14b_vol_X1' depends on axioms: [propext, Classical.choice, Quot.sound]`
  - `'RiemannZeta.Provenance.rz_14b_gaussBonnet_value' depends on axioms: [propext, Classical.choice, Quot.sound]`
- `tools/check.sh` and Comparator not run by this seat (the orchestrator runs the gate over the committed tree). `RiemannZeta.lean` (the index, Challenges only) not touched.

### Notes for the ledger / the gate
- L:RZ-15's discharge (V₁'s note) is now available: `(MeasureTheory.covolume RZ.modularPGL ℍ).toReal = Real.pi / 3` from `rz_14b_vol_X1` by `ENNReal.toReal_ofReal` (π/3 ≥ 0); not stated here (no theorem was added).
- RZ-13's ∀ conjunct is the bound the U8 seat left out of `ms_32b` ("excluding discr K = 4 … neither at the pin", `ModularSurface/Now/BUILD-LOG.md`); the δ-route above closes it at the same pin, should the ledger want to revisit MS-32b (an observation for the orchestrator, not acted on here).

### Row table (proofs phase)
| row | status | theorem(s) |
|---|---|---|
| L:RZ-14a | PROVED | `rz_14a_area_fd` |
| L:RZ-05 | PROVED | `rz_05_translation_length` |
| L:RZ-06b | PROVED | `rz_06b_systole_at_F2` |
| L:RZ-09 | PROVED | `rz_09_Q_sqrt5_invariants` |
| L:RZ-13 | PROVED | `rz_13_min_real_quadratic_discr` |
| L:RZ-14b (i) | PROVED | `rz_14b_vol_X1` |
| L:RZ-14b (ii-arith) | PROVED | `rz_14b_gaussBonnet_value` |
| L:RZ-14b (ii-thm) | CITED, NOT CHECKED — orbifold Gauss–Bonnet, X(1) of signature (0; 2, 3; 1); no theorem | — |

- seat closed 2026-10-28T21:35:28Z. Files for commit: `RiemannZeta/Provenance/Solution.lean` (new), `RiemannZeta/Provenance/BUILD-LOG.md` (this section), one `L-proofs:` line each in `specs/RZ-14a.md`, `RZ-05.md`, `RZ-06b.md`, `RZ-09.md`, `RZ-13.md`, `RZ-14b.md`. `comparator.json` unchanged (all seven names stand). Scratch: `<scratchpad>/l-u9-proofs/` (prototypes, build and axiom outputs; no later stage needs them).
