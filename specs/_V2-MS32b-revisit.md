# V₂ — statement fidelity, L:MS-32b revisit (unit U8, `ModularSurface/Now`) — the wall's word 3

- opened: 2026-10-28T22:36:55Z · own-words claim written: 2026-10-28T22:37:15Z (before any spec or Lean was opened) · signed: 2026-10-28T22:38:31Z · seat V₂ (fresh context; never M, never the prover, never V₁)
- dispatch: Orchestrator A, 2026-10-28; cause: the wall's word 3 ("one fresh M/V₂ pass re-freezes the statement on the δ route U9 found"); M ruled STANDS (`specs/MS-32b.md` § `## M revisit — 2026-10-28T22:33:11Z`)
- served PDF: `~/Claude/projects/qriemannian-site/public/pdfs/modular-surface-characterization.pdf`, sha256 `b4841489ec6bea619f8d5525ce4c788b86e0109e51d6e9d2cb252690f5b13af5` — match (22:36:55Z)
- pages read by `pdftotext -layout -f 12 -l 14` (cover = p01, folio = page − 1): §3.4 whole, from its heading on PDF p12 (folio 11) to its close on PDF p13 (folio 12), with the §4 opening on p13–p14 as the section's end marker. The sentence under review is on PDF p13 (folio 12).
- `ModularSurface/Now/Challenge.lean` sha256 at open (22:38Z read) and at signing (22:38:31Z): `648a9eecd38f30ab6be4905c53fee7d7f41e1fafb57930717037f44da308f2f2` (= `statement_sha256`, = `statement_sha256_draft`).
- `ModularSurface/Now/Solution.lean`: NOT opened (a prover is writing it beside this seat; directory listing only).

## 1 · Own-words claim (written before the spec and the Lean)

Family: every real quadratic number field K (degree 2 over ℚ, totally real), d_K its positive field discriminant. Quantity: g(K) = 1/(π√d_K), a function of d_K alone ("written form-independently"). Claim: g has a maximum over that family and it is attained at d_K = 5 — (attainment) some real quadratic K has d_K = 5; (bound) every real quadratic K has g(K) ≤ g(5), equivalently d_K ≥ 5. The printed ground is the [CV] premise "ℚ(√5) has the smallest discriminant of any real quadratic field", then "Hence". Uniqueness is not printed as a clause; the strict drop to the next rung (√(5/8) − 1, [D]) is a separate sentence (L:MS-32a). At the paper's strength the statement must carry bound and attainment, nothing stricter.

## 2 · The one-theorem table

| theorem | load-bearing clauses | verdict | note |
|---|---|---|---|
| `ms_32b_certificate_max_fields` (Challenge.lean:253–263 — docstring 253–257, theorem 258–263) | (i) ∀ K : Type, `Field`, `NumberField`, `IsTotallyReal`, `finrank ℚ K = 2` → `ms32Gc ↑(discr K) ≤ ms32Gc 5`; (ii) ∃ K : Type with the same three structures, `finrank ℚ K = 2 ∧ discr K = 5` | FAITHFUL | (i) is the bound over "the whole real-quadratic family" (totally real ∧ degree 2 = real quadratic); (ii) is "attains … at d_K = 5". Together: a maximum, attained, of value g(5). No strict inequality, no uniqueness — neither stronger nor weaker than the print. That the witness is ℚ(√5) belongs to the [CV] premise (L:RZ-13), not to the "Hence" clause. `Type` covers the family up to isomorphism (every number field has a copy in `Type`; `discr` is an isomorphism invariant). The δ route proves 5 ≤ d_K and does not ask the statement to move. |

## 3 · Pin checks (mathlib `db584cd6d46c92f209a44c0f1c829460d327499d`, read under `.lake/packages/mathlib/Mathlib/`)

- `NumberField.discr` — `NumberTheory/NumberField/Discriminant/Defs.lean:36`: `noncomputable abbrev discr : ℤ := Algebra.discr ℤ (RingOfIntegers.basis K)`, docstring "The absolute discriminant of a number field": a signed integer, not an absolute value. `discr_ne_zero` at Defs.lean:41. Sign: `sign_discr` at `Discriminant/Basic.lean:57`, `(discr K).sign = (-1) ^ nrComplexPlaces K` — positive for a totally real field, so it is the paper's d_K.
- `NumberField.IsTotallyReal` — `NumberField/InfinitePlace/TotallyRealComplex.lean:47`: every infinite place is real. `nrComplexPlaces_eq_zero_iff` at :52. With finrank 2 this is "real quadratic" exactly.
- `Module.finrank` — `LinearAlgebra/Dimension/Finrank.lean:62`: `Cardinal.toNat (Module.rank R M)`; its junk value 0 (infinite rank) is excluded twice: `NumberField` carries `FiniteDimensional ℚ K` (`NumberField/Basic.lean:44`), and the hypothesis asks for 2.
- `ms32Gc` — `ModularSurface/Now/Challenge.lean:235`: `noncomputable def ms32Gc (d : ℝ) : ℝ := 1 / (Real.pi * Real.sqrt d)`, `#print` = `fun d => 1 / (Real.pi * √d)` — g(d) = 1/(π√d) as the paper writes it, on all of ℝ.
- **Junk-value check.** For d ≤ 0, `√d = 0`, so `ms32Gc d = 1/0 = 0` (probe: `ms32Gc 0 = 0` and `∀ d ≤ 0, ms32Gc d = 0` both by `simp`). The bound conjunct would therefore be true by default at any K with `discr K ≤ 0` — but no such K is in its range: `sign_discr` makes `discr K > 0` for every totally real K. On d > 0 g is strictly decreasing, so the bound is not vacuous: the probe proves `¬ ms32Gc 4 ≤ ms32Gc 5`, and the same holds at 1, 2, 3. Given d_K > 0, the bound conjunct is equivalent to 5 ≤ d_K, the paper's content. The default does not carry it.
- **Elaboration** (probe `import ModularSurface.Now.Challenge`, `pp.coercions`, `pp.numericTypes`; `lake env lean`, 22:38:00Z → 22:38:12Z, exit 0, no errors): the bound reads `ms32Gc ↑(NumberField.discr K) ≤ ms32Gc (5 : ℝ)` (ℤ → ℝ cast); the ∃ elaborates as `∃ (K : Type) (x : Field K) (x_1 : NumberField K) (_ : NumberField.IsTotallyReal K), Module.finrank ℚ K = 2 ∧ NumberField.discr K = (5 : ℤ)` — the anonymous binders are local instances (the `NumberField K` and `IsTotallyReal K` binders and `finrank ℚ K` resolve against the bound `Field K`), in agreement with M's note and the U8 BUILD-LOG inspect (18:00:22Z).
- **The route's reality** (read, not re-run): `RiemannZeta/Provenance/Challenge.lean:183–188` `rz_13_min_real_quadratic_discr.{u}` states the ∀ at `Type u` with conclusion `5 ≤ NumberField.discr K`, and ℚ⟮√5⟯ totally real, finrank 2, discr 5; `specs/_V3-U9.md` row 5 (V3-CLEAN) and its convention check (line 48: `NumberField.discr` absolute, sign (−1)^{r₂}, positive for real quadratic) agree with the checks above. MS-32b's bound is that fact at universe 0 composed with antitonicity of g.

## 4 · Guards (`/opt/homebrew/bin/python3 -I`, mpmath, 30 digits) — truth, not fidelity

| d | g(d) = 1/(π√d) | g(d)/g(5) − 1 |
|---|---|---|
| 4 (excluded) | 0.15915494309189533577 | +0.11803398875 |
| 5 | 0.1423525086834354117 | 0 |
| 8 | 0.11253953951963825869 | −0.209430584958 |
| 12 | 0.091888149236965341585 | −0.354502775632 |
| 13 | 0.08828327816328951686 | −0.379826327054 |

g(5) − 1/(√5·π) = 0. 100(√(5/8) − 1) = −20.9430584957905. The ladder strictly descends from 5; the printed −20.943% is the 5 → 8 step.

## 5 · Verdict

**V2-GREEN (faithful as signed).** `ms_32b_certificate_max_fields` says what PDF p13 prints at the paper's strength: the bound g(d_K) ≤ g(5) over every real quadratic K and its attainment at d_K = 5, no uniqueness, no strictness. The default value of `ms32Gc` on d ≤ 0 never reaches the bound's range, because `sign_discr` makes d_K > 0. The statement stands byte for byte (digest `648a9eec…f2f2` at open and at signing); the 18:07:40Z signature is reconfirmed, not replaced.

Observation (no drift): `formalization.yaml` `v2_signed` reads `2026-10-28T18:07:07Z` while the spec V2 lines read `18:07:40Z`; both stand as written, this sheet touches neither.

- record closed: 2026-10-28T22:39:26Z (the `V2:` line in `specs/MS-32b.md`; the `v2_reconfirmed` line in `ModularSurface/Now/formalization.yaml`).
