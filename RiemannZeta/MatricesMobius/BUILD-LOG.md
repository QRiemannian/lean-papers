# BUILD-LOG — unit U4 (`RiemannZeta/MatricesMobius`)

Seat L (Lean coder), PHASE STATEMENTS, brief `Orchestrator/Chat-Design/cc-handoff/projects/reputation-play/lean-scoping/seats/L-statements-U4-2026-10-28.md`. Clocks from `date -u`. No git, no web.

- seat opened 2026-10-28T17:34:59Z; this file (first artefact) 2026-10-28T17:36:05Z
- inputs read: the brief; `lean-scoping/DAY0-2026-10-28.md` (Comparator schema); `specs/_UNIT-U4.md`; `specs/_V1-U4.md` (incl. its 17:34:26Z follow-up: RZ-63b V1-GREEN, RZ-43 split V1-SPLIT-OK); the sixteen U4 specs; sibling unit U2's files for format.
- rows per the dispatch: in scope RZ-41a, RZ-43a, RZ-43b (in scope under L:RZ-43), RZ-53a, RZ-55, RZ-63a, RZ-64a, RZ-83; OUT-OF-Q5 legs RZ-41c, RZ-53b, RZ-53c, RZ-63b, RZ-64b, RZ-64c (stated where they elaborate cleanly with the pin's objects, else OPEN with the reason); RZ-41b is V1-CC (CC-16) and gets no theorem.

## Builds
- **B1** 2026-10-28T17:38:15Z → 17:39:33Z — `lake build RiemannZeta.MatricesMobius.Challenge` · exit **0** · `Build completed successfully (8706 jobs)`, Challenge 71 s · first error: none · warnings: 14 × `declaration uses 'sorry'` (one per theorem; RZ-64c not yet in the file) + 3 × `linter.style.longLine` (lines 256, 285, 293) — to be wrapped. The two `NumberField` instances (ℚ⟮√2⟯, ℚ⟮√5⟯) elaborated with their proofs on the first pass.
- **B2** 2026-10-28T17:41:20Z → 17:42:12Z — after wrapping the three long lines and adding `RZ.phiSq` + RZ-64c (construction prototyped first in a scratchpad file outside the repo, `lake env lean`, 17:40:07Z → 17:40:54Z, exit 0) · exit **1** · first error: `Challenge.lean:318:25: Ambiguous term natCast_mem` (`_root_.natCast_mem` vs `IntermediateField.natCast_mem` under `open IntermediateField`) · fix: qualify as `IntermediateField.natCast_mem`.
- **B3** 2026-10-28T17:42:21Z → 17:42:33Z — `lake build RiemannZeta.MatricesMobius.Challenge` · exit **0** · `Build completed successfully (8706 jobs)`, Challenge 8.2 s · first error: none · warnings: 15 × `declaration uses 'sorry'` (one per theorem), nothing else.
- **inspect 1** 2026-10-28T17:42:51Z → 17:43:02Z — scratch file (scratchpad, outside the repo) `import RiemannZeta.MatricesMobius.Challenge` + `#check` of all fifteen theorems with `pp.fullNames`, exit 0. Each elaborates to its spec's statement (`I`/`ρ` → `UpperHalfPlane.I`/`UpperHalfPlane.ρ`; `.IsHyperbolic`/`.IsElliptic`/`.IsParabolic` → `Matrix.*`; `√` → `Real.sqrt`; `NumberField.discr ↥ℚ⟮√2⟯` / `ℚ⟮√5⟯` found the file's instances), with one exception: RZ-55 clause (v), written as in the spec `l.map fun n => !![0, 1; 1, (n : ℤ)]`, elaborated by coercing the list `l : List ℕ` to `List ℤ` first (pretty-printed `List.map (fun n => …) (do let a ← l; pure ↑a)`) — the same value, but not the reading on the page. Also checked by `example`s: `dist` on ℍ in RZ-63b is the hyperbolic metric (`UpperHalfPlane.dist_eq` typechecks against it); `IsHyperbolic ↔ 0 < discr` and `IsElliptic ↔ discr < 0` by `Iff.rfl`; `RZ.gaussMap x = Int.fract x⁻¹` and `(RZ.phiSq : ℝ) = φ²` by `rfl`. `#print axioms` on the two instances and the four defs: `[propext, Classical.choice, Quot.sound]` each (no `sorryAx` in any definition).
- fix: RZ-55 (v) binder annotated `fun n : ℕ => …` (a type ascription only), so the map runs over `l : List ℕ` as the spec reads.
- **B4** 2026-10-28T17:43:24Z → 17:43:58Z — `lake build RiemannZeta.MatricesMobius.Challenge` · exit **0** · `Build completed successfully (8706 jobs)`, Challenge 30 s · first error: none · warnings: 15 × `sorry`, nothing else. Re-inspect 17:43:58Z → 17:44:03Z: RZ-55 (v) now elaborates as `List.map (fun n => !![0, 1; 1, ↑n]) l`.
- **index** 2026-10-28T17:44:07Z — `RiemannZeta.lean` re-read immediately before the append (it then carried Pilot, ZetaL, Bridge, NoGo, SmallArith, Cyclotomic — the last three other seats'); `import RiemannZeta.MatricesMobius.Challenge` appended as a new last line, existing lines kept.
- **B5** 2026-10-28T17:44:13Z → 17:44:19Z — `lake build RiemannZeta` · exit **0** · `Build completed successfully (8718 jobs)` · first error: none · warnings: the `sorry` warnings of the units (74) + 2 × `linter.style.longLine` (`RiemannZeta.lean:1`, the index's pre-existing header comment; `RiemannZeta/NoGo/Solution.lean:101`, another seat's file) — left as found.
- **B6** 2026-10-28T17:44:29Z → 17:44:31Z — `lake build RiemannZeta.MatricesMobius.Challenge` · exit **0** · `Build completed successfully (8706 jobs)` (replay) · first error: none · warnings: 15 × `declaration uses 'sorry'`, nothing else. **Final.**

## Digest (statements phase)
- `Challenge.lean` sha256 `1c601bd63ea93301f450446df765848f850760b6c1aeecea90bd89d752570ff3` (taken 17:44:31Z, after B6) → `formalization.yaml` `statement_sha256_draft:` (V₂ signs `statement_sha256:`).
- `comparator.json` (Day-0 schema, fifteen fully-qualified theorem names, no `definition_names` — every def and instance has a body) and `formalization.yaml` written 17:44Z–17:45Z; names cross-checked across the three files 17:45:06Z (15 = 15 = 15).

## Row table
| row | status | theorem(s) |
|---|---|---|
| L:RZ-41a | STATED | `rz_41a_hyperbolic_elliptic` |
| L:RZ-41b | OPEN — V1-CC (CC-16), no theorem by rule | — |
| L:RZ-41c | STATED (OUT-OF-Q5) | `rz_41c_normal_forms` |
| L:RZ-43a | STATED | `rz_43a_elliptic_orders` |
| L:RZ-43b | STATED (in scope under L:RZ-43) | `rz_43b_orbifold_points` |
| L:RZ-53a | STATED | `rz_53a_gaussMap_mapsTo`, `rz_53a_hypLaplacian_eq` (+ defs `RZ.hypLaplacian`, `RZ.gaussMap`, `RZ.mayer`) |
| L:RZ-53b | OPEN — NEEDS-DEVELOPMENT; its shape needs sorry-bodied defs (primitive hyperbolic classes, their norm) absent at the pin | — |
| L:RZ-53c | STATED (OUT-OF-Q5) | `rz_53c_gauss_generates_cf`, `rz_53c_mayer_is_transfer` |
| L:RZ-55 | STATED | `rz_55_gauss_branches` |
| L:RZ-63a | STATED | `rz_63a_sinh_identity` |
| L:RZ-63b | STATED (OUT-OF-Q5) | `rz_63b_geometric` |
| L:RZ-64a | STATED | `rz_64a_gamma2_min_trace` |
| L:RZ-64b | STATED (OUT-OF-Q5) | `rz_64b_disc_Q_sqrt2` (+ instance `numberField_Q_sqrt2`) |
| L:RZ-64c | STATED (OUT-OF-Q5) | `rz_64c_conductor_one` (+ instance `numberField_Q_sqrt5`, def `RZ.phiSq`) |
| L:RZ-83 | STATED | `rz_83_hyperbolic_products` |

## Notes for V₂ and the proofs phase
- Signatures carried word for word from the V₁-green specs, with four named departures, each one the spec itself asked L to make or a type ascription:
  1. **RZ-55 (ii):** the spec's placeholder `(by sorry)` for `det ≠ 0` inside `mkOfDetNeZero` is `(by simp [Matrix.det_fin_two_of])` (the spec: "L writes the clause so that Challenge.lean carries no `sorry` in the statement"). Proof-irrelevant; the statement is unchanged.
  2. **RZ-55 (v):** `fun n => …` annotated `fun n : ℕ => …`. Without it Lean coerced the list `l : List ℕ` to `List ℤ` before mapping (same value, different reading on the page); with it the term is the spec's.
  3. **RZ-64b:** the binder `[NumberField ℚ⟮(√2 : ℝ)⟯]` dropped; the file supplies `instance numberField_Q_sqrt2` (√2 integral over ℚ ⇒ `IntermediateField.adjoin.finiteDimensional`), as the spec and V₁ ask, so the statement is unconditional.
  4. **RZ-64c:** the binder `[NumberField ℚ⟮(√5 : ℝ)⟯]` dropped (instance `numberField_Q_sqrt5`), and the binders `(phiSq : 𝓞 ℚ⟮√5⟯) (hphiSq : … = φ ^ 2)` replaced by the constructed `RZ.phiSq : 𝓞 ℚ⟮(√5 : ℝ)⟯` (φ² ∈ ℚ⟮√5⟯ by closure; integral over ℤ via φ a root of X² − X − 1 and `isIntegral_algHom_iff` through the inclusion into ℝ), as the spec asks ("L constructs φ² in 𝓞 K … rather than taking it as a hypothesis"). The pinning hypothesis is kept as the theorem's first conjunct `((RZ.phiSq : ℚ⟮√5⟯) : ℝ) = Real.goldenRatio ^ 2` (true by `rfl`), so the statement says which element it is about.
- RZ-53a: the defs keep the spec's names `RZ.hypLaplacian`, `RZ.gaussMap`, `RZ.mayer` (fully `RiemannZeta.MatricesMobius.RZ.*`); the second theorem `rz_53a_hypLaplacian_eq` is the identity the spec says "L may add" (mathlib's `Laplacian.laplacian` on ℂ).
- RZ-53b OPEN: its V₁-signed shape is definitions only, two of them `sorry`-bodied (`RZ.PrimHypClass`, `RZ.classNorm`); the spec itself says they "are not to be filled by `sorry` in a counted `Challenge.lean`". No statement elaborates with the pin's objects. Uncounted.
- RZ-41b: V1-CC (CC-16 on the correction track); no theorem, by rule.
- Docstrings carry the row id, the served locus (PDF page index, printed folio), the PDF sha256 prefix `2d5287e7`; the OUT-OF-Q5 legs carry `OUT-OF-Q5 (pending the wall)`; g_c is named "the geometry constant" and written out, no `def`.
- All defs and instances are bodied and `sorry`-free: `#print axioms` on `numberField_Q_sqrt2`, `numberField_Q_sqrt5`, `RZ.phiSq`, `RZ.gaussMap`, `RZ.mayer`, `RZ.hypLaplacian` → `[propext, Classical.choice, Quot.sound]` each.
- **Proofs-phase flag (same as U1's and U2's):** with `Solution.lean` importing `RiemannZeta.MatricesMobius.Challenge` in the same namespace, every theorem name is already declared and re-declaring it fails; Comparator's model has `Solution` restate the theorems (and the defs/instances, identically) under the same names. Not acted on here.
- Checks run on the unit folder: no `axiom`, `native_decide`, `admit` or `set_option` in `Challenge.lean`; the retired names and the barred word: 0 hits.
- Seat closed 2026-10-28T17:45:33Z; `Solution.lean` not written (statements phase).

---

# PHASE proofs (step 6) — seat L, Opus

- **Opened** 2026-10-28T17:53:50Z. `shasum -a 256 Challenge.lean` at open = `1c601bd63ea93301f450446df765848f850760b6c1aeecea90bd89d752570ff3` = `formalization.yaml` `statement_sha256:` (V₂ signed 2026-10-28T17:50:42Z). Challenge.lean is frozen; not edited.
- Solution module per the CO's ruling: `import Mathlib`, namespace `RiemannZeta.MatricesMobius`, the non-theorem declarations restated byte-identically, each theorem under its Challenge name and statement text.
- **P1** 2026-10-28T17:58:56Z → 17:58:59Z — `lake build RiemannZeta.MatricesMobius.Solution` · exit **0** · `Build completed successfully (8706 jobs).` · theorems in Solution: 5 · first Solution: rz_53a_gaussMap_mapsTo, rz_53a_hypLaplacian_eq, rz_63a_sinh_identity, rz_64a_gamma2_min_trace, rz_83_hyperbolic_products proved · first error: none · warnings: 0 (sorry: 0)
- **P2** 2026-10-28T18:04:38Z → 18:04:46Z — `lake build RiemannZeta.MatricesMobius.Solution` · exit **0** · `Build completed successfully (8706 jobs).` · theorems in Solution: 6 · rz_43a_elliptic_orders added · first error: none · warnings: 8 (sorry: 0)
- **P3** 2026-10-28T18:04:59Z → 18:05:07Z — `lake build RiemannZeta.MatricesMobius.Solution` · exit **0** · `Build completed successfully (8706 jobs).` · theorems in Solution: 6 · 43a style: flexible-simp and long lines cleared · first error: none · warnings: 0 (sorry: 0)
- **P4** 2026-10-28T18:06:34Z → 18:06:42Z — `lake build RiemannZeta.MatricesMobius.Solution` · exit **0** · `Build completed successfully (8706 jobs).` · theorems in Solution: 7 · rz_55_gauss_branches added · first error: none · warnings: 0 (sorry: 0)
- **P5** 2026-10-28T18:08:12Z → 18:08:20Z — `lake build RiemannZeta.MatricesMobius.Solution` · exit **0** · `Build completed successfully (8706 jobs).` · theorems in Solution: 8 · rz_43b_orbifold_points added · first error: none · warnings: 0 (sorry: 0)
- **P6** 2026-10-28T18:12:18Z → 18:12:31Z — `lake build RiemannZeta.MatricesMobius.Solution` · exit **0** · `Build completed successfully (8706 jobs).` · theorems in Solution: 9 · rz_41a_hyperbolic_elliptic added — the nine in-scope theorems all present · first error: none · warnings: 0 (sorry: 0)
- **P7** 2026-10-28T18:15:03Z → 18:15:12Z — `lake build RiemannZeta.MatricesMobius.Solution` · exit **0** · `Build completed successfully (8706 jobs).` · theorems in Solution: 11 · OUT-OF-Q5 legs rz_53c_gauss_generates_cf, rz_53c_mayer_is_transfer added · first error: none · warnings: 6 (sorry: 0)
- **P8** 2026-10-28T18:15:20Z → 18:15:30Z — `lake build RiemannZeta.MatricesMobius.Solution` · exit **0** · `Build completed successfully (8706 jobs).` · theorems in Solution: 11 · 53c style: show→change, long line · first error: none · warnings: 2 (sorry: 0)
- **P9** 2026-10-28T18:15:36Z → 18:15:46Z — `lake build RiemannZeta.MatricesMobius.Solution` · exit **0** · `Build completed successfully (8706 jobs).` · theorems in Solution: 11 · 53c style: remaining show→change · first error: none · warnings: 0 (sorry: 0)
- **P10** 2026-10-28T18:18:58Z → 18:19:08Z — `lake build RiemannZeta.MatricesMobius.Solution` · exit **0** · `Build completed successfully (8706 jobs).` · theorems in Solution: 12 · OUT-OF-Q5 leg rz_41c_normal_forms added · first error: none · warnings: 0 (sorry: 0)
- **P11** 2026-10-28T18:23:27Z → 18:23:38Z — `lake build RiemannZeta.MatricesMobius.Solution` · exit **0** · `Build completed successfully (8706 jobs).` · theorems in Solution: 13 · OUT-OF-Q5 leg rz_63b_geometric added · first error: none · warnings: 1 (sorry: 0)
- **P12** 2026-10-28T18:23:52Z → 18:24:04Z — `lake build RiemannZeta.MatricesMobius.Solution` · exit **0** · `Build completed successfully (8706 jobs).` · theorems in Solution: 13 · 63b style: long line · first error: none · warnings: 0 (sorry: 0)
- **P13** 2026-10-28T18:30:56Z → 18:31:08Z — `lake build RiemannZeta.MatricesMobius.Solution` · exit **0** · `Build completed successfully (8706 jobs).` · theorems in Solution: 14 · OUT-OF-Q5 leg rz_64b_disc_Q_sqrt2 added (𝓞 = ℤ[√2] via discr·Eisenstein at 2) · first error: none · warnings: 1 (sorry: 0)
- **P14** 2026-10-28T18:31:23Z → 18:31:35Z — `lake build RiemannZeta.MatricesMobius.Solution` · exit **0** · `Build completed successfully (8706 jobs).` · theorems in Solution: 14 · 64b style: long line · first error: none · warnings: 0 (sorry: 0)
- **P15** 2026-10-28T18:35:59Z → 18:36:15Z — `lake build RiemannZeta.MatricesMobius.Solution` · exit **0** · `Build completed successfully (8706 jobs).` · theorems in Solution: 15 · OUT-OF-Q5 leg rz_64c_conductor_one added (𝓞 = ℤ[(5+√5)/2] via discr·Eisenstein at 5) — all fifteen present · first error: none · warnings: 0 (sorry: 0)

## Proofs-phase result
- **15 of 15 frozen theorems proved** in `Solution.lean` (2026 lines, sha256 `e7bfa77a2d67903616960dfe45edc46739e3ad4c49a883afde10131d762122e3` at close): the nine in scope (rz_41a, rz_43a, rz_43b, rz_53a ×2, rz_55, rz_63a, rz_64a, rz_83) and all six OUT-OF-Q5 legs (rz_41c, rz_53c ×2, rz_63b, rz_64b, rz_64c). Nothing left out; `statements_not_checked:` not needed; `comparator.json` `theorem_names` left at the fifteen; `formalization.yaml` untouched (row statuses kept as `STATED`, the other units' precedent). No `STATEMENT-CHANGE-NEEDED`.
- Final `lake build RiemannZeta.MatricesMobius.Solution`: **P15**, exit 0, zero warnings, zero `sorry`. Scans of `Solution.lean`: `sorry`/`admit`/`native_decide`/`axiom`/`set_option` — 0 hits.
- Byte-identity check (scratch script): `Solution.lean` with every proof body replaced by `  sorry` equals `Challenge.lean` exactly, the module docstring aside — every def, instance, `open` line and theorem statement unchanged.
- Proof notes: no helper declarations were added; shared steps are restated inside each proof. 41a: fixed points on ℍ and on ∂ℍ by coordinates (`coe_specialLinearGroup_apply`, `OnePoint.smul_some_eq_ite`, `smul_infty_eq_self_iff`). 43a/43b/55: centre of SL(2, ℤ) = {±1} from `mem_center_iff`; orders by Cayley–Hamilton at trace 0, ±1; stabilizers from mathlib's `ModularGroup.stabilizer_I`, `stabilizer_ρ`, `stabilizer_of_ne`, `exists_smul_mem_fd`; ℤ/2, ℤ/3 by `mulEquivOfPrimeCardEq`. 41c: explicit conjugators in SL(2, ℝ) (eigenvector columns; upper-triangular for the rotation, θ = ±arccos(t/2)). 53c: `IntFractPair.succ_nth_stream_eq_some_iff`; the derivative by local agreement with y⁻¹ − (n+1); the sum reindexed by `Equiv.ofBijective`. 63b: cosh d(z, γz) = 1 + (S² + (t² − 4)y²)/(2y²) from `UpperHalfPlane.cosh_dist`, so τ(γ) = 2 arsinh(√(t² − 4)/2), attained on the axis; systole at trace 3 via sinh(2 log φ) = √5/2. 64b/64c: 𝓞 computed through `Algebra.discr_mul_isIntegral_mem_adjoin` + `mem_adjoin_of_smul_prime_pow_smul_of_minpoly_isEisensteinAt` (ℚ(√2): generator √2, X² − 2 Eisenstein at 2, power-basis discriminant 8 = 2³; ℚ(√5): generator (5 + √5)/2, X² − 5X + 5 Eisenstein at 5, discriminant 5), then `NumberField.discr_eq_discr` on the integral power basis; conductor via `conductor_eq_top_of_adjoin_eq_top` with φ² + 1 the integral generator.
- **Comparator** (informational, run by this seat 2026-10-28T18:37:23Z → 18:38:26Z, exit 0, with `scripts/fake-landrun.sh` — the shim that does NOT sandbox, macOS): `Lean default kernel accepts the solution` · `Your solution is okay!` on all fifteen names. The real-landrun run remains K's.

### `#print axioms` (verbatim, 2026-10-28T18:39:16Z)
```
'RiemannZeta.MatricesMobius.rz_41a_hyperbolic_elliptic' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.MatricesMobius.rz_41c_normal_forms' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.MatricesMobius.rz_43a_elliptic_orders' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.MatricesMobius.rz_43b_orbifold_points' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.MatricesMobius.rz_53a_gaussMap_mapsTo' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.MatricesMobius.rz_53a_hypLaplacian_eq' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.MatricesMobius.rz_53c_gauss_generates_cf' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.MatricesMobius.rz_53c_mayer_is_transfer' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.MatricesMobius.rz_55_gauss_branches' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.MatricesMobius.rz_63a_sinh_identity' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.MatricesMobius.rz_63b_geometric' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.MatricesMobius.rz_64a_gamma2_min_trace' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.MatricesMobius.rz_64b_disc_Q_sqrt2' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.MatricesMobius.rz_64c_conductor_one' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.MatricesMobius.rz_83_hyperbolic_products' depends on axioms: [propext, Classical.choice, Quot.sound]
```
(All 86 theorem constants of the module, auxiliaries included, collected the check.sh way: 52 × [propext, Classical.choice, Quot.sound], 31 × [propext], 3 × [] — nothing outside the permitted three.)

### Row table (proofs phase)
| row | status | theorem(s) |
|---|---|---|
| L:RZ-41a | PROVED | `rz_41a_hyperbolic_elliptic` |
| L:RZ-41b | OPEN — V1-CC (CC-16), no theorem by rule | — |
| L:RZ-41c | PROVED (OUT-OF-Q5) | `rz_41c_normal_forms` |
| L:RZ-43a | PROVED | `rz_43a_elliptic_orders` |
| L:RZ-43b | PROVED | `rz_43b_orbifold_points` |
| L:RZ-53a | PROVED | `rz_53a_gaussMap_mapsTo`, `rz_53a_hypLaplacian_eq` |
| L:RZ-53b | OPEN — NEEDS-DEVELOPMENT, unstated | — |
| L:RZ-53c | PROVED (OUT-OF-Q5) | `rz_53c_gauss_generates_cf`, `rz_53c_mayer_is_transfer` |
| L:RZ-55 | PROVED | `rz_55_gauss_branches` |
| L:RZ-63a | PROVED | `rz_63a_sinh_identity` |
| L:RZ-63b | PROVED (OUT-OF-Q5) | `rz_63b_geometric` |
| L:RZ-64a | PROVED | `rz_64a_gamma2_min_trace` |
| L:RZ-64b | PROVED (OUT-OF-Q5) | `rz_64b_disc_Q_sqrt2` |
| L:RZ-64c | PROVED (OUT-OF-Q5) | `rz_64c_conductor_one` |
| L:RZ-83 | PROVED | `rz_83_hyperbolic_products` |

- **Closed** 2026-10-28T18:39:16Z. `shasum -a 256 Challenge.lean` at close = `1c601bd63ea93301f450446df765848f850760b6c1aeecea90bd89d752570ff3` = the signed `statement_sha256`; Challenge.lean not edited. No git run.
