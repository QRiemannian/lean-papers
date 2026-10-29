# Unit U8 (`ModularSurface/Now`) — seat M summary

- Seat: M (statement author), Opus, dispatched by Orchestrator A, 2026-10-28. Brief: `Orchestrator/Chat-Design/cc-handoff/projects/reputation-play/lean-scoping/seats/M-U8-2026-10-28.md`.
- Authority read: MS served PDF `~/Claude/projects/qriemannian-site/public/pdfs/modular-surface-characterization.pdf`, sha256 `b4841489ec6bea619f8d5525ce4c788b86e0109e51d6e9d2cb252690f5b13af5` (re-hashed with `shasum -a 256` at seat start: match). `pdftotext -layout` at PDF p05, p06, p07, p08, p09, p10, p13, p14, p15, p17 and the whole text for the ℒ_s / domain searches; p13 also rendered at 220 dpi (`pdftoppm`) to read the MS-32 radical. Page convention: PDF index, cover = p01, printed folio = page − 1.
- Mathlib pin: `db584cd6d46c92f209a44c0f1c829460d327499d` (`lake-manifest.json`). Every name was grepped with `/usr/bin/grep -rn` under `~/Claude/projects/lean-papers/.lake/packages/mathlib/Mathlib/` with the file's namespace read; file:line is in each spec.
- No git, no web, no Lean compiled; nothing under the lab's non-public research trees read. Every clock from `date -u`.
- Summary clock: 2026-10-28T17:42:05Z

## Rows: 11 ledger rows + 1 new row → 16 spec files

| ledger row | spec file(s) | outcome | Q5 |
|---|---|---|---|
| L:MS-02 | `MS-02.md` | SPEC-DRAFT — the printed arithmetic only, on F = {r : ℕ∞ \| 7 ≤ r} with 1/∞ = 0: strictly increasing, area(∞) = π/3 as the LUB of the finite members, area(7) = π/21 least, k(7) = 21, k(∞) = 3, k strictly decreasing, k = 3 ↔ r = ∞. χ_orb(r) = 1/r − 1/6 **supplied** (not printed in the sentence). Gauss–Bonnet "is the area" and Siegel's minimum not taken | in |
| L:MS-03 | `MS-03.md` | SPEC-DRAFT — area A(q) = π − 2π/q **supplied** (the paper prints only the four values); values at q = 3..6, the printed chain, and π/3 least over q ≥ 3 | in |
| L:MS-05 | `MS-05.md` | SPEC-DRAFT — the full set statement on `OnePoint ℝ` under mathlib's GL(2)-Möbius action: {p \| F² • p = p} = {φ, −1/φ} (∞ not fixed). Ledger row = the fixed points, not the second head's MS-05 (that is L:MS-N3) | in |
| L:MS-07 | `MS-07.md` | SPEC-DRAFT — Selberg norm **convention named and supplied** (N_Γ = λ², λ = (t + √(t² − 4))/2; no Selberg norm at the pin): λ(F²) = φ², N_Γ(F²) = φ⁴, log N_Γ = 2 log φ² = 4 log φ (the "matching") | in |
| L:MS-09 | `MS-09a.md`, `MS-09b.md` | **SPLIT (seat-proposed):** 09a = (2.8) φ² = (3 + √5)/2 (keeps 0.1 pd); 09b = "is the fundamental automorph", read as: φ² generates the numbers (t + u√5)/2 > 1 with t² − 5u² = 4 — **OUT-OF-Q5 (pending the wall)**, NEEDS-DEVELOPMENT (the descent / no automorph theory at the pin) | 09a in · 09b out |
| L:MS-13 | `MS-13.md` | SPEC-DRAFT — integer form, two conjuncts: least squarefree d > 1 with d ≡ 1 [MOD 4] is 5; least fundamental discriminant > 1 is 5 (local def `ms13IsFundDisc`; none at the pin). Field form = L:RZ-13, not taken | in |
| L:MS-14 | `MS-14a.md`, `MS-14b.md`, `MS-14c.md` | **SPLIT:** 14a (brief) = the eight listed d ∈ S, S = squarefree d > 1 with x² − dy² = −1 or −4 solvable (keeps 0.5 pd); 14b (brief) = S infinite — **OUT-OF-Q5**, NEEDS-DEVELOPMENT (Legendre's theorem absent); 14c (**seat-proposed**) = the enumeration reading, S ∩ [0, 37] = the eight — **OUT-OF-Q5** (d = 34 has no congruence obstruction; needs the Pell unit argument) | 14a in · 14b, 14c out |
| L:MS-22 | `MS-22.md` | SPEC-DRAFT — systole = 4 log φ as a **hypothesis** (as vol in L:RZ-15; the value is L:RZ-06b, EFFORT): systole/2 = 2 log φ; \|2 log φ − 0.962\| < 0.0005; systole ≠ 2 log φ | in |
| L:MS-24b (NEW, brief) | `MS-24b.md` | SPEC-DRAFT — (3.9) at five decimals: \|g_c − 0.14235\| < 5 × 10⁻⁶. Recomputed: distance 2.509 × 10⁻⁶. **The d6 π bounds suffice** (with 2.236067 < √5 < 2.236068: g_c ∈ (0.1423524916, 0.1423526005), margins 7.49 × 10⁻⁶ / 2.40 × 10⁻⁶); d4 is too coarse; d20 present, not needed | in |
| L:MS-25 | `MS-25.md` | SPEC-DRAFT — g_c · √5 = 1/π ∧ log √5 + log π + log g_c = 0 (shared `geometryConstant`, L:RZ-15) | in |
| L:MS-32 | `MS-32a.md`, `MS-32b.md` | **SPLIT (seat-proposed):** 32a = integer-ladder form (fundamental discriminants in (1, 21] = {5, 8, 12, 13, 17, 21}; g(D) ≤ g(5), equality only at 5; g(8)/g(5) − 1 = √(5/8) − 1; \|100(√(5/8) − 1) + 20.943\| < 0.0005), keeps 1 pd; 32b = the same maximality over real quadratic **fields** (`NumberField.discr`) — **OUT-OF-Q5**, inherits L:RZ-13's gap | 32a in · 32b out |
| L:MS-39 | `MS-39.md` | SPEC-DRAFT — ℒ_s = `RZ.mayer` (RZ (8.3), L:RZ-53a; **MS names the Mayer operator but prints no formula**); domain 1/2 < re s **supplied** (no domain printed); (ℒ_s 1)(0) = Σ n^{−2s} = ζ(2s); (ℒ_s 1)(x) = classical ζ(2s, x + 1) on [0, 1); T(1/φ) = 1/φ; (ℒ_s 1)(1/φ) = classical ζ(2s, φ) | in |

**Splits for V₁'s sign-off:** L:MS-09 → 09a / 09b (seat-proposed); L:MS-14 → 14a / 14b (as the brief directs) + 14c (seat-proposed); L:MS-32 → 32a / 32b (seat-proposed). New row L:MS-24b as the brief directs.

## The 8 shared MS NOW rows — not specced here; they count by their RZ twin's commit, re-keyed to the MS locus by V₁ (plan §9 step 6)
| MS row | MS locus (served) | RZ twin(s) |
|---|---|---|
| L:MS-04 | (2.2), §2.2, p06 — F² = (2 1; 1 1), tr 3, det 1, eigenvalues φ², φ⁻² | L:RZ-02, L:RZ-04 |
| L:MS-08 | (2.7), §2.2, p06 — N(φ) = φφ̄ = −1, N(φ²) = +1 (N the field norm of ℚ(√5)) | L:RZ-07 |
| L:MS-12 | (2.9), §2.4, p07 — 3² − 4 = 5; smallest hyperbolic trace 3 | L:RZ-12, L:RZ-03 |
| L:MS-24 | (3.8)–(3.9), §3.1, p10 — g_c = 1/(√5 · π) ≡ 3 · vol(X(1))/(π² · √d_K) | L:RZ-15 ((3.8), the identity) + **L:MS-24b** ((3.9), five decimals) — not L:RZ-16: RZ-16's "≈ 0.1424" appears in MS only in the abstract, p02 (M-amend 2026-10-28T17:56:43Z, per `_V1-U8.md`) |
| L:MS-28 | (3.10a), §3.2, p11 — Λ = φ · √5 · π · g_c = φ | L:RZ-17 |
| L:MS-41 | (4.5), §4.3, p15; (5.1), p18 — φ(s) = Λ(2s − 1)/Λ(2s) and its expansion; the ξ-ratio differs by (s − 1)/s, of modulus 1 on Re(s) = 1/2 | L:RZ-46a + **L:RZ-49** (the modulus-1 clause; M-amend 2026-10-28T17:56:43Z, per `_V1-U8.md`) |
| L:MS-42 | §4.3, p15–p16 — χ_orb = −1/6; filled cusp +5/6 | L:RZ-44a |
| L:MS-44 | §4.4, p16 — "governed by φ(s) = Λ(2s − 1)/Λ(2s) of (4.5)" (CC-9 applied) | L:RZ-46a |

## CC-CANDIDATE
None. No printed statement in this unit's rows is false or vacuous in the served edition.

## Wording notes (recorded in the specs, not CCs — V₁ decides)
- L:MS-13: the §5.1 echo (p17) "the smallest squarefree d ≡ 1 (mod 4) is 5" omits §2.4's "greater than 1" (literally d = 1 is smaller); read as the §2.4 statement.
- L:MS-39 (locus erratum, per `_V1-U8.md`; M-amend 2026-10-28T17:56:43Z): the §5.2 echo of (4.4) is on served **p18** (printed folio 17), not p19 as `MS-39.md` §1 prints; re-checked by `pdftotext -f 18`. `MS-39.md` itself is left untouched under the follow-up's "touch no other spec" — the erratum is carried here and by V₁'s line in that spec.
- L:MS-39: no domain printed for (4.4) — 1/2 < re s supplied as the series' own convergence domain (the brief's "the domain the paper restricts to": no printed restriction was found in the served text); ℒ_s's formula not printed in MS — imported from RZ (8.3).
- L:MS-02 / L:MS-03 / L:MS-07: χ_orb of (2, 3, r), the Hecke area π − 2π/q, and the Selberg-norm normalisation are standard objects the sentences use without printing; each is a named one-line local definition.
- L:MS-32: the radical is √(5/8) (rendered page read; the extraction's "√5/8" is an artefact).
- L:MS-25: the sentence's opening process clause is elided by "…" in the verbatim quote (it is not a formal claim).

## Mathlib names not found at the pin (and what replaced them)
- None of the ledger's names for these rows is missing: `Real.goldenRatio_sq`, `Real.inv_goldenRatio`, `Squarefree`, `Real.log_mul`, `Real.log_inv`, `zeta_eq_tsum_one_div_nat_cpow`, `Real.sqrt` all FOUND. `Real.goldenRatio`, `Real.goldenConj`, `NumberField.discr` are `abbrev`s.
- Objects absent at the pin, supplied as local one-line definitions (not gaps): Selberg norm (only `SelbergSieve`, unrelated), fundamental discriminant, orbifold Euler characteristic / triangle-orbifold area, Hecke-family area, the negative-Pell set, the **classical** Hurwitz zeta at a ∉ [0, 1] (mathlib's `HurwitzZeta.hurwitzZeta` is 1-periodic on `UnitAddCircle` and gives a different number at a = φ or a = x + 1).
- NEEDS-DEVELOPMENT (all on OUT-OF-Q5 sub-rows): L:MS-09b — the generator (descent) statement for t² − 5u² = 4 / automorphs of binary quadratic forms (no `BinaryQuadraticForm`); L:MS-14b — Legendre's theorem (x² − py² = −1 for p ≡ 1 mod 4); L:MS-32b — the discriminant of a quadratic field (L:RZ-13's gap).
- No global `Fact (Nat.Prime 5)` is needed by any row of this unit.

## Declarations each row targets (file:line in the specs)
- MS-02: `ENat`, `ENat.toNat` (`ENat.recTopCoe` alt.), `Real.pi`, `Real.pi_pos`, `StrictMonoOn`, `StrictAntiOn`, `IsLUB`, `IsLeast`, `Set.image`; local defs `ms02InvOrder`, `ms02Area`, `ms02ChiOrb`, `ms02K`.
- MS-03: `Real.pi`, `Real.pi_pos`, `IsLeast`; local def `ms03HeckeArea`.
- MS-05: `OnePoint`, `OnePoint.instGLAction`, `OnePoint.smul_some_eq_ite`, `OnePoint.smul_infty_eq_self_iff`, `Matrix.GeneralLinearGroup.fixpointPolynomial`, `Matrix.GeneralLinearGroup.fixpointPolynomial_aeval_eq_zero_iff`, `Matrix.GeneralLinearGroup.mkOfDetNeZero` (alt. `Matrix.SpecialLinearGroup.toGL`, `Matrix.SpecialLinearGroup.map`), `Matrix.det_fin_two_of`, `Real.goldenRatio`, `Real.goldenRatio_sq`, `Real.inv_goldenRatio`, `Real.goldenRatio_ne_zero`, `Real.decidableEq`.
- MS-07: `Matrix.trace`, `Matrix.trace_fin_two_of`, `Real.sqrt`, `Real.log`, `Real.log_pow`, `Real.goldenRatio`, `Real.goldenRatio_sq`; local def `selbergNormOfTrace`.
- MS-09a: `Real.goldenRatio`, `Real.goldenRatio_sq`, `Real.sqrt`.
- MS-09b: `Real.goldenRatio`, `Real.goldenRatio_sq`, `Real.one_lt_goldenRatio`, `Real.sqrt` (`Pell.Solution₁`, `Pell.IsFundamental` present but for the +1 equation over ℤ[√5] — they would land on φ⁶).
- MS-13: `Squarefree`, the anonymous `DecidablePred (Squarefree : ℕ → Prop)` instance, `Nat.ModEq`, `IsLeast` (`Int.squarefree_natAbs` if over ℤ); local def `ms13IsFundDisc`.
- MS-14a: `Squarefree` + decidability; local def `ms14NegPellSet`.
- MS-14b: `Set.Infinite`, `Nat.infinite_setOfPred_prime_modEq_one`, `Set.infinite_of_injective_forall_mem`, `Nat.Prime.sq_add_sq` (ingredient).
- MS-14c: `Pell.Solution₁`, `Pell.IsFundamental`, `Pell.exists_of_not_isSquare`, `ZMod`, `Squarefree`.
- MS-22: `Real.log`, `Real.log_pos`, `Real.lt_log_iff_exp_lt`, `Real.log_lt_iff_lt_exp`, `Real.exp_bound`, `Real.goldenRatio`, `Real.one_lt_goldenRatio`, `Real.lt_sqrt`, `Real.sqrt_lt'`, `abs_sub_lt_iff`.
- MS-24b: `Real.pi_gt_d6`, `Real.pi_lt_d6` (`_d20` present, not needed), `Real.lt_sqrt`, `Real.sqrt_lt'`, `abs_sub_lt_iff`; shared def `geometryConstant` (L:RZ-15).
- MS-25: `Real.log`, `Real.log_mul`, `Real.log_inv`, `Real.pi_pos`, `Real.sqrt_pos`; shared `geometryConstant`.
- MS-32a: `Real.pi`, `Real.sqrt`, `Real.sqrt_lt_sqrt`, `Real.sqrt_le_sqrt`, `Real.sqrt_div'`/`Real.sqrt_div`, `Real.lt_sqrt`, `Real.sqrt_lt'`, `Squarefree`, `Nat.ModEq`, `abs_sub_lt_iff`; local def `ms32Gc`; shared `ms13IsFundDisc`.
- MS-32b: `NumberField`, `NumberField.discr`, `NumberField.IsTotallyReal`, `Module.finrank`, `Real.sqrt_le_sqrt`.
- MS-39: `riemannZeta`, `zeta_eq_tsum_one_div_nat_add_one_cpow`, `zeta_eq_tsum_one_div_nat_cpow`, `Complex.summable_one_div_nat_cpow`, `HurwitzZeta.hurwitzZeta`, `HurwitzZeta.hasSum_hurwitzZeta_of_one_lt_re`, `HurwitzZeta.hurwitzZeta_zero`, `Complex.cpow`, `Complex.cpow_neg`, `tsum`, `Int.fract`, golden-ratio lemmas; shared `RZ.mayer`, `RZ.gaussMap` (L:RZ-53a); local def `ms39HurwitzClassical`.

**Shared definitions across units (L places each once):** `geometryConstant` (L:RZ-15) ← MS-24b, MS-25; `RZ.mayer`, `RZ.gaussMap` (L:RZ-53a) ← MS-39; `ms13IsFundDisc` (MS-13) ← MS-32a/b; `ms14NegPellSet` (MS-14a) ← MS-14b/c; `ms32Gc` (MS-32a) ← MS-32b.

## The one thing V₁ should look hardest at, per row
- **MS-02:** the supplied χ_orb(r) = 1/r − 1/6 and the ℕ∞ index with 1/∞ = 0 — and "supremum" read as IsLUB of the finite members plus the value at ∞.
- **MS-03:** whether supplying A(q) = π − 2π/q is acceptable when the sentence prints only the four values, and "run" read as q = 3, 4, 5, 6.
- **MS-05:** "its two fixed points are" read as the exact fixed-point set on `OnePoint ℝ` (∞ excluded), via `OnePoint.instGLAction`.
- **MS-07:** the supplied Selberg-norm normalisation N_Γ = λ² (through the trace) — that it is the one under which "matching ℓ = 4 log φ through (2.4)" holds, and that the row stays apart from the field norm of (2.7).
- **MS-09a:** nothing subtle; confirm "is the fundamental automorph" is fully carried by 09b.
- **MS-09b:** the reading of "fundamental automorph" as a generator statement over t² − 5u² = 4 (and the ring caution: over ℤ[√5] the generator would be φ⁶).
- **MS-13:** the §5.1 echo without "greater than 1" — wording note (the spec) or CC.
- **MS-14a:** the squarefree reading of d (without it, 8 and 20 enter the set and the list is wrong) and "(or −4)" read as a disjunction.
- **MS-14b:** the cost hinge — Legendre (E3) under the squarefree reading vs. d = n² + 1 (E0–E1) under a non-square reading the list contradicts.
- **MS-14c:** whether "{2, 5, …, 37, …}" claims the initial segment at all; if V₁ reads "for example", withdraw 14c.
- **MS-22:** the three-decimal half-unit reading of "≈ 0.962" (margin 7.6 × 10⁻⁵) and the systole value as a hypothesis.
- **MS-24b:** the five-decimal half-unit reading; the upper margin is 2.49 × 10⁻⁶ and the d6 route clears it by 2.40 × 10⁻⁶.
- **MS-25:** nothing subtle; positivity side-conditions for `Real.log_mul`.
- **MS-32a:** that the integer-ladder form (fundamental discriminants) is an honest in-scope leg of "over the whole real-quadratic family", with the field link left to 32b; and the percent read at three decimals.
- **MS-32b:** that attainment at ℚ(√5) is left to L:RZ-09 / L:RZ-13 and the bound alone is stated.
- **MS-39:** the imported ℒ_s formula (RZ (8.3)) for an operator MS only names; the supplied domain 1/2 < re s; and the classical-vs-periodic Hurwitz zeta (do not let `hurwitzZeta φ` into the signature).

## Count for the unit
12 in-scope specs ready for V₁ (MS-02, 03, 05, 07, 09a, 13, 14a, 22, 24b, 25, 32a, 39) · 4 OUT-OF-Q5 sub-rows pending the wall (MS-09b, 14b, 14c, 32b) · 0 CC-CANDIDATE · 8 shared rows named, not specced (MS-04, 08, 12, 24, 28, 41, 42, 44).

Status: SPEC-DRAFT 2026-10-28T17:42:05Z — the unit's specs are on disk; V₁'s turn. Let's cook.

## M-amend 2026-10-28T17:56:43Z — after `_V1-U8.md` (V₁: 12 in-scope GREEN, 0 CC, two DRIFTs, two re-key corrections)
- **L:MS-09b** restated: the formal statement is now IsLeast — φ² is the least (t + u√5)/2 > 1 over integers t, u with t² − 5u² = 4, attained at (3, 1); the generator form is moved out of the statement as an optional, separately-costed strengthening (E2, NEEDS-DEVELOPMENT). Cost re-estimated at about E1. Scope line: "OUT-OF-Q5 pending the wall's re-weigh at the IsLeast cost" (the in-scope count may rise from 12 to 13 at the wall).
- **L:MS-32b** restated: the printed attainment is a second conjunct — a real quadratic K with `NumberField.discr K = 5` exists — beside the bound (now a ∀ over K). Scope unchanged: OUT-OF-Q5, inherits L:RZ-13; the attainment conjunct is NEEDS-DEVELOPMENT with it.
- **Twin lists corrected above:** L:MS-24 → L:RZ-15 + L:MS-24b (not L:RZ-16); L:MS-41 → L:RZ-46a + L:RZ-49.
- **L:MS-39 echo locus:** p18, not p19 (recorded in the wording notes above; the spec file is not touched).
- Prior text of the three edited files is kept in the seat's scratchpad; the SPEC-DRAFT and V1 lines of both specs are unchanged. V₁ re-signs MS-09b and MS-32b next. Let's cook.
