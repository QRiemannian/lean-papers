# BUILD-LOG — unit U11 (`RiemannZeta/Corrected`, namespace `RiemannZeta.Corrected`)

Seat L (Lean coder), PHASE STATEMENTS, dispatched by Orchestrator A 2026-10-28 for the two corrected legs of the zeta paper (the wall's night words, lane 1: L:RZ-33b, L:RZ-41b); method `Orchestrator/Chat-Design/cc-handoff/projects/reputation-play/lean-scoping/seats/TEMPLATE-L-lean-coder.md` (whole, with the sitting-71 addendum; scratch at `<scratchpad>/l-u11/`). Clocks from `date -u`. No git, no web, nothing under the lab's non-public research trees.

**Gate (carried in the module doc and `formalization.yaml`):** both specs are M-written and V₁-GREEN against the corrected DRAFT (sha256 `1b2af75c…` at the M and V₁ reads; pass 2 is `8346ab41`), not the served edition (`2d5287e7`). The flip waits on the wall's read of CORRECTION-WAVE-2026-10-28; until then both rows are STATED and uncounted.

- seat opened 2026-10-28T23:00:32Z (scratch folder created); `Challenge.lean` written 23:01:21Z; this file 23:04Z
- inputs read: `specs/_UNIT-U11.md` (whole; the M-amend paragraph at the top is live), `specs/RZ-33b.md` (whole; the live block is the LAST section, "M-amend — the equation's own symmetry restored", 22:56:18Z, V1-GREEN 22:58:43Z), `specs/RZ-41b.md` (whole; the live block is "M — the corrected claim", 22:40:59Z, V1-GREEN 22:55:14Z), `specs/_V1-U11.md` (whole, incl. the re-read), TEMPLATE-L; form from U12 `RiemannZeta/Accepted/` and U10 `RiemannZeta/LValue/`; header conventions from U4 `RiemannZeta/MatricesMobius/Challenge.lean`; the restated source `RiemannZeta/ZetaL/Challenge.lean:26–30`.

## Builds

- **B1** 2026-10-28T23:01:29Z → 23:01:41Z — `lake build RiemannZeta.Corrected.Challenge` · exit **0** · `Build completed successfully (8706 jobs)`, Challenge 9.3 s · first error: none · warnings: 2 × `declaration uses 'sorry'` (lines 61, 87), nothing else (no `longLine`; longest line 98 characters).
- **inspect** 2026-10-28T23:01:58Z → 23:02:10Z — scratch file `<scratchpad>/l-u11/inspect.lean` (outside the repo) importing `RiemannZeta.Corrected.Challenge` and `RiemannZeta.ZetaL.Challenge`, run with `lake env lean` (after `lake build RiemannZeta.ZetaL.Challenge`, exit 0, replayed) · exit **0**, no error. **The cross-unit link:** `example : RiemannZeta.ZetaL.zetaChi = RiemannZeta.Corrected.zetaChi := rfl` elaborates. **The header's `open`s change nothing in RZ-33b:** the statement re-typed outside any namespace with no `open`, with `RiemannZeta.ZetaL.zetaChi` in place of the local name, is closed by the term `RiemannZeta.Corrected.rz_33b_reflection_fixed_point`. **The `let`s are transparent:** `(rz_41b_noncentral_trichotomy γ h₁ h₂).1` checks against the disjunction written with `(γ : Matrix (Fin 2) (Fin 2) ℤ)` in place of `m`. `#check` (with `pp.numericTypes` on 33b): `{(1 / 2 : ℂ)}`, `{s | s.re = (1 / 2 : ℝ)}`, `(-2 : ℂ) * (↑n + (1 : ℂ))`, `(∀ (n : ℤ), s ≠ ↑n)`; RZ-41b prints its `let`s as `have m := ↑γ; have g := (Matrix.SpecialLinearGroup.mapGL ℝ) γ`, the action `γ • z` on `UpperHalfPlane`, the boundary witness `c = OnePoint.infty ∨ ∃ q, c = ↑↑q`.
- **index** 2026-10-28T23:03:25Z — `RiemannZeta.lean` re-read immediately before the append (header comment + Pilot, ZetaL, Bridge, NoGo, SmallArith, Cyclotomic, MatricesMobius, LValue, Provenance, Accepted; final byte `0a`); `import RiemannZeta.Corrected.Challenge` appended as the new last line with `>>` (guarded by an exact-line `/usr/bin/grep -qxF`), existing lines kept.
- **B2** 2026-10-28T23:03:25Z → 23:03:42Z — `lake build RiemannZeta` · exit **0** · `Build completed successfully (8728 jobs)` · first error: none · warnings besides `sorry` (91 in all, two of them this unit's): 1 × `longLine` on `RiemannZeta.lean:1` (the index's header comment) and 1 × header-linter `Copyright too short!` replayed on `RiemannZeta/ZetaL/Challenge.lean:1:1` — both pre-existing, neither on this seat's lines; left as found.
- **B3** 2026-10-28T23:03:54Z → 23:03:57Z — `lake build RiemannZeta.Corrected.Challenge` (final) · exit **0** · `Build completed successfully (8706 jobs)` (replayed) · first error: none · warnings: 2 × `sorry`, nothing else.

## `#print axioms` on the restated definition (inspect run, 23:02:10Z) — no `sorry` in it
```
'RiemannZeta.Corrected.zetaChi' depends on axioms: [propext, Classical.choice, Quot.sound]
```

## Byte-identity checks (by script, `python3 -I <scratchpad>/l-u11/bytecheck.py`, 23:02:24Z, exit 0)
```
restated zetaChi: RiemannZeta/ZetaL/Challenge.lean:26-30 (docstring 26-28 + body 29-30, 408 bytes) occurs 1x in Challenge -> IDENTICAL
statement RZ-33b: 650 bytes (theorem .. := by) from specs/RZ-33b.md live section, occurs 1x followed by '  sorry' -> IDENTICAL
docstring RZ-33b: spec's first paragraph (741 bytes) occurs 1x as the theorem docstring's first paragraph -> IDENTICAL
statement RZ-41b: 881 bytes (theorem .. := by) from specs/RZ-41b.md live section, occurs 1x followed by '  sorry' -> IDENTICAL
docstring RZ-41b: spec's first paragraph (500 bytes) occurs 1x as the theorem docstring's first paragraph -> IDENTICAL
ALL IDENTICAL
```
The script re-extracts every block from its home file on its own (the LAST ```lean block of the live section of each spec; lines 26–30 of the U3 Challenge), independently of the composing script; each statement is the spec's §5 block from `theorem` through the end of the `:= by` line, followed by `  sorry`.

## Departures from the specs' text, each with its reason
1. **`zetaChi`'s docstring.** The RZ-33b M-amend §5 block prints `zetaChi` with its own docstring ("The factor χ of the asymmetric functional equation (5.2) … the χ the corrected edition prints beside (5.2). Restated byte-identically from U3 …"). The orchestrator's brief, the unit sheet's M-amend and V₁'s re-read all require the definition byte-identical to U3, docstring and body, so the U3 block (`ZetaL/Challenge.lean:26–30`) is restated as is, with the U12 provenance-comment form above it; the spec docstring's one new fact (the corrected edition prints this χ beside (5.2), draft p14) moved into that comment. The body is the same in the spec, in U3 and here.
2. **Theorem docstrings.** First paragraph: the spec's text, verbatim (checked by script). Second paragraph: rewritten per the brief — the served locus, the served prefix `2d5287e7`, and the sentence that the leg formalizes the corrected edition (draft `1b2af75c` at the M read; pass 2 is `8346ab41`), whose republish waits on the wall's read. RZ-41b's locus reads "PDF p17–18 (printed folios 16–17; the correction draft breaks the table onto p18)" where the spec wrote "PDF p17" (the served edition has the whole table on p17; M's landed-draft note and V₁ name the p17–18 break; the brief gives p17–18).
3. **Header.** `open scoped MatrixGroups` and `open UpperHalfPlane` (U4's, required by RZ-41b's `SL(2, ℤ)` and `ℍ`) stand above the namespace and so also cover RZ-33b; M's 33b probe (Probe5) had no `open`. The inspect run shows the 33b statement elaborates to the same term either way.
4. **`end RiemannZeta.Corrected`** closes the file (U12's form).
5. **None in any statement.**

## Name check (the sitting-71 form, run 23:02Z on the pin's tree `.lake/packages/mathlib/Mathlib/`; namespace read from the file's `namespace`/`end` stack by `<scratchpad>/l-u11/ns.py`), hits pasted with their namespace
- `NumberTheory/LSeries/RiemannZeta.lean:121: def riemannZeta := hurwitzZetaEven 0` — namespace stack: root → `riemannZeta`. (The regex's known limit (a): its first hits are `riemannZeta₀` / `riemannZeta₁` in `Harmonic/ZetaAsymp.lean:532/536`, a non-ASCII character counting as a boundary; the true declaration was read at :121.)
- `Dynamics/FixedPoints/Defs.lean:28: def fixedPoints (f : α → α) : Set α :=` — inside `namespace Function` (:23) → `Function.fixedPoints`. (A second hit, `GroupTheory/GroupAction/Defs.lean:116: def fixedPoints : Set α`, is `MulAction.fixedPoints`, a different declaration.)
- `Logic/Function/Basic.lean:1010: def Involutive {α} (f : α → α) : Prop :=` — inside `namespace Function` (:29) → `Function.Involutive`.
- `Algebra/Star/Basic.lean:341: def starRingEnd : R →+* R where` — root → `starRingEnd`.
- `LinearAlgebra/Matrix/GeneralLinearGroup/FinTwo.lean:40: def IsParabolic : Prop := m ∉ Set.range (scalar _) ∧ m.discr = 0` — inside `namespace Matrix` (:33) → `Matrix.IsParabolic`; `:137 def IsHyperbolic` and `:140 def IsElliptic`, same namespace → `Matrix.IsHyperbolic`, `Matrix.IsElliptic`. (The GL abbrevs at :210/:221/:224 are `Matrix.GeneralLinearGroup.*`; the `IsElliptic` hit in `AlgebraicGeometry/EllipticCurve/Weierstrass.lean:363` is `WeierstrassCurve.IsElliptic`, unrelated.)
- `LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:284: def mapGL : Matrix.SpecialLinearGroup n R →* Matrix.GeneralLinearGroup n S :=` — inside `namespace Matrix` (:33) > `SpecialLinearGroup` (:250) → `Matrix.SpecialLinearGroup.mapGL`.
- `Topology/Compactification/OnePoint/Basic.lean:68: @[match_pattern] def infty : OnePoint X := none` — inside `namespace OnePoint` (:65) → `OnePoint.infty`.
- `Complex.sin`, `Complex.Gamma`, `Real.pi` appear only inside the restated `zetaChi` (U3's names, unchanged; the `rfl` link above).

## Digest (statements phase)
- `Challenge.lean` (103 lines) sha256 `7f9a78383b1ef37f8546cc4f8b43e533192fd6777ada6c080dc18f011549c8b1` (after B3) → `formalization.yaml` `statement_sha256_draft:` (V₂ signs `statement_sha256:`).
- `comparator.json` parsed as JSON (python3 -I), `formalization.yaml` parsed as YAML (ruby) — 23:04:15Z.

## Row table
| row | theorem | status |
|---|---|---|
| L:RZ-33b | `rz_33b_reflection_fixed_point` | STATED (the flip waits on the wall's read of CORRECTION-WAVE-2026-10-28) |
| L:RZ-41b | `rz_41b_noncentral_trichotomy` | STATED (the flip waits on the wall's read of CORRECTION-WAVE-2026-10-28) |

## Notes for V₂ and the proofs phase
- **V₂** reads the statements against the correction draft (`1b2af75c`; pass 2 `8346ab41`) and re-reads them against the corrected edition at the republish; the docstrings' `2d5287e7` is replaced by the corrected edition's prefix then (a docstring change before V₂ signs, or a re-sign after).
- **The Solution module, CO-ruled options for `rz_33b`'s conjunct (0):** (a) `Solution.lean` imports `RiemannZeta.ZetaL.Solution` and takes (5.2) from `RiemannZeta.ZetaL.rz_33a_functional_equation`, linking `RiemannZeta.ZetaL.zetaChi = RiemannZeta.Corrected.zetaChi` by `rfl` — the U10 decision-2 pattern (a Solution may import another unit's Solution); or (b) restate U3's steps inside this unit's Solution, self-contained. Either way the Solution restates `zetaChi` (provenance comment and docstring included) byte-identically, repeats the header `open`s, and does not import `Challenge` (CO's ruling in TEMPLATE-L). The reflected instance is (5.2) at 1 − s; the product χ(s)χ(1 − s) = 1 by `Complex.sin_pi_div_two_sub`, `Complex.cpow_add`, `Complex.sin_two_mul`, `Complex.Gamma_mul_Gamma_one_sub`, `field_simp` (route: `specs/RZ-33b.md` 22:40:59Z §7 steps 3–6).
- **RZ-33b (i)–(ii):** route in `specs/RZ-33b.md` 22:46:46Z §7 steps 1–7 — step 4 (locating a non-trivial zero in the strip through `riemannZeta_one_sub`, `riemannZeta_ne_zero_of_one_le_re`, `Complex.Gamma_ne_zero`, `Complex.cpow_eq_zero_iff`, `Complex.cos_eq_zero_iff`) carries the weight; then `riemannZeta_conj`.
- **RZ-41b:** route in `specs/RZ-41b.md` §7 — steps 1–4 on U4's `rz_41a` Solution pattern (`MatricesMobius/Solution.lean:44–55`; non-scalar ⇔ γ ≠ ±1 via det r² = 1 over ℤ), step 5 the transfer to ℝ, step 6 `UpperHalfPlane.gl_smul_eq_self_iff_quadratic`, step 7 `Matrix.GeneralLinearGroup.IsParabolic.smul_eq_self_iff` (watch the `DecidableEq ℝ` instance — `convert … using 2` if the action's and `parabolicFixedPoint`'s instances differ), step 8 unfolding `parabolicFixedPoint` for the ∞-or-rational witness.
- Scratch files (outside the repo): `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/l-u11/` — `inspect.lean` (+ `inspect.out`; the elaboration, axioms, `rfl`-link, no-`open` and `let` checks; a later stage may re-run it), `bytecheck.py` (V₂ may re-run it), `extract.py` + `compose.py` + `extracted.json` (how the Challenge was assembled from the spec blocks), `ns.py` (namespace stack reader for the name check), `B1.out`, `B2.out` (build output).
- seat closed 2026-10-28T23:05:13Z

## Proofs phase — 2026-10-28 (seat L, prover)

Seat L (Lean prover), PHASE PROOFS, dispatched by Orchestrator A 2026-10-28 after V₂'s signature (statement_sha256 `7f9a7838…8b1`, v2_signed 2026-10-28T23:10:17Z). Clocks from `date -u`. No git, no web, nothing under the lab's non-public research trees; Challenge.lean untouched (sha256 `7f9a78383b1ef37f8546cc4f8b43e533192fd6777ada6c080dc18f011549c8b1` re-read after the last build). Scratch: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/l-u11-proofs/`.

- seat opened ≈2026-10-28T23:13Z (first scratch file 23:14:39Z); inputs read: `specs/RZ-33b.md` (the M-amend route and the 22:46:46Z §7 it points to), `specs/RZ-41b.md` (\"M — the corrected claim\" §7), `specs/_V2-U11.md`, this unit's Challenge/formalization.yaml/comparator.json/BUILD-LOG; worked forms `RiemannZeta/ZetaL/Solution.lean` (rz_33a :167–194, rz_47 :269–300), `RiemannZeta/MatricesMobius/Solution.lean` (rz_41a :42–170), `RiemannZeta/Accepted/Solution.lean` (the module header and `section Aux` form).
- **The import decision: TAKEN.** `Solution.lean` imports `Mathlib` and `RiemannZeta.ZetaL.Solution` (the CO decision for this unit; the ruled U10 decision-2 pattern, its second instance tonight). From that import the proof uses exactly one declaration, `RiemannZeta.ZetaL.rz_33a_functional_equation`, for conjunct (0)'s two instances of (5.2); the link `RiemannZeta.ZetaL.zetaChi = RiemannZeta.Corrected.zetaChi` is definitional (`exact h` closes the goal; `example … := rfl` re-checked in the axioms probe). `zetaChi` is still restated byte-identically (provenance comment, docstring, body). The strip step of (ii-b) is restated in `aux_strip` from U3's rz_47 lines rather than taken from `rz_47_zero_gives_pole`, so the import's use stays the one the CO ruled.
- **Form.** `Solution.lean` (437 lines) = `import Mathlib`, `import RiemannZeta.ZetaL.Solution`, a proofs module doc, the header `open`s, `namespace RiemannZeta.Corrected`, the Challenge's lines 37–45 byte for byte (the `zetaChi` block), `section Aux … end Aux` (`aux_chi_mul`, `aux_strip`), then each theorem's docstring and statement text (Challenge lines 47–70 and 72–100) with the proof in place of `sorry`, then `end RiemannZeta.Corrected`. Assembled by script (`assemble.py`, scratch), so no statement byte was retyped.

### Route per theorem
- **L:RZ-33b** `rz_33b_reflection_fixed_point` — PROVED. (0) (5.2) at s from `rz_33a` (s ∉ ℤ gives s ∉ ℕ); at 1 − s from `rz_33a` at 1 − s (1 − s = n would put s = 1 − n ∈ ℤ), then `sub_sub_cancel`. The product `aux_chi_mul`: 2^s·2^(1−s) = 2 (`Complex.cpow_add`), π^(s−1)·π^(1−s−1) = π⁻¹ (`Complex.cpow_add`, `Complex.cpow_neg_one`), sin(π(1 − s)/2) = cos(πs/2) (`Complex.sin_pi_div_two_sub`), sin(πs) = 2 sin(πs/2) cos(πs/2) (`Complex.sin_two_mul`), Γ(s)Γ(1 − s) = π/sin(πs) (`Complex.Gamma_mul_Gamma_one_sub`), sin(πs) ≠ 0 off ℤ (`Complex.sin_eq_zero_iff`), closed by `field_simp` + `div_self`. (i) `ring`; fixed points of 1 − · by `Function.mem_fixedPoints`, `Function.IsFixedPt`, `Set.mem_singleton_iff`, `linear_combination`. (ii-a) `Complex.ext_iff` with `Complex.conj_re`, `Complex.conj_im`: the imaginary part holds always, the real part is 1 − Re s = Re s ⇔ Re s = 1/2 (`linarith`). (ii-b) ρ ≠ 1 by `riemannZeta_ne_zero_of_one_le_re`; 0 < Re ρ < 1 by `aux_strip`; ζ(1 − ρ) = 0 by `riemannZeta_one_sub` at ρ (ρ ∉ −ℕ since Re ρ > 0) and `mul_zero`; 1 − ρ̄ = conj (1 − ρ) by `simp`, then `riemannZeta_conj` and `map_zero`; 1 − ρ̄ is not −2(n + 1) because its real part 1 − Re ρ is positive.
- **L:RZ-41b** `rz_41b_noncentral_trichotomy` — PROVED. Setup `hdetγ`, `hdisc`, `hconjtr` as U4. `hns`: for k ∈ SL(2, ℤ), (k : Mat) ∈ range scalar ↔ k = 1 ∨ k = −1 (det (scalar r) = r·r = 1, `Int.eq_one_or_neg_one_of_mul_eq_one'`, `Matrix.SpecialLinearGroup.ext`). `hpm`: conjugation keeps {1, −1} (`group`, `simp`); so the conjugate is scalar iff γ is (the converse by conjugating back with h⁻¹). γ ≠ ±1 gives `hnsγ`, hence IsParabolic ↔ discr = 0. Exhaustive by `lt_trichotomy 0 discr`; the three exclusions by `lt_irrefl`/`lt_asymm` on the discriminant; hyperbolic/elliptic ↔ trace as U4; parabolic ↔ |tr| = 2 by `sq_abs` and `pow_left_inj₀`; conjugation by `hdisc`, `hconjtr` and the scalar transfer. Parabolic case: entries over ℤ and ℝ as U4, (A + D)² = 4 from discr = 0. No fixed point in ℍ: U4's coordinate form of γ • z = z gives 2Cx + D − A = 0 and 4C²y² = 4 − (A + D)² = 0, so C = 0 (y ≠ 0), then D = A and B = 0 — a scalar matrix, against `hnsγ`. The boundary: if C = 0, then ad = 1 forces d = a, b ≠ 0 (else scalar), and the one fixed point is ∞ (`OnePoint.smul_infty_eq_self_iff`; a finite k would need B = 0); if C ≠ 0, ∞ is not fixed and a finite k is fixed iff (2Ck + D − A)² = (A + D)² − 4 = 0 iff k = (A − D)/(2C), the cusp witness q := ((a − d : ℤ) : ℚ)/(2·(c : ℚ)) with `push_cast`.

### Copied steps (with source lines)
- `aux_strip` ← `RiemannZeta/ZetaL/Solution.lean:275–300` (rz_47: ρ ≠ 0, Γ_ℝ(ρ) ≠ 0, Λ(ρ) = 0, Re ρ < 1, Re ρ > 0); its `hnt` adapted to the ∀-form and ρ ≠ 1 derived inside.
- (5.2) at s and at 1 − s ← the imported `RiemannZeta.ZetaL.rz_33a_functional_equation` (`ZetaL/Solution.lean:167`), used, not copied.
- RZ-41b `hdetγ`, `hdisc`, `hconjtr` ← `MatricesMobius/Solution.lean:42–55`; the entries block (`a`…`D`, `hdetZ`, `htrZ`, `hdetR`) ← :57–67; `hfixH` ← :76–94; the fixed-point consequence (the `linear_combination (-4 * C) * h2 + 4 * hdetR + …` line) ← :95–103; `hg`, `hinf`, `hfin` ← :104–121; the hyperbolic/elliptic ↔ trace proofs ← :159–171 (with `hdm` in place of `hm, hdisc γ, ← hm`).

### Departures from the specs' routes
1. **RZ-33b strip (22:46:46Z §7 step 4):** the spec routes Re ρ > 0 through `riemannZeta_one_sub` at 1 − ρ, `Complex.Gamma_ne_zero`, `Complex.cpow_eq_zero_iff` and `Complex.cos_eq_zero_iff`; the proof takes U3's already-checked rz_47 steps instead (Λ = Γ_ℝ·ζ, `completedRiemannZeta_one_sub`), restated as `aux_strip`. Same conclusion, fewer new steps.
2. **RZ-33b product:** `Complex.sin_eq_zero_iff` and `Complex.cpow_neg_one` added to the spec's lemma list (sin(πs) ≠ 0 off ℤ; π^(−1) = π⁻¹).
3. **RZ-41b steps 5–8:** the spec routes the ℍ and boundary claims through the GL transfer (`mapGL`, the GL `IsParabolic`), `UpperHalfPlane.gl_smul_eq_self_iff_quadratic`, `Matrix.GeneralLinearGroup.parabolicFixedPoint` and `IsParabolic.smul_eq_self_iff`. The proof uses U4's coordinate machinery (`hfixH`, `hinf`, `hfin`, the same g) instead, so the `DecidableEq ℝ` instance question the spec flagged never arises; the cusp witness is the spec's (a − d)/(2c) or ∞.
4. **RZ-41b step 4:** the group route (spec's main line) is used; `Matrix.isParabolic_conj_iff` (the spec's alternative) is not.
5. **Aux names** `aux_chi_mul`, `aux_strip` are in the unit namespace inside `section Aux`; no statement uses them. None in any statement.

### Name check (every library name in the proofs, by `#check @<name>` at the pin: scratch `Names.lean` → `names.out`, 36 names, `lake env lean` exit 0, no error), with namespace
- root: `riemannZeta_conj` (Harmonic/ZetaAsymp.lean:458), `riemannZeta_one_sub` (LSeries/RiemannZeta.lean:178), `riemannZeta_ne_zero_of_one_le_re` (LSeries/Nonvanishing.lean:411, written `_root_.`), `riemannZeta_zero` (RiemannZeta.lean:151), `riemannZeta_def_of_ne_zero`, `completedRiemannZeta_one_sub` (RiemannZeta.lean:106), `pow_left_inj₀`.
- `Complex`: `Gamma_mul_Gamma_one_sub` (Gamma/Beta.lean:398), `sin_eq_zero_iff`, `sin_two_mul`, `sin_pi_div_two_sub`, `cpow_add` (Pow/Complex.lean:81), `cpow_neg_one` (Pow/Complex.lean:97), `Gammaℝ_eq_zero_iff`, `conj_re`, `conj_im`. (The `Real.Angle` hits for `sin_eq_zero_iff` / `sin_pi_div_two_sub` in Trigonometric/Angle.lean are different declarations; the full `Complex.` names were checked.)
- `Function`: `mem_fixedPoints`; `Set`: `mem_ofPred_eq` (the non-deprecated name for `mem_setOf_eq` at the pin).
- `Matrix`: `discr_fin_two` (Charpoly/Disc.lean:42), `det_fin_two`, `trace_fin_two`, `trace_mul_comm`, `scalar_apply`, `diagonal_apply_eq`, `diagonal_apply_ne`; `Matrix.SpecialLinearGroup`: `coe_neg`, `coe_mul`; `Int`: `eq_one_or_neg_one_of_mul_eq_one'`.
- `UpperHalfPlane`: `denom_ne_zero`, `coe_specialLinearGroup_apply`, `im_ne_zero`; `OnePoint`: `smul_infty_eq_self_iff` (ProjectiveLine.lean:147), `smul_some_eq_ite` (:151), `coe_eq_coe`, `coe_ne_infty`, `infty_ne_coe`.
- From the import: `RiemannZeta.ZetaL.rz_33a_functional_equation` (`ZetaL/Solution.lean:167`), the only one used.

### Builds and checks
- **S1** 2026-10-28T23:14:39Z → 23:15Z — scratch `P33.lean` (`lake env lean`): one unsolved goal in `aux_chi_mul` (`field_simp` left sc/sc = 1); repaired with `div_self` on sin·cos ≠ 0.
- **S2** ≈23:15:06Z — `P33.lean` exit 0, no output. **S3** 23:16:10Z — `P41.lean` with the last conjunct `sorry`: exit 0, only the `sorry` warning. **S4** 23:16:44Z — full `P41.lean`: the scalar-matrix `ext` goals unsolved by `simp` (repaired with `Matrix.diagonal_apply_eq/_ne`); then the witness typed as ℚ where OnePoint ℝ was wanted (repaired with the double cast). **S5** ≈23:17:27Z — exit 0, no output.
- **P1** 2026-10-28T23:18:1xZ — `lake build RiemannZeta.Corrected.Solution` (the assembled file) · exit **0** · `Build completed successfully (8707 jobs)`, Solution 17 s.
- **P2 (final)** 2026-10-28T23:18:39Z → 23:18:42Z (after `touch`) — `lake build RiemannZeta.Corrected.Solution` · exit **0** · `Build completed successfully (8707 jobs)` · no warning, no `sorry` (`/usr/bin/grep -ci "warning\|sorry"` on the log → 0). Solution.lean sha256 `ce4df2f08001ae3bedfead73e9c9886491c70a70779caf8afaad3f22ae422635`.
- **axioms** 23:18:42Z — scratch `Axioms.lean` (`import RiemannZeta.Corrected.Solution`, two `#print axioms`, the `rfl` link), `lake env lean` exit 0:
```
'RiemannZeta.Corrected.rz_33b_reflection_fixed_point' depends on axioms: [propext, Classical.choice, Quot.sound]
'RiemannZeta.Corrected.rz_41b_noncentral_trichotomy' depends on axioms: [propext, Classical.choice, Quot.sound]
```
- **grep** `/usr/bin/grep -nE "native_decide|sorry|admit|axiom|opaque|set_option" RiemannZeta/Corrected/Solution.lean` → no hits (exit 1).
- **byte identity** (`assemble.py`, scratch): the `zetaChi` block (Challenge :37–45), each theorem's docstring-and-statement text (Challenge :47–70 and :72–100, from `theorem` through `:= by`) each occurs exactly once in Solution. No `import` of the Challenge.
- `comparator.json`: unchanged (both theorems proved; `theorem_names` lists the two). `formalization.yaml`: unchanged (nothing frozen; `statement_sha256` / `v2_signed` untouched).

### Row table (proofs phase)
| row | theorem | status |
|---|---|---|
| L:RZ-33b | `rz_33b_reflection_fixed_point` | PROVED |
| L:RZ-41b | `rz_41b_noncentral_trichotomy` | PROVED |

**The ROW flips wait on the wall's read** of CORRECTION-WAVE-2026-10-28 and the corrected edition's republish (the docstrings' `2d5287e7` → the corrected edition's prefix is a re-sign); until then both rows stay STATED and uncounted, proved.

- seat closed 2026-10-28T23:21:00Z (after the two `L-proofs:` lines)
