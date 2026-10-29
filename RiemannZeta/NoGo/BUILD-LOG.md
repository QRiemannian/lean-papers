# BUILD-LOG — unit U5 (`RiemannZeta/NoGo`)

Seat L (Lean coder), PHASE STATEMENTS, brief `Orchestrator/Chat-Design/cc-handoff/projects/reputation-play/lean-scoping/seats/L-statements-U5-2026-10-28.md`. Clocks from `date -u`. No git, no web.

- seat opened 2026-10-28T17:28:07Z; this file (first artefact) 2026-10-28T17:28:31Z
- inputs read: `specs/_UNIT-U5.md`, `specs/_V1-U5.md`, `lean-scoping/DAY0-2026-10-28.md` (comparator schema), the four spec files RZ-80, RZ-81, RZ-82a, RZ-82b, each carrying a `V1:` line — RZ-80 V1-GREEN · RZ-81 V1-GREEN (+ wording note) · RZ-82a V1-SPLIT-OK + V1-GREEN · RZ-82b V1-SPLIT-OK + V1-GREEN as a statement (OUT-OF-Q5, NEEDS-DEVELOPMENT). Precedent read: units Bridge and ZetaL (layout, docstring form, comparator.json, formalization.yaml).

## Builds

- **B1** 2026-10-28T17:29:17Z → 17:29:32Z — `lake build RiemannZeta.NoGo.Challenge` · exit **1** · first error: `Challenge.lean:97:13: failed to synthesize instance of type class LieRing (Matrix (Fin 2) (Fin 2) ℝ)` (RZ-82a; second identical error at 99:14) · RZ-80, RZ-81, RZ-82b elaborated (3 × `sorry`). Cause: at the pin `LieRing.ofAssociativeRing` is a `def` (`@[instance_reducible]`), not a global instance; `Mathlib.Algebra.Lie.Classical` itself states `sl`/`so` under `attribute [local instance 100] LieRing.ofAssociativeRing`.
- **repair** between B1 (17:29:32Z) and B2 (17:29:52Z), not separately clocked — the same line, scoped to the one declaration: `attribute [local instance 100] LieRing.ofAssociativeRing in` before `rz_82a_cartan_sl2` (mathlib's own convention; not a `set_option`, weakens no check; the statement text is unchanged).
- **B2** 17:29:52Z → 17:30:10Z — `lake build RiemannZeta.NoGo.Challenge` · exit **0** · `Build completed successfully (8706 jobs)`, Challenge 14 s · first error: none · warnings: 4 × `declaration uses 'sorry'`, nothing else.
- **inspect** 17:30:18Z → 17:30:22Z — scratch file (scratchpad, outside the repo) `#check` with `pp.fullNames` / `pp.numericTypes` on all four theorems + `#print symmTraceless2`: each elaborates to its spec's signature (RZ-80: `𝒜 : ZMod 2 → Submodule ℂ A`, `[GradedAlgebra 𝒜]`, iℏ = `Complex.I * ↑ħ` acting by `•`; RZ-81: the two legs, universe-polymorphic `A : Type u`; RZ-82a: the three `let`s pretty-print as `have`, `Module.finrank ℝ ↥𝔰𝔩 = 3`, `Module.finrank ℝ ↥𝔭 = 2`; RZ-82b: `∃ θ : L ≃ₗ⁅ℝ⁆ L`, `killingForm ℝ L` resolves its instances from `[FiniteDimensional ℝ L]`). The scratch file's one extra `example` failed to parse (`ᵀ` without `open Matrix`) — a scratch slip, not the unit.
- **inspect 2** 17:30:30Z → 17:30:47Z — scratch file, exit 0: `X ∈ symmTraceless2 ↔ Xᵀ = X ∧ X.trace = 0` closes by `simp [symmTraceless2, Matrix.IsSelfAdjoint, Matrix.IsAdjointPair]` — the local def is the symmetric traceless matrices; `rz_81_jacobi_forces_DEH_zero.{0}` instantiates.
- **index** 17:31:08Z — `RiemannZeta.lean` re-read immediately before the append (header comment + Pilot, ZetaL, Bridge imports); `import RiemannZeta.NoGo.Challenge` appended with `>>` as a new last line, existing lines kept.
- **B3** 17:31:08Z → 17:31:32Z — `lake build RiemannZeta` · exit **0** · `Build completed successfully (8712 jobs)` · first error: none · warnings: 50 × `sorry` (NoGo 4 · Bridge 13 · Pilot Challenge 10 · Pilot Solution 9 · ZetaL 14 — the other units are other seats', built through the lean_lib glob) + 1 `linter.style.longLine` on `RiemannZeta.lean:1` (the index's pre-existing header comment, not this seat's line; left as found).
- **B4** 17:31:32Z → 17:31:36Z — `lake build RiemannZeta.NoGo.Challenge` · exit **0** · `Build completed successfully (8706 jobs)` (replayed) · first error: none · warnings: 4 × `sorry`, nothing else. **Final.**

## Digest (statements phase)
- `Challenge.lean` sha256 `f4c872442f0acc7aee951cf322243206ba56d68176cc6c47c4f754e408314ba2` (taken 17:31:02Z, re-taken after B4 17:31:36Z, identical) → `formalization.yaml` `statement_sha256_draft:` (V₂ signs `statement_sha256:`).

## Row table
| row | theorem | status |
|---|---|---|
| L:RZ-80 | `RiemannZeta.NoGo.rz_80_z2_grading_incompatible` | STATED |
| L:RZ-81 | `RiemannZeta.NoGo.rz_81_jacobi_forces_DEH_zero` | STATED (one theorem, the printed conjunction) |
| L:RZ-82a | `RiemannZeta.NoGo.rz_82a_cartan_sl2` | STATED |
| L:RZ-82b | `RiemannZeta.NoGo.rz_82b_cartan_decomposition` | STATED — OUT-OF-Q5 (pending the wall), NEEDS-DEVELOPMENT; elaborates cleanly with the pin's objects (`LieEquiv`, `LieAlgebra.IsSemisimple`, `killingForm`); docstring says so |

## Notes for V₂ and the proofs phase
- Every statement is its V₁-signed spec signature verbatim, inside `namespace RiemannZeta.NoGo`; `comparator.json` carries the fully-qualified names (Day-0 schema). RZ-82b sits in `theorem_names` as ZetaL's RZ-32b does, so a proof, if the wall admits it, is checked like the rest.
- **Q7 held:** no `structure`, no `class`; the relations are hypotheses over an arbitrary `[Ring A] [Algebra ℂ A]` (RZ-80: (3.2) alone; RZ-81: all six). The one local `def` is `symmTraceless2` (a definition with a body, not a hole — no `definition_names`).
- **One addition beside a spec's text:** `attribute [local instance 100] LieRing.ofAssociativeRing in` before RZ-82a (B1's error; mathlib's own convention in `Mathlib.Algebra.Lie.Classical`). It changes no statement token; without it `LieAlgebra.Orthogonal.so (Fin 2) ℝ` does not elaborate at the pin. The proofs seat needs the same local instance wherever it restates RZ-82a.
- `universe u` declared once for RZ-81's `∀ {A : Type u}`, as the spec writes it.
- **Proofs-phase flag (same as U1–U3):** a `Solution` that imports `Challenge` in the same namespace cannot re-declare the theorem names Comparator expects; per the orchestrator's later note (Comparator README step 4) the Solution module restates rather than imports — then `symmTraceless2`, the universe and the local-instance line must be restated identically. Not acted on here.
- Scans on the unit folder: no `axiom` declaration, no `native_decide`, no `set_option`; retired names: 0 hits (the only `/usr/bin/grep -i axiom` hit is the schema key `permitted_axioms` in `comparator.json`).

STATEMENTS-PHASE CLOSE 2026-10-28T17:32:09Z — seat L, unit U5.

---

# PHASE PROOFS — seat L, unit U5

Brief `Orchestrator/Chat-Design/cc-handoff/projects/reputation-play/lean-scoping/seats/L-proofs-U5-2026-10-28.md` (incl. CO's ruling on the Solution module). Seat opened 2026-10-28T17:38:41Z; this section (first artefact) 2026-10-28T17:38:51Z. `Challenge.lean` FROZEN — sha256 re-taken at open: `f4c872442f0acc7aee951cf322243206ba56d68176cc6c47c4f754e408314ba2` (matches V₂'s `statement_sha256`). Scope: RZ-80, RZ-81, RZ-82a; RZ-82b OUT-OF-Q5 — left out of Solution.

## Builds (proofs phase)

- **scratch** 17:39Z → 17:43Z — each theorem first elaborated alone in a scratchpad file (outside the repo) by `lake env lean`, one at a time: RZ-80 exit 0 (first pass); RZ-81 exit 1 then 0 (first error `Unknown constant Matrix.zero_fin_two` in leg (b)'s N·N = 0 step — replaced by `ext` + `fin_cases` + `Matrix.mul_apply`); RZ-82a exit 0 with two `linter.unnecessarySeqFocus` warnings (fixed in assembly). Not separately clocked per file; the unit builds below are the record.
- **P1** 2026-10-28T17:43:33Z → 17:43:58Z — `Solution.lean` assembled (Challenge lines 28–107 copied verbatim, each `sorry` replaced by its proof, RZ-82b left out); `lake build RiemannZeta.NoGo.Solution` · exit **0** · `Build completed successfully (8706 jobs)` · first error: none · warnings: 1 × `linter.style.longLine` (Solution.lean:101), 0 × `sorry`.
- **P2** 17:44:06Z → 17:44:13Z — a different line wrapped (RZ-82a's `invFun`; not the flagged one) · exit **0** · same 1 × `longLine` warning at :101.
- **P3** 17:44:20Z → 17:44:26Z — the flagged line (RZ-81's `simp only … at F1 … G3`) wrapped · exit **0** · `Build completed successfully (8706 jobs)` · first error: none · warnings: **none**. **Final.**
- **checks** 17:44:30Z → 17:44:39Z — (i) byte-identity: the three Challenge chunks between the `sorry` lines (`universe u` + RZ-80 docstring/statement · RZ-81 docstring/statement + `symmTraceless2` docstring/def + the two comment lines + `attribute [local instance 100] LieRing.ofAssociativeRing in` + RZ-82a docstring/statement) each found verbatim in `Solution.lean` (python substring test: True × 3); `rz_82b` absent from Solution. (ii) `/usr/bin/grep -nE "sorry|admit|axiom|native_decide|set_option" Solution.lean` → no hits. (iii) retired-name / forbidden-word scan on Solution → no hits. (iv) `Challenge.lean` sha256 re-taken: `f4c872442f0acc7aee951cf322243206ba56d68176cc6c47c4f754e408314ba2` (unchanged, = V₂'s `statement_sha256`); `Solution.lean` sha256 `a049be3273299c7e31dac031c7f3108a46baea9d1f88e7e550d4a58ab76525b8`.

## Row table (proofs phase)
| row | theorem | status | proof route |
|---|---|---|---|
| L:RZ-80 | `rz_80_z2_grading_incompatible` | **PROVED** | `SetLike.mul_mem_graded` puts ÊŜ, ŜÊ in 𝒜 (1+1) = 𝒜 0 and ĤD̂ in 𝒜 1; (3.2) puts [Ê, Ŝ] in 𝒜 0 ∩ 𝒜 1; `DirectSum.decompose_of_mem_same` + `decompose_of_mem_ne` give [Ê, Ŝ] = 0; then `smul_eq_zero` with iℏ ≠ 0 gives ĤD̂ = 0 |
| L:RZ-81 | `rz_81_jacobi_forces_DEH_zero` | **PROVED** | (a) the Jacobi triple (D̂, Ê, Ĥ): (13.3)-first, (3.4), (3.5) each multiplied left/right by the third operator (six instances), then (13.3)-second·D̂, Ê·(3.2), (3.3)·Ĥ for the leftover commutators; normalised with `mul_smul_comm`/`smul_mul_assoc`/`mul_assoc` and closed by `linear_combination (norm := module)` to (iℏ)² • D̂ÊĤ = 0, hence D̂ÊĤ = 0; the units leg by `IsUnit.mul` + `IsUnit.ne_zero`. The associative Jacobi identity enters as the cancellation inside that linear combination (the `noncomm_ring`/`lie_jacobi` route of the brief was not needed). (b) N = !![0,1;0,0] for all four operators, N·N = 0 by `ext`/`fin_cases`, N ≠ 0 at entry (0,1) |
| L:RZ-82a | `rz_82a_cartan_sl2` | **PROVED** | membership: `LieAlgebra.Orthogonal.mem_so` (Xᵀ = −X), `symmTraceless2` unfolds to Xᵀ = X ∧ tr X = 0, `sl`'s submodule is `ker trace` (`Iff.rfl`); 𝔨 ⊔ 𝔭 = 𝔰𝔩 by `le_antisymm` and `Submodule.mem_sup` with X = ½(X − Xᵀ) + ½(X + Xᵀ); 𝔨 ⊓ 𝔭 = ⊥ by 2X = 0; the three inclusions of (13.6) by `Matrix.transpose_mul` + `noncomm_ring` (and `Matrix.trace_mul_comm` for tr [X, Y] = 0); finrank 3 and 2 by explicit bases `Module.Basis.ofEquivFun` of the coordinate equivalences 𝔰𝔩 ≃ ℝ³ (X₀₀, X₀₁, X₁₀) and 𝔭 ≃ ℝ² (X₀₀, X₀₁), then `Module.finrank_eq_card_basis` |
| L:RZ-82b | `rz_82b_cartan_decomposition` | **OUT-OF-Q5 / NOT PROVED** — left out of `Solution.lean` entirely (pending the wall; NEEDS-DEVELOPMENT: no Cartan involution at the pin) | — |

No row needed a statement change (no STATEMENT-CHANGE-NEEDED); no row OPEN.

## #print axioms (scratchpad file `import RiemannZeta.NoGo.Solution`, `lake env lean`, 17:44:35Z → 17:44:39Z, exit 0)
```
'RiemannZeta.NoGo.rz_80_z2_grading_incompatible' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.NoGo.rz_81_jacobi_forces_DEH_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.NoGo.rz_82a_cartan_sl2' depends on axioms: [propext, Classical.choice, Quot.sound]
```

## Notes for the orchestrator
- `comparator.json` `theorem_names` still lists `RiemannZeta.NoGo.rz_82b_cartan_decomposition`, which `Solution.lean` does not contain (by the brief). Left as V₂ signed it; a Comparator run over the unit as listed reports that one name missing. ZetaL's `comparator.json` today carries no `rz_32b` — the same disposition (drop while OUT-OF-Q5) would apply here, at the orchestrator's hand.
- `formalization.yaml` untouched in this phase (statuses stay `STATED`, as the Pilot and ZetaL precedents keep them).
- Builds were run on the assembled module rather than once per theorem; each theorem was first elaborated alone in scratch (above).

PROOFS-PHASE CLOSE 2026-10-28T17:45:17Z — seat L, unit U5.
