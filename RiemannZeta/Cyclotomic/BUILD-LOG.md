# BUILD-LOG — unit U6 (`RiemannZeta/Cyclotomic`)

Seat L (Lean coder), PHASE STATEMENTS, brief `Orchestrator/Chat-Design/cc-handoff/projects/reputation-play/lean-scoping/seats/L-statements-U6-2026-10-28.md`. Clocks from `date -u`. No git, no web.

- seat opened 2026-10-28T17:39:03Z; this file (first artefact) 2026-10-28T17:39:43Z
- inputs read: `specs/_UNIT-U6.md`, `specs/_V1-U6.md`, the six spec files (RZ-65, 71a, 71b, 72a, 72b, 72c); V₁ verdicts: RZ-65 · RZ-71a · RZ-72a (GREEN 17:38:10Z, after D1 — clause 8) GREEN in Q5 · RZ-71b · RZ-72b · RZ-72c GREEN OUT-OF-Q5 · splits RZ-71 → a/b and RZ-72 → a/b/c SPLIT-OK.

## Builds

- **B1** 2026-10-28T17:40:43Z → 17:41:35Z — `lake build RiemannZeta.Cyclotomic.Challenge` · exit **0** · `Build completed successfully (8706 jobs)`, Challenge 46 s · first error: none · warnings: 13 × `declaration uses 'sorry'` (one per theorem), nothing else.
- **inspect** 17:41:43Z → 17:42:11Z — scratch file (scratchpad, outside the repo) `import RiemannZeta.Cyclotomic.Challenge` + `#check` with `pp.numericTypes` / `pp.coercions` on RZ-71a, 71b (A), 71b (B), 72a cl. 5, 72a cl. 6, 72a cl. 8, 72b: each elaborates to the spec's statement — p* is `↑((-1 : ℤ) ^ ((p - 1) / 2) * ↑p) : K` (ℤ-cast, as specced); `x ^ 2 = (5 : K)`; the prime set is `{(5 : ℕ)}` (Finset ℕ); `p ≡ (1 : ℕ) [MOD (4 : ℕ)]`; clause 8 reads `IsEmpty (CyclotomicField (5 : ℕ) ℚ →ₐ[ℚ] K) ∧ ¬∃ ζ, IsPrimitiveRoot ζ (5 : ℕ)`. **RZ-72c probe** in the same scratch file (the spec's shape-only signature, never placed in Challenge): **first error** `failed to synthesize instance of type class NeZero χ.conductor` at `DirichletCharacter.LFunction χ.primitiveCharacter s` — the spec's form does not elaborate at the pin (the probe's exit code was not captured; the error line is the record). RZ-72c → OPEN.
- **index** 2026-10-28T17:42:18Z — `RiemannZeta.lean` re-read immediately before the append (header comment + five imports: Pilot, ZetaL, Bridge, NoGo, SmallArith); `import RiemannZeta.Cyclotomic.Challenge` appended with `>>` (guarded by `grep -qxF`), existing lines kept.
- **B2** 2026-10-28T17:42:27Z → 17:42:46Z — `lake build RiemannZeta` · exit **0** · `Build completed successfully (8717 jobs)` · first error: none · warnings: 74 × `sorry` (13 Cyclotomic; the rest other seats' units, incl. `RiemannZeta/MatricesMobius/Challenge.lean` built through the lean_lib glob) + 1 `linter.style.longLine` on `RiemannZeta.lean:1` — the index's pre-existing header comment, not this seat's line; left as found.
- **B3** 2026-10-28T17:42:46Z → 17:42:49Z — `lake build RiemannZeta.Cyclotomic.Challenge` (final) · exit **0** · `Build completed successfully (8706 jobs)` · first error: none · warnings: 13 × `sorry`, 0 other.

## Digest (statements phase)
- `Challenge.lean` sha256 `a06f2a6e81f5925ecc79096314d79d21ae4401149dc5fcf9a1d05b2c23f78ffc` (hashed after B3) → `formalization.yaml` `statement_sha256_draft:` (V₂ signs `statement_sha256:`).
- `comparator.json`: 13 fully-qualified names = the 13 `theorem` declarations of Challenge (diffed); JSON parses. `formalization.yaml` parses (ruby YAML).

## Row table
| row | theorem(s) | status |
|---|---|---|
| L:RZ-65 | `rz_65_gal_cyclotomic_five` | STATED |
| L:RZ-71a | `rz_71a_cyclotomic_completeness_legs12` | STATED (leg 1's "= 4 ⇔ p = 5" counted once with RZ-72a cl. 7) |
| L:RZ-71b | `rz_71b_unique_quadratic_subfield`, `rz_71b_leg3_selects_five` | STATED — OUT-OF-Q5 (pending the wall); docstrings say so |
| L:RZ-72a | `rz_72a_degrees`, `rz_72a_gal_seven_no_quartic`, `rz_72a_units_cyclic`, `rz_72a_units_contain_quartic`, `rz_72a_examples`, `rz_72a_quartic_layer_infinitely_often`, `rz_72a_degree_four_only_five`, `rz_72a_cyclotomic_five_does_not_recur` | STATED (eight; clause 8 = the containment theorem) |
| L:RZ-72b | `rz_72b_sqrt_five_does_not_recur` (its (A) = `rz_71b_unique_quadratic_subfield`, stated once) | STATED — OUT-OF-Q5 (pending the wall) |
| L:RZ-72c | — | OPEN — OUT-OF-Q5, NEEDS-DEVELOPMENT (no Dedekind-zeta factorisation at the pin); the spec's signature fails to elaborate (`NeZero χ.conductor`) |

Notes: no `Fact (Nat.Prime n)` for a numeral is needed by any statement to elaborate (all numeral-named fields enter only as `IsCyclotomicExtension {n} ℚ K` / `ZMod n` / `CyclotomicField n ℚ`); the local `⟨by norm_num⟩` instances belong to the proofs phase. No `Solution.lean` written. No `axiom`, no `native_decide`, no `set_option` in Challenge.

- close 2026-10-28T17:43:38Z

---

# Seat L — PHASE PROOFS (step 6)

Brief `Orchestrator/Chat-Design/cc-handoff/projects/reputation-play/lean-scoping/seats/L-proofs-U6-2026-10-28.md`, under CO's Solution-module ruling (Solution imports Mathlib only, restates every non-theorem declaration byte-identically, proves each theorem under the identical name and statement text). Clocks from `date -u`. No git, no web.

- seat opened 2026-10-28T17:51:51Z; this section (first artefact) 2026-10-28T17:53:03Z
- open sha check: `shasum -a 256 Challenge.lean` = `a06f2a6e81f5925ecc79096314d79d21ae4401149dc5fcf9a1d05b2c23f78ffc` = `formalization.yaml` `statement_sha256:` (signed 2026-10-28T17:46:54Z) — MATCH.
- Challenge carries no `def`/`instance`/`universe`/notation; its non-theorem lines are `import Mathlib`, the module docstring, `namespace`/`end`, section docstrings, and the two `open IntermediateField in` prefixes attached to the RZ-71b theorems.

## Builds (proofs phase)

- scratch elaboration 17:53:44Z → 17:55:28Z — `lake env lean` on scratch files (scratchpad, outside the repo) for the ten in-Q5 theorems; errors met and fixed on the way: `5 = p` vs `p = 5` orientation (RZ-71a leg 2), a `p - 1 = 4 * 0` case (RZ-72a cl. 4, closed by `omega`), and `failed to synthesize IsCyclotomicExtension {n} ℚ (CyclotomicField n ℚ)` (RZ-72a cl. 6 and cl. 8 — the mathlib instance `CyclotomicField.isCyclotomicExtension` needs `NeZero ((n : ℕ) : ℚ)`, which instance search did not find on its own; supplied locally as a `have` naming the instance term).
- Solution.lean is generated from Challenge.lean by a scratch script (scratchpad `gen/gen.py`): each theorem block of Challenge is copied byte-for-byte up to `:= by`, and its `  sorry` line is replaced by the proof; a theorem without a proof is dropped with a one-line comment marker; the module docstring is replaced by one describing the proofs module. Challenge carries no `def`/`instance`/`universe`/notation to restate.
- **P1** 2026-10-28T17:56:35Z → 17:56:41Z — `lake build RiemannZeta.Cyclotomic.Solution` · exit **0** · `Build completed successfully (8706 jobs)` · first error: none · warnings: 1 × `linter.style.haveILetI` (a `haveI` in RZ-72a cl. 3) — fixed to `have`.
- **P2** 2026-10-28T17:56:47Z → 17:56:53Z — same command · exit **0** · `Build completed successfully (8706 jobs)` · first error: none · warnings: **0**. Ten theorems proved (RZ-65; RZ-71a; RZ-72a clauses 1–8); the three OUT-OF-Q5 theorems (`rz_71b_unique_quadratic_subfield`, `rz_71b_leg3_selects_five`, `rz_72b_sqrt_five_does_not_recur`) not yet attempted at this stamp.
- OUT-OF-Q5 attempt 17:57Z → 18:03:27Z — the three wall-pending theorems came within reach and are proved:
  - `rz_71b_unique_quadratic_subfield`: x is the quadratic Gauss sum (`gaussSum_sq` with `quadraticChar (ZMod p)` pushed into K and `AddChar.zmodChar` at the cyclotomic generator; `quadraticChar_neg_one` + `ZMod.χ₄_eq_neg_one_pow` turn χ(−1) into (−1)^((p−1)/2)); [ℚ(x) : ℚ] = 2 from `minpoly` bounds (p* is not a rational square: `Prime.not_isSquare` via `Rat.isSquare_natCast_iff`, or negative); uniqueness by Galois correspondence — Gal(K/ℚ) is cyclic (image of `autEquivPow`), so it has one subgroup of index 2 (squares lie in every index-2 subgroup, `Subgroup.sq_mem_of_index_two`; an odd power of the generator in it would force it to ⊤), and `IntermediateField.finrank_eq_fixingSubgroup_index` + `IsGalois.fixedField_fixingSubgroup` carry that to fields.
  - `rz_72b_sqrt_five_does_not_recur`: p = 2 — [K : ℚ] = 1 forces a square root of 5 into ℚ; p odd, p ≠ 5 — a square root y of 5 generates a quadratic subfield, which by the theorem above is ℚ(x) with x² = p*; reducing y's polynomial modulo X² − p* writes y = a + b·x (a, b ∈ ℚ); squaring forces ab = 0 (else x ∈ ℚ), b = 0 makes 5 a rational square, a = 0 makes 5p (or −5p) a rational square — each impossible for a prime p ≠ 5.
  - `rz_71b_leg3_selects_five`: ⇒ from `rz_72b_sqrt_five_does_not_recur`; ⇐ from `rz_71b_unique_quadratic_subfield` at p = 5 (5* = 5). Because it uses the 72b theorem, its block sits after 72b in Solution (moved whole, statement text and docstring unchanged; a one-line comment marks its Challenge position). Comparator matches by name, so the order does not enter the check.
  - In the 72b proof the adjoin is written `IntermediateField.adjoin ℚ {y}` (the `ℚ⟮y⟯` notation needs `open IntermediateField`, which the frozen 72b statement does not carry; no `open … in` was added to its header).
- **P3** 2026-10-28T18:03:49Z → 18:03:58Z — `lake build RiemannZeta.Cyclotomic.Solution` · exit **0** · `Build completed successfully (8706 jobs)` · first error: none · warnings: **0**. 13 of 13 theorems proved.
- statement-text check 18:04Z — a script extracted each theorem block (docstring through `:= by`, the `open IntermediateField in` prefix included) from Challenge and Solution: 13 = 13 names, every block byte-identical. Scan of Solution for `sorry|admit|axiom|native_decide|set_option` (`/usr/bin/grep -nE`): no hits.
- **axioms** 2026-10-28T18:04:11Z → 18:04:14Z — scratch file `import RiemannZeta.Cyclotomic.Solution` + `#print axioms` per theorem, `lake env lean` exit 0; output verbatim:

```
'RiemannZeta.Cyclotomic.rz_65_gal_cyclotomic_five' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Cyclotomic.rz_71a_cyclotomic_completeness_legs12' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'RiemannZeta.Cyclotomic.rz_71b_unique_quadratic_subfield' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Cyclotomic.rz_71b_leg3_selects_five' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Cyclotomic.rz_72a_degrees' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Cyclotomic.rz_72a_gal_seven_no_quartic' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Cyclotomic.rz_72a_units_cyclic' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Cyclotomic.rz_72a_units_contain_quartic' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Cyclotomic.rz_72a_examples' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Cyclotomic.rz_72a_quartic_layer_infinitely_often' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'RiemannZeta.Cyclotomic.rz_72a_degree_four_only_five' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Cyclotomic.rz_72a_cyclotomic_five_does_not_recur' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
'RiemannZeta.Cyclotomic.rz_72b_sqrt_five_does_not_recur' depends on axioms: [propext, Classical.choice, Quot.sound]
```

- `comparator.json` `theorem_names`: unchanged — all 13 names, each proved in Solution. `formalization.yaml`: rows RZ-65 · 71a · 71b · 72a · 72b → `PROVED` (71b and 72b notes keep OUT-OF-Q5, pending the wall), RZ-72c stays `OPEN` (no statement); `statements_not_checked: []`; `proofs_phase` block added. Both files parse (python json, ruby YAML).
- close sha check: `shasum -a 256 Challenge.lean` = `a06f2a6e81f5925ecc79096314d79d21ae4401149dc5fcf9a1d05b2c23f78ffc` — MATCH with `statement_sha256:`; Challenge untouched. Solution.lean sha256 `04fe735d39e88146a6401a01fe153c7d3e0bd6e4407284c2acd662211d06ba63`.
- index: `RiemannZeta.lean` not touched (the orchestrator adds unit imports).

## Row table (proofs phase)
| row | theorem(s) | status |
|---|---|---|
| L:RZ-65 | `rz_65_gal_cyclotomic_five` | PROVED |
| L:RZ-71a | `rz_71a_cyclotomic_completeness_legs12` | PROVED |
| L:RZ-71b | `rz_71b_unique_quadratic_subfield`, `rz_71b_leg3_selects_five` | PROVED — OUT-OF-Q5 (pending the wall) |
| L:RZ-72a | clauses 1–8 (eight theorems) | PROVED |
| L:RZ-72b | `rz_72b_sqrt_five_does_not_recur` | PROVED — OUT-OF-Q5 (pending the wall) |
| L:RZ-72c | — | OPEN (no statement; unchanged) |

- close 2026-10-28T18:05:00Z
