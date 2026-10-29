# L:RZ-76a — the arithmetic of §12.2–12.3: 7/8 = 1 − 1/8 (12.2); Path A (1/4 − 1/2)·π/2 = −π/8, −1/8 after dividing by π (12.3); Path B (1/2)(−1/2)/2 = −1/8 (12.5); Path C +1/(4·2·sin(π/2)) = +1/8 (12.6)

## 1 · Header
- row: `L:RZ-76a` (split from `L:RZ-76` as the brief directs; sibling `L:RZ-76b` — the roles of the three paths — NOT A LEAN TARGET). This sub-row keeps the ledger figure (E0, 0.5 pd).
- unit: U7 `RiemannZeta/SmallArith`
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
- locus: §12.2 "Decomposition of 7/8", display (12.2); §12.3 "Three appearances of 1/8", displays (12.3), (12.4), (12.5), (12.6) — served PDF page p29 (printed folio 28).
- spec_clock: 2026-10-28T17:25:00Z
- **CHANGED in the republish** (re-key change column; REKEY §"The four stale rows"): Path C is now **+**1/(4·2·sin(π/2)) = **+**1/8 (was −1/8 in the v0.1 pointer), its role is now "the constant term of the Weyl law of X(1)"; the §12.3 heading is "Three appearances of 1/8" (was "Three derivations"); Path B gains "This is a coincidence of value, not a derivation"; "Three paths, one number — structure, not coincidence." is no longer printed. This spec is written from the served text only.

## 2 · Printed statement, verbatim
Served p29, `pdftotext -layout`, mathematical-italic letters written plain; displays linearised:

> The constant decomposes as
>
> 7/8 = 1 − 1/8,        (12.2)

> Path A — Stirling approximation. … The cross-term Re(z − 1/2) × Im(log z) evaluated at z = 1/4 + iT/2 gives
>
> (1/4 − 1/2) × π/2 = −π/8,        (12.3)
>
> yielding −1/8 after dividing by π.

> Path B — the ξ-function prefactor. The completed zeta function
>
> ξ(s) = ½ s(s − 1) π^{−s/2} Γ(s/2) ζ(s)        (12.4)
>
> contains the prefactor s(s − 1)/2, which at s = 1/2 evaluates to
>
> (1/2)(−1/2)/2 = −1/8.        (12.5)

> Path C — Selberg trace formula. The order-2 orbifold point at z = i contributes
>
> + 1/(4 · 2 · sin(π/2)) = + 1/8        (12.6)
>
> to the constant term of the Weyl law of X(1).

Taken here: the equalities of the five displays as equalities of numbers, and (12.4) only as the definition that names the prefactor. Everything else in §12.2–12.3 (where the 1 and the 1/8 "come from", the cross-term "evaluated at z = 1/4 + iT/2", "coincidence of value, not a derivation", "contributes … to the constant term of the Weyl law of X(1)", the closing paragraph) is `L:RZ-76b`.

## 3 · Formal reading
- **(12.2)** over ℚ: 7/8 = 1 − 1/8.
- **(12.3)** over ℝ, π = `Real.pi`: (1/4 − 1/2)·(π/2) = −π/8; and "yielding −1/8 after dividing by π": (−π/8)/π = −1/8 (needs π ≠ 0, `Real.pi_ne_zero`).
- **(12.4)–(12.5).** ξ is the paper's completed zeta function; in Lean it is the local definition `riemannXiRZ s := s * (s - 1) / 2 * completedRiemannZeta s` already proposed in `L:RZ-46a` (one definition for the build; L places it once). The paper's Λ factor π^{−s/2}Γ(s/2)ζ(s) is mathlib's `completedRiemannZeta` off s = 0 (`riemannZeta_def_of_ne_zero`, `Complex.Gammaℝ_def`), as `L:RZ-46a` (o) states — not restated here. "Contains the prefactor s(s − 1)/2" is then definitional. The claim of (12.5): the prefactor, as the complex polynomial s ↦ s(s − 1)/2, at s = 1/2 equals −1/8 (and the printed middle term (1/2)(−1/2)/2 is that value).
- **(12.6)** over ℝ: 1/(4·2·sin(π/2)) = 1/8, with `Real.sin` and `Real.sin_pi_div_two`. The sign is the print's "+".
- "Three mathematical paths yield 1/8": the three values are −1/8, −1/8, +1/8; "yield 1/8" is read as "of size 1/8", the print's own phrase for Path C. The spec states the three signed values and adds nothing about sizes.

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`; each found by `/usr/bin/grep -rn` over `.lake/packages/mathlib/Mathlib/`)
| name | kind (file:line) | module |
|---|---|---|
| `Real.pi` | protected def (Trigonometric/Basic.lean:127; notation `π` under `open Real`) | Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic |
| `Real.pi_ne_zero`, `Real.pi_pos` | theorems (Trigonometric/Basic.lean:165, :157) | Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic |
| `Real.sin` | def (Analysis/Complex/Trigonometric.lean:74) | Mathlib.Analysis.Complex.Trigonometric |
| `Real.sin_pi_div_two` | theorem (Trigonometric/Basic.lean:437, namespace Real) — `sin (π / 2) = 1` | Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic |
| `completedRiemannZeta` | def (NumberTheory/LSeries/RiemannZeta.lean:68) — used only inside the shared def `riemannXiRZ` | Mathlib.NumberTheory.LSeries.RiemannZeta |
| `riemannZeta_def_of_ne_zero` | lemma (RiemannZeta.lean:154) — convention link, as in `L:RZ-46a` | Mathlib.NumberTheory.LSeries.RiemannZeta |
| `Complex.Gammaℝ`, `Complex.Gammaℝ_def` | def (Analysis/SpecialFunctions/Gamma/Deligne.lean:43), lemma (:45) — convention link | Mathlib.Analysis.SpecialFunctions.Gamma.Deligne |

No name in this spec is absent at the pin. (`riemannXi` / ξ does not exist in mathlib; `L:RZ-46a` supplies `riemannXiRZ`.)

## 5 · Intended Lean statement
**Prose.** 7/8 = 1 − 1/8; (1/4 − 1/2)·(π/2) = −π/8 and (−π/8)/π = −1/8; the ξ-prefactor s(s − 1)/2 at s = 1/2 is (1/2)(−1/2)/2 = −1/8; 1/(4·2·sin(π/2)) = 1/8.

**Proposed signature** (shape only; `open Real`):
```lean
/-- L:RZ-76a · RZ §12.2–12.3, (12.2)–(12.6), served p29: the arithmetic of the decomposition
7/8 = 1 − 1/8 and of the three appearances of 1/8 (Path A −π/8 → −1/8, Path B −1/8,
Path C +1/8). The prefactor in Path B is that of `riemannXiRZ` (L:RZ-46a). -/
theorem rz_76a_seven_eighths_arith :
    (7 / 8 : ℚ) = 1 - 1 / 8 ∧
    ((1 / 4 - 1 / 2) * (π / 2) = -π / 8 ∧ (-π / 8) / π = -1 / 8) ∧
    ((fun s : ℂ => s * (s - 1) / 2) (1 / 2) = (1 / 2) * (-1 / 2) / 2 ∧
       (1 / 2 : ℂ) * (-1 / 2) / 2 = -1 / 8) ∧
    1 / (4 * 2 * Real.sin (π / 2)) = 1 / 8 := by
  sorry
```

## 6 · What the row does not claim
- Not that the 1 of (12.2) "comes from the pole of ζ(s) at s = 1 (… the winding number of the single simple pole)", nor that the 1/8 "is the genuine Maslov phase correction [CV]".
- Not that the cross-term Re(z − 1/2)·Im(log z) at z = 1/4 + iT/2 equals (1/4 − 1/2)·π/2 (it does so only in the limit T → ∞; see `L:RZ-76b`), nor anything about arg Γ(s/2) or Stirling.
- Not that ξ's prefactor enters N(T) in any way ("only through its argument change along the contour").
- Not that the order-2 point at z = i contributes +1/8 to the constant term of the Weyl law of X(1) (Selberg trace formula; not in mathlib).
- Not any relation among the three paths ("its relation to Path A is not shown here [I]").
All of these are `L:RZ-76b`.

## 7 · Status line
- `SPEC-DRAFT 2026-10-28T17:25:00Z`
- V1: V1-SPLIT-OK + V1-GREEN 2026-10-28T17:32:07Z — served p29 displays read and matched one by one: (12.2) 7/8 = 1 − 1/8; (12.3) (1/4 − 1/2) × π/2 = −π/8, "−1/8 after dividing by π"; (12.5) (1/2)(−1/2)/2 = −1/8 for the prefactor s(s − 1)/2 of (12.4), the same prefactor as `riemannXiRZ` (s * (s - 1) / 2); (12.6) SERVED SIGN CONFIRMED "+": the print reads "+ 1/(4 · 2 · sin(π/2)) = + 1/8" (the ledger's v0.1 −1/8 is stale); the spec's signed values (−1/8, −1/8, +1/8) under "three paths yield 1/8" read as "of size 1/8", the print's own phrase — faithful, adds nothing. This seat did not adjudicate the Selberg normalisation of the elliptic term (76b's role, not a target; no web).
- V2: V2-GREEN 2026-10-28T17:44:42Z — read served p29 §12.2–§12.3 displays (12.2)–(12.6). `rz_76a_seven_eighths_arith`: (12.2) 7/8 = 1 − 1/8 in ℚ; (12.3) (1/4 − 1/2)·(π/2) = −π/8 and "−1/8 after dividing by π" in ℝ, π = `Real.pi` via `open Real in`; (12.5) the prefactor s(s − 1)/2 of (12.4) as the polynomial on ℂ at s = 1/2: (1/2)(−1/2)/2 = −1/8, token-equal to the first factor of `riemannXiRZ`'s body; (12.6) 1/(4·2·sin(π/2)) = 1/8 with the SERVED "+" sign. Signed values −1/8, −1/8, +1/8 as printed; "yield 1/8" adds nothing; the Stirling / ξ / Selberg roles, z = 1/4 + iT/2 and every [I]/coincidence sentence stay in L:RZ-76b. RULING on the unused local `riemannXiRZ`: it STAYS — inert (no theorem uses it; a def with a body adds no hypothesis and no axiom), body byte-equal to U3's `RiemannZeta/ZetaL/Challenge.lean:42`, it makes the docstring's "the prefactor in Path B is that of riemannXiRZ" checkable by the reader, and its {0, 1} deviation from the entire ξ is declared in its own docstring and touches no statement here (Path B is evaluated at 1/2).
