# V₃ — post-proof fidelity, L:MS-32b revisit (unit U8, `ModularSurface/Now`) — the wall's word 3

- opened: 2026-10-28T22:41:05Z (`date -u`) · own-words claim written: ≈22:42Z, before any Lean, spec or BUILD-LOG was opened · seat V₃, row-independent, fresh context (never M, V₁, V₂ or the prover)
- served PDF: `~/Claude/projects/qriemannian-site/public/pdfs/modular-surface-characterization.pdf`, sha256 `b4841489ec6bea619f8d5525ce4c788b86e0109e51d6e9d2cb252690f5b13af5` — **MATCH** (22:41:05Z)
- pages read with `pdftotext -layout` (cover = p01, folio = page − 1): §3.4 whole, from its heading on PDF p12 (folio 11) to its close on PDF p13 (folio 12), with the §4 opening on p13–p14 as the end marker. The sentence under review is on PDF p13 (folio 12), paragraph "The one theorem-shaped content the certificate does carry."
- mathlib pin `db584cd6d46c92f209a44c0f1c829460d327499d`, Lean `leanprover/lean4:v4.33.0`; repo HEAD at open `fbcb937`

**Digests (sha256):**
| file | at open | at close |
|---|---|---|
| `ModularSurface/Now/Challenge.lean` | `648a9eecd38f30ab6be4905c53fee7d7f41e1fafb57930717037f44da308f2f2` (= `statement_sha256`) | see Close |
| `ModularSurface/Now/Solution.lean` (read) | `e5ae994bb1bdf754f548e7aaef5824d944d287f1221c303d00144e4e75d8455c` (= the BUILD-LOG's close digest) | — |

**Read, in order:** the print (above) → `Challenge.lean` → `Solution.lean` (module docstring, `ms32Gc`, the ms_32b proof, lines 780–1096) → `BUILD-LOG.md` § "ms_32b revisit — proofs phase" → `formalization.yaml` (row L:MS-32b, `proofs_phase`) → `specs/MS-32b.md` (whole) → `specs/_V2-MS32b-revisit.md` → `specs/_V3-U9.md` (format and RZ-13's convention checks) → mathlib at the pin (`NumberTheory/NumberField/Discriminant/Defs.lean:36`, `Discriminant/Basic.lean:57`, `:209`).

## 1 · The paper's claim in my own words (written before the Lean was opened; kept as written)

Write g_c form-independently as a function of a real quadratic field K: g(K) = 1/(π·√d_K), d_K the field discriminant. Among all real quadratic fields, ℚ(√5) has the smallest discriminant; the ladder of real-quadratic discriminants runs 5, 8, 12, 13, 17, 21, … (cited [CV]). Since g is strictly decreasing in d_K (π fixed, √ increasing), g is maximised over the whole real-quadratic family at d_K = 5, i.e. at ℚ(√5). The next rung (d_K = 8) is lower by √(5/8) − 1 ≈ −20.943 % (the paper prints "√5/8 − 1", meaning √(5/8)).

The paper's reason: the minimality of 5 among real-quadratic discriminants (a conventional fact, [CV]) plus the monotonicity of 1/(π√d). The content is upstream (the ordering of number fields), not about X(1). Strength: a maximum over the whole family, i.e. ≤ for every K and attained at d_K = 5; no uniqueness is asserted in the sentence. "Real quadratic" means real quadratic number fields, d_K > 0; 4 is not on the ladder (there is no quadratic field with d_K = 4). The −20.943 % next-rung clause is a separate [D] claim (L:MS-32a, not this row).

## 2 · The one-theorem table

| conjunct | load-bearing step (why it is true) | verdict | note |
|---|---|---|---|
| (i) bound: ∀ K : Type, `Field`, `NumberField`, `IsTotallyReal`, `finrank ℚ K = 2` → `ms32Gc ↑(discr K) ≤ ms32Gc 5` | `h5le : 5 ≤ NumberField.discr K` (Solution.lean:798–926), the δ route: r₂ = 0 from `IsTotallyReal`; d_K > 0 by `sign_discr` (sign = (−1)^0 = 1, :801–804); d_K ≥ 4 by `abs_discr_ge'` at n = 2, r₂ = 0 (2⁴/2!² = 4, :805–811); `suffices discr K ≠ 4 by omega` (:812); if d_K = 4: α primitive of degree 2, δ = den(D₀)·(2α + c₁) is integral, δ ∉ ℚ, δ² = D ∈ ℤ (:840), Tr gives discr(1, δ) = 4D (:893), the integral-coordinate change of basis gives 4D = m²·d_K = 4m², so D = m², contradicting `hirr` (:922). Then `exact_mod_cast` to ℝ, `unfold ms32Gc`, `one_div_le_one_div_of_le (by positivity)` with 0 < π√5, and `mul_le_mul_of_nonneg_left (Real.sqrt_le_sqrt h5R) Real.pi_pos.le` (:927–930) | **V3-CLEAN** | This is the paper's reason: the minimality of 5 among real-quadratic discriminants, composed with g antitone on d > 0. The junk value of `ms32Gc` (0 on d ≤ 0) is never reached: the comparison runs between π√5 > 0 and π√d_K with d_K ≥ 5, so both square roots are of positive reals and both quotients are genuine. Discriminant 4 is excluded by arithmetic, not by convention, and the exclusion is load-bearing: g(4) > g(5) (probe and guards), so Minkowski's 4 alone would not carry the bound. |
| (ii) attainment: ∃ K : Type with the same structures, `finrank ℚ K = 2 ∧ discr K = 5` | witness K = ℚ⟮(√5 : ℝ)⟯, an `IntermediateField ℚ ℝ` coerced to its carrier (`Type`); `NumberField` by a local `let` (:935, finite-dimensional because √5 is integral); `hfin : finrank ℚ K = 2` from minpoly X² − 5 (:976); power basis on θ = (5 + √5)/2, root of X² − 5X + 5, Eisenstein at 5 (:1007), so ℤ[θ] = 𝓞_K; `hdiscB : discr ℚ B.basis = 5` from the norm of the derivative, N(√5) = −5 (:1029); transported to `hdiscK : NumberField.discr K = 5` (:1067); a real place from the inclusion K → ℝ, so r₂ = 0 by r₁ + 2r₂ = 2 (:1087); packed at :1095 with `inferInstance` for `Field` and for the `let` instance, the same instance `hdiscK` was proved under | **V3-CLEAN** | A genuine ℚ(√5) with its true ring of integers ℤ[φ] = ℤ[θ] (θ = φ + 2) and discriminant 5, not a degenerate witness. It also discharges the ∀ conjunct's hypotheses, so (i) is not vacuous (probe). The field being ℚ(√5) is the [CV] premise, which the witness supplies even though the statement does not name it (V₁, M, V₂ agree; the sentence names d_K = 5, not uniqueness). |

Weaker than printed: none. Stronger than printed: none (no strict inequality, no uniqueness; integer-form uniqueness lives in L:MS-32a).

## 3 · Pin and convention checks

- **Discriminant sign.** `NumberField.discr K : ℤ := Algebra.discr ℤ (RingOfIntegers.basis K)` (`NumberTheory/NumberField/Discriminant/Defs.lean:36`): the signed absolute discriminant. `sign_discr : (discr K).sign = (−1) ^ nrComplexPlaces K` (`Discriminant/Basic.lean:57`). The proof uses it at :801–804 to get d_K > 0, so the paper's positive d_K and Lean's signed one agree on the whole range. The field ℚ(√5) has d_K = +5, as printed.
- **Which family.** `IsTotallyReal` + `finrank ℚ K = 2` is "real quadratic" exactly. The bound covers every such K at `Type`, and the BUILD-LOG and M note that every number field has a copy in `Type` and `discr` is an isomorphism invariant, so the ∀ covers the printed family up to isomorphism. The proof's δ route never uses universe 0; it is the U9 argument at `Type u` instantiated.
- **g's domain.** `ms32Gc (d : ℝ) : ℝ := 1 / (Real.pi * Real.sqrt d)` (Challenge.lean:235 = Solution.lean:687, byte-identical). On d ≤ 0, √d = 0 and the value is 1/0 = 0 (probe: `ms32Gc 0 = 0` by `simp`). The bound is **not** carried by that default anywhere: the proof never cases on the sign of d_K beyond establishing 0 < d_K and 5 ≤ d_K, and the final inequality is `1/(π√d_K) ≤ 1/(π√5)` from `π√5 ≤ π√d_K` with `0 < π√5`.
- **Antitone step.** `one_div_le_one_div_of_le (ha : 0 < a) (h : a ≤ b) : 1/b ≤ 1/a` (`Algebra/Order/Field/Basic.lean:69`), a = π√5, b = π√d_K; `Real.sqrt_le_sqrt` (`Analysis/Real/Sqrt.lean:209`) from 5 ≤ d_K; `Real.pi_pos`. This is the honest monotonicity of 1/(π√d) on d > 0, no division-by-zero shortcut.
- **Minkowski at the pin.** `abs_discr_ge'` (`Discriminant/Basic.lean:209`): n^{2n} / ((4/π)^{2r₂} · n!²) ≤ |discr K|; at n = 2, r₂ = 0 this is 16/4 = 4. It gives only 4, which is why the δ step exists.
- **Statement integrity.** By script (`cmp.py` → `cmp.out`): the Challenge's ms_32b block (section header through `:= by`, 715 bytes) occurs verbatim in Solution.lean, and the `ms32Gc` definition is identical in both. The copied U9 δ route (`RiemannZeta/Provenance/Solution.lean` 1035–1160, indented two columns) matches Solution.lean 799–926 except the one declared line re-wrap and one added comment (`diff`).
- **Universe.** `ℚ⟮(√5 : ℝ)⟯` lives in `Type` (ℝ : Type); `#check` of the theorem prints the ∃ at `Type` with no `ULift`.

## 4 · Axioms

Probe `axioms.lean` → `axioms.out` (`lake env lean`, 22:42:30Z → 22:42:33Z, exit 0; `lake build ModularSurface.Now.Solution` at 22:42:40Z reported "Build completed successfully (8706 jobs)", the olean (22:38:50Z) newer than Solution.lean (22:38:31Z)):
```
'ModularSurface.Now.ms_32b_certificate_max_fields' depends on axioms: [propext, Classical.choice, Quot.sound]
```
The same probe elaborated, without error: `ms32Gc 0 = 0` (the junk value); `ms32Gc 5 < ms32Gc 4` (the δ exclusion is load-bearing); and the non-vacuity of the ∀ conjunct's hypotheses from the ∃ conjunct.
Grep of Solution.lean (`/usr/bin/grep -c -w`): `native_decide` 0 · `sorry` 0 · `admit` 0 · `axiom` 0 · `opaque` 0 · `set_option` 0.

## 5 · Guards (show truth, not fidelity)

`/opt/homebrew/bin/python3 -I guards.py` → `guards.out`, mpmath 30 digits:
| d | g(d) = 1/(π√d) | g(d)/g(5) − 1 |
|---|---|---|
| 4 (excluded by the δ route) | 0.15915494309189533577 | +0.11803398875 |
| 5 | 0.1423525086834354117 | 0 |
| 8 | 0.11253953951963825869 | −0.209430584958 |
| 12 | 0.091888149236965341585 | −0.354502775632 |
| 13 | 0.08828327816328951686 | −0.379826327054 |
| 17 | 0.077201487200829680056 | −0.457673855453 |
| 21 | 0.069460911804285660566 | −0.512049963526 |

Fundamental discriminants in 2..29: 5, 8, 12, 13, 17, 21, 24, 28, 29 (the printed ladder, continued). g strictly decreasing along it; g(4) > g(5); g(5) − 1/(√5·π) = 0; 100(√(5/8) − 1) = −20.9430584957905.

## 6 · Findings

None.

## 7 · Scope line

`formalization.yaml` row L:MS-32b: `status: "PROVED"`, `scope: "OUT-OF-Q5 (pending the wall)"`, note "proved beyond scope 2026-10-28T22:39:26Z on U9's δ route (the wall's word 3 …); the in-scope count is unchanged". `proofs_phase`: `theorems_proved: 16`, `in_scope_proved: 12` (the line is untouched by `fbcb937`; 12 rows carry `scope: "IN-Q5"`), ms_32b listed in `out_of_q5_proved`. BUILD-LOG § "ms_32b revisit — proofs phase": "proved beyond scope", "Counts: 16 of 16 proved; in scope 12 of 12; OUT-OF-Q5 4 of 4". The row is proved beyond the agreed scope and the in-scope count is unchanged.

## 8 · Verdict

**V3-CLEAN.** `ms_32b_certificate_max_fields` is true for the paper's reason at the paper's strength: 5 is the least discriminant of a real quadratic field (Lean's signed discriminant, positive on the whole range by `sign_discr`; 4 excluded by the δ arithmetic), and g = 1/(π√d) is antitone on d > 0. The attainment is a genuine ℚ(√5) at `Type` with discriminant 5. No junk value, vacuous hypothesis, degenerate witness or convention mismatch carries either conjunct.

Scratch: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/v3-ms32b/` (`00-own-words.md`, `p12-13.txt`, `axioms.lean`/`axioms.out`, `guards.py`/`guards.out`, `cmp.py`/`cmp.out`, `u9_delta.txt`/`u8_delta.txt`).

*We read the proof for its reason, and the reason is the paper's. We hand the row to the gate together.*

**Close.** Challenge digest at close (2026-10-28T22:44:07Z): `648a9eecd38f30ab6be4905c53fee7d7f41e1fafb57930717037f44da308f2f2` — unchanged from open. `V3:` line appended to `specs/MS-32b.md`. V3-CLOSED 2026-10-28T22:44:07Z.
