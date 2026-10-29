# L:RZ-N2a — §3 after (3.5): the relation set (3.2)–(3.5) is invariant under the 4-cycle Ê → Ŝ → Ĥ → D̂ → Ê

## 1 · Header
- row: L:RZ-N2a — split leg of NEW row L:RZ-N2 (re-keyed ledger §"RZ — NEW rows"; second-head RZ-06 narrowed form). Split stated in `_NEW-ROWS-2026-10-28.md` for V₁'s sign-off: **N2a** the rotation invariance (this spec) · **N2b** the reflection clause (CC-CANDIDATE, = CC-13; `RZ-N2b.md`) · **N2c** "not under all of T_d" (NOT A TARGET, Q7; no spec).
- unit: — (NEW row; suggested home: U5 `RiemannZeta/NoGo`, whose Q7 conventions it takes over unchanged)
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
- locus: §3, the sentence after display (3.5), served PDF p09–p10 (printed folios 8–9); the relations (3.2)–(3.5) on p09
- spec_clock: 2026-10-28T20:32:57Z

## 2 · Printed statement, verbatim
§3 (p09–p10): "Each of the four specified commutators produces the product of the other two operators — a cyclic pattern along the edge 4-cycle Ê → Ŝ → Ĥ → D̂ → Ê of the tetrahedron, invariant under that rotation (a cyclic subgroup of order 4 of T_d ≅ S4; the reflections of the 4-cycle reverse the commutators' sign), not under all of T_d; the pairs [Ê, Ĥ] and [Ŝ, D̂] are left unspecified (§13.3)."

Relations (p09): "[Ê, Ŝ] = iℏ Ĥ · D̂, (3.2) [Ŝ, Ĥ] = iℏ D̂ · Ê, (3.3) [Ĥ, D̂] = iℏ Ê · Ŝ, (3.4) [D̂, Ê] = iℏ Ŝ · Ĥ. (3.5)"

This leg is "invariant under that rotation" (and, since the rotation generates the order-4 subgroup, under the subgroup).

## 3 · Formal reading
- **Q7 (binding):** the operator algebra is never a `structure` or `class`. As in U5: Ê, Ŝ, Ĥ, D̂ are elements E, S, H, D of an arbitrary ring A that is a ℂ-algebra; [X, Y] = XY − YX; iℏ is `Complex.I * (ħ : ℂ)` with ħ : ℝ; the four relations appear only as hypotheses / as the two sides of an iff, written out inline (no predicate named for the algebra).
- **The rotation** is the substitution ρ: E ↦ S, S ↦ H, H ↦ D, D ↦ E (the edge 4-cycle Ê → Ŝ → Ĥ → D̂ → Ê). Applied to the relation set it sends (3.2) → (3.3) → (3.4) → (3.5) → (3.2) (checked by the re-key seat and here by substitution: [ρE, ρS] = iℏ ρH·ρD reads [S, H] = iℏ D·E, which is (3.3); likewise down the list).
- **"invariant under that rotation":** the four relations hold for (E, S, H, D) iff they hold for (S, H, D, E). The iff gives invariance under ρ⁻¹ as well, hence under the cyclic subgroup ⟨ρ⟩ of order 4.
- No ħ ≠ 0 hypothesis is needed (the statement is a reindexing).

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
| declaration | kind | file:line | namespace |
|---|---|---|---|
| `Ring`, `Algebra` | class | Mathlib core (as used by U5's `rz_80`, `rz_81`) | root |
| `Complex.I` | def | Mathlib/Data/Complex/Basic (as used by U5) | `Complex` |
No new name; the U5 statements elaborate with the same vocabulary at the pin. No gap.

## 5 · Intended Lean statement
Prose: in any complex algebra, E, S, H, D and real ħ satisfy (3.2)–(3.5) exactly when S, H, D, E (the 4-cycle applied) satisfy them.

```lean
/-- L:RZ-N2a — RZ §3, the sentence after (3.5), served p09–p10 (sha256 2d5287e7…): the relation
set (3.2)–(3.5) is "invariant under that rotation", the edge 4-cycle Ê → Ŝ → Ĥ → D̂ → Ê.
Relations as hypotheses only (Q7). -/
theorem rz_N2a_rotation_invariant {A : Type*} [Ring A] [Algebra ℂ A] (E S H D : A) (ħ : ℝ) :
    (E * S - S * E = (Complex.I * (ħ : ℂ)) • (H * D) ∧     -- (3.2)
     S * H - H * S = (Complex.I * (ħ : ℂ)) • (D * E) ∧     -- (3.3)
     H * D - D * H = (Complex.I * (ħ : ℂ)) • (E * S) ∧     -- (3.4)
     D * E - E * D = (Complex.I * (ħ : ℂ)) • (S * H)) ↔   -- (3.5)
    (S * H - H * S = (Complex.I * (ħ : ℂ)) • (D * E) ∧     -- (3.2) at (S, H, D, E)
     H * D - D * H = (Complex.I * (ħ : ℂ)) • (E * S) ∧     -- (3.3) at (S, H, D, E)
     D * E - E * D = (Complex.I * (ħ : ℂ)) • (S * H) ∧     -- (3.4) at (S, H, D, E)
     E * S - S * E = (Complex.I * (ħ : ℂ)) • (H * D)) := by -- (3.5) at (S, H, D, E)
  sorry
```

Cost class: E0 (a reordering of a conjunction; `tauto`). ≈ 0.1 pd.

## 6 · What the row does not claim
- Not the reflection clause "the reflections of the 4-cycle reverse the commutators' sign" (N2b — CC-CANDIDATE, CC-13: true only up to the order of the product).
- Not "not under all of T_d" (N2c — a statement about the relation set as an object; NOT A TARGET under Q7).
- Not the existence of any algebra satisfying the relations, nor minimality (§3's [C] proposal, L:RZ-19), nor non-factorizability; the relation set is never exported as an object (Q7; L:RZ-18 stays NOT A TARGET).

## 7 · Status
SPEC-DRAFT 2026-10-28T20:32:57Z

V1: V1-GREEN 2026-10-28T20:50:09Z — p09 relations (3.2)–(3.5) and p09–p10 sentence read first. Substitution checked by hand: under E ↦ S ↦ H ↦ D ↦ E, (3.2) → (3.3) → (3.4) → (3.5) → (3.2); the right side of the iff is the left side reordered, so the iff states exactly "invariant under that rotation", and through ρ⁻¹ the order-4 subgroup — nothing about any other element of T_d. Q7: no `structure`/`class`, relations inline as the two sides of an iff (the U5 vocabulary of `rz_81`); Q7's text names negative results only, so the wall may note that inline relation-set symmetry statements are admitted on the same footing. ħ : ℝ with no ħ ≠ 0 is harmless (a reindexing). Split: N2a / N2b V1-SPLIT-OK; N2c V1-DISAGREE-CLASS (read as a target in RZ-81 (b)'s matrix-witness form — see `_V1-NEW-ROWS.md`).

V2: V2-GREEN 2026-10-28T22:52:53Z — `rz_N2a_rotation_invariant` (RiemannZeta/Accepted/Challenge.lean:74–82) says what p09–p10 prints (relations (3.2)–(3.5) on p09; "invariant under that rotation" after (3.5)), no stronger, no weaker: in any ring that is a ℂ-algebra, the four relations at (E, S, H, D) iff at (S, H, D, E) — the right side is the images of (3.2), (3.3), (3.4), (3.5) under ρ: E ↦ S ↦ H ↦ D ↦ E, in that order, which are (3.3), (3.4), (3.5), (3.2) (mechanical substitution, scratch); quantified over all algebras, the iff is set invariance of the relation set under ρ (hence ρ⁻¹ and the order-4 subgroup), nothing about any other element of T_d; the four relation lines are U5's `rz_81` lines (NoGo/Challenge.lean:63–66) — Q7 inline, no structure or class; no ħ ≠ 0 needed for a reindexing. Theorem text = §5 byte for byte (759 B). The row L:RZ-N2 stays out of T until CC-13 lands (unchanged). Signed: statement_sha256 43e639cca6e866ecb9ab68b4d46ee56a811a5f2443f091f05a83386fe448385a, v2_signed 2026-10-28T22:52:27Z. Full note: `specs/_V2-U12.md`.

L-proofs: PROVED 2026-10-28T23:03:04Z — `rz_N2a_rotation_invariant` in `RiemannZeta/Accepted/Solution.lean` (sha256 f383d9d5…): the conjunction reordered both ways (rintro/exact), no algebra used. Build exit 0, no warning; axioms [propext, Classical.choice, Quot.sound]. The row L:RZ-N2 still enters T only after CC-13 lands. Log: `RiemannZeta/Accepted/BUILD-LOG.md` §Proofs phase.

V3: V3-CLEAN 2026-10-28T23:07:56Z — rz_N2a_rotation_invariant is true by reordering, and that is the paper's claim: the probe shows the theorem term has type relSet E S H D ħ ↔ relSet S H D E ħ (the right side is literally the relation set at the rotated tuple), so the iff over every ℂ-algebra is invariance of (3.2)–(3.5) under the 4-cycle, the paper's cyclic construction read back; not vacuous (a non-symmetry such as E ↔ S is no reordering). No junk, no ħ ≠ 0 needed. Axioms standard. The row L:RZ-N2 still enters T only after CC-13 lands (yaml note + BUILD-LOG row tables confirm). Sheet `specs/_V3-U12.md`.
