# BUILD-LOG — unit U13 (`ModularSurface/Accepted`, namespace `ModularSurface.Accepted`)

Seat L (Lean coder), PHASE STATEMENTS, dispatched by Orchestrator A 2026-10-28 for the NEW modular-surface rows the wall ACCEPTED (`priority/inbox/WORD-wall-2026-10-28-night-words.md`, word 2); method `Orchestrator/Chat-Design/cc-handoff/projects/reputation-play/lean-scoping/seats/TEMPLATE-L-lean-coder.md` (whole, with the sitting-71 addendum; the name-check form from the sitting-71 addendum of `TEMPLATE-M-statement-author.md`). Scratch at `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/l-u13/`. Clocks from `date -u`. No git, no web, nothing under the lab's non-public research trees.

- seat opened 2026-10-28T22:43:16Z; this file (first artefact) 2026-10-28T22:44:25Z
- inputs read: the brief; the wall's word sheet (`priority/inbox/WORD-wall-2026-10-28-night-words.md`, word 2); TEMPLATE-L (whole, with the sitting-71 addendum) and the filled example `seats/L-statements-U8-2026-10-28.md`; `specs/_NEW-ROWS-2026-10-28.md` and `specs/_V1-NEW-ROWS.md` (whole); `specs/MS-N2a.md`, `specs/MS-N3.md`, `specs/MS-N5a.md` (whole); the form from `ModularSurface/Now/{Challenge.lean,comparator.json,formalization.yaml,BUILD-LOG.md}` (U8) and `RiemannZeta/LValue/{Challenge.lean,comparator.json,formalization.yaml,BUILD-LOG.md}` (U10).
- V₁ gate, read 22:43Z: **MS-N2a** `V1: V1-GREEN 2026-10-28T20:50:09Z`; **MS-N3** `V1: V1-GREEN 2026-10-28T20:50:09Z`; **MS-N5a** `V1: V1-DRIFT 2026-10-28T20:50:09Z` followed by `M-amend: 2026-10-28T20:53:08Z` (§6 declaration, V₁'s fix (a), statement unchanged) — the drift closed by declaration, and the wall's word 2 accepts the row as NEEDS-DEVELOPMENT (stated, frozen, uncounted). Three theorems.
- assembly: `Challenge.lean` was assembled by a script (`<scratch>/l-u13/assemble.py`) that copies U10's lines 26–28 and 30–35 and each spec's §5 Lean block (docstring, `theorem` … `:= by`, and `heckePeriodClosedForm`) from the files themselves; only the module docstring, the section header, the `--` provenance comments and each theorem docstring's second paragraph are hand-written.

## Builds

- **B1** 2026-10-28T22:44:57Z → 22:45:23Z — `lake build ModularSurface.Accepted.Challenge` · exit **0** · `Build completed successfully (8706 jobs)`, Challenge 23 s · first error: none · warnings: 3 × `declaration uses 'sorry'` (lines 58, 74, 88, one per theorem), nothing else (no `longLine`).
- **inspect** 2026-10-28T22:45:32Z → 22:45:50Z — scratch file `<scratch>/l-u13/inspect.lean` (outside the repo) importing `ModularSurface.Accepted.Challenge` and `RiemannZeta.LValue.Challenge` (built first, exit 0), run with `lake env lean` · exit **0**, no error. `#check` with `pp.numericTypes` / `pp.coercions`: N2a's trivial-zero clause reads `¬∃ n, ρ = (-2 : ℂ) * (↑n + (1 : ℂ))` (n : ℕ cast to ℂ, the `rz_47` form), its qualifier `(1 / 2 : ℝ) ≤ ρ.re`, the limit `Filter.Tendsto ModularSurface.Accepted.heckePeriodClosedForm (nhdsWithin ρ {ρ}ᶜ) (nhds (0 : ℂ))`; N3 over ℝ with `systole / (4 : ℝ)`; N5a's points `(1 / 2 : ℂ) + ↑t * Complex.I` and `DirichletCharacter.LFunction ModularSurface.Accepted.chi5`. `#print heckePeriodClosedForm`: `(5 : ℂ) ^ (s / (2 : ℂ)) * Complex.Gamma (s / (2 : ℂ)) ^ (2 : ℕ) * riemannZeta s * DirichletCharacter.LFunction chi5 s / (Complex.Gamma s * riemannZeta ((2 : ℂ) * s))`. **The cross-unit link:** `example : ModularSurface.Accepted.chi5 = RiemannZeta.LValue.chi5 := rfl` and `example : ModularSurface.Accepted.fact_prime_five = RiemannZeta.LValue.fact_prime_five := rfl` both elaborate.
- **index** 2026-10-28T22:47:27Z — `ModularSurface.lean` re-read immediately before the edit (header comment + `import ModularSurface.Now.Challenge`, trailing newline present); `import ModularSurface.Accepted.Challenge` appended as the new last line with `>>`, behind an exact-line `/usr/bin/grep -qxF` guard; existing lines kept. The lakefile's `[[lean_lib]] name = "ModularSurface"`, `globs = ["ModularSurface.*"]` takes the module; no lakefile change.
- **B2** 2026-10-28T22:47:27Z → 22:47:42Z — `lake build ModularSurface` · exit **0** · `Build completed successfully (8710 jobs)` · first error: none · warnings: 16 × `sorry` (U8's Challenge, replayed), 3 × `sorry` (this unit), and 1 × `linter.style.longLine` at `ModularSurface.lean:1` (the index's pre-existing header comment, left as found, as U8's B2 recorded).
- **B3** 2026-10-28T22:47:47Z → 22:47:49Z — `lake build ModularSurface.Accepted.Challenge` (final) · exit **0** · `Build completed successfully (8706 jobs)` (replayed) · first error: none · warnings: 3 × `declaration uses 'sorry'`, nothing else.

## `#print axioms` on each restated / shared definition (inspect run, 22:45:50Z)
```
'ModularSurface.Accepted.fact_prime_five' depends on axioms: [propext, Classical.choice, Quot.sound]
'ModularSurface.Accepted.chi5' depends on axioms: [propext, Classical.choice, Quot.sound]
'ModularSurface.Accepted.heckePeriodClosedForm' depends on axioms: [propext, Classical.choice, Quot.sound]
```

## Byte-identity checks (script `<scratch>/l-u13/bytecheck.py`, `python3 -I`, 2026-10-28T22:46:01Z)
```
SAME fact_prime_five (U10:26-28)
SAME chi5 (U10:30-35)
SAME MS-N2a.md theorem..:= by + sorry
SAME MS-N3.md theorem..:= by + sorry
SAME MS-N5a.md theorem..:= by + sorry
SAME heckePeriodClosedForm (spec MS-N2a §5, docstring+def)
SAME chi5 code lines = spec MS-N2a §5 chi5 code lines
```
Each line is a verbatim substring test of the source text against `Challenge.lean` (U10's lines joined with their newlines; each spec's §5 block from `theorem` through `:= by` plus the `  sorry` line).

## Departures from the specs' text, each with its reason
1. **`chi5` restated from U10, not from the spec's own block.** The spec (`MS-N2a.md` §5) carries a one-line docstring naming U2's `RiemannZeta.Bridge.chi5`; the brief rules the restatement from U10's `RiemannZeta.LValue.chi5` byte-identically, docstring included (lines 30–35). The two code lines are the same in all three places (check above), so the definition is unchanged; only the docstring differs from the spec's.
2. **`fact_prime_five` added** (U10's lines 26–28, docstring included): the spec's block does not carry the instance, but `quadraticChar (ZMod 5)` needs `ZMod 5` to be a field, which needs `Fact (Nat.Prime 5)` (none at the pin for 5). The brief names it.
3. **`--` provenance comments** above each restated / shared definition (source file and lines, or the spec). Comments only.
4. **Theorem docstrings**: the spec's docstring text kept whole as the first paragraph, plus a second paragraph with the served locus (from each spec's §1 header) and the PDF sha256 prefix `b4841489`; N5a's second paragraph also names the NEEDS-DEVELOPMENT status and the declared gap. Per the brief and TEMPLATE-L.
5. **Module docstring** at the top (paper, PDF digest, the three rows, N5a's gap and its `statements_not_checked` home, the self-containment note). The U8 / U10 form.
6. **None in any statement.** The three theorem texts from `theorem` to `:= by` equal the specs' §5 blocks byte for byte; `heckePeriodClosedForm` equals the spec's (docstring and body). L:MS-N3 uses no local definition (only `Real.goldenRatio`, `Real.exp`, `Real.log`), so nothing was restated from `ModularSurface/Now/Challenge.lean` for it; its hypothesis form is `ms_22_halfSystole`'s (`(systole : ℝ) (h : systole = 4 * Real.log Real.goldenRatio)`, the same binder text).

## Name check (the sitting-71 form, `<scratch>/l-u13/namecheck.sh`, run 2026-10-28T22:46Z on the pin), hits pasted with their namespace
The regex of the M template's sitting-71 addendum over `.lake/packages/mathlib/Mathlib/`, then the innermost `namespace` above each hit read with `/usr/bin/grep -n '^namespace \|^end '`.
- `NumberTheory/LSeries/RiemannZeta.lean:121:def riemannZeta := hurwitzZetaEven 0` — no enclosing namespace (only `noncomputable section` at :57) → root `riemannZeta`. (The regex's first hits are `riemannZeta₀` / `riemannZeta₁`, ZetaAsymp.lean:532/536: a non-ASCII subscript after the short name counts as a boundary, the limit M's sheet already tagged.)
- `NumberTheory/LSeries/RiemannZeta.lean:185:def RiemannHypothesis : Prop :=` — root.
- `NumberTheory/LSeries/DirichletContinuation.lean:61:noncomputable def LFunction (χ : DirichletCharacter ℂ N) (s : ℂ) : ℂ := ZMod.LFunction χ s` — inside `namespace DirichletCharacter` (:49) → `DirichletCharacter.LFunction` (two other hits: `ZMod.LFunction`, ZMod.lean:83; the elliptic-curve one, LFunction.lean:79 — not used).
- `NumberTheory/DirichletCharacter/Basic.lean:40:abbrev DirichletCharacter …` — root.
- `NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:120:def quadraticChar : MulChar F ℤ where` — root (sections only).
- `NumberTheory/MulChar/Basic.lean:453:def ringHomComp …` — inside `namespace MulChar` (:88) → `MulChar.ringHomComp`.
- `Data/Int/Cast/Lemmas.lean:85:def castRingHom : ℤ →+* α where` — inside `namespace Int` (:34) → `Int.castRingHom`.
- `Analysis/SpecialFunctions/Gamma/Basic.lean:287:@[irreducible, pp_nodot] def Gamma (s : ℂ) : ℂ :=` — inside `namespace Complex` (:141) → `Complex.Gamma`.
- `NumberTheory/Real/GoldenRatio.lean:37:abbrev goldenRatio : ℝ := (1 + √5) / 2` — inside `namespace Real` (:34) → `Real.goldenRatio`.
- `Analysis/Complex/Exponential.lean:80:nonrec def exp (x : ℝ) : ℝ :=` — inside `namespace Real` (:72) → `Real.exp`.
- `Analysis/SpecialFunctions/Log/Basic.lean:44:noncomputable def log (x : ℝ) : ℝ :=` — inside `namespace Real` (:35) → `Real.log`.
- `Order/Filter/Defs.lean:321:def Tendsto …` — inside `namespace Filter` (:85) → `Filter.Tendsto`.
- `Topology/Defs/Filter.lean:138:def nhdsWithin (x : X) (s : Set X) : Filter X :=` — root.
Every name in the three statements and the shared definitions resolves at the pin; no NEEDS-DEVELOPMENT name.

## Digest (statements phase)
- `Challenge.lean` sha256 `d7307749fdb8fb24ff0e45f8b7550c163a2fb5af99f24fe7cf4857eedd1a63af` (after B3, `shasum -a 256`) → `formalization.yaml` `statement_sha256_draft:` (V₂ signs `statement_sha256:`).
- `comparator.json` parsed as JSON (`python3 -I`): `theorem_names` = N2a and N3 only; N5a is frozen-unproved from the start and not listed. `formalization.yaml` parsed as YAML (ruby, 22:48:07Z: 3 rows, the digest read back, 1 `statements_not_checked` entry).

## Row table
| row | theorem | status | scope |
|---|---|---|---|
| L:MS-N2a | `ms_N2a_closedForm_vanishes` | STATED | in T |
| L:MS-N3 | `ms_N3_phi_from_systole` | STATED | in T |
| L:MS-N5a | `ms_N5a_figure1_nodes` | STATED, frozen | NEEDS-DEVELOPMENT (in T, uncounted); `statements_not_checked` |

## Notes for V₂ and the proofs phase
- V₂ diffs: the restated block against `RiemannZeta/LValue/Challenge.lean:26–28, 30–35`; `heckePeriodClosedForm` and the three theorem texts against the specs' §5 (the bytecheck script above re-runs as is).
- `Solution.lean` (proofs phase): `import Mathlib` only, namespace `ModularSurface.Accepted`, restate `fact_prime_five`, `chi5`, `heckePeriodClosedForm` byte-identically (with their `--` comments and docstrings), then N2a and N3 under the identical statement text (CO's ruling in TEMPLATE-L). N5a stays out of `Solution.lean` and out of `theorem_names` unless the wall moves it.
- Proof pointers from the specs (not this phase): **N3** E0 — `Real.exp_log` with `Real.goldenRatio_pos`, `h ▸` and `field_simp`/`ring`. **N2a** E2 — at ρ ≠ 1/2: continuity of the quotient at ρ (`Complex.differentiableAt_Gamma` at ρ/2 and ρ, `Complex.Gamma_ne_zero`, `DirichletCharacter.differentiable_LFunction` with χ₅ ≠ 1 by χ₅(2) = −1 as in U10's `aux_chi5_ne_one`, `differentiableAt_riemannZeta` at ρ and 2ρ, `riemannZeta_ne_zero_of_one_le_re` for ζ(2ρ) ≠ 0), then the value 0 from ζ(ρ) = 0 and `ContinuousAt.tendsto` restricted to 𝓝[≠]; at ρ = 1/2: `riemannZeta_residue_one` gives ‖ζ(2s)‖ → ∞ while the numerator stays bounded. The RH arm reduces to the first (RH gives Re ρ = 1/2 for nontrivial zeros). **N5a** (if ever developed): shares N2a's toolkit; the third conjunct needs nonvanishing of every other factor on the line and `tendsto_nhds_unique`.
- Scratch files (outside the repo): `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/l-u13/` — `assemble.py`, `bytecheck.py`, `inspect.lean`, `namecheck.sh`. V₂ may re-run `bytecheck.py` and `inspect.lean`; no other stage needs them.
- seat closed 2026-10-28T22:48:54Z

## Proofs phase — seat L, 2026-10-28T23:01:37Z

Brief: prove `ms_N2a_closedForm_vanishes` and `ms_N3_phi_from_systole` in a new `Solution.lean` against the frozen Challenge (sha256 `d7307749fdb8fb24ff0e45f8b7550c163a2fb5af99f24fe7cf4857eedd1a63af`, V₂-signed 2026-10-28T22:53:46Z; re-read at this phase, unchanged). Inputs read: `specs/MS-N2a.md`, `specs/MS-N3.md`, `specs/_V2-U13.md`, this log, `Challenge.lean`, `comparator.json`, `formalization.yaml`; worked forms `RiemannZeta/LValue/Solution.lean`, `ModularSurface/Now/Solution.lean`.

### Result
- **L:MS-N2a `ms_N2a_closedForm_vanishes` — PROVED.**
- **L:MS-N3 `ms_N3_phi_from_systole` — PROVED.**
- **L:MS-N5a `ms_N5a_figure1_nodes` stays frozen and unproved by the wall's word (NEEDS-DEVELOPMENT): not restated in Solution.lean, absent from `comparator.json` `theorem_names`, its gap kept under `statements_not_checked`. Not attempted.**
- `comparator.json` and `formalization.yaml` untouched (both proved theorems were already the listed ones).

### Solution.lean layout
`import Mathlib` only; module docstring; `namespace ModularSurface.Accepted`; Challenge lines 26–49 copied byte-for-byte (the heading, `fact_prime_five`, `chi5`, `heckePeriodClosedForm`, with their `--` comments and docstrings; programmatic substring check: True); `section Aux` (Solution lines 55–156, `open Filter Topology` inside the section only); then Challenge lines 50–76 (both theorems with their docstrings and headings) with each `  sorry` replaced by the proof (statement text from `theorem` through `:=` a substring of Solution.lean for both: True); `end ModularSurface.Accepted`. No `open` outside `section Aux`; no statement uses an `aux_*` name. Solution.lean sha256 `4874921e8672e8c475e053f1eec67ac9ac02dd883693be5631301465641d1af0`.

### Route — L:MS-N2a (spec §3 "Why it is true", §5 cost note)
Write the closed form as N(s) · (Γ(s)⁻¹ · ζ(2s)⁻¹) with N(s) = 5^{s/2} Γ(s/2)² ζ(s) L(s, χ₅) (`aux_num`, `aux_closedForm_eq`: `div_eq_mul_inv`, `mul_inv`). Core lemma `aux_closedForm_tendsto_zero` (ζ ρ = 0, ρ ≠ 1, 1/2 ≤ Re ρ ⇒ limit 0 on 𝓝[≠] ρ):
1. N continuous at ρ (`aux_num_continuousAt`): 5^{s/2} by `DifferentiableAt.const_cpow` (base 5 ≠ 0); Γ(s/2) by `Complex.differentiableAt_Gamma` at ρ/2 (ρ/2 ≠ −m because Re(ρ/2) > 0); ζ by `differentiableAt_riemannZeta` (ρ ≠ 1); L(·, χ₅) by `DirichletCharacter.differentiable_LFunction` with `aux_chi5_ne_one`. N(ρ) = 0 from ζ(ρ) = 0.
2. Γ⁻¹ entire: `Complex.differentiable_one_div_Gamma` (stated with `(Gamma s)⁻¹`).
3. ζ(2s)⁻¹ has a finite limit c on 𝓝[≠] ρ (`aux_inv_zeta_two_tendsto`), split on 2ρ = 1: if 2ρ ≠ 1, c = ζ(2ρ)⁻¹ by continuity of ζ at 2ρ and `riemannZeta_ne_zero_of_one_le_re` (Re 2ρ ≥ 1), `Tendsto.inv₀`; if 2ρ = 1, c = 0 by `aux_inv_zeta_tendsto_one` — from `riemannZeta_residue_one`, ζ(w)⁻¹ = (w − 1)·((w − 1)ζ(w))⁻¹ for w ≠ 1 → 0 · 1⁻¹ — composed with s ↦ 2s carried into 𝓝[≠] 1 by `tendsto_nhdsWithin_of_tendsto_nhds_of_eventually_within`. No ζ(1/2) ≠ 0 lemma is used (spec §3's note holds).
4. Product → 0 · (Γ(ρ)⁻¹ · c) = 0; `Tendsto.congr'` back to `heckePeriodClosedForm`.
Conjunct 1 applies the core lemma (the trivial-zero hypothesis is unused). Conjunct 2: `RiemannHypothesis` gives Re ρ = 1/2 at every nontrivial zero, so `le_of_eq` feeds the core lemma.

### Route — L:MS-N3 (spec pointer E0)
`systole / 4 = Real.log Real.goldenRatio` by `rw [h]; ring`; the first conjunct by `Real.exp_log Real.goldenRatio_pos`, the second is its symmetric.

### Steps copied, with source lines
- `aux_q_vals` (Solution 60–66) ← `RiemannZeta/LValue/Solution.lean` 226–232, verbatim.
- `aux_chi5_apply` (Solution 68) ← same file 234, verbatim (`rfl`, valid because `chi5`'s body is byte-identical to U10's).
- `aux_chi5_ne_one` (Solution 71–75) ← same file 392–396, verbatim.
- N3's hypothesis form follows `ModularSurface/Now/Solution.lean` 609 (`ms_22_halfSystole`); no step copied (E0 proof written here).

### Departures
- None in any statement or restated declaration. Two docstrings added to copied aux lemmas (comments only). `aux_num` is a local helper definition inside `section Aux`, used by no statement.

### Name check — mathlib hits used by the proofs, with namespace
- `riemannZeta_residue_one` — NumberTheory/LSeries/RiemannZeta.lean:242, root.
- `differentiableAt_riemannZeta` — RiemannZeta.lean:139, root.
- `riemannZeta_ne_zero_of_one_le_re` — NumberTheory/LSeries/Nonvanishing.lean:411, `_root_`.
- `DirichletCharacter.differentiable_LFunction` — NumberTheory/LSeries/DirichletContinuation.lean:98, namespace `DirichletCharacter` (:49).
- `Complex.differentiableAt_Gamma` — Analysis/SpecialFunctions/Gamma/Deriv.lean:65, namespace `Complex` (:37).
- `Complex.differentiable_one_div_Gamma` — Analysis/SpecialFunctions/Gamma/Beta.lean:522, namespace `Complex` (:372).
- `DifferentiableAt.const_cpow` — Analysis/SpecialFunctions/Pow/Deriv.lean:111.
- `tendsto_nhdsWithin_of_tendsto_nhds_of_eventually_within` — Topology/NhdsWithin.lean:460, root.
- `Real.exp_log` — Analysis/SpecialFunctions/Log/Basic.lean:59, namespace `Real` (:35).
- `quadraticChar_neg_one_iff_not_isSquare` / `quadraticChar_one_iff_isSquare` — NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:159 / :134, root.
- `mul_inv_cancel₀` — Algebra/GroupWithZero/Defs.lean:239, root.

### Build and checks
- Scratch compile `lake env lean <scratch>/Solution.lean`: exit 0, no output.
- `lake build ModularSurface.Accepted.Solution`: `✔ [8706/8706] Built ModularSurface.Accepted.Solution (17s)`, "Build completed successfully", exit 0 (2026-10-28T23:00:06Z); rebuild output grepped for warn/sorry/error: empty.
- `#print axioms` (scratch probe `<scratch>/axioms.lean`, `import ModularSurface.Accepted.Solution`):
```
'ModularSurface.Accepted.ms_N2a_closedForm_vanishes' depends on axioms: [propext, Classical.choice, Quot.sound]
'ModularSurface.Accepted.ms_N3_phi_from_systole' depends on axioms: [propext, Classical.choice, Quot.sound]
```
- `/usr/bin/grep -nE "native_decide|sorry|admit|axiom|opaque|set_option" Solution.lean`: no hits (exit 1).
- `tools/check.sh` not run (per brief).
- Scratch: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/l-u13-proofs/` (`header.txt`, `aux.txt`, `Solution.lean`, `axioms.lean`); no later stage needs them.

### Row table (proofs phase)
| row | theorem | status |
|---|---|---|
| L:MS-N2a | `ms_N2a_closedForm_vanishes` | PROVED |
| L:MS-N3 | `ms_N3_phi_from_systole` | PROVED |
| L:MS-N5a | `ms_N5a_figure1_nodes` | frozen, unproved — NEEDS-DEVELOPMENT by the wall's word |

- seat closed 2026-10-28T23:01:37Z
