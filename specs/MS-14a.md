# L:MS-14a — the printed instance: 2, 5, 10, 13, 17, 26, 29, 37 each carry a solvable negative Pell equation

## 1 · Header
- row: L:MS-14a (split from L:MS-14, CHANGED in the republish, as the brief directs: 14a the printed instance, in scope, keeps the ledger figure (E1, 0.5 pd); 14b the infinitude, OUT-OF-Q5 pending the wall; and a further split proposed by this seat, 14c the enumeration reading of "{…, …}", OUT-OF-Q5 pending the wall — V₁ signs the 14c split off).
- unit: U8 (`ModularSurface/Now`)
- paper: MS — *The Invariant Structure of the Modular Surface* (2026, revised October 2026)
- pdf_sha256: `b4841489ec6bea619f8d5525ce4c788b86e0109e51d6e9d2cb252690f5b13af5`
- locus: §2.4, the paragraph after the two bullets under (2.9), served PDF p08 (printed folio 7; moved p07 → p08 in the republish). Re-key change class: CHANGED (was "shared across {2, 5, 10, 13, 17}"; now an open-ended infinite set with three more listed values and the Pell equation printed).
- spec_clock: 2026-10-28T17:36:52Z

## 2 · Printed statement, verbatim
§2.4 (p08): "The two conjuncts meet at the minimizer, and they are bridged there by N(φ) = −1 — but this bridge is a systole mechanism, not a selector: the norm-(−1) relation is shared by infinitely many d — {2, 5, 10, 13, 17, 26, 29, 37, …}, those for which the relevant Pell equation x² − dy² = −1 (or −4) is solvable — so it cannot single out 5."

## 3 · Formal reading
- **The parameter d.** "the norm-(−1) relation is shared by … d" is about the real quadratic fields ℚ(√d): d is the squarefree parameter d > 1 (every listed value is squarefree). The squarefree condition is load-bearing for the set as printed: without it, d = 8 (x² − 8y² = −4 at (2, 1)) and d = 20 (at (4, 1)) would satisfy "−1 (or −4)" and are not listed.
- **"the relevant Pell equation x² − dy² = −1 (or −4)":** read as the disjunction — some integer solution of x² − dy² = −1 or of x² − dy² = −4. (For squarefree d the disjunction agrees with the "relevant" reading −1 for d ≡ 2, 3 mod 4 and −4 for d ≡ 1 mod 4: a solution of −1 doubles to one of −4, and for squarefree d a solution of −4 yields one of −1 — directly by parity when d ≢ 5 mod 8, by cubing the half-integral unit when d ≡ 5 mod 8. Not claimed; it is why the reading is safe.)
- **The set:** S = {d ∈ ℕ | 1 < d, d squarefree, ∃ x y ∈ ℤ, x² − dy² = −1 ∨ x² − dy² = −4}.
- **This sub-row's claim:** each of the eight listed values belongs to S. Witnesses (each solves x² − dy² = −1): 2 (1, 1); 5 (2, 1); 10 (3, 1); 13 (18, 5); 17 (4, 1); 26 (5, 1); 29 (70, 13); 37 (6, 1) — recomputed in this seat.
- "infinitely many" is L:MS-14b; "the listed values are the first members, in order" is L:MS-14c. "so it cannot single out 5" and "a systole mechanism, not a selector" are readings, not taken.

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
| declaration | kind | module (file:line) |
|---|---|---|
| `Squarefree` | def | Mathlib.Algebra.Squarefree.Basic (Basic.lean:42) |
| anonymous `instance : DecidablePred (Squarefree : ℕ → Prop)` | instance | Mathlib.Data.Nat.Squarefree (Squarefree.lean:235) |
| set literal `{2, 5, …}` and `⊆` on `Set ℕ` | notation (no name cited) | Mathlib.Data.Set.Defs |
Tactics: `decide` (squarefree on ℕ), `norm_num` with the explicit witnesses. `Pell.Solution₁` (Pell.lean:94) concerns x² − dy² = **+1** and is not needed. No name missing.

## 5 · Intended Lean statement
Prose: with S as above, the set {2, 5, 10, 13, 17, 26, 29, 37} is contained in S.

```lean
/-- MS §2.4 p08: the squarefree d > 1 for which x² − dy² = −1 (or −4) is solvable. -/
def ms14NegPellSet : Set ℕ :=
  {d | 1 < d ∧ Squarefree d ∧
    ∃ x y : ℤ, x ^ 2 - (d : ℤ) * y ^ 2 = -1 ∨ x ^ 2 - (d : ℤ) * y ^ 2 = -4}

/-- L:MS-14a — MS §2.4, served p08 (sha256 b4841489…3af5): the printed instance. -/
theorem ms_14a_listed_in_negPellSet :
    ({2, 5, 10, 13, 17, 26, 29, 37} : Set ℕ) ⊆ ms14NegPellSet := by sorry
```

## 6 · What the row does not claim
- Not "infinitely many d" (L:MS-14b), and not that the list is the initial segment of S (L:MS-14c).
- Not "the norm-(−1) relation" as a statement about fundamental units of ℚ(√d) (that a solution gives a unit of norm −1 in the ring of integers is standard; the units of specific quadratic fields are not formalised at the pin — L:RZ-09 territory).
- Not N(φ) = −1 (L:MS-08 = L:RZ-07), not "bridged … at the minimizer", "a systole mechanism, not a selector", "cannot single out 5" (readings; L:MS-15 CONCEPT).

## 7 · Status
SPEC-DRAFT 2026-10-28T17:36:52Z

V1: V1-SPLIT-OK + V1-GREEN 2026-10-28T17:51:21Z — p08 read; quoted exactly. The squarefree reading of d is CONFIRMED mandatory: without it 4 (0, 1), 8 (2, 1) and 20 (4, 1) solve "−4" and 50 (7, 1) solves "−1", none listed; every listed value is squarefree and d parametrises ℚ(√d). "(or −4)" as the disjunction is the faithful reading (the ring-of-integers norm for d ≡ 1 mod 4). The eight witnesses recomputed (13: 18² − 13·5² = −1; 29: 70² − 29·13² = −1; the rest with y = 1). Keeps the ledger figure.

V2: V2-GREEN 2026-10-28T18:07:40Z — ms_14a_listed_in_negPellSet says what p08 prints: each listed d is in S = squarefree d > 1 with x² − dy² = −1 or −4 solvable over ℤ. The squarefree reading is mandatory because 4, 8, 20 (−4) and 50 (−1) are unlisted. For squarefree d the disjunction is the field's norm-(−1) condition, since for d ≡ 2, 3 mod 4 a −4 solution has x, y even. Witnesses recomputed (13: 18² − 13·5² = −1; 29: 70² − 29·13² = −1).
