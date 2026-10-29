# L:MS-14b — "shared by infinitely many d" — OUT-OF-Q5 (pending the wall)

## 1 · Header
- row: L:MS-14b (split from L:MS-14 as the brief directs; siblings L:MS-14a (in scope) and L:MS-14c). **OUT-OF-Q5 (pending the wall).**
- unit: U8 (`ModularSurface/Now`)
- paper: MS — *The Invariant Structure of the Modular Surface* (2026, revised October 2026)
- pdf_sha256: `b4841489ec6bea619f8d5525ce4c788b86e0109e51d6e9d2cb252690f5b13af5`
- locus: §2.4, served PDF p08 (printed folio 7). Re-key change class: CHANGED.
- spec_clock: 2026-10-28T17:36:52Z

## 2 · Printed statement, verbatim
§2.4 (p08): "the norm-(−1) relation is shared by infinitely many d — {2, 5, 10, 13, 17, 26, 29, 37, …}, those for which the relevant Pell equation x² − dy² = −1 (or −4) is solvable — so it cannot single out 5."

## 3 · Formal reading
- S is the set of L:MS-14a: squarefree d > 1 with an integer solution of x² − dy² = −1 or −4 (the squarefree reading and its reasons are recorded there).
- Claim: S is infinite.
- **Routes (for L and V₁, not claims):**
  - Legendre's theorem (the brief's route, E3): for a prime p ≡ 1 (mod 4), x² − py² = −1 is solvable; with the infinitude of such primes (present: `Nat.infinite_setOfPred_prime_modEq_one`) S is infinite. Legendre's theorem is **not at the pin** (no lemma on x² − py² = −1; mathlib's `Pell` is the +1 equation). NEEDS-DEVELOPMENT: Legendre's theorem for p ≡ 1 mod 4.
  - **A cheaper route exists only for a weaker reading:** if d were any non-square integer (squarefreeness dropped), d = n² + 1 with witness (n, 1) gives infinitude at once (E0–E1). That reading puts 8 and 20 into the set, which the printed list excludes; the spec therefore keeps the squarefree reading and its E3 cost. V₁ should weigh this — it is the hinge of the 14b cost.

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
| declaration | kind | module (file:line) |
|---|---|---|
| `Set.Infinite` | def (protected) | Mathlib.Data.Finite.Defs (Defs.lean:205) |
| `Nat.infinite_setOfPred_prime_modEq_one` | theorem — infinitely many primes p ≡ 1 [MOD k] | Mathlib.NumberTheory.PrimesCongruentOne (PrimesCongruentOne.lean:67) |
| `Set.infinite_of_injective_forall_mem` | theorem | Mathlib.Data.Set.Finite.Basic (Basic.lean:909) |
| `Squarefree` | def | Mathlib.Algebra.Squarefree.Basic (Basic.lean:42) |
| `Nat.Prime.sq_add_sq` | theorem (two squares, p % 4 ≠ 3) | Mathlib.NumberTheory.SumTwoSquares (SumTwoSquares.lean:35) — an ingredient, not Legendre |
**NEEDS-DEVELOPMENT:** Legendre's theorem (x² − py² = −1 solvable for primes p ≡ 1 mod 4) — absent at the pin.

## 5 · Intended Lean statement
```lean
/-- L:MS-14b — MS §2.4, served p08: "shared by infinitely many d". OUT-OF-Q5 (pending the wall).
`ms14NegPellSet` as in L:MS-14a. -/
theorem ms_14b_negPellSet_infinite : ms14NegPellSet.Infinite := by sorry
```

## 6 · What the row does not claim
- Not the eight listed members (L:MS-14a) nor the enumeration (L:MS-14c).
- Not a density or counting statement (only infinitude is printed).
- Not "so it cannot single out 5" (reading).

## 7 · Status
SPEC-DRAFT 2026-10-28T17:36:52Z

V1: V1-SPLIT-OK 2026-10-28T17:51:21Z — "shared by infinitely many d" is printed and is S.Infinite under the (mandatory) squarefree reading; OUT-OF-Q5 agreed. The cost hinge is decided against the cheap route: the non-square reading contradicts the printed list (14a), so d = n² + 1 is not available as stated. Cost note for the wall, not a fidelity point: a Legendre-free route exists — the squarefree kernel of n² + 1 lies in S for every n (witness (n, k) where n² + 1 = k²d) — but its infinitude needs a growth bound on the solutions for a fixed d, so it is not obviously cheaper than E3.

V2: V2-GREEN 2026-10-28T18:07:40Z — (OUT-OF-Q5, stated) ms_14b_negPellSet_infinite is "shared by infinitely many d" at p08, on the same S as 14a: S.Infinite, with no density claim.
