# BUILD-LOG — unit U12 (`RiemannZeta/Accepted`, namespace `RiemannZeta.Accepted`)

Seat L (Lean coder), PHASE STATEMENTS, dispatched by Orchestrator A 2026-10-28 for the NEW rows of the zeta paper the wall accepted as Lean targets (`Orchestrator/Chat-Design/cc-handoff/projects/priority/inbox/WORD-wall-2026-10-28-night-words.md`, word 2); method `Orchestrator/Chat-Design/cc-handoff/projects/reputation-play/lean-scoping/seats/TEMPLATE-L-lean-coder.md` (whole, with the sitting-71 addendum; scratch at `<scratchpad>/l-u12/`). Clocks from `date -u`. No git, no web, nothing under the lab's non-public research trees.

- seat opened 2026-10-28T22:43Z (scratch folder created); this file (first artefact) 2026-10-28T22:44:36Z
- inputs read: TEMPLATE-L (whole, with the sitting-71 addendum), the filled example `seats/L-statements-U4-2026-10-28.md`, `specs/_NEW-ROWS-2026-10-28.md` (whole, with its `## V₁ read`), `specs/_V1-NEW-ROWS.md` (whole), `specs/RZ-N1.md`, `specs/RZ-N2a.md`, `specs/RZ-N4b.md` (whole; each V1-GREEN 2026-10-28T20:50:09Z); form from U10 `RiemannZeta/LValue/{Challenge.lean,comparator.json,formalization.yaml,BUILD-LOG.md}` and U9 `RiemannZeta/Provenance/Challenge.lean` (the `-- Restated byte-identically from …` comment form); the restated sources `RiemannZeta/ZetaL/Challenge.lean:32–35` and `ModularSurface/Now/Challenge.lean:148–152`; U5's relation form `RiemannZeta/NoGo/Challenge.lean` (`rz_80`, `rz_81`).

## Builds

- **B1** 2026-10-28T22:45:01Z → 22:45:23Z — `lake build RiemannZeta.Accepted.Challenge` · exit **0** · `Build completed successfully (8706 jobs)`, Challenge 19 s · first error: none · warnings: 3 × `declaration uses 'sorry'` (one per theorem, lines 55, 74, 93), nothing else (no `longLine`).
- **inspect** 2026-10-28T22:45:46Z → 22:45:59Z — scratch file `<scratchpad>/l-u12/inspect.lean` (outside the repo) importing `RiemannZeta.Accepted.Challenge`, `RiemannZeta.ZetaL.Challenge`, `ModularSurface.Now.Challenge`, run with `lake env lean` after `lake build RiemannZeta.ZetaL.Challenge ModularSurface.Now.Challenge` (exit 0) · exit **0**, no error. `#check` (with `pp.numericTypes` on N1): N1's intervals elaborate over ℝ (`|(2 : ℝ) * Real.arcosh (4 / 2 : ℝ) - 2.634| < 5e-4`), the `IsLeast` sets over ℕ, `(8 : ℕ) < (12 : ℕ)`; N2a quantifies `{A : Type u_1} [Ring A] [Algebra ℂ A]` with `(Complex.I * ↑ħ) •`; N4b reads `s.re = 1 / 2 → s ≠ 1 / 2 → ‖RiemannZeta.Accepted.scatteringRatio s‖ = 1`. **The cross-unit links:** `example : RiemannZeta.ZetaL.scatteringRatio = RiemannZeta.Accepted.scatteringRatio := rfl` and `example : ModularSurface.Now.ms13IsFundDisc = RiemannZeta.Accepted.ms13IsFundDisc := rfl` both elaborate.
- **index** 2026-10-28T22:46:49Z — `RiemannZeta.lean` re-read immediately before the append (header comment + Pilot, ZetaL, Bridge, NoGo, SmallArith, Cyclotomic, MatricesMobius, LValue, Provenance; final byte `0a`); `import RiemannZeta.Accepted.Challenge` appended as the new last line with `>>` (guarded by an exact-line `/usr/bin/grep -qxF`), existing lines kept.
- **B2** 2026-10-28T22:46:49Z → 22:47:00Z — `lake build RiemannZeta` · exit **0** · `Build completed successfully (8726 jobs)` · first error: none · warnings besides `sorry`: 1 × `longLine` on `RiemannZeta.lean:1` (the index's pre-existing header comment, not this seat's line) — left as found.
- **B3** 2026-10-28T22:47:06Z → 22:47:09Z — `lake build RiemannZeta.Accepted.Challenge` (final) · exit **0** · `Build completed successfully (8706 jobs)` (replayed) · first error: none · warnings: 3 × `sorry`, nothing else.

## `#print axioms` on the restated definitions (inspect run, 22:45:59Z) — no `sorry` in any definition
```
'RiemannZeta.Accepted.scatteringRatio' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Accepted.ms13IsFundDisc' depends on axioms: [propext]
```

## Byte-identity checks (by script, `python3 -I <scratchpad>/l-u12/bytecheck.py`, 22:45:35Z, exit 0)
```
restated scatteringRatio: RiemannZeta/ZetaL/Challenge.lean:32-35 (287 bytes) occurs 1x in Challenge -> IDENTICAL
restated ms13IsFundDisc: ModularSurface/Now/Challenge.lean:148-152 (325 bytes) occurs 1x in Challenge -> IDENTICAL
statement RZ-N1: 517 bytes (theorem .. := by[ line end]) occurs 1x followed by '  sorry' -> IDENTICAL
statement RZ-N2a: 759 bytes (theorem .. := by[ line end]) occurs 1x followed by '  sorry' -> IDENTICAL
statement RZ-N4b: 130 bytes (theorem .. := by[ line end]) occurs 1x followed by '  sorry' -> IDENTICAL
ALL IDENTICAL
```
Each restated block is the home file's docstring and body as one contiguous byte run; each statement is the spec's §5 Lean block from `theorem` through the end of the `:= by` line (N2a's carries its end-of-line comment `-- (3.5) at (S, H, D, E)`), followed by `  sorry`. A second script (`<scratchpad>/l-u12/doccheck.py`) confirms each spec's docstring text, up to its ` -/`, is the theorem docstring's first paragraph verbatim.

## Departures from the specs' text, each with its reason
1. **Unit and namespace.** The specs name no unit (§1 "NEW row; no unit assigned", each with a suggested home: N1 → U2, N2a → U5, N4b → U3). The orchestrator's brief places all three in the new unit U12 `RiemannZeta/Accepted`; the statements are namespace-independent apart from the two restated local names, which resolve inside the unit.
2. **Docstrings** carry the spec's text verbatim as the first paragraph, then a second paragraph with the served locus and the PDF sha256 prefix `2d5287e7` (TEMPLATE-L); N2a's second paragraph also names the CC-13 gate on its row. The spec docstrings do not carry the `**…**` bold row id of U10; kept as the spec writes it.
3. **Restated declarations** each carry a `-- Restated byte-identically from …` provenance comment above the docstring (the U9 form); the declaration text itself is unchanged.
4. **None in any statement.**

## Name check (the sitting-71 form, run 22:46Z on the pin's tree `.lake/packages/mathlib/Mathlib/`), hits pasted with their namespace
- `Analysis/SpecialFunctions/Arcosh.lean:61:def arcosh (x : ℝ) :=` — inside `namespace Real` (opened :55, closed :208) → `Real.arcosh`.
- `Order/Monotone/Defs.lean:99:def StrictMonoOn (f : α → β) (s : Set α) : Prop :=` — no `namespace` in the file (only `section MonotoneDef` :57) → root `StrictMonoOn` (a second hit, `GroupTheory/Nilpotent.lean:1013:lemma upperCentralSeries.StrictMonoOn`, is a different declaration).
- `Order/Bounds/Defs.lean:45:def IsLeast (s : Set α) (a : α) : Prop :=` — no `namespace` in the file → root `IsLeast`.
- `NumberTheory/LSeries/RiemannZeta.lean:68:def completedRiemannZeta (s : ℂ) : ℂ := completedHurwitzZetaEven 0 s` — no `namespace` in the file → root. (The regex's known limit (a): the first hits are `completedRiemannZeta₀_one` / `₀_zero` / `completedRiemannZeta₀`, a non-ASCII character counting as a boundary; the true declaration read at :68.)
- `Algebra/Squarefree/Basic.lean:42:def Squarefree [Monoid R] (r : R) : Prop :=` — before `namespace Squarefree` (:181) → root `Squarefree`.
- `Data/Nat/ModEq.lean:36:def Nat.ModEq (n a b : ℕ) :=` — written qualified, before `namespace Nat` (:69) → `Nat.ModEq`; its notation `a ≡ b [MOD n]` at :40 is unscoped (`notation:50`), so `ms13IsFundDisc` needs no `open`.
- `Data/Complex/Basic.lean:240:def I : ℂ :=` — inside `namespace Complex` (opened :43) → `Complex.I`. (A tree-wide run of the short name `I` returns other `I`s first — `TopCat`, `UpperHalfPlane`, a `private def` — so the hit was read in the complex-numbers file.)

## Digest (statements phase)
- `Challenge.lean` (97 lines) sha256 `43e639cca6e866ecb9ab68b4d46ee56a811a5f2443f091f05a83386fe448385a` (after B3) → `formalization.yaml` `statement_sha256_draft:` (V₂ signs `statement_sha256:`).
- `comparator.json` parsed as JSON (python3 -I), `formalization.yaml` parsed as YAML (ruby) — 22:47:26Z.

## Row table
| row | theorem | status |
|---|---|---|
| L:RZ-N1 | `rz_N1_length_monotone_in_trace` | STATED |
| L:RZ-N2a | `rz_N2a_rotation_invariant` | STATED (the row L:RZ-N2 enters T only after CC-13's correction lands) |
| L:RZ-N4b | `rz_N4b_scatteringRatio_norm_one` | STATED |

## Notes for V₂ and the proofs phase
- `comparator.json` lists all three theorems; the Solution module restates `scatteringRatio` and `ms13IsFundDisc` (docstrings and provenance comments included) byte-identically and imports `Mathlib` only (CO's ruling in TEMPLATE-L).
- Proofs-phase pointers (from the specs, not this phase): N1 — `Real.strictMonoOn_arcosh` (Arcosh.lean:110) composed with t ↦ t/2 (positive on (2, ∞)); the two `IsLeast` by `decide`/`interval_cases` below the bound (u ≥ 1 forces t ≥ 4 resp. t² ≥ 36); `ms13IsFundDisc` 12 (m = 3) and 8 (m = 2) by `Nat.ModEq` unfolding and `Nat.squarefree_iff_prime_squarefree` / `decide`; the intervals via 2 arcosh 2 = 2 log(2 + √3) and 2 arcosh 3 = 4 log(1 + √2) (`Real.arcosh` is `log (x + √(x² − 1))`), then log bounds by `Real.exp_bound'` / `Real.sum_le_exp_of_nonneg` with rational brackets on √2, √3 — the upper margin at 3.525 is 5.65 × 10⁻⁶ (the cost driver). N2a — a reordering of the conjunction (`tauto` or `constructor <;> rintro ⟨…⟩ <;> exact ⟨…⟩`). N4b — Λ(2s − 1) = Λ(2it) = Λ(1 − 2it) by `completedRiemannZeta_one_sub`, = conj Λ(1 + 2it) assembled from `riemannZeta_def_of_ne_zero`, `riemannZeta_conj`, `Complex.Gamma_conj`, `Complex.cpow_conj` (no completed-zeta conjugation lemma at the pin), and Λ(1 + 2it) ≠ 0 from `Complex.Gammaℝ_ne_zero_of_re_pos` and `riemannZeta_ne_zero_of_one_le_re`; then `Complex.norm_conj` and `div_self`.
- Scratch files (outside the repo): `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/l-u12/` — `inspect.lean` (+ `inspect.out`; the elaboration, axioms and `rfl`-link check; a later stage may re-run it), `bytecheck.py`, `doccheck.py` (V₂ may re-run them), `src-scatteringRatio.txt`, `src-ms13IsFundDisc.txt` (the extracted home blocks).
- seat closed 2026-10-28T22:48:05Z

## Proofs phase — 2026-10-28 (seat L, prover)

Seat L (Lean prover), PHASE PROOFS, dispatched by Orchestrator A 2026-10-28 after V₂'s signature (statement_sha256 `43e639cc…`, v2_signed 2026-10-28T22:52:27Z). Clocks from `date -u`. No git, no web, nothing under the lab's non-public research trees; Challenge.lean untouched (sha256 `43e639cca6e866ecb9ab68b4d46ee56a811a5f2443f091f05a83386fe448385a` re-read after the last build). Scratch: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/l-u12-proofs/`.

- seat opened 2026-10-28T22:54Z; inputs read: `specs/RZ-N1.md`, `specs/RZ-N2a.md`, `specs/RZ-N4b.md`, `specs/_V2-U12.md`, `specs/_NEW-ROWS-2026-10-28.md` notes 1, 2, 4, 7, this unit's Challenge/formalization.yaml/comparator.json/BUILD-LOG; worked forms `RiemannZeta/ZetaL/Solution.lean` (rz_47 :269–330, rz_49 :392–401), `RiemannZeta/Bridge/Solution.lean` (rz_06a :152–178), `RiemannZeta/LValue/Solution.lean` (the module header and `section Aux` form, :1–47, :443), `ModularSurface/Now/Solution.lean` (ms_13's squarefree-from-prime step, :399).
- **Form.** `Solution.lean` (244 lines) = a proofs header, then the Challenge's text from `namespace RiemannZeta.Accepted` through the end of `ms13IsFundDisc` byte for byte (800 B, both restated definitions with their provenance comments and docstrings), then `section Aux … end Aux` (seven `aux_` helpers, `open ComplexConjugate` scoped inside the section), then each theorem's docstring and statement text as in the Challenge with the proof in place of `sorry`. Imports `Mathlib` only; no other unit. Assembled by script (`assemble.py`: the Challenge's `  sorry` lines replaced in order, the Aux block inserted before `/-! ## L:RZ-N1 -/`), so no statement byte was retyped.

### Route per theorem
- **L:RZ-N1** `rz_N1_length_monotone_in_trace` — PROVED. (i) `aux_strictMonoOn`: `Real.strictMonoOn_arcosh` (Arcosh.lean:110) at a/2, b/2 > 0. (ii) 12 = 4·3, 8 = 4·2 via the right disjunct, `Nat.ModEq` by `rfl`, `Squarefree` from `Nat.prime_three` / `Nat.prime_two` (dot notation resolves to `Irreducible.squarefree`, Algebra/Squarefree/Basic.lean:66, root) — the ms_13 step (ModularSurface/Now/Solution.lean:399, `Nat.prime_five.squarefree`). (iii)–(iv) `aux_least_twelve`, `aux_least_eight`: membership with u = 1 resp. u = 2; below the bound `by_contra!` + `interval_cases t` (+ `interval_cases u` after u ≤ 2 by `nlinarith`) + `nlinarith`/`omega`. (v) `(8 : ℕ) < 12` by `norm_num`; ℓ(4) < ℓ(6) from (i) at 4, 6 ∈ (2, ∞). (vi)–(vii) `aux_arcosh_two`/`aux_arcosh_three` unfold `Real.arcosh` (log (x + √(x² − 1))) to log(2 + √3), log(3 + √8); `aux_interval_two`/`aux_interval_three` bracket the log: lower by exp(a) = exp(a/2)² with `Real.exp_bound'` (Analysis/Complex/Exponential.lean:523, namespace `Real`; needs x ≤ 1, hence the half-argument) at n = 10 and `nlinarith`; upper by `Real.sum_le_exp_of_nonneg` (Exponential.lean:248, `Real`) at order 14 (√3) resp. 18 (√8); rational brackets 1.732 ≤ √3 < 1.7321, 2.828 ≤ √8 < 2.8284272 by `Real.le_sqrt` (Analysis/Real/Sqrt.lean:240) / `Real.sqrt_lt'` (:235); `Real.lt_log_iff_exp_lt` (Log/Basic.lean:167), `Real.log_lt_iff_lt_exp` (:163). Copied form: rz_06a (Bridge/Solution.lean:152–178), the same lemma pair and the `simp only [Finset.sum_range_succ, …, Nat.factorial]; norm_num; linarith` close. The tight edge (upper, 3.525 + 5·10⁻⁴; margin 5.65·10⁻⁶ in ℓ, 2.8·10⁻⁶ in the log) is carried by the order-18 sum at 1.76275 against 3 + 2.8284272.
- **L:RZ-N2a** `rz_N2a_rotation_invariant` — PROVED. `constructor`, each direction `rintro` the four conjuncts and `exact` them reordered ((3.2)…(3.5) ↦ (3.3), (3.4), (3.5), (3.2) and back). No algebra used, as the spec's E0 class says.
- **L:RZ-N4b** `rz_N4b_scatteringRatio_norm_one` — PROVED. w = 2s has Re w = 1, and on the line 2s − 1 = 1 − conj(2s) (`Complex.ext`, `simp [hs]`), so Λ(2s − 1) = Λ(conj(2s)) by `completedRiemannZeta_one_sub` (NumberTheory/LSeries/RiemannZeta.lean:106) = conj Λ(2s) by `aux_completedRiemannZeta_conj`; then `norm_div`, `Complex.norm_conj` (Analysis/Complex/Norm.lean:96), `div_self`. Λ(2s) ≠ 0: Λ(2s) = 0 would give ζ(2s) = 0 through `riemannZeta_def_of_ne_zero` (:154), against `riemannZeta_ne_zero_of_one_le_re` (Nonvanishing.lean:411, `_root_`) — rz_47's step (ZetaL/Solution.lean:296–300, :311–315). `aux_completedRiemannZeta_conj` (Re w = 1): Λ z = ζ z · Γ_ℝ z for z ≠ 0 with Γ_ℝ z ≠ 0 (`Complex.Gammaℝ_ne_zero_of_re_pos`, Deligne.lean:66); `riemannZeta_conj` (Harmonic/ZetaAsymp.lean:458, root); Γ_ℝ(conj w) = conj Γ_ℝ(w) from `Complex.Gammaℝ_def` (Deligne.lean:45), `Complex.Gamma_conj` (Gamma/Basic.lean:356) and `Complex.cpow_conj` (Pow/Complex.lean:243) with arg π = 0 ≠ π (`Complex.arg_ofReal_of_nonneg`, Complex/Arg.lean:223).

### Departures
1. **h₀ (s ≠ 1/2) is not needed by the proof.** The route holds at every point of the line; at s = 1/2 it runs through mathlib's junk values (Λ(0) = Λ(1 − 0), Λ(1) ≠ 0 since mathlib's ζ(1) junk value is nonzero) — the point the statement excludes, as `_NEW-ROWS-2026-10-28.md` note 4 anticipated ("the junk ratio is 1 … not used"). The binding is kept (frozen text) and set aside by `have _h₀ := h₀` with a comment, so the unused-variables linter has nothing to report; no option touched.
2. **The spec's route names √2 (2 arcosh 3 = 4 log(1 + √2)); the proof brackets √8 directly** (arcosh 3 = log(3 + √8) by the definition's own √(x² − 1)), one bracket fewer.
3. **Aux names** (`aux_completedRiemannZeta_conj`, `aux_arcosh_two`, `aux_arcosh_three`, `aux_strictMonoOn`, `aux_least_twelve`, `aux_least_eight`, `aux_interval_two`, `aux_interval_three`) are in the unit namespace inside `section Aux`; no statement uses them.

### Builds and checks
- **P1** 2026-10-28T22:58:49Z → 22:59:06Z — `lake build RiemannZeta.Accepted.Solution` · exit 1 · first error :239 (the imaginary-part goal of `hrefl`: `simp [hw]` left `0 = 1 - 2 * s.re`; repaired to `simp [hs]`).
- **P2** 22:59:17Z → 22:59:31Z — exit **0**; one warning (unused variable `h₀`, Departure 1).
- **P3** 22:59:45Z → 23:00:06Z — exit **0**, no warning.
- **P4 (final)** 2026-10-28T23:00:22Z → 23:00:41Z — `lake build RiemannZeta.Accepted.Solution` · exit **0** · `Build completed successfully (8706 jobs)` · no warning, no `sorry`. Solution.lean sha256 `f383d9d5e7804aa2d5c06ef2181891ae842684c506e9da257425100c1151c315`.
- **axioms** 23:00:45Z — scratch `probe.lean` (`import RiemannZeta.Accepted.Solution`, three `#print axioms`), `lake env lean` exit 0:
```
'RiemannZeta.Accepted.rz_N1_length_monotone_in_trace' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Accepted.rz_N2a_rotation_invariant' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Accepted.rz_N4b_scatteringRatio_norm_one' depends on axioms: [propext, Classical.choice, Quot.sound]
```
- **grep** `/usr/bin/grep -nE "native_decide|sorry|admit|axiom|opaque|set_option" RiemannZeta/Accepted/Solution.lean` → no hits (exit 1).
- **byte identity** (`python3 -I bytecheck.py`, scratch): definitions block (namespace through `ms13IsFundDisc`) identical to the Challenge, 800 B; each theorem text from `theorem` through the `:= by` line occurs once in Solution (518, 760, 131 B with the line end; V₂'s 517, 759, 130 B without it). The first line is `import Mathlib`; no `import` of any unit.
- `comparator.json`: unchanged (all three theorems proved; `theorem_names` lists the three). `formalization.yaml`: unchanged (nothing frozen).

### Row table (proofs phase)
| row | theorem | status |
|---|---|---|
| L:RZ-N1 | `rz_N1_length_monotone_in_trace` | PROVED |
| L:RZ-N2a | `rz_N2a_rotation_invariant` | PROVED (the row L:RZ-N2 still enters T only after CC-13's correction lands) |
| L:RZ-N4b | `rz_N4b_scatteringRatio_norm_one` | PROVED |

- seat closed 2026-10-28T23:03:04Z (after the three `L-proofs:` lines)
