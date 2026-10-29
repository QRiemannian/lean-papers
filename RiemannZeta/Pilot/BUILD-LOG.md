# BUILD-LOG — unit U1 (`RiemannZeta/Pilot`)

Seat L (Lean coder), PHASE STATEMENTS, brief `Orchestrator/Chat-Design/cc-handoff/projects/reputation-play/lean-scoping/seats/L-statements-U1-2026-10-28.md`. Clocks from `date -u`. No git, no web.

- seat opened 2026-10-28T17:17:32Z; this file (first artefact) 2026-10-28T17:18:00Z

## Builds

- **B1** 2026-10-28T17:19:08Z → 17:19:36Z — `lake build RiemannZeta.Pilot.Challenge` · exit **0** · `Build completed successfully (8706 jobs)`, Challenge 21 s · first error: none · warnings: 10 × `declaration uses 'sorry'` (one per theorem), nothing else.
- **inspect** between 17:19:36Z and 17:20:06Z (B1 end, B2 start; not separately clocked) — scratch file (scratchpad, outside the repo) `import RiemannZeta.Pilot.Challenge` + `#check` of all ten theorems: each elaborates to the spec's statement (`!![2,1;1,1].discr` resolves to `Matrix.discr`; `example : M.discr = M.charpoly.discr := rfl` accepted; `ω` → `QuadraticAlgebra.omega`; `(Real.sqrt 5 : ℂ)` → `↑√5`; ζ-side casts to ℂ as written). No error.
- **B2** 2026-10-28T17:20:06Z → 17:20:20Z — `import RiemannZeta.Pilot.Challenge` appended to `RiemannZeta.lean`; `lake build RiemannZeta` · exit **0** · `Build completed successfully (8708 jobs)` · first error: none · warnings: the 10 `sorry` (replayed) + 1 `linter.style.longLine` on `RiemannZeta.lean:1` — the index's pre-existing header comment (115 chars), not this seat's line; left as found for the orchestrator.

## Digest (statements phase)
- `Challenge.lean` sha256 `f0c3f600f6fe0af809c5f618f3ed340d5d6f029f57891f1836cf9b05ce58f1e5` → `formalization.yaml` `statement_sha256_draft:` (V₂ signs `statement_sha256:`).

## Notes for V₂ and the proofs phase
- One theorem per row, except where the V₁-green spec's own signature carries two: **L:RZ-02** (`rz_02_fib_sq` + `rz_02_fib_sq_mem_SL`) and **L:RZ-20a** (`rz_20a_zeta_two_mul_nat` + `rz_20a_zeta_two_mul_nat_rat_mul_pi_pow`). Kept as the specs sign them rather than conjoined, so the statement V₂ reads is the one V₁ signed.
- RZ-02's fourth conjunct uses `Matrix.discr` (the CO alignment note, 17:2xZ); the spec wrote `charpoly.discr`; the two are definitionally equal (`Matrix.discr A := A.charpoly.discr`, Mathlib/LinearAlgebra/Matrix/Charpoly/Disc.lean:26; checked by `rfl` above).
- Everything sits in `namespace RiemannZeta.Pilot` so the unit's `Fact (Nat.Prime 5)` instance (named `fact_prime_five`) and `chi5` cannot collide with another unit's in the `RiemannZeta` index module; `comparator.json` carries the fully-qualified names (Day 0 confirmed dotted names work).
- `chi5` and `fact_prime_five` are definitions with bodies, not holes — no `definition_names` in `comparator.json`.
- RZ-07b is stated and marked OUT-OF-Q5 (pending the wall) in its docstring and in `formalization.yaml`; it is in `theorem_names` so a proof, if the wall admits it, is checked like the rest.
- RZ-20b: CONCEPT, no theorem.
- **Proofs-phase flag:** the brief's `Solution.lean` header is `import RiemannZeta.Pilot.Challenge`. Comparator's model (README at the pinned tag) is that `Solution` "writ[es] out the same theorem" under the same name; if `Solution` imports `Challenge` in the same namespace, every theorem name is already declared and re-declaring it fails. The proofs seat will want either `Solution` without that import (restating `chi5` and the instance identically), or a ruling on the import line. Not acted on here (statements phase).

STATEMENTS-PHASE CLOSE 2026-10-28T17:21:00Z — seat L, unit U1.

---

# PHASE PROOFS — seat L, unit U1

Brief `Orchestrator/Chat-Design/cc-handoff/projects/reputation-play/lean-scoping/seats/L-proofs-U1-2026-10-28.md`, with CO's ruling: `Solution.lean` begins `import Mathlib`, does NOT import `Challenge`, restates `fact_prime_five` and `chi5` byte-identically in `namespace RiemannZeta.Pilot`, and proves the ten theorems under identical names and statement text. `Challenge.lean` is FROZEN (sha256 re-read at open: `f0c3f600f6fe0af809c5f618f3ed340d5d6f029f57891f1836cf9b05ce58f1e5`, equal to `statement_sha256:`). Clocks from `date -u`. No git, no web.

- seat opened 2026-10-28T17:27:28Z (this entry is the first artefact)

## Builds (proofs phase)
- **P1** 2026-10-28T17:30:50Z → 17:31:09Z — Solution with theorems 1..1 proved (through ``), the rest `sorry`; `lake build RiemannZeta.Pilot.Solution` · exit **0** · `Build completed successfully (8706 jobs).` · first error: none · warnings: 9 (0 × `declaration uses 'sorry'`)
- **P2** 2026-10-28T17:31:09Z → 17:31:33Z — Solution with theorems 1..2 proved (through `rz_02_fib_sq`), the rest `sorry`; `lake build RiemannZeta.Pilot.Solution` · exit **0** · `Build completed successfully (8706 jobs).` · first error: none · warnings: 8 (0 × `declaration uses 'sorry'`)
- **P3** 2026-10-28T17:31:33Z → 17:31:46Z — Solution with theorems 1..3 proved (through `rz_02_fib_sq_mem_SL`), the rest `sorry`; `lake build RiemannZeta.Pilot.Solution` · exit **0** · `Build completed successfully (8706 jobs).` · first error: none · warnings: 7 (0 × `declaration uses 'sorry'`)
- **P4** 2026-10-28T17:31:46Z → 17:31:56Z — Solution with theorems 1..4 proved (through `rz_07a_golden_conj_products`), the rest `sorry`; `lake build RiemannZeta.Pilot.Solution` · exit **0** · `Build completed successfully (8706 jobs).` · first error: none · warnings: 6 (0 × `declaration uses 'sorry'`)
- **P5** 2026-10-28T17:31:56Z → 17:32:07Z — Solution with theorems 1..5 proved (through `rz_07b_field_norm`), the rest `sorry`; `lake build RiemannZeta.Pilot.Solution` · exit **0** · `Build completed successfully (8706 jobs).` · first error: none · warnings: 5 (0 × `declaration uses 'sorry'`)
- **P6** 2026-10-28T17:32:08Z → 17:32:18Z — Solution with theorems 1..6 proved (through `rz_11_gaussSum_chi5`), the rest `sorry`; `lake build RiemannZeta.Pilot.Solution` · exit **0** · `Build completed successfully (8706 jobs).` · first error: none · warnings: 4 (0 × `declaration uses 'sorry'`)
- **P7** 2026-10-28T17:32:18Z → 17:32:26Z — Solution with theorems 1..7 proved (through `rz_20a_zeta_two_mul_nat`), the rest `sorry`; `lake build RiemannZeta.Pilot.Solution` · exit **0** · `Build completed successfully (8706 jobs).` · first error: none · warnings: 3 (0 × `declaration uses 'sorry'`)
- **P8** 2026-10-28T17:32:26Z → 17:33:01Z — Solution with theorems 1..8 proved (through `rz_20a_zeta_two_mul_nat_rat_mul_pi_pow`), the rest `sorry`; `lake build RiemannZeta.Pilot.Solution` · exit **0** · `Build completed successfully (8706 jobs).` · first error: none · warnings: 2 (0 × `declaration uses 'sorry'`)
- **P9** 2026-10-28T17:33:01Z → 17:33:35Z — Solution with theorems 1..9 proved (through `rz_23_bernoulli_odd_eq_zero`), the rest `sorry`; `lake build RiemannZeta.Pilot.Solution` · exit **0** · `Build completed successfully (8706 jobs).` · first error: none · warnings: 1 (0 × `declaration uses 'sorry'`)
- **P10** 2026-10-28T17:33:35Z → 17:33:52Z — Solution with theorems 1..10 proved (through `rz_66_discr_cyclotomic_five`), the rest `sorry`; `lake build RiemannZeta.Pilot.Solution` · exit **0** · `Build completed successfully (8706 jobs).` · first error: none · warnings: 0 (0 × `declaration uses 'sorry'`)
- *erratum (appended 2026-10-28T17:34:05Z) to P1–P10:* the `sorry`-count field above grepped the wrong quote character (Lean prints `declaration uses \`sorry\`` with backticks) and so reads 0 in every line; the true counts, re-read from the saved build outputs, are P1 9 · P2 8 · P3 7 · P4 6 · P5 5 · P6 4 · P7 3 · P8 2 · P9 1 · P10 0 — in every build all warnings were these `sorry` warnings and nothing else (no linter warning).
- **F** 2026-10-28T17:34:48Z → 17:34:52Z — final `lake build RiemannZeta.Pilot.Solution` on the closed file · exit **0** · `Build completed successfully (8706 jobs).` · first error: none · warnings: 0

## Checks (proofs phase)
- Forbidden-token scan of `Solution.lean` (`/usr/bin/grep -nwiE 'sorry|admit|axiom|native_decide|set_option|verif[i]ed'`): no hit (grep exit 1).
- Statement identity: from `namespace RiemannZeta.Pilot` to the end, `Challenge.lean` and `Solution.lean` are equal once each `:= by` proof body is masked — every theorem name, docstring and statement text, and the `fact_prime_five` / `chi5` blocks (each also checked as a byte-identical substring). Only the module header comment differs (it names the Solution and the no-import rule).
- `Challenge.lean` sha256 at close: `f0c3f600f6fe0af809c5f618f3ed340d5d6f029f57891f1836cf9b05ce58f1e5` (unchanged; equals `statement_sha256:`). `Solution.lean` sha256 at close: `ffc23b5e557ba47b98c943e02d8823b021cd8b0b2440b28311ceaa4a968bcc7e`.

## Row table (proofs phase)
| Row | Theorem(s) | Status | Proof route |
|---|---|---|---|
| L:RZ-02 | `rz_02_fib_sq` · `rz_02_fib_sq_mem_SL` | PROVED · PROVED | entrywise `fin_cases`+`simp`; `Matrix.det_fin_two_of`, `Matrix.trace_fin_two_of`, `Matrix.discr_fin_two`; SL element `⟨!![2,1;1,1], det = 1⟩` |
| L:RZ-07a | `rz_07a_golden_conj_products` | PROVED | `Real.goldenRatio_mul_goldenConj`; `mul_pow` for the square |
| L:RZ-07b (OUT-OF-Q5, pending the wall) | `rz_07b_field_norm` | PROVED | `Algebra.norm_apply` + `QuadraticAlgebra.det_toLinearMap_eq_norm` (Algebra.norm = `QuadraticAlgebra.norm`), `algebraMap_norm_eq_mul_star`, `norm_def` (N(ω) = −1), `map_pow` |
| L:RZ-11 | `rz_11_gaussSum_chi5` | PROVED | sum over the five residues; χ₅ = 0, 1, −1, −1, 1 (`quadraticChar_neg_one_iff_not_isSquare` / `quadraticChar_one_iff_isSquare` + `decide`); ψ(k) = cos(2πk/5) + i·sin(2πk/5) (`ZMod.toCircle_natCast`, `Complex.exp_mul_I`); the imaginary parts cancel by `sin_two_pi_sub`; real part 2cos(2π/5) − 2cos(4π/5) = (√5−1)/2 + (1+√5)/2 = √5 from `Real.cos_pi_div_five`, `cos_two_mul`, `cos_pi_sub`. The sign is + : τ = +√5 for `ZMod.stdAddChar` |
| L:RZ-20a | `rz_20a_zeta_two_mul_nat` · `rz_20a_zeta_two_mul_nat_rat_mul_pi_pow` | PROVED · PROVED | `riemannZeta_two_mul_nat`, 2^{2n} = 2·2^{2n−1}, `field_simp`/`ring`; q = (−1)^{n+1}·2^{2n−1}·B_{2n}/(2n)! |
| L:RZ-20b | — | CONCEPT (no statement) | — |
| L:RZ-23 | `rz_23_bernoulli_odd_eq_zero` | PROVED | `bernoulli_eq_zero_of_odd` |
| L:RZ-66 | `rz_66_discr_cyclotomic_five` | PROVED | `IsCyclotomicExtension.Rat.discr_prime`: (−1)^2·5^3 = 125 |
| L:RZ-67 | `rz_67_classNumber_cyclotomic_five` | PROVED | `NumberField.classNumber_eq_one_iff` + `IsCyclotomicExtension.Rat.five_pid` |

STATEMENT-CHANGE-NEEDED: none. OPEN: none.

## `#print axioms` (run 2026-10-28T17:34:52Z via `lake env lean` on a scratch file outside the repo importing `RiemannZeta.Pilot.Solution`; exit 0)
```
'RiemannZeta.Pilot.rz_02_fib_sq' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Pilot.rz_02_fib_sq_mem_SL' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Pilot.rz_07a_golden_conj_products' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Pilot.rz_07b_field_norm' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Pilot.rz_11_gaussSum_chi5' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Pilot.rz_20a_zeta_two_mul_nat' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Pilot.rz_20a_zeta_two_mul_nat_rat_mul_pi_pow' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Pilot.rz_23_bernoulli_odd_eq_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Pilot.rz_66_discr_cyclotomic_five' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Pilot.rz_67_classNumber_cyclotomic_five' depends on axioms: [propext, Classical.choice, Quot.sound]
```

PROOFS-PHASE CLOSE 2026-10-28T17:34:52Z — seat L, unit U1. Files written: `RiemannZeta/Pilot/Solution.lean` (new), `RiemannZeta/Pilot/BUILD-LOG.md` (appended). `Challenge.lean`, `comparator.json`, `formalization.yaml` untouched.
- *erratum (appended 2026-10-28T17:34:56Z):* the `#print axioms` heading's clock is the time the section was written; the run itself was 2026-10-28T17:34:21Z → 17:34:25Z (exit 0).
