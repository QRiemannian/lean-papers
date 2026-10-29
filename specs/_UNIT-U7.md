# Unit U7 (`RiemannZeta/SmallArith`) — seat M summary

- Seat: M (statement author), Opus, dispatched by Orchestrator A, 2026-10-28. Brief: `Orchestrator/Chat-Design/cc-handoff/projects/reputation-play/lean-scoping/seats/M-U7-2026-10-28.md`.
- Authority read: RZ served PDF, sha256 `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54` (re-hashed at the start of this seat), `pdftotext -layout` at PDF p11, p15, p17, p18, p29, p30. Page convention: PDF index, cover = p01, printed folio = page − 1. The re-keyed ledger and REKEY report were read as pointers only.
- Mathlib pin: `db584cd6d46c92f209a44c0f1c829460d327499d` (`lake-manifest.json`). Every name was grepped with `/usr/bin/grep -rn` under `~/Claude/projects/lean-papers/.lake/packages/mathlib/Mathlib/` (two core names, `Function.Injective` and `List.sum`, under the v4.33.0 toolchain's `src/lean/Init/`); file:line is recorded in each spec.
- No git, no web, no Lean compiled; nothing under the lab's non-public research trees read.
- Summary clock: 2026-10-28T17:28:14Z

## Rows: 5 ledger rows → 7 spec files

| ledger row | spec file(s) | outcome | Q5 |
|---|---|---|---|
| L:RZ-24 | `RZ-24.md` | SPEC-DRAFT — the CORRECTED (4.2) f(−t) − f(t) = t (CC-1 landed; true as served); f + t/2 even; the same symmetry for `bernoulliPowerSeries ℚ`; "kills all odd coefficients beyond B₁" stated as the implication over any series Q with Q(−X) − Q(X) = X. f carries its removable value f(0) = 1 (local def `bernoulliGF`). Convention `bernoulli` (B₁ = −1/2), as `L:RZ-23` | in |
| L:RZ-38 | `RZ-38.md` | SPEC-DRAFT — (6.4) solves ẋ = ∂H/∂p, ṗ = −∂H/∂x for H = xp, and is the unique solution from (x₀, p₀); "hyperbolic" = conservation xp = x₀p₀; "never return" = injectivity of t ↦ (x(t), p(t)) under the **supplied** hypothesis (x₀, p₀) ≠ (0, 0) (wording note, not a CC) | in |
| L:RZ-44a | `RZ-44a.md` | SPEC-DRAFT — χ_orb formula 2 − 2g − Σ(1 − 1/m) − n carried as a local def (not printed; convention named); χ(0,[2,3],1) = −1/6, χ(0,[2,3],0) = 5/6 > 0, χ(0,[2,3,m],0) < 0 for m ≥ 7 (forward direction only; the converse is not printed). Geometry stays in `L:RZ-44b` (EFFORT-FAR, not specced) | in |
| L:RZ-76 | `RZ-76a.md`, `RZ-76b.md` | **SPLIT as the brief directs**: 76a = the arithmetic of (12.2), (12.3), (12.5), (12.6) — 7/8 = 1 − 1/8; (1/4 − 1/2)·π/2 = −π/8, ÷π → −1/8; prefactor s(s−1)/2 at 1/2 = −1/8 (the prefactor of `L:RZ-46a`'s `riemannXiRZ`); **+**1/(4·2·sin(π/2)) = **+**1/8 (served sign) — keeps the ledger's 0.5 pd. 76b = the roles (Stirling / ξ-prefactor / Selberg elliptic term / pole winding / Maslov) — **NOT A LEAN TARGET** (EFFORT-FAR analytic theorems absent at the pin + [I]/coincidence statements with no formal claim) | 76a in · 76b not a target, uncounted |
| L:RZ-77 | `RZ-77a.md`, `RZ-77b.md` | **SPLIT (this seat's proposal, for V₁'s sign-off)**: 77a = (12.7)–(12.9) arithmetic, M = λ/2, the table's Maslov column 0, 1/8, 0, and `IsMaxOn` at σ = 1/2 [E] — keeps the ledger's 0.25 pd. 77b = "the Casimir operator C has eigenvalue s(1 − s) on the principal series with parameter s" — **OUT-OF-Q5 (pending the wall)**, NEEDS-DEVELOPMENT (no Casimir, no principal series in mathlib) | 77a in · 77b out |

**Splits for V₁'s sign-off:** L:RZ-76 → 76a / 76b (directed by the brief); L:RZ-77 → 77a / 77b (proposed here under plan §4 step 8: the print says more than the row's 0.25 pd covers).

**Definitional rows carried (brief: "name which"):**
- **L:RZ-10** (√5 = √d_K, (2.5), p07) is carried by **L:RZ-09** (ℚ(√5), discriminant 5; provenance cluster, plan §9 step 4 — not yet specced) and is echoed by **L:RZ-11** (`RZ-11.md` §6 already names it as not taken there).
- **L:RZ-40** (ℓ = log N(p), (6.6), p17) is carried by **L:RZ-61a** (log N at N = φ⁴, the systolic weight) and **L:RZ-63a** (ℓ in √(t² − 4) = 2 sinh(ℓ/2); there ℓ := 2 log λ, which equals log N with N = λ²); the geometric reading of ℓ as translation length is `L:RZ-05` / `L:RZ-63b`. Neither carrier spec currently cites `L:RZ-40` by id — V₁ may ask the carriers to name it.

## CC-CANDIDATE (plan §4 step 3)
**None.** Every printed statement taken in this unit is true as served (RZ-24 at its corrected (4.2)).

## Wording notes (recorded in the specs, not CCs; V₁ decides)
- **L:RZ-76b** — §12.3 Path A: "The cross-term Re(z − 1/2) × Im(log z) evaluated at z = 1/4 + iT/2 gives (1/4 − 1/2) × π/2". At finite T > 0, Im(log z) = arctan(2T) < π/2; the printed value is the T → ∞ limit. Standard asymptotic shorthand, false read literally as a pointwise evaluation; the display (12.3) as arithmetic is true and lives in 76a.
- **L:RZ-38** — "they never return" fails for the fixed point at the origin; the spec supplies (x₀, p₀) ≠ (0, 0).
- **L:RZ-44a** — the χ_orb formula is used but not printed; the spec names the standard convention.
- **L:RZ-77a/b** — the principal-series parameter and the Casimir normalisation are not printed; 77b names the ones under which the eigenvalue is s(1 − s).

## Mathlib names not found at the pin (and what replaced them)
- `bernoulli_power_series` (ledger v0.1, RZ-24) — absent; replaced by `bernoulliPowerSeries` (Bernoulli.lean:268) / `bernoulliPowerSeries_mul_exp_sub_one` (:271).
- ξ (`riemannXi`) — absent; RZ-76a uses `L:RZ-46a`'s local `riemannXiRZ` (one def for the build).
- Orbifold Euler characteristic — absent (one docstring hit, Geometry/Diffeology/Basic.lean:125, no declaration); RZ-44a carries the formula as a local def (not a gap for 44a; it is 44b's gap).
- Casimir element (0 files), principal-series representations, hyperbolic Laplacian on `UpperHalfPlane` — absent; RZ-77b NEEDS-DEVELOPMENT.
- Complex Stirling with error term, Selberg trace formula (only `SelbergSieve.lean`), Weyl law / Maass spectrum (0 hits), Riemann–von Mangoldt N(T) — absent; RZ-76b NOT A LEAN TARGET.
- No `Fact (Nat.Prime 5)` is needed anywhere in U7.

## Declarations each row targets (file:line in the specs)
- RZ-24: `Real.exp`, `Real.exp_neg`, `Real.exp_ne_zero`, `Real.exp_eq_one_iff`, `Function.Even`, `bernoulli`, `bernoulli_one`, `bernoulliPowerSeries`, `bernoulliPowerSeries_mul_exp_sub_one`, `PowerSeries.exp`, `PowerSeries.X`, `PowerSeries.coeff`, `PowerSeries.coeff_X`, `PowerSeries.rescale`, `PowerSeries.coeff_rescale`, `PowerSeries.evalNegHom`, `PowerSeries.evalNegHom_X`; local def `bernoulliGF`.
- RZ-38: `HasDerivAt`, `HasDerivAt.deriv`, `HasDerivAt.differentiableAt`, `hasDerivAt_id`, `Real.hasDerivAt_exp`, `HasDerivAt.exp`, `HasDerivAt.const_mul`, `HasDerivAt.neg`, `hasDerivAt_neg`, `is_const_of_deriv_eq_zero` (`_root_`), `Real.exp_add`, `Real.exp_neg`, `Real.exp_ne_zero`, `Real.exp_pos`, `Real.exp_injective`, `Function.Injective` (core).
- RZ-44a: `List.sum`, `List.map` (core), ℚ arithmetic; local def `orbEulerChar`.
- RZ-76a: `Real.pi`, `Real.pi_ne_zero`, `Real.pi_pos`, `Real.sin`, `Real.sin_pi_div_two`; convention link `completedRiemannZeta`, `riemannZeta_def_of_ne_zero`, `Complex.Gammaℝ`, `Complex.Gammaℝ_def` (via `L:RZ-46a`'s `riemannXiRZ`).
- RZ-76b: none (NOT A LEAN TARGET).
- RZ-77a: `IsMaxOn`, `isMaxOn_iff`, `Set.univ`.
- RZ-77b: none targeted; ingredients present `UniversalEnvelopingAlgebra`, `LieAlgebra.SpecialLinear.sl`, `IsSl2Triple`.

## The one thing V₁ should look hardest at, per row
- **RZ-24:** clause (iv) — that stating "kills all odd coefficients beyond B₁" as an implication over *any* series with the symmetry is the print's claim and not stronger; and that the two registers (real f with f(0) = 1, formal `bernoulliPowerSeries`) are both needed, with the analytic link between them left unclaimed.
- **RZ-38:** clause (b), uniqueness — whether the definite article "the classical trajectories" licenses it; and the supplied hypothesis (x₀, p₀) ≠ (0, 0) in (d), plus the Hamilton sign convention ẋ = +∂H/∂p.
- **RZ-44a:** that the χ_orb formula as a local def (convention, unprinted) and the forward-only m ≥ 7 clause say exactly what the print's arithmetic says — no converse, no geometry.
- **RZ-76a:** the served sign of Path C (+1/8, CHANGED from the v0.1 −1/8) and that (12.5) is stated as the prefactor's value, not as anything about ξ or N(T).
- **RZ-76b:** the Path A wording note (the "evaluated at" sentence is a T → ∞ limit) — correction track or not.
- **RZ-77a:** inclusion of the table's Maslov column (0, 1/8, 0) — printed numbers of the same function, but outside the ledger pointer's "(12.7)–(12.9)" — and that "maximized" is not read as unique.
- **RZ-77b:** the proposed split itself, and the named normalisation/parameter conventions.

## Status
- `SPEC-DRAFT 2026-10-28T17:28:14Z` — 7 spec files + this summary written under `~/Claude/projects/lean-papers/specs/`; no other row's file touched.
