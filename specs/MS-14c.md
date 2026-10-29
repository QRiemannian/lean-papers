# L:MS-14c — the enumeration reading of "{2, 5, 10, 13, 17, 26, 29, 37, …}": the first eight members — OUT-OF-Q5 (pending the wall); split proposed by seat M

## 1 · Header
- row: L:MS-14c — **a split proposed by this seat beyond the brief's 14a/14b** (plan §4 step 8: the print says more than the row's cost covers). V₁ signs it off or folds it back. **OUT-OF-Q5 (pending the wall).**
- unit: U8 (`ModularSurface/Now`)
- paper: MS — *The Invariant Structure of the Modular Surface* (2026, revised October 2026)
- pdf_sha256: `b4841489ec6bea619f8d5525ce4c788b86e0109e51d6e9d2cb252690f5b13af5`
- locus: §2.4, served PDF p08 (printed folio 7). Re-key change class: CHANGED.
- spec_clock: 2026-10-28T17:36:52Z

## 2 · Printed statement, verbatim
§2.4 (p08): "the norm-(−1) relation is shared by infinitely many d — {2, 5, 10, 13, 17, 26, 29, 37, …}, those for which the relevant Pell equation x² − dy² = −1 (or −4) is solvable"

## 3 · Formal reading
- A set written "{a₁, a₂, …, a₈, …}" in increasing order conventionally lists its first members: no element of S lies below 37 except the eight listed. The spec takes that as the printed content beyond membership (14a) and infinitude (14b): S ∩ [0, 37] = {2, 5, 10, 13, 17, 26, 29, 37}, with S as in L:MS-14a (squarefree d > 1, x² − dy² = −1 or −4 solvable).
- Checked in this seat: the squarefree d ≤ 37 not listed are 3, 6, 7, 11, 14, 15, 19, 21, 22, 23, 30, 31, 33, 34, 35. All but one are excluded by a congruence (a prime q ≡ 3 mod 4 dividing d, which makes −1 and −4 non-residues mod q). **d = 34 has no congruence obstruction** (−1 is a square mod 2 and mod 17): its exclusion needs a unit argument (e.g. the fundamental solution of x² − 34y² = 1 is (35, 6) and 35 + 6√34 is not a square in ℤ[√34]; and x² − 34y² = −4 reduces to −1 by parity). This is why 14c is not in the 0.5 pd of the ledger row (the v0.1 ledger already priced "exactly these d" at +1.5 pd).
- Whether the "…" is meant as an initial-segment enumeration or only as "for example" is the reading V₁ decides; if V₁ takes "for example", this sub-row is withdrawn and nothing else changes.

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
| declaration | kind | module (file:line) |
|---|---|---|
| `Squarefree` | def | Mathlib.Algebra.Squarefree.Basic (Basic.lean:42) |
| `Pell.Solution₁` | def (solutions of x² − dy² = 1 as `unitary (ℤ√d)`) | Mathlib.NumberTheory.Pell (Pell.lean:94) |
| `Pell.IsFundamental` | def | Mathlib.NumberTheory.Pell (Pell.lean:430) |
| `Pell.exists_of_not_isSquare` | theorem | Mathlib.NumberTheory.Pell (Pell.lean:323, :457) |
| `ZMod` (for the congruence exclusions) | def | Mathlib.Data.ZMod.Defs (Defs.lean:142) |
No lemma at the pin decides x² − 34y² = −1; the route is the Pell machinery above plus a finite check (E1–E2). No ledger-cited name missing.

## 5 · Intended Lean statement
```lean
/-- L:MS-14c — MS §2.4, served p08: the listed values are the first eight members of the set.
`ms14NegPellSet` as in L:MS-14a. OUT-OF-Q5 (pending the wall). -/
theorem ms_14c_negPellSet_initial :
    {d ∈ ms14NegPellSet | d ≤ 37} = ({2, 5, 10, 13, 17, 26, 29, 37} : Set ℕ) := by sorry
```

## 6 · What the row does not claim
- Not membership alone (L:MS-14a), not infinitude (L:MS-14b).
- Not any statement past 37 ("…").

## 7 · Status
SPEC-DRAFT 2026-10-28T17:36:52Z

V1: V1-SPLIT-OK 2026-10-28T17:51:21Z — "{2, 5, 10, 13, 17, 26, 29, 37, …}" is READ as an initial enumeration (an increasing list in set braces closed by an ellipsis lists the first members — the same reading this unit applies, in scope, to MS-32a's ladder "5, 8, 12, 13, 17, 21, …"); 14c is NOT withdrawn. The statement S ∩ [0, 37] = the eight is true: the unlisted squarefree d ≤ 37 are 3, 6, 7, 11, 14, 15, 19, 21, 22, 23, 30, 31, 33, 34, 35; all but 34 carry a prime ≡ 3 (mod 4); 34 needs the unit argument (x² − 34y² = −4 descends to −1 by parity twice; −1 is unsolvable — the period of √34 = [5; 1, 4, 1, 10] is even; a brute search to x < 3000 finds nothing). OUT-OF-Q5 agreed.

V2: V2-GREEN 2026-10-28T18:07:40Z — (OUT-OF-Q5, stated) ms_14c_negPellSet_initial reads "{2, 5, 10, 13, 17, 26, 29, 37, …}" as an increasing list in braces closed by an ellipsis, which lists the set's first members. That is the same reading as MS-32a's ladder: S ∩ [0, 37] = the eight. Recomputed with an independent brute search (y < 20000), the squarefree d ≤ 37 in S are exactly the eight. Nothing past 37 is stated.
