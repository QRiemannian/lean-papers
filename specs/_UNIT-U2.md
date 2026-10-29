# UNIT U2 — `RiemannZeta/Bridge` (the §9.5 bridge's NOW rows) — seat M summary

- unit: U2 · seat: M (statement author), dispatched by Orchestrator A, brief `Chat-Design/cc-handoff/projects/reputation-play/lean-scoping/seats/M-U2-2026-10-28.md`
- paper: RZ, served edition sha256 2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54 (digest re-read with `shasum -a 256` at the seat's start, 2026-10-28T17:00Z; matches)
- mathlib pin: db584cd6d46c92f209a44c0f1c829460d327499d (`lake-manifest.json`, mathlib `rev`)
- pages read from the served PDF by `pdftotext -layout`: p07, p08, p23, p24, p25 (PDF index; folio = page − 1)
- summary_clock: 2026-10-28T17:14:25Z

## Rows specced (7 spec files for 5 ledger rows)

| spec | ledger row | locus (served) | status | split / gate |
|---|---|---|---|---|
| `specs/RZ-03.md` | L:RZ-03 | §2.2, sentences before (2.1), p07 | SPEC-DRAFT | — |
| `specs/RZ-04.md` | L:RZ-04 | (2.1) + parenthesis, p07; (9.1)–(9.3) + sentence, p23 | SPEC-DRAFT | — |
| `specs/RZ-06a.md` | L:RZ-06a | (2.3), p07 | SPEC-DRAFT | the ledger's own a/b split stands; RZ-06b (systole) is not this unit's NOW leg |
| `specs/RZ-12.md` | L:RZ-12 | (2.7), p08 | SPEC-DRAFT | — |
| `specs/RZ-61a.md` | L:RZ-61 → a | (9.7) chain to 4 log φ/√5, ≈ 0.8608, p24 | SPEC-DRAFT | **SPLIT** (NOW) |
| `specs/RZ-61b.md` | L:RZ-61 → b (= ledger's RZ-62(a)) | §9.5 sentences after (9.8), "the 2 being log ε₊/log ε", p24 | SPEC-DRAFT | **SPLIT** (NOW, E1) |
| `specs/RZ-61c.md` | L:RZ-61 → c | (9.7) last link "= 2·L(1, χ5)" + "equals 2·L(1, χ5), not L(1, χ5)", p24; χ5 defined §9.2, p23 | SPEC-DRAFT, **GATED on L:RZ-58**, **NEEDS-DEVELOPMENT** | **SPLIT** (in Q5's scope through RZ-58; not NOW) |

**The split of L:RZ-61, for V₁'s sign-off.** (9.7) prints one chain whose last link is the L-value. **a** = the real-number chain log N/(N^{1/2} − N^{−1/2}) = log(φ⁴)/(φ² − φ⁻²) = 4 log φ/√5 with N = λ² = φ⁴, and the numeral 0.8608 (correct rounding) — NOW. **b** = the factor-of-two sentence at d = 5 as arithmetic: log N = 2 log ε₊ = 4 log φ = 4R, log ε₊/log ε = 2, and 4R/√5 = (log ε₊/log ε)·(2R/√5) against the class-number formula's printed right-hand side — NOW, carries the ledger's proposed RZ-62(a) as the brief directs. **c** = "= 2·L(1, χ5)" and "not L(1, χ5)" — gated on L:RZ-58's closed form; its proof is E0 once RZ-58 lands. The ledger's 0.5 pd for RZ-61 belongs to a + b; c rides RZ-58's figure.

## CC-CANDIDATE rows
**None.** Every printed statement in the unit read true at the served edition under its stated reading. The one reading-dependent point: RZ-03's "the smallest available trace is t = 3" is false if "smallest" is read on the signed trace (traces of hyperbolic elements are unbounded below, −g being hyperbolic); the sentence's own premise "|t| > 2" fixes the absolute-value reading, which is true. Not a CC-candidate; V₁ to confirm the reading.

## OUT-OF-Q5, named and not specced (the print does not force their split from the rows above)
- **RZ-62(b)** — the d = 12 instance: "for 𝑑 = 12, 𝜀 = 2 + √3, the weight equals 𝐿(1, 𝜒12)" (p24). OUT-OF-Q5 (pending the wall).
- **RZ-62(c)** — the general unit-index statement: "The factor is the unit index and carries no further structure [CV]" and "Where the fundamental unit has norm +1 the factor is 1" (p24). OUT-OF-Q5 (pending the wall).
Both are listed in RZ-61b's and RZ-61c's §6.

## Mathlib names not found at the pin
- **None of the ledger-cited names for this unit is missing.** All of `Matrix.GeneralLinearGroup.IsHyperbolic`, `Matrix.charpoly_fin_two`, `Real.goldenRatio_sq`, `Real.goldenRatio_mul_goldenConj`, `Real.inv_goldenRatio`, `Real.goldenRatio_sub_goldenConj`, `Real.log`, `Real.goldenRatio` exist.
- **Not an object at the pin (NEEDS-DEVELOPMENT, RZ-61c):** χ5 (no conductor-5 character; candidate `(quadraticChar (ZMod 5)).ringHomComp (Int.castRingHom ℂ)`, shared with and fixed by L:RZ-58), and any closed value of `DirichletCharacter.LFunction` at s = 1 (L:RZ-58). Also no global `Fact (Nat.Prime 5)` instance (local instance from `Nat.prime_five`, as `Cyclotomic/PID.lean:49` does).
- **No lemma pairs `Real.log` with `goldenRatio`** (grep over all of Mathlib: none). RZ-06a's and RZ-61a's numerals are built from `Real.exp_bound`/`exp_bound'` and `Real.lt_sqrt`/`Real.sqrt_lt'`.
- **Method note for the brief's grep form.** `theorem <name>\|lemma <name>\|def <name>` does not match an `abbrev` (`Matrix.GeneralLinearGroup.IsHyperbolic` and `Real.goldenRatio` are `abbrev`s at the pin), and fully-qualified names never appear on declaration lines (declarations are written short inside `namespace` blocks). Every name here was grepped by its short form with `abbrev` added, and its namespace read from the file's `namespace`/`end` lines; file:line is recorded in each spec.

## Declarations each row targets (full tables, file:line, in each spec's §4)
- **RZ-03:** `Matrix.SpecialLinearGroup`, `Matrix.SpecialLinearGroup.det_coe`, `Matrix.IsHyperbolic` (def, `0 < m.discr`), `Matrix.GeneralLinearGroup.IsHyperbolic` (abbrev), `Matrix.SpecialLinearGroup.toGL`, `Matrix.isHyperbolic_neg_iff`, `Matrix.discr`, `Matrix.discr_fin_two`, `Matrix.trace_fin_two`, `Matrix.det_fin_two`, `IsLeast`.
- **RZ-04:** `Matrix.det_fin_two_of`, `Matrix.charpoly`, `Matrix.charpoly_fin_two`, `Matrix.charpoly_map`, `Matrix.mem_spectrum_iff_isRoot_charpoly`, `Module.End.hasEigenvalue_iff_isRoot_charpoly`, `spectrum`, `Real.goldenRatio`, `Real.goldenRatio_sq`, `Real.goldenRatio_mul_goldenConj`, `Real.inv_goldenRatio`, `Real.goldenRatio_ne_zero`, `Real.goldenRatio_add_goldenConj`, `Real.goldenRatio_sub_goldenConj`.
- **RZ-06a:** `Real.goldenRatio`, `Real.log`, `Real.log_pow`, `Real.log_lt_log`, `Real.log_le_log`, `Real.exp_log`, `Real.log_exp`, `Real.exp_bound`, `Real.exp_bound'`, `Real.add_one_le_exp`, `Real.exp_one_gt_d9`/`exp_one_lt_d9` (precedent), `Real.one_lt_goldenRatio`, `Real.goldenRatio_pos`, `Real.sqrt_lt'`, `Real.lt_sqrt`.
- **RZ-12:** `Matrix.trace`, `Matrix.trace_fin_two`, `Matrix.trace_fin_two_of`, the `!![…]` notation (Mathlib.LinearAlgebra.Matrix.Notation); reference only: `Matrix.discr`, `Matrix.discr_fin_two`.
- **RZ-61a:** `Real.goldenRatio`, `Real.goldenRatio_sub_goldenConj`, `Real.goldenRatio_add_goldenConj`, `Real.inv_goldenRatio`, `Real.goldenRatio_sq`/`_pos`/`_ne_zero`, `Real.log_pow`, `Real.rpow_natCast`, `Real.rpow_mul`, `Real.rpow_neg`, `Real.sqrt_eq_rpow`, `Real.sqrt_sq`, `zpow_neg`, `zpow_natCast`, plus RZ-06a's bound lemmas.
- **RZ-61b:** `Real.goldenRatio`, `Real.one_lt_goldenRatio`, `Real.log`, `Real.log_pow`, `Real.log_pos`; `NumberField.Units.regulator` named and deliberately not used.
- **RZ-61c:** `DirichletCharacter`, `DirichletCharacter.LFunction`, `DirichletCharacter.LFunction_eq_LSeries`, `DirichletCharacter.LFunction_apply_one_ne_zero`, `DirichletCharacter.IsPrimitive`, `quadraticChar`, `MulChar.ringHomComp`, `Int.castRingHom`; precedents `ZMod.χ₄`, `ZMod.χ₈`.

## The one thing V₁ should look hardest at, per row
- **RZ-03:** the reading of "the smallest available trace is t = 3" as `IsLeast` of |tr| over hyperbolic elements (absolute value, attainment included), and the row statement taken as the printed one-way implication "hyperbolic ⇒ |t| > 2" under mathlib's discriminant definition of hyperbolic (the converse offered only as a `Solution.lean` helper). Is either stronger or weaker than the print?
- **RZ-04:** "eigenvalues φ and −1/φ" carried as the set equality `spectrum ℝ M = {φ, −1/φ}` for the real matrix (no others, real eigenvalues) — and F² read as the printed (2 1; 1 1), with F ^ 2 = (2 1; 1 1) left to L:RZ-02 (U1). Check the spelling φ⁻² ↔ `(φ ^ 2)⁻¹` against both prints ((2.1) "φ⁻²", (9.3) "1/φ²").
- **RZ-06a:** the precision reading of "≈ 1.9248" as correct four-decimal rounding, [1.92475, 1.92485): true, but the upper margin is 2.7 × 10⁻⁶. Confirm the reading (vs the looser "|·| ≤ 10⁻⁴"), and that "systole(X(1)) =" is left wholly to L:RZ-06b.
- **RZ-12:** that the statement is the display as printed (tr² − 4, over ℤ, for the printed matrix) and does not also carry "the discriminant of ℚ(√5)" — and the overlap with L:RZ-02's "discriminant 5" (U1's spec takes `Polynomial.discr` of the charpoly; mathlib also has `Matrix.discr` = `charpoly.discr` with `Matrix.discr_fin_two` — one spelling across U1/U2 would be cleaner; CO's call).
- **RZ-61a:** the rpow reading of N^{1/2}, N^{−1/2} and the zpow reading of φ⁻²; and that the numeral 0.8608, printed after "= 2·L(1, χ5)", is attached to 4 log φ/√5 (legitimate only because the chain is of equalities).
- **RZ-61b:** whether replacing L(1, χ5) by the print's "2R/√5" in "4R/√5 = 2 L(1, χ5), the 2 being log ε₊/log ε" is a faithful NOW leg of the sentence or too thin to count — the arithmetic is trivial once the symbols are the printed numbers, and the number-field meanings (ε₊ generates the totally positive units; R is the regulator) are explicitly not claimed. This is the split's weakest point.
- **RZ-61c:** the χ5 object — the candidate is the Legendre symbol (·/5) composed into ℂ; the print says "the Kronecker symbol (5/·)". They agree on all integers (5 ≡ 1 mod 4), but the binding definition must be L:RZ-58's and identical here.

## Cross-references for CO
- L:RZ-60 (the identities φ² − φ⁻² = φ + 1/φ = √5, φ − 1/φ = 1; not in this unit's list) is used by RZ-61a as a proof step only.
- RZ-02 (U1, sibling seat's `specs/RZ-02.md`, read for alignment): takes F ^ 2 = (2 1; 1 1), det 1, trace 3, discriminant 5. RZ-03 (witness), RZ-04 (F² eigenvalues), RZ-12 (trace) rely on its matrix facts without restating them.
- RZ-61c enters the build after L:RZ-58's statement is signed; FAN-OUT-PLAN-v1 §9 step 2 orders RZ-03/04/06a/12 → RZ-61 → RZ-58.

No git run, no web, no Lean compiled, nothing under the lab's non-public research trees read.
