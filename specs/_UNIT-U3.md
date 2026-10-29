# Unit U3 (`RiemannZeta/ZetaL`) — seat M summary

- Seat: M (statement author), Opus, dispatched by Orchestrator A, 2026-10-28. Brief: `Orchestrator/Chat-Design/cc-handoff/projects/reputation-play/lean-scoping/seats/M-U3-2026-10-28.md`.
- Authority read: RZ served PDF, sha256 `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54` (re-hashed at the start of this seat), `pdftotext -layout` at PDF p08, p09, p10, p11, p12, p14, p19, p24, p25 and the whole text for the χ(s) search. Page convention: PDF index, cover = p01, printed folio = page − 1.
- Mathlib pin: `db584cd6d46c92f209a44c0f1c829460d327499d` (`lake-manifest.json`). Every name below was grepped with `/usr/bin/grep -rn` under `~/Claude/projects/lean-papers/.lake/packages/mathlib/Mathlib/`; file:line is recorded in each spec.
- No git, no web, no Lean compiled; nothing under the lab's non-public research trees read.
- Summary clock: 2026-10-28T17:12:39Z

## Rows: 11 ledger rows → 13 spec files

| ledger row | spec file(s) | outcome | Q5 |
|---|---|---|---|
| L:RZ-15 | `RZ-15.md` | SPEC-DRAFT — vol(X(1)) = π/3 and d_K = 5 taken as **hypotheses** (RZ-14, RZ-09 are EFFORT) | in |
| L:RZ-16 | `RZ-16.md` | SPEC-DRAFT — "≈ 0.1424" read as \|g_c − 0.1424\| < 0.00005 | in |
| L:RZ-17 | `RZ-17.md` | SPEC-DRAFT — Λ here is the argument-less product, not `completedRiemannZeta` | in |
| L:RZ-21 | `RZ-21.md` | SPEC-DRAFT — direct from `riemannZeta_two`, `riemannZeta_four` | in |
| L:RZ-32 | `RZ-32a.md`, `RZ-32b.md` | **SPLIT**: 32a = the termwise q-rewriting (4.3) ↔ (5.1) (keeps the ledger's 0.5 pd); 32b = (5.1) as a ζ(3) statement = Ramanujan (RZ-26) in q-form, **OUT-OF-Q5 (pending the wall)**, NEEDS-DEVELOPMENT | 32a in · 32b out |
| L:RZ-33 | `RZ-33a.md`, `RZ-33b.md` | **SPLIT**: 33a = the functional equation (5.2) with the standard χ supplied by the spec; 33b = "reflection symmetry s ↔ 1 − s with fixed locus Re(s) = 1/2" — **CC-CANDIDATE**, stopped | 33a in · 33b OPEN, uncounted |
| L:RZ-34 | `RZ-34.md` | SPEC-DRAFT — domain 1 < Re s supplied; omission recorded as a wording note, not a CC | in |
| L:RZ-46a | `RZ-46a.md` | SPEC-DRAFT — Λ = `completedRiemannZeta` (convention conjunct (o)); (7.5) expansion; the (s − 1)/s factor; ξ as a local one-line def | in |
| L:RZ-47 | `RZ-47.md` | SPEC-DRAFT — pole as `Tendsto … (𝓝[≠] (ρ/2)) (Bornology.cobounded ℂ)`; RH → Re = 1/4; unconditional strip proved, not assumed | in |
| L:RZ-49 | `RZ-49.md` | SPEC-DRAFT — `‖(s − 1)/s‖ = 1` on Re s = 1/2 | in |
| L:RZ-60 | `RZ-60.md` | SPEC-DRAFT — re-keyed to the CHANGED served sentence (the erratum chain is gone); φ² − φ⁻² = φ + 1/φ = √5, φ − 1/φ = 1 (≠ √5), log φ⁴ = 4 log φ = 2 log φ² | in |

**Splits for V₁'s sign-off:** L:RZ-32 → 32a / 32b; L:RZ-33 → 33a / 33b.

## CC-CANDIDATE (plan §4 step 3 — to the correction track; row stays OPEN and uncounted)
- **L:RZ-33b** — §5.4 p14, "has reflection symmetry s ↔ 1 − s with fixed locus Re(s) = 1/2". Defect: the fixed-point set of s ↦ 1 − s on ℂ is {1/2}, not the line Re(s) = 1/2; the reflection with that fixed locus is s ↦ 1 − s̄. Echoes for the sweep: §5.4 "functional-equation symmetry axis s ↔ 1 − s" (p14); §7.4 "symmetry axis of the functional equation E(z, s) ↔ E(z, 1 − s)" (p19).

## Wording notes (recorded in the specs, not CCs)
- L:RZ-33a: **χ(s) is undefined in the served text** (the string occurs once in the whole PDF, in (5.2)). The spec supplies the standard factor χ(s) = 2^s π^{s−1} sin(πs/2) Γ(1 − s) on the strength of "The functional equation"; with χ unconstrained the display would be vacuous. V₁ decides whether the naming suffices or this joins 33b on the correction track.
- L:RZ-34: the domain 1 < Re s is still omitted in print; supplied.
- L:RZ-17 / L:RZ-46a: Λ has two meanings in the paper (its own note, p19); the Lean names keep them apart. φ (scattering ratio) collides with φ (golden ratio); the Lean name is `scatteringRatio`.

## Mathlib names not found at the pin (and what replaced them)
- `Complex.abs` (ledger, RZ-49) — absent; replaced by the norm `‖·‖` (`norm_div`, `Complex.norm_def`, `Complex.normSq_apply`, `Complex.sq_norm`).
- ξ (`riemannXi` / `RiemannXi`, 0 hits) — absent; a one-line local definition in RZ-46a (not a gap).
- Ramanujan's ζ(3) formula — absent; RZ-32b marked NEEDS-DEVELOPMENT (the RZ-26 gap), OUT-OF-Q5.
- Closed: `riemannZeta_four` **exists** (HurwitzZetaValues.lean:232). `Real.goldenRatio` / `Real.goldenConj` are `abbrev`s (GoldenRatio.lean:37, :40), not `def`s.
- The ledger's `riemannZeta_ne_zero_of_one_le_re` is declared `_root_.` inside `namespace DirichletCharacter` (section `nonvanishing`) at Nonvanishing.lean:411 — present under the root name.

## Declarations each row targets (file:line in the specs)
- RZ-15: `Real.pi`, `Real.pi_pos`, `Real.sqrt`, `Real.sqrt_pos`; shared def `geometryConstant := 1 / (√5 * π)` (L places once for RZ-15/16/17).
- RZ-16: `Real.pi_gt_d6`, `Real.pi_lt_d6` (also `_d4`, `_d20` present), `Real.lt_sqrt`, `Real.sqrt_lt'`.
- RZ-17: `Real.goldenRatio`, `Real.sqrt`, `Real.pi` (+ positivity lemmas).
- RZ-21: `riemannZeta`, `riemannZeta_two`, `riemannZeta_four`.
- RZ-32a: `Real.exp`, `Real.exp_neg`, `Real.exp_nat_mul`, `Real.pi`, `tsum_congr` (← `tprod_congr`).
- RZ-32b: `riemannZeta`, `cot_series_rep` (ingredient); NEEDS-DEVELOPMENT.
- RZ-33a: `riemannZeta_one_sub`, `Complex.Gamma`, `Complex.sin`, `Complex.cos_pi_div_two_sub`, `Complex.mul_cpow_ofReal_nonneg` (`completedRiemannZeta_one_sub` as the alternative route); local def `zetaChi`.
- RZ-33b: none (stopped).
- RZ-34: `riemannZeta_eulerProduct_hasProd` (target form), `riemannZeta_eulerProduct_tprod`, `riemannZeta_eulerProduct`, `Nat.Primes`.
- RZ-46a: `completedRiemannZeta`, `riemannZeta_def_of_ne_zero`, `Complex.Gammaℝ`, `Complex.Gammaℝ_def`, `Complex.Gammaℝ_eq_zero_iff`, `Complex.Gamma`; local defs `scatteringRatio`, `riemannXiRZ`.
- RZ-47: `scatteringRatio` (from 46a), `completedRiemannZeta_one_sub`, `differentiableAt_completedZeta`, `riemannZeta_def_of_ne_zero`, `riemannZeta_one_sub`, `RiemannHypothesis`, `riemannZeta_ne_zero_of_one_le_re`, `riemannZeta_zero`, `riemannZeta_neg_nat_eq_bernoulli`, `Complex.Gammaℝ_ne_zero_of_re_pos`, `AnalyticAt.eventually_eq_zero_or_eventually_ne_zero`, `meromorphicOrderAt`, `tendsto_cobounded_iff_meromorphicOrderAt_neg`.
- RZ-49: `norm_div`, `Complex.norm_def`, `Complex.normSq_apply`, `Complex.sq_norm`.
- RZ-60: `Real.goldenRatio`, `Real.goldenConj`, `Real.inv_goldenRatio`, `Real.goldenRatio_add_goldenConj`, `Real.goldenRatio_sub_goldenConj`, `Real.goldenRatio_pos`, `Real.goldenRatio_ne_zero`, `Real.log_pow`.

## The one thing V₁ should look hardest at, per row
- **RZ-15:** that taking vol = π/3 and d_K = 5 as hypotheses (rather than theorems) matches the display's "with … " clause and does not weaken it.
- **RZ-16:** the precision reading — four decimals ⇒ the half-unit interval; note g_c sits only ≈ 2.5 × 10⁻⁶ above 0.14235 (true, but tight).
- **RZ-17:** that the statement says nothing about operators/eigenvalues (Q7) and that Λ is not the completed zeta here.
- **RZ-21:** nothing subtle; confirm the row is only the two "e.g." values, not (4.1).
- **RZ-32a/b:** the split itself — the termwise identity is not printed as its own display; is "between (4.3) and (5.1)" an honest locus, and is 32b correctly out of Q5.
- **RZ-33a:** the supplied χ — whether "The functional equation" makes the undefined χ definite enough, or the row should follow 33b to the correction track; and the excluded set s ∈ ℕ.
- **RZ-33b:** whether "fixed locus" is false as printed (the spec's judgment) or admits the invariant-line reading as the paper's own meaning.
- **RZ-34:** HasProd (convergence + value) as the faithful reading of "=" with an infinite product, and the supplied domain.
- **RZ-46a:** the pointwise excluded set (s ∉ {0, −1, −2, …} ∪ {1/2, −1/2, −3/2, …}) as the exact Lean shadow of the meromorphic identity, and the direction of the (s − 1)/s factor (ξ-ratio = ((s − 1)/s) · Λ-ratio).
- **RZ-47:** the reading of "a zero ρ" as a non-trivial zero in `RiemannHypothesis`'s vocabulary (strip proved, not assumed) and "pole" as `Tendsto … cobounded`.
- **RZ-49:** nothing subtle; the `Complex.abs` → norm replacement.
- **RZ-60:** that the spec targets the served (CHANGED) sentence only and reads "which doubles the numerator to 4 log φ" as log φ⁴ = 4 log φ = 2 log φ².

## Count for the unit
11 in-scope specs ready for V₁ (RZ-15, 16, 17, 21, 32a, 33a, 34, 46a, 47, 49, 60) · 1 OUT-OF-Q5 sub-row (RZ-32b) · 1 CC-CANDIDATE (RZ-33b, OPEN, uncounted).

Status: SPEC-DRAFT 2026-10-28T17:12:39Z — the unit's specs are on disk; V₁'s turn. Let's cook.
