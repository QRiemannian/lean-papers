# L:RZ-61c — the weight equals 2 · L(1, χ5), not L(1, χ5) — GATED on L:RZ-58 · NEEDS-DEVELOPMENT (χ5 and the closed form of L(1, χ5) absent at the pin)

## 1 · Header
- row: L:RZ-61c (split of L:RZ-61: the link "= 2 ⋅ 𝐿(1, 𝜒5)" of (9.7) and the sentence "the systolic geodesic spectral weight equals 2 ⋅ 𝐿(1, 𝜒5), not 𝐿(1, 𝜒5)". The ledger's v0.1 note on RZ-61 already says "the '= 2·L(1,χ₅)' step needs RZ-58".)
- unit: U2 (`RiemannZeta/Bridge`)
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: 2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54
- locus: §9.5, display (9.7) (last equality) and the sentence after display (9.8), PDF page p24 (printed folio 23); χ5's definition at §9.2 after display (9.4), PDF page p23 (printed folio 22).
- spec_clock: 2026-10-28T17:13:09Z

## 2 · Printed statement, verbatim (served edition, `pdftotext -layout`)
p24, (9.7):
> log 𝑁 / (𝑁 1/2 − 𝑁 −1/2) = log(𝜑4 ) / (𝜑2 − 𝜑−2) = 4 log 𝜑 / √5 = 2 ⋅ 𝐿(1, 𝜒5 ) ≈ 0.8608,  (9.7)

p24, after (9.8):
> The two quantities differ by exactly a factor of 2: the systolic geodesic spectral weight equals 2 ⋅ 𝐿(1, 𝜒5 ), not 𝐿(1, 𝜒5 ).

p23, §9.2 (the definition of χ5):
> where 𝜒5 is the Kronecker symbol (5/⋅), the unique real primitive Dirichlet character of conductor 5.

The sub-row's content: 4 log φ/√5 = 2 · L(1, χ5), and 4 log φ/√5 ≠ L(1, χ5).

## 3 · Formal reading
- **χ5 (convention named; NEEDS-DEVELOPMENT).** No conductor-5 character exists at the pin (`LEDGER-NAMES-v0.1-2026-10-28.md` §4b: 0 hits for χ₅ / `quadraticChar (ZMod 5)` / `DirichletCharacter … 5`). The print defines χ5 as the Kronecker symbol (5/·), the real primitive character of conductor 5. Candidate object from the pin's building blocks: `χ₅ : DirichletCharacter ℂ 5 := (quadraticChar (ZMod 5)).ringHomComp (Int.castRingHom ℂ)` — the Legendre symbol (·/5), which equals the Kronecker symbol (5/·) on all integers since 5 ≡ 1 (mod 4) (including n = 2: (5/2) = −1 = (2/5)). **The definition is shared with L:RZ-58 and is fixed in that row's spec; this sub-row must use the same object.** Precedents at the pin: `ZMod.χ₄`, `ZMod.χ₈` (LegendreSymbol/ZModChar.lean). Primitivity (`DirichletCharacter.IsPrimitive`) is part of the print's definition and is a property of the object, not a hypothesis of this statement.
- **L(1, χ5).** `DirichletCharacter.LFunction χ₅ 1 : ℂ` — mathlib's analytic continuation (a Hurwitz-zeta combination); for nontrivial χ it is the value of an entire function at s = 1, the standard meaning of L(1, χ). The weight is a real number cast to ℂ.
- **"= 2 ⋅ 𝐿(1, 𝜒5)".** ((4 log φ/√5 : ℝ) : ℂ) = 2 · LFunction χ₅ 1. Given L:RZ-58 (L(1, χ5) = 2 log φ/√5) this is one line of arithmetic; without it, it is the whole of L:RZ-58's difficulty.
- **"not 𝐿(1, 𝜒5)".** ((4 log φ/√5 : ℝ) : ℂ) ≠ LFunction χ₅ 1. Follows from the equality and L(1, χ5) ≠ 0 (`DirichletCharacter.LFunction_apply_one_ne_zero`, needs χ₅ ≠ 1), or from the closed form directly.
- **No hypotheses beyond the definition of χ₅; no domain issue** (s = 1 is a point of the entire continuation for χ₅ ≠ 1).

## 4 · Target mathlib declarations (pin db584cd6d46c92f209a44c0f1c829460d327499d; each found by `/usr/bin/grep -rn` under `.lake/packages/mathlib/Mathlib/`)
| declaration | kind | module (file:line) |
|---|---|---|
| `DirichletCharacter` | abbrev (MulChar (ZMod n) R) | Mathlib.NumberTheory.DirichletCharacter.Basic |
| `DirichletCharacter.LFunction` | def (:61) | Mathlib.NumberTheory.LSeries.DirichletContinuation |
| `DirichletCharacter.LFunction_eq_LSeries` | lemma (:75) — for 1 < re s | Mathlib.NumberTheory.LSeries.DirichletContinuation |
| `DirichletCharacter.LFunction_apply_one_ne_zero` | theorem (Nonvanishing.lean:406) — `χ ≠ 1 → LFunction χ 1 ≠ 0` | Mathlib.NumberTheory.LSeries.Nonvanishing |
| `DirichletCharacter.IsPrimitive` | def (:292) | Mathlib.NumberTheory.DirichletCharacter.Basic |
| `quadraticChar` | def (:120) — `MulChar F ℤ` for a finite field F | Mathlib.NumberTheory.LegendreSymbol.QuadraticChar.Basic |
| `MulChar.ringHomComp` | def (:453) | Mathlib.NumberTheory.MulChar.Basic |
| `Int.castRingHom` | def (Int/Cast/Lemmas.lean:85) | Mathlib.Data.Int.Cast.Lemmas |
| `ZMod.χ₄`, `ZMod.χ₈` | defs (precedents) | Mathlib.NumberTheory.LegendreSymbol.ZModChar |
| `Real.goldenRatio`, `Real.log` | as L:RZ-61a | — |

**NEEDS-DEVELOPMENT, gaps named:** (1) **χ5** — no object at the pin; to be defined (candidate above), shared with L:RZ-58. (2) **L(1, χ5) = 2 log φ/√5** — mathlib carries non-vanishing at s = 1 only, never a closed value for any specific character (`LEDGER-NAMES` §4b); this is L:RZ-58 (E3, standalone finite-formula route per FAN-OUT-PLAN-v1 §9 step 2). This sub-row is **GATED on L:RZ-58**: it enters the build after L:RZ-58's statement is signed, and its proof is then E0.

## 5 · Intended Lean statement
**Prose.** Let χ5 be the real primitive Dirichlet character of conductor 5 (the Kronecker symbol (5/·)), as fixed in L:RZ-58. Then 4 log φ/√5 = 2 · L(1, χ5), and 4 log φ/√5 ≠ L(1, χ5).

**Proposed signature** (χ₅ named as L:RZ-58 will export it; shown with the candidate definition so the statement is self-contained for V₁):
```lean
/-- Candidate; the binding definition is L:RZ-58's. -/
noncomputable def χ₅ : DirichletCharacter ℂ 5 :=
  (quadraticChar (ZMod 5)).ringHomComp (Int.castRingHom ℂ)

open Real in
theorem rz_61c_weight_eq_two_L :
    ((4 * Real.log goldenRatio / √5 : ℝ) : ℂ) = 2 * DirichletCharacter.LFunction χ₅ 1 ∧
    ((4 * Real.log goldenRatio / √5 : ℝ) : ℂ) ≠ DirichletCharacter.LFunction χ₅ 1 := by
  sorry
```
(`ZMod 5` needs `Fact (Nat.Prime 5)` for its field instance; there is no global such instance at the pin — `Cyclotomic/PID.lean:49` builds one locally from `Nat.prime_five` — so L supplies a local instance the same way.)

## 6 · What the row does not claim
- The closed form L(1, χ5) = 2 log φ/√5 ((9.5), (9.8), (9.9)) — L:RZ-58. Not stated here; used as the gate.
- The Dedekind factorisation ζ_{ℚ(√5)} = ζ · L(s, χ5) (9.4) — L:RZ-57 (outside Q5 except by the wall's word). Not claimed.
- "the unique real primitive Dirichlet character of conductor 5" — uniqueness is part of the print's definition of χ5; this sub-row neither states nor needs it (a uniqueness lemma, if wanted, belongs with L:RZ-58's definition).
- "Selberg spectral weight" (name from the trace formula, L:RZ-52); the factor-of-two's meaning ("the unit index", RZ-62(c), OUT-OF-Q5); the d = 12 instance (RZ-62(b), OUT-OF-Q5). Not claimed.
- The two-√5-slots warning and the (i)→(ii) [I] grading — the paper's reading. Not claimed.

## 7 · Status
SPEC-DRAFT 2026-10-28T17:13:09Z — GATED on L:RZ-58; NEEDS-DEVELOPMENT (χ5; closed form of L(1, χ5)).

V1: V1-GREEN 2026-10-28T17:18:56Z · V1-SPLIT-OK — faithful to (9.7)'s last link "= 2 ⋅ 𝐿(1, 𝜒5)" and to "the systolic geodesic spectral weight equals 2 ⋅ 𝐿(1, 𝜒5), not 𝐿(1, 𝜒5)" (p24), with χ5 per §9.2 p23 ("the Kronecker symbol (5/⋅), the unique real primitive Dirichlet character of conductor 5"). χ5 candidate checked: `quadraticChar (ZMod 5)` composed into ℂ is the Legendre symbol (·/5), which agrees with the Kronecker symbol (5/·) on every integer (5 ≡ 1 mod 4; (5/2) = −1 = (2/5); (5/−1) = +1 = (−1/5)) — the same character, real, primitive of conductor 5; the binding definition must be L:RZ-58's (correctly stated). L(1, χ5) as `DirichletCharacter.LFunction χ₅ 1` (the continuation at s = 1, the standard meaning for nontrivial χ) — convention confirmed. Equality + inequality is exactly "equals …, not …"; printed values true (0.8608 = 2 × 0.4304). GATED on L:RZ-58 and NEEDS-DEVELOPMENT (χ5; closed form) — agreed. Labelling note: the "≠" conjunct and the "equals 2 ⋅ 𝐿(1, 𝜒5)" sentence sit in the §9.5 text after (9.8) (the ledger's RZ-62 region), not in L:RZ-61's quote; harmless (the ≠ follows from the = and L(1, χ5) ≠ 0), but c is RZ-61's last link PLUS one RZ-62 sentence, and should be labelled so.

V2: V2-GREEN 2026-10-28T17:27:17Z (GATED on L:RZ-58) — "= 2·L(1, χ5)" (9.7) and "equals 2·L(1, χ5), not L(1, χ5)" (p24), χ5 per §9.2 p23: `chi5 = (quadraticChar (ZMod 5)).ringHomComp (Int.castRingHom ℂ)` : `DirichletCharacter ℂ 5` is the Legendre symbol (·/5), equal to the Kronecker symbol (5/·) on n = 1..199 (checked here) and by reciprocity on all n — the real primitive character of conductor 5; L(1, χ5) = `LFunction chi5 1`, the continuation's value at s = 1 for χ ≠ 1 (the series value); both conjuncts true (L(1, χ5) = 2 log φ/√5 = 0.43040894…, weight = 2× that, ≠ since L(1, χ5) ≠ 0). `fact_prime_five` is a proved instance, not a hypothesis. chi5 remains the candidate; the binding definition is L:RZ-58's, and a change there re-opens this statement.

V3: V3-CLEAN 2026-10-28T21:19:16Z — post-proof fidelity, fresh seat: `RiemannZeta.Bridge.rz_61c_weight_eq_two_L` proved from `RiemannZeta.LValue.rz_58a_LFunction_chi5_one` (Bridge.chi5 ≡ LValue.chi5 definitionally, byte-identical bodies); `=` by arithmetic, `≠` because L(1, χ₅) = 2 log φ/√5 > 0 — the genuine non-vanishing, no junk value; the statement names Bridge.chi5 only (pp.fullNames). The ruled import Bridge.Solution → LValue.Solution is acyclic and adds no statement-level dependence. Axioms propext · Classical.choice · Quot.sound. Full note: `specs/_V3-U10.md`.
