# UNIT U10 — `RiemannZeta/LValue` (L(1, χ5) and the χ5 binding definition) — seat M summary

- unit: U10 · seat: M (statement author), dispatched by Orchestrator A 2026-10-28 ≈20:25Z for LANE 3 of the wall's word (`Orchestrator/Chat-Design/cc-handoff/projects/priority/inbox/WORD-wall-2026-10-28-now-wave-words.md`: "RZ-58 standalone (RZ-61c and the chi5-unification ride it)")
- paper: RZ, served edition sha256 2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54 (re-read with `shasum -a 256` at the seat's start, 2026-10-28T20:21Z; matches)
- mathlib pin: db584cd6d46c92f209a44c0f1c829460d327499d (`lake-manifest.json`, mathlib `rev`)
- pages read from the served PDF by `pdftotext -layout`: p23, p24, p25 (PDF index; cover = p01; folio = page − 1)
- inputs read: TEMPLATE-M (whole, with the sitting-71 addendum), `specs/RZ-61c.md`, `specs/RZ-61a.md`, `specs/_UNIT-U2.md`, `RiemannZeta/Bridge/Challenge.lean` + `Solution.lean` header + `BUILD-LOG.md` + `comparator.json` + `formalization.yaml`, `RiemannZeta/Pilot/Challenge.lean` + `Solution.lean` (chi5, `rz_11`), ledger v0.2 row `| RZ-58 |`, `LEDGER-NAMES-v0.1` §4b, `V3-UNCARRIED-2026-10-28.md`, FAN-OUT-PLAN-v1 §9
- summary_clock: 2026-10-28T20:36:31Z

## Rows specced (1 spec file, 1 ledger row split three ways, 1 rider)

| spec / row | ledger row | locus (served) | status | split / gate |
|---|---|---|---|---|
| `specs/RZ-58.md` → **RZ-58a** | L:RZ-58 → a | (9.5) p23, (9.8) p24, (9.9) p24–p25: L(1, χ5) = 2 log φ/√5 | SPEC-DRAFT · REACHABLE (in-unit development; no library gap) | **SPLIT** |
| `specs/RZ-58.md` → **RZ-58b** | L:RZ-58 → b | §9.2 after (9.4), p23: "the Kronecker symbol (5/⋅), the unique real primitive Dirichlet character of conductor 5" | SPEC-DRAFT · NOW | **SPLIT** (the χ5 unification, as theorems) |
| `specs/RZ-58.md` → **RZ-58c** | L:RZ-58 → c | "≈ 0.4304" of (9.5)/(9.8)/(9.9) | SPEC-DRAFT · NOW | **SPLIT** |
| `specs/RZ-61c.md` (U2, unchanged) | L:RZ-61 → c | (9.7) last link + the sentence after (9.8), p24 | V1-GREEN / V2-GREEN, frozen in `Bridge/Challenge.lean` | **RIDES RZ-58a** — E0 once (a) lands; see §"RZ-61c" |

**The split of L:RZ-58, for V₁'s sign-off.** One printed value across three displays, plus the definition of its object. **a** = `DirichletCharacter.LFunction chi5 1 = ↑(2 log φ/√5)` — the target. **b** = what χ5 is: the Kronecker symbol (5/·) (through its defining values: J(5 | n) on odd n, χ₈(5) at 2, +1 at −1), real-valued, primitive, conductor 5, and unique among real primitive characters mod 5 — the brief's and V₃-U2's "agreement, primitivity and conductor 5 as theorems, not a docstring". **c** = the numeral, correct four-decimal rounding of 2 log φ/√5. No separate spec file per leg: the three legs share one locus and one object, and the spec carries them as three numbered blocks (V₁ may ask for `RZ-58a.md`/`b`/`c` files; the content is already separated).

## CC-CANDIDATE
**None.** Every printed member reads true at the served edition: 2 log φ/√5 = 0.4304089409640040388894…, and L(1, χ5) equals it (checked at 40 digits by three independent formulas — the grouped series, the integral ∫₀¹ (1 − t²)/(1 + t + t² + t³ + t⁴), and the digamma form −(1/5) Σ χ(a) ψ(a/5) — a check on the reading, not a proof); Kronecker (5/n) = Legendre (n/5) for every n ∈ [−2000, 2000]; χ5 is real, primitive, of conductor 5, and the only such character mod 5.

## OUT-OF-Q5, named and not specced
- The class-number formula as a theorem and its inputs h(ℚ(√5)) = 1, ε = φ, R = log φ, d_K = 5 (the middle members of (9.9)); the Dedekind factorisation (9.4) — L:RZ-57 / L:RZ-09, outside Q5 except by the wall's word. Named in RZ-58 §6. Leg a's proof does not use them.

## Names table

**Declarations the unit exports (proposed; namespace the CO's call):**
| name | kind | row |
|---|---|---|
| `RiemannZeta.LFunction.fact_prime_five` | instance `Fact (Nat.Prime 5)` (U1/U2 form) | — |
| `RiemannZeta.LFunction.chi5` | `noncomputable def : DirichletCharacter ℂ 5 := (quadraticChar (ZMod 5)).ringHomComp (Int.castRingHom ℂ)` — **the binding definition** | 58b |
| `rz_58a_LFunction_chi5_one` | theorem | 58a |
| `rz_58b_chi5_kronecker` | theorem | 58b |
| `rz_58b_chi5_real_primitive_conductor` | theorem | 58b |
| `rz_58b_chi5_unique` | theorem | 58b |
| `rz_58c_value_approx` | theorem | 58c |
| `rz_61c_of_rz_58a` (proposed helper, Solution-side; see build order) | theorem, conditional on (a)'s equation as a hypothesis | 61c reduction |

**Namespace note for the CO.** The module path the brief gives, `RiemannZeta/LValue`, makes the namespace `RiemannZeta.LFunction`, which shares its last component with `DirichletCharacter.LFunction`. Lean resolves `DirichletCharacter.LFunction` written fully, as U2 already does; the spec writes it fully everywhere and recommends the coder never write a bare `LFunction` in this unit. A different namespace (e.g. `RiemannZeta.LValue`) avoids the question; the CO's call.

**Mathlib declarations the rows target** (full tables with file:line and namespace in `specs/RZ-58.md` §4):
- **58a:** `DirichletCharacter.LFunction`, `.differentiable_LFunction`, `.LFunction_eq_LSeries`, `ZMod.LSeriesSummable_of_one_lt_re`, `Nat.sumByResidueClasses`, `LSeries.term_of_ne_zero`, `Complex.ofReal_cpow`, `tendsto_tsum_of_dominated_convergence`, `Real.rpow_le_rpow_of_exponent_ge`, `Real.continuousAt_const_rpow`, `Real.rpow_neg_one`, `Real.summable_one_div_nat_pow`, `integral_pow`, `intervalIntegral.hasSum_integral_of_dominated_convergence`, `hasSum_geometric_of_lt_one`, `ContinuousOn.intervalIntegrable`, `intervalIntegral.integral_eq_sub_of_hasDerivAt`, `HasDerivAt.log`, `Real.goldenRatio_add_goldenConj` / `_mul_goldenConj` / `_sub_goldenConj` / `_sq`, `Real.neg_one_lt_goldenConj`, `Real.goldenConj_neg`, `Real.log_mul`, `Real.log_pow`.
- **58b:** `quadraticChar`, `quadraticChar_zero` / `_neg_one_iff_not_isSquare` / `_one_iff_isSquare`, `MulChar.ringHomComp` (+ generated `ringHomComp_apply`), `jacobiSym`, `jacobiSym.quadratic_reciprocity_one_mod_four`, `jacobiSym.legendreSym.to_jacobiSym`, `jacobiSym.mod_left`, `ZMod.χ₈`, `ZMod.χ₈_nat_eq_if_mod_eight`, `DirichletCharacter.conductor` / `.IsPrimitive` / `.isPrimitive_def` / `.conductor_dvd_level` / `.conductor_ne_zero` / `.eq_one_iff_conductor_eq_one`, `MulChar.ext'`.
- **58c:** the RZ-61a numeral argument (`Real.exp_bound`, `Real.exp_bound'`, `Real.lt_sqrt`, `Real.sqrt_lt'`), restated.

**Name check — one hit pasted with its namespace (the sitting-71 form, run on the real tree):** `NumberTheory/LSeries/Nonvanishing.lean:406:theorem LFunction_apply_one_ne_zero (hχ : χ ≠ 1) : LFunction χ 1 ≠ 0 :=`, innermost namespace `DirichletCharacter` (opened :58, closed :419) → `DirichletCharacter.LFunction_apply_one_ne_zero`. A prefix-carrying hit the old grep form would have mis-named: `NumberTheory/LegendreSymbol/JacobiSymbol.lean:115:theorem legendreSym.to_jacobiSym`, inside `namespace jacobiSym` (:99–:267) → `jacobiSym.legendreSym.to_jacobiSym`.

**Names not found at the pin (each searched by the sitting-71 form, in the right directories):**
- `MulChar.ringHomComp_apply`, `MulChar.ringHomComp_ne_one` — no source line: the first is generated by `@[simps]` on `ringHomComp` (MulChar/Basic.lean:452–453) and is used in mathlib by that name (:461); the second does not exist (chi5 ≠ 1 comes from chi5 2 = −1).
- `tsum_eq_zero_of_not_summable` — no source line: the additive form generated from `tprod_eq_one_of_not_multipliable` (Topology/Algebra/InfiniteSum/Defs.lean:201).
- `Real.digamma` — absent; the object is `Complex.digamma` (Analysis/SpecialFunctions/Gamma/Digamma.lean:39).
- `DirichletCharacter.LFunction_eq_sum_hurwitzZeta` (the brief's "-class" name) — absent; the Hurwitz decomposition is the definition of `ZMod.LFunction` (LSeries/ZMod.lean:83), so it holds by unfolding.
- `DirichletCharacter.conductor_eq_one_iff` — absent; the pin's form is `DirichletCharacter.eq_one_iff_conductor_eq_one` (Basic.lean:268).
- Closed values at s = 1 of `LFunction` / `hurwitzZeta` / `cosZeta` / `expZeta` for any argument; Gauss's digamma theorem; the boundary value of the log series on |z| = 1; the factorisation ζ_{ℚ(√5)} = ζ·L(·, χ5); h(ℚ(√5)) = 1 — all absent; none is on the chosen route (RZ-58 §4, "Searched and absent").

## The chi5 unification (what V₃-U2 asked for)
- **One expression, three units.** U1 `RiemannZeta.Pilot.chi5 : MulChar (ZMod 5) ℂ`, U2 `RiemannZeta.Bridge.chi5 : DirichletCharacter ℂ 5`, U10 `RiemannZeta.LFunction.chi5 : DirichletCharacter ℂ 5` — the same body `(quadraticChar (ZMod 5)).ringHomComp (Int.castRingHom ℂ)`; `DirichletCharacter ℂ 5` unfolds to `MulChar (ZMod 5) ℂ` (an `abbrev`); each unit's `fact_prime_five` is a proof of a `Prop`, so the bodies are definitionally equal. U10 is where the definition becomes **binding**: RZ-58b states, as theorems, that it is the Kronecker symbol (5/·), real, primitive, of conductor 5, and unique — which is what makes U1's τ(χ5) = √5 and U2's RZ-61c about the paper's χ5.
- **The cross-unit equation.** Under the CO's self-contained-module ruling (Challenge and Solution each import `Mathlib` only), `Pilot.chi5 = LFunction.chi5` and `Bridge.chi5 = LFunction.chi5` cannot be stated inside any one unit. Recommended: a link file outside the Comparator modules, e.g. `RiemannZeta/LValue/Link.lean`, importing the three Challenge modules and carrying `theorem bridge_chi5_eq : RiemannZeta.Bridge.chi5 = RiemannZeta.LFunction.chi5 := rfl` and `theorem pilot_chi5_eq : RiemannZeta.Pilot.chi5 = RiemannZeta.LFunction.chi5 := rfl` (expected `rfl`; the coder confirms by compiling; two `Fact (Nat.Prime 5)` instances in scope there are harmless). The CO's call where it lives.

## RZ-61c (rides RZ-58a)
- **Statement: unchanged.** `RiemannZeta.Bridge.rz_61c_weight_eq_two_L` stays frozen in `Bridge/Challenge.lean` under its V2 signature (statement_sha256 `97cd8d05…`); nothing in this spec reopens it. Its `chi5` is the binding definition's body verbatim, so U2's "candidate" docstring is now answered by RZ-58b.
- **Reduction to (a), E0:** from `LFunction chi5 1 = ↑x` with x = 2 log φ/√5: first conjunct `↑(4 log φ/√5) = 2·↑x` by `push_cast; ring`; second: x > 0 (`Real.log_pos` with `Real.one_lt_goldenRatio`, `Real.sqrt_pos`), so 2x ≠ x. The ≠ can also use `DirichletCharacter.LFunction_apply_one_ne_zero` (Nonvanishing.lean:406) with chi5 ≠ 1.
- **Where the proof lives — a decision for the CO.** Bridge/Solution imports `Mathlib` only. Options: (i) Bridge/Solution imports U10's Solution module (one import; changes the ruling for this unit); (ii) Bridge/Solution restates U10's leg-a development (self-contained, ≈ the whole leg-a proof duplicated); (iii) U10 states a copy of 61c and U2's frozen statement stays in `statements_not_checked`. Recommendation: (i), the smallest change that keeps one proof of one fact; (ii) if the ruling must hold.

## Cost table

| leg | reachable? | class | estimate | note |
|---|---|---|---|---|
| RZ-58a | YES — every step on pin objects (RZ-58 §5, A0–A8) | **E2** (ledger: E3, 15 pd) | 4–6 pd; band to 10 pd | real half A5–A8 (integral + FTC + golden algebra) ≈ 1.5–2 pd; L-function half A0–A4 (regroup by residue + Tannery + continuity) ≈ 2.5–4 pd |
| RZ-58b | YES | E1 | 0.5–1 pd | residue values by `decide` (U1 precedent); reciprocity one lemma; conductor by divisibility; uniqueness by values |
| RZ-58c | YES | E0–E1 | 0.25 pd | the RZ-61a bound halved, restated in-unit |
| RZ-61c | YES, given 58a | E0 | 0.1–0.25 pd + the CO's placement decision | statement frozen in U2 |

**Re-class note for the CO (FAN-OUT-PLAN-v1 §9 step 2 / §10 item 4).** The plan makes RZ-58 "the first E3 measurement" that re-scales the other four E3 rows. On this spec RZ-58 is an E2-shaped row (a real integral, a five-term character sum, Tannery), so its measurement is an E2 point, not an E3 one; the four remaining E3 rows (RZ-05, 09, 13, 14b) keep the ledger's figures with the ×2 band until one of them is measured. This is a proposal, not a re-grade; V₁ and the CO dispose it.

## Recommended build order (tonight, clean resumable at every step)
1. **U10 Challenge** — `fact_prime_five`, `chi5`, the five statements of RZ-58a/b/c with `sorry`; compile; statement hash. (E0)
2. **RZ-58b** (all three theorems) and **RZ-58c** — NOW rows; they close the χ5 unification as theorems and the numeral. (≈ 0.75–1.25 pd)
3. **`rz_61c_of_rz_58a`** — the conditional reduction, Solution-side helper: hypothesis `DirichletCharacter.LFunction chi5 1 = ((2 * Real.log goldenRatio / √5 : ℝ) : ℂ)` ⟹ RZ-61c's two conjuncts for U10's chi5. Lands tonight whatever (a)'s state; when (a) lands, 61c is one application. (E0)
4. **RZ-58a, real half first** — helper `HasSum (fun m : ℕ ↦ 1/(5m+1) − 1/(5m+2) − 1/(5m+3) + 1/(5m+4)) (2 log φ/√5)` (A5–A8): self-contained real analysis, independent of L-functions; a clean stopping point.
5. **RZ-58a, L-function half** — `DirichletCharacter.LFunction chi5 1 = ↑(∑' m, b_m)` (A0–A4); then (a) = step 4 + step 5.
6. **Link file** (chi5 equalities across U1/U2/U10) and the CO's placement of RZ-61c's proof.

If (a) does not land tonight, what a coder CAN land: steps 1–3 (b, c, the 61c reduction) and step 4 (the real series value), which leaves (a) exactly the A0–A4 L-function half.

## The one thing V₁ should look hardest at, per row
- **RZ-58a:** the reading of L(1, χ5) as `DirichletCharacter.LFunction chi5 1` and the two traps beside it (`LSeries chi5 1 = 0` and `∑' n, chi5 n / n = 0` at the pin — absolute-summability semantics); and whether the route A0–A8 really owes nothing the pin lacks (it is why the row moves from E3 to E2).
- **RZ-58b:** whether the Kronecker agreement through the defining values (J(5 | n) on odd n, χ₈(5) at 2, +1 at −1) is faithful to "the Kronecker symbol (5/⋅)" in the absence of a mathlib Kronecker object; "real" read literally as Im = 0; and the inclusion of uniqueness (printed "the unique").
- **RZ-58c:** the rounding reading [0.43035, 0.43045) (margins 5.9 × 10⁻⁵ / 4.1 × 10⁻⁵).
- **RZ-61c:** nothing in its statement; only the cross-unit chi5 equation and where its proof lives.

## Working files (scratch, `<scratchpad>/u10/`; a later stage may read them)
- `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/u10/rz-p23-25.txt` — the served pages 23–25 by `pdftotext -layout`.
- `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/u10/check_rz58.py` + `check_rz58.out` — the 40-digit value, the three independent formulas, the Kronecker/Legendre agreement on [−2000, 2000].
- `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/u10/namecheck.sh` — the sitting-71 name-check form as a script.

No git run, no web, no Lean compiled, nothing under the lab's non-public research trees read.

*Status:* SPEC-DRAFT 2026-10-28T20:36:31Z — V₁ appends its own line.

## CO decisions at M's return (2026-10-28T20:38:32Z, Orchestrator A)
1. **Namespace / module:** the unit builds as `RiemannZeta/LValue/` in namespace `RiemannZeta.LValue` (not `LFunction`, which collides with `DirichletCharacter.LFunction`); `DirichletCharacter.LFunction` is always written fully qualified.
2. **RZ-61c's proof:** stays frozen in U2's `Bridge/Challenge.lean`; `Bridge/Solution.lean` MAY `import RiemannZeta.LValue.Solution` (never a Challenge) and prove `rz_61c_weight_eq_two_L` from `LValue.rz_58a_LFunction_chi5_one`, with `Bridge.chi5 = LValue.chi5` by `rfl` (both restated byte-identically). Comparator's step 4 holds: every declaration in rz_61c's statement is Bridge's own. Then `rz_61c` returns to Bridge's `theorem_names` and leaves `statements_not_checked`.
3. **Cross-unit chi5:** no link file; the `rfl` inside the proof is the link.
4. **Re-class:** RZ-58 reads E2 (4–6 pd) on the finite-formula route; the ledger's E3 figure is noted as superseded by this measurement at the wall's read — the scope word unchanged (EFFORT lane, built tonight).
