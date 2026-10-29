# L:RZ-72c — §10.3 continuation: for prime cyclotomic fields all L-function factors are degree-1 Dirichlet L-functions

**OUT-OF-Q5 (pending the wall). NEEDS-DEVELOPMENT** (the Dedekind-zeta factorisation of an abelian field into Dirichlet L-functions is absent at the pin). Split leg of L:RZ-72; kin to L:RZ-69 (EFFORT, 50 pd, out of Q5). Not counted in Q5.

## 1 · Header
- row: L:RZ-72c (split of L:RZ-72; proposed EFFORT, E3, riding on whatever builds L:RZ-69's factorisation — no figure set here)
- unit: U6 (`RiemannZeta/Cyclotomic`)
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
- locus: §10.3, the paragraph after Proposition 10.1, PDF p27 (printed folio 26); it leans on the §10.1 sentence, PDF p26: "For an abelian extension K/ℚ of degree n, the Dedekind zeta function factors into n Dirichlet L-functions corresponding to the characters of the Galois group". Re-key change class: CHANGED (paragraph rewritten; this sentence carried over).
- spec_clock: 2026-10-28T17:24:03Z

## 2 · Printed statement, verbatim
§10.3, p27 (the two sentences carrying this leg; the full paragraph is quoted in RZ-72a.md §2):
> For higher cyclotomic fields (ℚ(ζ7) with degree 6, ℚ(ζ11) with degree 10, etc.), additional L-function factors arise from the larger Galois groups. Since these are abelian extensions, all factors are degree-1 Dirichlet L-functions — they produce more characters, not higher-dimensional representations.

(The degrees 6 and 10 are L:RZ-72a clause 1.)

## 3 · Formal reading
- **Scope of "these".** The prime cyclotomic fields ℚ(ζp) the sentence lists ("ℚ(ζ7) …, ℚ(ζ11) …, etc."), p prime. (The §10.1 sentence states the general abelian case; that is not this row.)
- **"all factors are degree-1 Dirichlet L-functions"** — read as the factorisation, for Re s > 1, ζ_{ℚ(ζp)}(s) = ∏_{χ} L(s, χ*), the product over the p − 1 Dirichlet characters χ mod p (`DirichletCharacter ℂ p`), χ* the primitive character inducing χ (`DirichletCharacter.primitiveCharacter`). **Convention named:** with the *imprimitive* trivial character mod p, L(s, χ₀) = ζ(s)(1 − p^{−s}) ≠ ζ(s), and the product would be wrong by that Euler factor; the primitive reading is the one under which the printed claim is true and is the standard one (the §10.1 table's factor "ζ(s)" for χ₀ confirms it). Restricted to 1 < re s, where both sides are Euler products/Dirichlet series (mathlib's `NumberField.dedekindZeta` is the `LSeries` of ideal counts, defined as a series).
- **"degree-1"** — each factor is the L-function of a one-dimensional character; this is definitional for a Dirichlet L-function and carries no separate content.
- **"they produce more characters, not higher-dimensional representations"** — the gloss that irreducible complex representations of the finite abelian group Gal(ℚ(ζp)/ℚ) are one-dimensional. A true standard fact; read as background to the factorisation, not as a separate conjunct (V₁ may promote it to its own clause; it would be E1–E2 via Schur's lemma, and the spec does not target a mathlib name for it).

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
| declaration | kind | module (file:line) |
|---|---|---|
| `NumberField.dedekindZeta` | def | Mathlib.NumberTheory.NumberField.DedekindZeta (:47) — the `LSeries` of n ↦ #{I : absNorm I = n} |
| `DirichletCharacter` | abbrev | Mathlib.NumberTheory.DirichletCharacter.Basic (:40) — `MulChar (ZMod n) R` (abbrev; found by `abbrev DirichletCharacter`) |
| `DirichletCharacter.primitiveCharacter` | noncomputable def | Mathlib.NumberTheory.DirichletCharacter.Basic (:307) |
| `DirichletCharacter.LFunction` | noncomputable def | Mathlib.NumberTheory.LSeries.DirichletContinuation (:61) |
| `DirichletCharacter.fintype` | noncomputable instance | Mathlib.NumberTheory.DirichletCharacter.Orthogonality (:27) |
| `CyclotomicField` | def | Mathlib.NumberTheory.Cyclotomic.Basic (:654) |

**NEEDS-DEVELOPMENT — the gap named:** no factorisation of `NumberField.dedekindZeta` into Dirichlet L-functions exists at the pin — `Mathlib/NumberTheory/NumberField/DedekindZeta.lean` is the only file under `Mathlib/` mentioning `dedekindZeta` (re-checked by `/usr/bin/grep -rln dedekindZeta`), and it carries no product formula (the same finding as LEDGER-NAMES §"The residue route" for ℚ(√5)). The development needed: prime splitting in ℚ(ζp) (the residue degree of q ≠ p is the order of q mod p) and the Euler-product comparison, as for L:RZ-69.

## 5 · Intended Lean statement
**Prose.** For every prime p and every complex s with 1 < re s, the Dedekind zeta function of ℚ(ζp) equals the product, over the Dirichlet characters χ modulo p, of the L-functions of the primitive characters inducing them.

**Proposed signature (shape only; it cannot be proved at the pin without the development above).**
```lean
theorem rz_72c_dedekindZeta_cyclotomic_prime (p : ℕ) [Fact p.Prime] (s : ℂ) (hs : 1 < s.re) :
    NumberField.dedekindZeta (CyclotomicField p ℚ) s =
      ∏ χ : DirichletCharacter ℂ p, DirichletCharacter.LFunction χ.primitiveCharacter s := by
  sorry
```
(The product needs `Fintype (DirichletCharacter ℂ p)`: instance `DirichletCharacter.fintype`, Mathlib.NumberTheory.DirichletCharacter.Orthogonality (:27), present at the pin.)

## 6 · What the row does not claim
- The general §10.1 statement for every abelian K/ℚ, and the ℚ(ζ5) instance ζ·L(χ₅)·L(χ₂)·L(χ̄₂) — L:RZ-69.
- The S4 question — printed "beyond scope"; no claim.
- The degrees 6 and 10 — L:RZ-72a.
- Any operator reading of the factors — CONCEPT.

## 7 · Status
SPEC-DRAFT 2026-10-28T17:24:03Z — OUT-OF-Q5 (pending the wall); NEEDS-DEVELOPMENT; not counted.

V1: V1-GREEN 2026-10-28T17:30:04Z — the primitive-character convention is a reading, not a repair: the §10.1 table writes the trivial factor as ζ(s) (p26), which is the primitive (conductor-1) character's L-function; with the imprimitive χ₀ mod p the product would be off by (1 − p^{−s}). Domain ∀ prime p is broader than the p27 "higher cyclotomic fields" but within what §10.1 prints for every abelian K/ℚ — not stronger than the paper. "Not higher-dimensional representations" rightly background (restatement of "degree-1"), not a separate conjunct. OUT-OF-Q5 / NEEDS-DEVELOPMENT agreed.
