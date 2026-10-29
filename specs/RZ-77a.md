# L:RZ-77a — the arithmetic of §12.4: σ(1 − σ)/2 at σ = 1/2 is 1/8 (12.7); λ = s(1 − s) at s = 1/2 is 1/4, λ/2 = 1/8 (12.8)–(12.9); the table's Maslov column; σ(1 − σ)/2 is maximized at σ = 1/2 [E]

## 1 · Header
- row: `L:RZ-77a` (split from `L:RZ-77`; sibling `L:RZ-77b` — the Casimir eigenvalue s(1 − s) on the principal series of SL(2, ℝ) — OUT-OF-Q5 (pending the wall)). This sub-row keeps the ledger figure (E0, 0.25 pd).
- unit: U7 `RiemannZeta/SmallArith`
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
- locus: §12.4 "The Casimir connection", displays (12.7), (12.8), (12.9), the spin/Maslov table, and the sentence after the table — served PDF page p30 (printed folio 29). Re-key: (12.7) page p29 → p30.
- spec_clock: 2026-10-28T17:26:29Z
- **REWORDED in the republish** (re-key change column): "maximized at σ = 1/2 [E]"; the former "topological phase correction is largest [CV]" clause now reads "reading it as a topological phase is part of the [I] reading above". This spec is written from the served text only.

## 2 · Printed statement, verbatim
Served p30, `pdftotext -layout`, mathematical-italic letters written plain; displays linearised:

> The expression
>
> σ(1 − σ)/2        (12.7)
>
> evaluated at σ = σ_c = 1/2 gives 1/8. This is half the Casimir eigenvalue of SL(2, ℝ): the Casimir operator C has eigenvalue
>
> λ = s(1 − s)        (12.8)
>
> on the principal-series representation with parameter s. At s = 1/2:
>
> λ = 1/4,   λ/2 = 1/8.        (12.9)

> We read the formula Maslov(σ) = σ(1 − σ)/2 as a spin-statistics-like phase [I]:
>
> | Spin σ | Maslov | Character |
> |---|---|---|
> | 0 | 0 | Bosonic — no correction |
> | 1/2 | 1/8 | Fermionic reading [I] — Riemann zeros at the σ = 1/2 axis |
> | 1 | 0 | Bosonic — no correction |

> The function σ(1 − σ)/2 is maximized at σ = 1/2 [E]; reading it as a topological phase is part of the [I] reading above.

Taken here: the numbers of (12.7) and (12.9) with λ the expression s(1 − s) of (12.8); "half": (12.7) = λ/2 as functions; the Spin/Maslov columns of the table as values of σ(1 − σ)/2; "maximized at σ = 1/2 [E]". Not taken: that s(1 − s) is the Casimir eigenvalue on the principal series (`L:RZ-77b`); the Character column and every [I] reading.

## 3 · Formal reading
- σ and s are real numbers here (σ_c = 1/2 is the critical-line abscissa; the table's spins 0, 1/2, 1 are real). The functions: M(σ) := σ(1 − σ)/2 (the print's "Maslov(σ)"), λ(s) := s(1 − s).
- **(12.7)**: M(1/2) = 1/8.
- **"This is half the Casimir eigenvalue"** — arithmetic part only: M(σ) = λ(σ)/2 for every σ. (That λ(s) is the Casimir eigenvalue is 77b.)
- **(12.9)**: λ(1/2) = 1/4 and λ(1/2)/2 = 1/8.
- **Table (Spin, Maslov columns)**: M(0) = 0, M(1/2) = 1/8, M(1) = 0.
- **"maximized at σ = 1/2 [E]"**: M attains its maximum over ℝ at 1/2, i.e. `IsMaxOn M Set.univ (1/2)` (∀ σ, M σ ≤ M (1/2)). Uniqueness of the maximizer is not printed and not stated.

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`; each found by `/usr/bin/grep -rn` over `.lake/packages/mathlib/Mathlib/`)
| name | kind (file:line) | module |
|---|---|---|
| `IsMaxOn` | def (Order/Filter/Extr.lean:114) | Mathlib.Order.Filter.Extr |
| `isMaxOn_iff` | theorem (:130) — `IsMaxOn f s a ↔ ∀ x ∈ s, f x ≤ f a` | Mathlib.Order.Filter.Extr |
| `Set.univ` | def (Data/Set/Defs.lean:215) | Mathlib.Data.Set.Defs |
| tactics `norm_num`, `nlinarith` (M(1/2) − M(σ) = (σ − 1/2)²/2 ≥ 0) | — | Mathlib.Tactic |

No name in this spec is absent at the pin.

## 5 · Intended Lean statement
**Prose.** With M(σ) = σ(1 − σ)/2 and λ(s) = s(1 − s) on ℝ: M(1/2) = 1/8; M = λ/2; λ(1/2) = 1/4 and λ(1/2)/2 = 1/8; M(0) = 0, M(1) = 0; M attains its maximum over ℝ at 1/2.

**Proposed signature** (shape only):
```lean
/-- L:RZ-77a · RZ §12.4, (12.7)–(12.9) and the table, served p30: σ(1 − σ)/2 at 1/2 is 1/8, it is
half of s(1 − s), whose value at 1/2 is 1/4; the table's Maslov values 0, 1/8, 0 at σ = 0, 1/2, 1;
and σ(1 − σ)/2 is maximized at σ = 1/2. -/
theorem rz_77a_casimir_arith :
    let M : ℝ → ℝ := fun σ => σ * (1 - σ) / 2
    let lam : ℝ → ℝ := fun s => s * (1 - s)
    M (1 / 2) = 1 / 8 ∧
    (∀ σ, M σ = lam σ / 2) ∧
    (lam (1 / 2) = 1 / 4 ∧ lam (1 / 2) / 2 = 1 / 8) ∧
    (M 0 = 0 ∧ M 1 = 0) ∧
    IsMaxOn M Set.univ (1 / 2) := by
  sorry
```

## 6 · What the row does not claim
- Not that s(1 − s) is the eigenvalue of the Casimir operator of SL(2, ℝ) on the principal series with parameter s — `L:RZ-77b`, OUT-OF-Q5.
- Not the spin-statistics, bosonic/fermionic or "Riemann zeros at the σ = 1/2 axis" readings (the Character column, [I]).
- Not "reading it as a topological phase" ([I]), nor §12.5's chain "Casimir eigenvalue 1/4 → Maslov = 1/8 → counting-function offset 7/8" (the 1/4 → 1/8 step is printed as "this paper's reading [I] — an equality of numbers, not a derivation").
- Not uniqueness of the maximizer.

## 7 · Status line
- `SPEC-DRAFT 2026-10-28T17:26:29Z`
- V1: V1-SPLIT-OK + V1-GREEN 2026-10-28T17:32:07Z — served p30: (12.7) σ(1 − σ)/2 at 1/2 = 1/8, "half" = M = λ/2 (arithmetic part only), (12.9) λ = 1/4, λ/2 = 1/8; the table's Maslov column (0, 1/8, 0 at σ = 0, 1/2, 1) is printed numbers of the same printed function on the same page, so including it is not stronger (the ledger's "(12.7)–(12.9)" pointer is a pointer, not a scope bound); "maximized at σ = 1/2 [E]" as IsMaxOn on ℝ (the function's natural domain; 1/8 − M = (2σ − 1)²/8) with uniqueness rightly not stated; σ real confirmed (σ_c is an abscissa, the spins are real).
- V2: V2-GREEN 2026-10-28T17:44:42Z — read served p30 §12.4 (12.7)–(12.9), the Spin/Maslov table and the sentence after it. `rz_77a_casimir_arith` over ℝ with M(σ) = σ(1 − σ)/2, λ(s) = s(1 − s): M(1/2) = 1/8 (12.7); M = λ/2 pointwise = the arithmetic of "half the Casimir eigenvalue" (that λ is the Casimir eigenvalue is L:RZ-77b); λ(1/2) = 1/4, λ(1/2)/2 = 1/8 (12.9); the Maslov column 0, 1/8, 0 at σ = 0, 1/2, 1; "maximized at σ = 1/2 [E]" as `IsMaxOn M Set.univ (1/2)` — the print names no domain, ℝ is the literal reading and it is true (M(1/2) − M(σ) = (σ − 1/2)²/2, recomputed); uniqueness not printed, not stated. No Character column, no [I] reading.
