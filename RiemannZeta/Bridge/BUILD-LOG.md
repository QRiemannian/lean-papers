# BUILD-LOG — unit U2 (`RiemannZeta/Bridge`)

Seat L (Lean coder), PHASE STATEMENTS, brief `Orchestrator/Chat-Design/cc-handoff/projects/reputation-play/lean-scoping/seats/L-statements-U2-2026-10-28.md` (CO notes read: one discriminant spelling `Matrix.discr`; one local `Fact (Nat.Prime 5)` instance; RZ-61b's OUT-OF-Q5 scope docstring; RZ-61c gated on L:RZ-58; φ⁻² spelled `goldenRatio ^ (-2 : ℤ)` across the unit). Clocks from `date -u`. No git, no web.

- seat opened 2026-10-28T17:21:05Z; this file (first artefact) 2026-10-28T17:21:39Z
- specs read, each carrying a `V1: V1-GREEN` line (RZ-61a/b/c also `V1-SPLIT-OK`): RZ-03, RZ-04, RZ-06a, RZ-12, RZ-61a, RZ-61b, RZ-61c.

## Builds

- **B1** 2026-10-28T17:22:23Z → 17:22:44Z — `lake build RiemannZeta.Bridge.Challenge` · exit **0** · `Build completed successfully (8706 jobs)`, Challenge 17 s · first error: none · warnings: 13 × `declaration uses 'sorry'` (one per theorem), nothing else.
- **inspect** 17:22:54Z → 17:23:06Z — scratch file (scratchpad, outside the repo) `import RiemannZeta.Bridge.Challenge` + `#check` of all thirteen theorems with `pp.fullNames`, exit 0: each elaborates to its spec's statement (`.IsHyperbolic` → `Matrix.IsHyperbolic` / `Matrix.GeneralLinearGroup.IsHyperbolic` through `toGL`; `X` → `Polynomial.X`; `goldenRatio` → `Real.goldenRatio`; `√5` → `Real.sqrt 5`; `N ^ ((1 : ℝ) / 2)` is `Real.rpow`; `goldenRatio ^ (-2 : ℤ)` is zpow; `chi5 : DirichletCharacter ℂ 5`; `DirichletCharacter.LFunction chi5 1` elaborates).
- **inspect 2** 17:23:26Z → 17:23:38Z — scratch file, exit 0: the `let` binders of RZ-61a/RZ-61b (pretty-printed `have`) are the instantiated propositions by `Iff.rfl`; `(g : Matrix …).IsHyperbolic ↔ 0 < (g : Matrix …).discr` by `Iff.rfl` (the CO's one discriminant spelling, `Matrix.discr`).
- **index** 17:24:13Z — `RiemannZeta.lean` re-read immediately before the append (it then carried `RiemannZeta.Pilot.Challenge` and `RiemannZeta.ZetaL.Challenge`, the latter another seat's); `import RiemannZeta.Bridge.Challenge` appended as a new last line, existing lines kept.
- **B2** 17:24:13Z → 17:24:15Z — `lake build RiemannZeta.Bridge.Challenge` · `Build completed successfully (8706 jobs)` (replay; the exit was not captured — zsh `PIPESTATUS` slip — so B4 re-runs it with the exit recorded).
- **B3** 17:24:15Z → 17:24:31Z — `lake build RiemannZeta` · exit **0** · `Build completed successfully (8710 jobs)` · first error: none · warnings: the `sorry` warnings of the three units (37) + 1 `linter.style.longLine` on `RiemannZeta.lean:1` — the index's pre-existing header comment, not this seat's line; left as found. Pilot and Bridge both declare `fact_prime_five` and `chi5`, each in its own namespace — no collision.
- **B4** 17:24:39Z → 17:24:42Z — `lake build RiemannZeta.Bridge.Challenge` · exit **0** · `Build completed successfully (8706 jobs)` · first error: none · warnings: 13 × `sorry`, nothing else. **Final.**

## Digest (statements phase)
- `Challenge.lean` sha256 `97cd8d05c2b079fac2662be7a2f6bfe7f6dd4757dc10415401fabe41b23df3cd` (first taken between 17:23:38Z and 17:24:03Z — not separately clocked — re-taken after B4 at 17:24:42Z, identical) → `formalization.yaml` `statement_sha256_draft:` (V₂ signs `statement_sha256:`).

## Notes for V₂ and the proofs phase
- Thirteen theorems for seven spec files, each signature as its V₁-green spec signs it (RZ-03: 3; RZ-04: 3; RZ-06a: 2; RZ-12: 1; RZ-61a: 2; RZ-61b: 1; RZ-61c: 1). Kept as signed rather than conjoined, so the statement V₂ reads is the one V₁ signed.
- **One deviation from a spec's text, by the CO's note:** RZ-04's `rz_04_fib_sq_eigenvalues` spells φ⁻² as `goldenRatio ^ (-2 : ℤ)` (the unit's one spelling, as RZ-61a); the spec wrote `(goldenRatio ^ 2)⁻¹`. Same real number (`zpow_neg`, `zpow_natCast`); V₁ named both spellings faithful.
- RZ-61b: STATED; docstring carries `OUT-OF-Q5 (pending the wall) — counted in T, not in N` and describes the content only as the arithmetic of the printed symbols.
- RZ-61c: χ₅ and `DirichletCharacter.LFunction` elaborate cleanly at the pin, so the statement is written, body `sorry`, docstring `GATED (L:RZ-58)`. `chi5` here is the same expression as U1's `RiemannZeta.Pilot.chi5`, typed `DirichletCharacter ℂ 5` (= `MulChar (ZMod 5) ℂ`); the binding definition is L:RZ-58's, and when RZ-58 lands the two units' `chi5` should become one object.
- `chi5` and `fact_prime_five` are definitions with bodies, not holes — no `definition_names` in `comparator.json`.
- Everything sits in `namespace RiemannZeta.Bridge`; `comparator.json` carries the fully-qualified names (Day 0 confirmed dotted names work).
- **Proofs-phase flag (same as U1's):** with `Solution.lean` importing `RiemannZeta.Bridge.Challenge` in the same namespace, every theorem name is already declared and re-declaring it fails; Comparator's model has `Solution` restate the theorems under the same names. The proofs seat will want `Solution` without that import (restating `chi5` and the instance identically) or a ruling on the import line. Not acted on here.
- Checks run on the file: no `axiom`, no `native_decide`, no `set_option`; retired names: 0 hits in the unit folder.

STATEMENTS-PHASE CLOSE 2026-10-28T17:25:03Z — seat L, unit U2.

---

# PHASE PROOFS — seat L (Lean coder), brief `Orchestrator/Chat-Design/cc-handoff/projects/reputation-play/lean-scoping/seats/L-proofs-U2-2026-10-28.md`

- seat opened 2026-10-28T17:29:10Z; this section (first artefact) 2026-10-28T17:29:24Z. No git, no web. Clocks from `date -u`.
- CO's ruling read: `Solution.lean` begins `import Mathlib` (NOT the Challenge module), opens `namespace RiemannZeta.Bridge`, restates the non-theorem declarations (`fact_prime_five`, `chi5`) byte-identically, and proves each theorem under its identical name and statement text.
- `Challenge.lean` FROZEN: sha256 at seat open `97cd8d05c2b079fac2662be7a2f6bfe7f6dd4757dc10415401fabe41b23df3cd` = `formalization.yaml` `statement_sha256:` (V₂ signed 2026-10-28T17:27:17Z). Not edited.
- `rz_61c_weight_eq_two_L`: **GATED (L:RZ-58)** — left out of `Solution.lean` entirely (a `sorry` outside Challenge fails the check).

## Proof builds
- **P1** 2026-10-28T17:35:47Z → 17:36:01Z — `lake build RiemannZeta.Bridge.Solution` · L:RZ-03 (3 theorems) · exit **0** · `Build completed successfully (8706 jobs).` · first error: none · warning lines: 1
- **P2** 2026-10-28T17:36:11Z → 17:36:56Z — `lake build RiemannZeta.Bridge.Solution` · L:RZ-03 (3 theorems), `show`→`change` after P1's linter warning · exit **0** · `Build completed successfully (8706 jobs).` · first error: none · warning lines: 0
- **P3** 2026-10-28T17:36:56Z → 17:37:44Z — `lake build RiemannZeta.Bridge.Solution` · + L:RZ-04 (3 theorems) · exit **0** · `Build completed successfully (8706 jobs).` · first error: none · warning lines: 0
- **P4** 2026-10-28T17:37:44Z → 17:38:02Z — `lake build RiemannZeta.Bridge.Solution` · + L:RZ-06a (2 theorems) · exit **0** · `Build completed successfully (8706 jobs).` · first error: none · warning lines: 0
- **P5** 2026-10-28T17:38:08Z → 17:39:07Z — `lake build RiemannZeta.Bridge.Solution` · + L:RZ-12 (1 theorem) · exit **0** · `Build completed successfully (8706 jobs).` · first error: none · warning lines: 0
- **P6** 2026-10-28T17:39:07Z → 17:40:04Z — `lake build RiemannZeta.Bridge.Solution` · + L:RZ-61a (2 theorems) · exit **0** · `Build completed successfully (8706 jobs).` · first error: none · warning lines: 0
- **P7** 2026-10-28T17:40:04Z → 17:40:58Z — `lake build RiemannZeta.Bridge.Solution` · + L:RZ-61b (1 theorem) — all twelve ungated theorems; L:RZ-61c left out (GATED) · exit **0** · `Build completed successfully (8706 jobs).` · first error: none · warning lines: 0
- P1–P7 were built one row at a time (the row's theorems added to the cumulative file, then `lake build`); every proof was first elaborated in a scratch file outside the repo (scratchpad, `lake env lean`), then assembled into `Solution.lean` by a script that copies `Challenge.lean` and replaces only each theorem's `sorry` line. **P7 is final.**

## Statement fidelity (mechanical, after P7)
- Script compare of `Solution.lean` against the frozen `Challenge.lean`: `fact_prime_five` and `chi5` (docstring + declaration) IDENTICAL; for each of the twelve proved theorems the `open … in` line, docstring and statement text up to `:= by` IDENTICAL; `rz_61c_weight_eq_two_L` ABSENT; no extra declarations in `Solution.lean`. The module docstring is the Solution's own (not a declaration).
- Token scan of `Solution.lean`: `sorry` 0 · `admit` 0 · `axiom` 0 · `native_decide` 0 · `set_option` 0. Header line 1: `import Mathlib` (no import of the Challenge module).
- `Challenge.lean` sha256 after the phase: `97cd8d05c2b079fac2662be7a2f6bfe7f6dd4757dc10415401fabe41b23df3cd` (unchanged, = `statement_sha256:`). `Solution.lean` sha256: `c0bab8368ff86c7253a34ae563765b1f191d216ab1ee591e3ecebb48c5354597`.

## Numeral method (RZ-06a, RZ-61a)
- log φ ≥ 0.4811875: `Real.le_log_iff_exp_le`, then `Real.exp_bound'` (order-8 Taylor sum + remainder) ≤ 1.618 ≤ φ, with √5 ≥ 2.236 by `Real.le_sqrt`.
- log φ < 0.4812125: `Real.log_lt_iff_lt_exp`, then φ < 1.6180345 (√5 < 2.236069 by `Real.sqrt_lt'`) < order-10 Taylor sum ≤ exp by `Real.sum_le_exp_of_nonneg`. Times 4: [1.92475, 1.92485) — the tight side (margin ≈ 2.7 × 10⁻⁶ in 4 log φ) carried with ≈ 4 × 10⁻⁷ to spare after the rational witnesses.
- 4 log φ/√5: from the RZ-06a interval and 2.236 ≤ √5 ≤ 2.2361 (`le_div_iff₀` / `div_lt_iff₀`, `nlinarith`).

## `#print axioms` (scratch file `import RiemannZeta.Bridge.Solution`, `lake env lean`, run 2026-10-28T17:41:09Z → 17:41:59Z, exit 0)
```
'RiemannZeta.Bridge.rz_03_two_lt_abs_trace_of_isHyperbolic' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Bridge.rz_03_two_lt_abs_trace_of_isHyperbolic_GL' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'RiemannZeta.Bridge.rz_03_min_hyperbolic_abs_trace' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Bridge.rz_04_fib_det_charpoly' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Bridge.rz_04_fib_eigenvalues' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Bridge.rz_04_fib_sq_eigenvalues' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Bridge.rz_06a_two_log_sq_eq' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Bridge.rz_06a_four_log_phi_approx' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Bridge.rz_12_anchoring_identity' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Bridge.rz_61a_weight_chain' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Bridge.rz_61a_weight_approx' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Bridge.rz_61b_factor_two' depends on axioms: [propext, Classical.choice, Quot.sound]
```
Every theorem: exactly `propext`, `Classical.choice`, `Quot.sound`.

## Row table (proofs phase)
| Row | Theorems | Status |
|---|---|---|
| L:RZ-03 | rz_03_two_lt_abs_trace_of_isHyperbolic · rz_03_two_lt_abs_trace_of_isHyperbolic_GL · rz_03_min_hyperbolic_abs_trace | PROVED (3/3) |
| L:RZ-04 | rz_04_fib_det_charpoly · rz_04_fib_eigenvalues · rz_04_fib_sq_eigenvalues | PROVED (3/3) |
| L:RZ-06a | rz_06a_two_log_sq_eq · rz_06a_four_log_phi_approx | PROVED (2/2) |
| L:RZ-12 | rz_12_anchoring_identity | PROVED (1/1) |
| L:RZ-61a | rz_61a_weight_chain · rz_61a_weight_approx | PROVED (2/2) |
| L:RZ-61b | rz_61b_factor_two | PROVED (1/1) — OUT-OF-Q5 (pending the wall), counted in T, not in N |
| L:RZ-61c | rz_61c_weight_eq_two_L | GATED (L:RZ-58) — left out of `Solution.lean` |

STATEMENT-CHANGE-NEEDED: none.

## Flags for the orchestrator (not acted on)
- `comparator.json` still lists `RiemannZeta.Bridge.rz_61c_weight_eq_two_L` (as the statements seat wrote it); with the theorem absent from `Solution.lean`, a Comparator run over the full list will report that name missing until L:RZ-58 lands or the list is ruled. Left as written.
- `formalization.yaml` row statuses still read `STATED`; not changed by this seat.
- `RiemannZeta.lean` (index) not touched: the brief gives the unit import to the orchestrator. `tools/check.sh` not run.

PROOFS-PHASE CLOSE 2026-10-28T17:42:31Z — seat L, unit U2.

- 2026-10-28T17:50:54Z — orchestrator: the "comparator.json still lists rz_61c" flag above is RETIRED; on disk the list carries 12 names and rz_61c is absent (V₃-U2 checked).

## 2026-10-28T21:13:29Z — L:RZ-61c closed on L:RZ-58a (seat L, U10 proofs phase; CO decision 2 of `specs/_UNIT-U10.md`)
- `Solution.lean`: `import RiemannZeta.LValue.Solution` added after `import Mathlib` (the one ruled cross-unit import; a Solution module, never a Challenge); the module docstring's "GATED … left out of this module" paragraph replaced by one saying how 61c is proved; `rz_61c_weight_eq_two_L` added after the restated `chi5`, its `open Real in` line, docstring and text from `theorem` through `:= by` byte-identical to `Challenge.lean` (python3 -I substring check, 21:11Z; the `chi5` block likewise). Every other theorem untouched. 310 lines, sha256 `76a497bd180776b03af092c2ff106e60f7804c4056c26469b6a9c73375d78bf7`.
- Proof: `DirichletCharacter.LFunction chi5 1 = ↑(2 log φ/√5)` is `RiemannZeta.LValue.rz_58a_LFunction_chi5_one` read at `Bridge.chi5` (definitional: the bodies are byte-identical and the two `Fact (Nat.Prime 5)` instances are proofs of one `Prop`); first conjunct `push_cast; ring`; second: real parts, 4 log φ/√5 = 2·(2 log φ/√5) and 2 log φ/√5 > 0 (`Real.log_pos one_lt_goldenRatio`), `linarith`.
- Builds: 2026-10-28T21:10:53Z `lake build RiemannZeta.Bridge.Solution` exit **1** (first error: `linarith` did not see 4·x/√5 as 2·(2·x/√5); one `have … := by ring` added); 2026-10-28T21:11:04Z → 21:11:09Z exit **0**, `Build completed successfully (8707 jobs)`, no warnings; 21:11:36Z `lake build RiemannZeta` exit **0**.
- Axioms (`lake env lean` on a scratch file, 21:11:18Z, exit 0): `'RiemannZeta.Bridge.rz_61c_weight_eq_two_L' depends on axioms: [propext, Classical.choice, Quot.sound]`.
- `comparator.json`: `RiemannZeta.Bridge.rz_61c_weight_eq_two_L` appended to `theorem_names` (12 → 13; parses as JSON). `Challenge.lean` sha256 re-read: `97cd8d05…`, equal to the signed `statement_sha256`.
- Flag (not acted on): `formalization.yaml` still lists rz_61c under `statements_not_checked:` as GATED; that line is now stale. formalization.yaml is outside this seat's files — the orchestrator's call.
