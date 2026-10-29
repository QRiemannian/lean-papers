# CC-CANDIDATE — L:RZ-N2b: "the reflections of the 4-cycle reverse the commutators' sign" holds only up to the order of the product (= CC-13)

## 1 · Header
- row: L:RZ-N2b — split leg of NEW row L:RZ-N2 (see `RZ-N2a.md` §1 for the split).
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
- locus: §3, the parenthesis after display (3.5), served PDF p09 (printed folio 8)
- spec_clock: 2026-10-28T20:32:57Z

## 2 · Printed statement, verbatim
§3 (p09): "(a cyclic subgroup of order 4 of T_d ≅ S4; the reflections of the 4-cycle reverse the commutators' sign)"

## The one-line defect
Read as an algebra automorphism, the reflection Ŝ ↔ D̂ (Ê, Ĥ fixed) sends (3.2) to [Ê, D̂] = iℏ ĤŜ, while (3.5) gives [Ê, D̂] = −iℏ ŜĤ — a sign reversal only up to the order of the product (ĤŜ − ŜĤ = −iℏ D̂Ê by (3.3), not zero); read as an anti-automorphism the reflection preserves the relations with no sign change. Either reading, the printed clause is imprecise. Already listed as **CC-13** (`REKEY-2026-10-28.md` §"Correction candidates"); not repaired here. The row leg stays OPEN and uncounted; it goes to the correction track.

## Status
CC-CANDIDATE 2026-10-28T20:32:57Z — stopped (plan §4 step 3).

V1: V1-CC 2026-10-28T20:50:09Z — agree with CC-13. p09 parenthesis read first. Checked both reflection types of the 4-cycle as algebra automorphisms: the vertex reflection Ŝ ↔ D̂ sends (3.2) to [Ê, D̂] = iℏ ĤŜ against (3.5)'s [Ê, D̂] = −iℏ ŜĤ; the edge reflection Ê ↔ Ŝ, Ĥ ↔ D̂ sends (3.2) to [Ê, Ŝ] = −iℏ D̂Ĥ against (3.2)'s iℏ ĤD̂ — each a sign reversal only with the product's order reversed (ĤŜ − ŜĤ = −iℏ D̂Ê by (3.3)). As anti-automorphisms both preserve the relations with no sign change. Imprecise either way; leg OPEN, uncounted, correction track.

## M spec against the corrected text (2026-10-29)

*Seat M for L:RZ-N2b, dispatched by Orchestrator A 2026-10-29 under the wall's ship word (`Orchestrator/Chat-Design/cc-handoff/projects/priority/inbox/WORD-wall-2026-10-29-read-and-ship.md`, word 1: CC-13 lands in print at today's republish and L:RZ-N2 joins T). The CC-CANDIDATE text and the V1 line above stay as written; they describe the served edition's old sentence, which is CC-13 and is not the statement here. This section specs the leg against the corrected sentence only.*

### 1 · Header
- row: L:RZ-N2b — leg of L:RZ-N2 (siblings: L:RZ-N2a CHECKED, U12 `rz_N2a_rotation_invariant`; L:RZ-N2c NOT A TARGET (Q7), the wall's word 2 of 2026-10-28 carrying M's and V₁'s readings side by side)
- unit: **NEW — U14 `RiemannZeta/CorrectedReflections`** (next free number after U13; the orchestrator assigns), namespace `RiemannZeta.CorrectedReflections`; reasons in §8
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- edition read: the corrected sentence, from the source `Orchestrator/Papers/restructure/riemann-zeta-tetrahedral-maynard.md` :185 (read whole, with (3.2)–(3.5) at :177–:183), and from two built PDFs by `pdftotext -layout` (cover = p01): the pass-2 correction draft `CORRECTION-WAVE-2026-10-28/RZ-DRAFT-riemann-zeta-tetrahedral-2026-10-28.pdf` sha256 `8346ab4168882802ea5cca91b499de4a6e61f9733b45da8e2c050f697365d0ab` (the edition the wall read) and the publish-tree build `Papers/restructure/publish/riemann-zeta-tetrahedral-maynard-PUBLICATION.pdf` sha256 `6b89ce0e7ae0a71301a8d792b6e80f4cb850244df83f4731810377d70e3d2d12` (mtime 17:42Z today, the ship build in flight; not served at this seat's stamp). Both print the sentence identically at p09–p10. **The served file at this seat's stamp is still `2d5287e7…3e54` (the old sentence).** The docstrings carry the corrected edition's sha256 prefix when it is served; V₁ reads against the served corrected edition.
- locus: §3, the parenthesis in the sentence after display (3.5), PDF p09–p10 (printed folios 8–9), the break after "acting as anti-automorphisms"; relations (3.2)–(3.5) on PDF p09
- spec_clock: 2026-10-29T17:53:23Z

### 2 · (1) The printed sentence, verbatim, with its locus
Relations (p09): "[Ê, Ŝ] = iℏ Ĥ · D̂, (3.2) [Ŝ, Ĥ] = iℏ D̂ · Ê, (3.3) [Ĥ, D̂] = iℏ Ê · Ŝ, (3.4) [D̂, Ê] = iℏ Ŝ · Ĥ. (3.5)"

The sentence after (3.5) (p09–p10; source :185), whole: "Each of the four specified commutators produces the product of the other two operators — a cyclic pattern along the edge 4-cycle Ê → Ŝ → Ĥ → D̂ → Ê of the tetrahedron, invariant under that rotation (a cyclic subgroup of order 4 of T_d ≅ S4; **the reflections of the 4-cycle, acting as anti-automorphisms — reversing the order of products — carry the four relations to one another, while as automorphisms they reverse the commutators' sign only up to the order of the product**), not under all of T_d; the pairs [Ê, Ĥ] and [Ŝ, D̂] are left unspecified (§13.3)."

This leg is the bold clause. "invariant under that rotation" is N2a; "not under all of T_d" is N2c.

### 3 · (2) The mathematical content, split as the sentence splits
**The reflections.** Read the 4-cycle as the square with vertices Ê, Ŝ, Ĥ, D̂ in cyclic order; its symmetry group is D₄ = the four rotations (⟨ρ⟩, N2a) and **four reflections**, all of which the plural "the reflections" names:
- σ₁ — the vertex reflection fixing Ê and Ĥ: Ŝ ↔ D̂; (Ê, Ŝ, Ĥ, D̂) ↦ (Ê, D̂, Ĥ, Ŝ)
- σ₂ — the vertex reflection fixing Ŝ and D̂: Ê ↔ Ĥ; ↦ (Ĥ, Ŝ, Ê, D̂)
- σ₃ — the edge reflection Ê ↔ Ŝ, Ĥ ↔ D̂; ↦ (Ŝ, Ê, D̂, Ĥ)
- σ₄ — the edge reflection Ŝ ↔ Ĥ, D̂ ↔ Ê; ↦ (D̂, Ĥ, Ŝ, Ê)

σ₁, σ₂ are conjugate under ρ, as are σ₃, σ₄; V₁ of 2026-10-28 checked one of each class. The statement carries all four, because the print does and because the four-way form costs nothing.

**(i) "acting as anti-automorphisms — reversing the order of products — carry the four relations to one another".** The anti-automorphism σ̃ extending σ is ℂ-linear, sends each generator X to σX, and reverses products: σ̃(xy) = σ̃(y)σ̃(x). It sends the relation [X, Y] = iℏ ZW to σY·σX − σX·σY = iℏ σW·σZ. Computed for each reflection, every anti-image is **literally** a relation of the set — the same relator, no sign, no scalar:

| | (3.2) ↦ | (3.3) ↦ | (3.4) ↦ | (3.5) ↦ |
|---|---|---|---|---|
| σ₁ | (3.5) | (3.4) | (3.3) | (3.2) |
| σ₂ | (3.3) | (3.2) | (3.5) | (3.4) |
| σ₃ | (3.2) | (3.5) | (3.4) | (3.3) |
| σ₄ | (3.4) | (3.3) | (3.2) | (3.5) |

"carry the four relations to one another" = each anti-image is one of the four relations, and the map on relations is a bijection (a permutation of (3.2)–(3.5)). As a predicate in the Q7 frame: for every ring A that is a ℂ-algebra and every Ê, Ŝ, Ĥ, D̂ ∈ A and real ℏ, the four relations hold at (Ê, Ŝ, Ĥ, D̂) iff their four anti-images hold there. An anti-homomorphism into A is a homomorphism into the opposite ring Aᵐᵒᵖ (op x · op y = op (y·x)), so "the anti-images hold at (Ê, Ŝ, Ĥ, D̂)" is exactly "(3.2)–(3.5) hold in Aᵐᵒᵖ at (op σÊ, op σŜ, op σĤ, op σD̂)" — the form the statement takes (§5). Quantified over all algebras, the iff is the presentation-level content of "the anti-automorphism maps the relation set onto itself".

**(ii) "while as automorphisms they reverse the commutators' sign only up to the order of the product".** The automorphism σ̂ extending σ keeps products in order and sends [X, Y] = iℏ ZW to [σX, σY] = iℏ σZ·σW. Each image is a relation of the set with **the sign reversed and the right-hand product reversed**: e.g. σ₁ on (3.2) gives [Ê, D̂] = iℏ ĤŜ, i.e. [D̂, Ê] = −iℏ ĤŜ, against (3.5)'s [D̂, Ê] = iℏ ŜĤ. Write R⁻ for (3.2)–(3.5) with iℏ ↦ −iℏ and each right-hand product reversed:

R⁻: [Ê, Ŝ] = −iℏ D̂Ĥ, [Ŝ, Ĥ] = −iℏ ÊD̂, [Ĥ, D̂] = −iℏ ŜÊ, [D̂, Ê] = −iℏ ĤŜ,

and R₋ for the set with the sign reversed and the order kept: [Ê, Ŝ] = −iℏ ĤD̂, … (the old sentence's reading). What is claimed:
- **(a) "reverse the commutators' sign … up to the order of the product":** for each of σ₁–σ₄, in every complex algebra, the relations hold at the σ-reflected tuple (= the automorphism images of the four relations hold at (Ê, Ŝ, Ĥ, D̂)) iff R⁻ holds at (Ê, Ŝ, Ĥ, D̂). The images are not relations of the set: each image relator is the NEGATIVE of an R⁻ relator (σ₁ on (3.2): [Ê, D̂] − iℏ ĤŜ = −([D̂, Ê] + iℏ ĤŜ)). R⁻ is (3.2)–(3.5) read in Aᵐᵒᵖ at (op Ê, op Ŝ, op Ĥ, op D̂).
- **(b) "only":** the sign reversal does NOT hold with the product order kept — R⁻ and R₋ are different sets: for every real ℏ ≠ 0 there are 2 × 2 complex matrices satisfying R⁻ and failing R₋. With (a), that one tuple t refutes the plain reading "relations at σt ⟺ R₋ at t" for all four reflections at once.

What is not claimed: that any reflection, as an automorphism, preserves the relation set (it does not); that R and R₋ (or R and R⁻) are compatible or incompatible in general; that (3.2)–(3.5) have a non-degenerate model (the (b) witness happens to give one by transposition — the print does not say so; see the V3 tag); anything at ℏ = 0, where R⁻ and R₋ coincide (both say the four commutators vanish), so "only" is vacuous there and (b) carries ℏ ≠ 0; anything about the sixteen relabelings outside D₄ (N2c's territory) or about [Ê, Ĥ], [Ŝ, D̂] (§13.3).

**Check of the reading (a check, not a proof).** Noncommutative sympy (`<scratch>/refl_check.py`): for σ₁–σ₄, every anti-image relator equals a relator of the set (the table above), every automorphism image equals −(an R⁻ relator), and none equals ±(an R₋ relator). Scan of all 24 relabelings of {Ê, Ŝ, Ĥ, D̂} (`s4_scan.py`): the relator set is kept as automorphisms by exactly the four rotations and as anti-automorphisms by exactly the four reflections, and by none of the other sixteen either way — the corrected sentence's D₄ picture is exact. The (b) witness family is checked symbolically for general ℏ (`witness_family.py`), and at ℏ = 3/2 with Gaussian-integer entries (`witness.py`).

**One fact read twice.** (i) and (ii)(a) are logically the same fact through the anti-isomorphism op : A → Aᵐᵒᵖ: substitute (Ê, Ŝ, Ĥ, D̂) := the σ-reflected tuple in (i) (σ is an involution) and unfold op, and (i) becomes (ii)(a). The leg states both because the print states both and each Lean form reads its own clause directly (the anti-automorphism through Aᵐᵒᵖ; the automorphism's sign and order inline). V₂ should know they are not independent; the independent content of the "while" clause is (b).

### 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`; the M-template name-check form, run on the real tree; no `#check` — this seat wrote no Lean)
| declaration | kind | file:line | namespace |
|---|---|---|---|
| `Ring`, `Algebra`, `Complex.I` | — | as U5 / U12 use them | — |
| `MulOpposite.op` (`Aᵐᵒᵖ`) | def | Mathlib/Algebra/Opposites.lean (namespace `MulOpposite` :73–:263) | `MulOpposite` |
| `MulOpposite.instRing` | instance | Mathlib/Algebra/Ring/Opposite.lean:119 | `MulOpposite` (:21–:134) |
| `MulOpposite.instAlgebra` | instance | Mathlib/Algebra/Algebra/Opposite.lean:45 | `MulOpposite` |
| `MulOpposite.op_mul` | lemma (simp, rfl) | Mathlib/Algebra/Opposites.lean:221 — `op (x * y) = op y * op x` | `MulOpposite` |
| `MulOpposite.op_sub` | lemma (simp, rfl) | Opposites.lean:230 | `MulOpposite` |
| `MulOpposite.op_smul` | lemma (rfl) | Opposites.lean:235 — `op (a • b) = a • op b` | `MulOpposite` |
| `MulOpposite.op_inj` | theorem | Opposites.lean:138 | `MulOpposite` |
| `neg_smul` | theorem | Mathlib/Algebra/Module/Defs.lean:139 | root |
| `Real.sq_sqrt` | theorem | Mathlib/Analysis/Real/Sqrt.lean:178 — `0 ≤ x → √x ^ 2 = x` | `Real` (:107–:318) |
| `Complex.I_sq` | theorem | Mathlib/Data/Complex/Basic.lean:627 | `Complex` |
| `Matrix (Fin 2) (Fin 2) ℂ`, `!![…]` | — | as U5's `rz_81` (b) uses them | — |

Name-check hit pasted with its namespace: `Mathlib/Algebra/Opposites.lean:221:@[to_additive (attr := simp)] lemma op_mul [Mul α] (x y : α) : op (x * y) = op y * op x := rfl`, inside `namespace MulOpposite` (:73–:263) → `MulOpposite.op_mul`. (The same file's :281 `op_mul` is `AddOpposite.op_mul`, namespace :265–:300 — the one to avoid.) No gap.

### 5 · (3) Proposed Lean statements (Q7 form)
Header of the unit's Challenge: `import Mathlib`, `namespace RiemannZeta.CorrectedReflections`, `universe u` (for (ii)'s inner `∀ {A : Type u}`, rz_81's form). No definitions.

**(i)** — prose: for each reflection σ of the 4-cycle, in any complex algebra, (3.2)–(3.5) hold at (E, S, H, D) iff they hold in Aᵐᵒᵖ at (op σE, op σS, op σH, op σD).

```lean
open MulOpposite in
/-- **L:RZ-N2b (i)** — RZ §3, the parenthesis after (3.5), as corrected (CC-13): "the reflections
of the 4-cycle, acting as anti-automorphisms — reversing the order of products — carry the four
relations to one another". For each of the four reflections σ of the square Ê–Ŝ–Ĥ–D̂ (the two
vertex reflections Ŝ ↔ D̂ and Ê ↔ Ĥ, the two edge reflections Ê ↔ Ŝ, Ĥ ↔ D̂ and Ŝ ↔ Ĥ, D̂ ↔ Ê),
in any ring A that is a ℂ-algebra: the relations (3.2)–(3.5) hold at (Ê, Ŝ, Ĥ, D̂) exactly when
they hold in the opposite ring Aᵐᵒᵖ (where op x * op y = op (y * x)) at the op of the reflected
tuple — the anti-automorphism extending σ, read as a homomorphism into Aᵐᵒᵖ. Unfolded, each
anti-image is a relation of the set itself, with no sign change. Relations inline only (Q7).

Served locus: §3, the sentence after display (3.5), PDF p09–p10 (printed folios 8–9); relations
(3.2)–(3.5) on PDF p09. PDF sha256 prefix: the corrected edition's, at the republish. -/
theorem rz_N2b_reflections_anti_automorphism {A : Type*} [Ring A] [Algebra ℂ A]
    (E S H D : A) (ħ : ℝ) :
    -- the vertex reflection fixing Ê, Ĥ (Ŝ ↔ D̂)
    ((E * S - S * E = (Complex.I * (ħ : ℂ)) • (H * D) ∧   -- (3.2)
      S * H - H * S = (Complex.I * (ħ : ℂ)) • (D * E) ∧   -- (3.3)
      H * D - D * H = (Complex.I * (ħ : ℂ)) • (E * S) ∧   -- (3.4)
      D * E - E * D = (Complex.I * (ħ : ℂ)) • (S * H))   -- (3.5)
      ↔
     (op E * op D - op D * op E = (Complex.I * (ħ : ℂ)) • (op H * op S) ∧   -- (3.2) under it, in Aᵐᵒᵖ
      op D * op H - op H * op D = (Complex.I * (ħ : ℂ)) • (op S * op E) ∧   -- (3.3) under it, in Aᵐᵒᵖ
      op H * op S - op S * op H = (Complex.I * (ħ : ℂ)) • (op E * op D) ∧   -- (3.4) under it, in Aᵐᵒᵖ
      op S * op E - op E * op S = (Complex.I * (ħ : ℂ)) • (op D * op H))) ∧   -- (3.5) under it, in Aᵐᵒᵖ
    -- the vertex reflection fixing Ŝ, D̂ (Ê ↔ Ĥ)
    ((E * S - S * E = (Complex.I * (ħ : ℂ)) • (H * D) ∧   -- (3.2)
      S * H - H * S = (Complex.I * (ħ : ℂ)) • (D * E) ∧   -- (3.3)
      H * D - D * H = (Complex.I * (ħ : ℂ)) • (E * S) ∧   -- (3.4)
      D * E - E * D = (Complex.I * (ħ : ℂ)) • (S * H))   -- (3.5)
      ↔
     (op H * op S - op S * op H = (Complex.I * (ħ : ℂ)) • (op E * op D) ∧   -- (3.2) under it, in Aᵐᵒᵖ
      op S * op E - op E * op S = (Complex.I * (ħ : ℂ)) • (op D * op H) ∧   -- (3.3) under it, in Aᵐᵒᵖ
      op E * op D - op D * op E = (Complex.I * (ħ : ℂ)) • (op H * op S) ∧   -- (3.4) under it, in Aᵐᵒᵖ
      op D * op H - op H * op D = (Complex.I * (ħ : ℂ)) • (op S * op E))) ∧   -- (3.5) under it, in Aᵐᵒᵖ
    -- the edge reflection Ê ↔ Ŝ, Ĥ ↔ D̂
    ((E * S - S * E = (Complex.I * (ħ : ℂ)) • (H * D) ∧   -- (3.2)
      S * H - H * S = (Complex.I * (ħ : ℂ)) • (D * E) ∧   -- (3.3)
      H * D - D * H = (Complex.I * (ħ : ℂ)) • (E * S) ∧   -- (3.4)
      D * E - E * D = (Complex.I * (ħ : ℂ)) • (S * H))   -- (3.5)
      ↔
     (op S * op E - op E * op S = (Complex.I * (ħ : ℂ)) • (op D * op H) ∧   -- (3.2) under it, in Aᵐᵒᵖ
      op E * op D - op D * op E = (Complex.I * (ħ : ℂ)) • (op H * op S) ∧   -- (3.3) under it, in Aᵐᵒᵖ
      op D * op H - op H * op D = (Complex.I * (ħ : ℂ)) • (op S * op E) ∧   -- (3.4) under it, in Aᵐᵒᵖ
      op H * op S - op S * op H = (Complex.I * (ħ : ℂ)) • (op E * op D))) ∧   -- (3.5) under it, in Aᵐᵒᵖ
    -- the edge reflection Ŝ ↔ Ĥ, D̂ ↔ Ê
    ((E * S - S * E = (Complex.I * (ħ : ℂ)) • (H * D) ∧   -- (3.2)
      S * H - H * S = (Complex.I * (ħ : ℂ)) • (D * E) ∧   -- (3.3)
      H * D - D * H = (Complex.I * (ħ : ℂ)) • (E * S) ∧   -- (3.4)
      D * E - E * D = (Complex.I * (ħ : ℂ)) • (S * H))   -- (3.5)
      ↔
     (op D * op H - op H * op D = (Complex.I * (ħ : ℂ)) • (op S * op E) ∧   -- (3.2) under it, in Aᵐᵒᵖ
      op H * op S - op S * op H = (Complex.I * (ħ : ℂ)) • (op E * op D) ∧   -- (3.3) under it, in Aᵐᵒᵖ
      op S * op E - op E * op S = (Complex.I * (ħ : ℂ)) • (op D * op H) ∧   -- (3.4) under it, in Aᵐᵒᵖ
      op E * op D - op D * op E = (Complex.I * (ħ : ℂ)) • (op H * op S))) := by   -- (3.5) under it, in Aᵐᵒᵖ
  sorry
```

**(ii)** — prose: (a) for each reflection σ, in any complex algebra, (3.2)–(3.5) hold at the σ-reflected tuple iff the sign-and-order-reversed set R⁻ holds at (E, S, H, D); (b) for every real ħ ≠ 0 some 2 × 2 complex matrices satisfy R⁻ and fail R₋. One theorem with the printed conjunction, in rz_81's (a) ∧ (b) form.

```lean
/-- **L:RZ-N2b (ii)** — RZ §3, the parenthesis after (3.5), as corrected (CC-13): "while as
automorphisms they reverse the commutators' sign only up to the order of the product".
(a) For each of the four reflections σ (as in (i)), in any ring A that is a ℂ-algebra: the
relations (3.2)–(3.5) hold at the reflected tuple — the images of the four relations under the
automorphism extending σ — exactly when the four relations hold at (Ê, Ŝ, Ĥ, D̂) with iℏ
replaced by −iℏ AND each right-hand product reversed (ĤD̂ → D̂Ĥ, D̂Ê → ÊD̂, ÊŜ → ŜÊ, ŜĤ → ĤŜ);
that set is (3.2)–(3.5) read in Aᵐᵒᵖ at the op of (Ê, Ŝ, Ĥ, D̂).
(b) "only up to the order": for every real ℏ ≠ 0, some 2 × 2 complex matrices satisfy the
sign-and-order-reversed set and fail the set with the sign reversed and the order kept — so,
with (a), for every reflection the reflected relations are not the sign-reversed relations.
Relations inline only (Q7); the witness is RZ-81 (b)'s matrix form.

Served locus: §3, the sentence after display (3.5), PDF p09–p10 (printed folios 8–9); relations
(3.2)–(3.5) on PDF p09. PDF sha256 prefix: the corrected edition's, at the republish. -/
theorem rz_N2b_reflections_sign_up_to_order :
    (∀ {A : Type u} [Ring A] [Algebra ℂ A] (E S H D : A) (ħ : ℝ),
      -- the vertex reflection fixing Ê, Ĥ (Ŝ ↔ D̂)
      ((E * D - D * E = (Complex.I * (ħ : ℂ)) • (H * S) ∧   -- (3.2) under it
        D * H - H * D = (Complex.I * (ħ : ℂ)) • (S * E) ∧   -- (3.3) under it
        H * S - S * H = (Complex.I * (ħ : ℂ)) • (E * D) ∧   -- (3.4) under it
        S * E - E * S = (Complex.I * (ħ : ℂ)) • (D * H))   -- (3.5) under it
        ↔
       (E * S - S * E = (-(Complex.I * (ħ : ℂ))) • (D * H) ∧   -- (3.2), sign and order reversed
        S * H - H * S = (-(Complex.I * (ħ : ℂ))) • (E * D) ∧   -- (3.3), sign and order reversed
        H * D - D * H = (-(Complex.I * (ħ : ℂ))) • (S * E) ∧   -- (3.4), sign and order reversed
        D * E - E * D = (-(Complex.I * (ħ : ℂ))) • (H * S))) ∧   -- (3.5), sign and order reversed
      -- the vertex reflection fixing Ŝ, D̂ (Ê ↔ Ĥ)
      ((H * S - S * H = (Complex.I * (ħ : ℂ)) • (E * D) ∧   -- (3.2) under it
        S * E - E * S = (Complex.I * (ħ : ℂ)) • (D * H) ∧   -- (3.3) under it
        E * D - D * E = (Complex.I * (ħ : ℂ)) • (H * S) ∧   -- (3.4) under it
        D * H - H * D = (Complex.I * (ħ : ℂ)) • (S * E))   -- (3.5) under it
        ↔
       (E * S - S * E = (-(Complex.I * (ħ : ℂ))) • (D * H) ∧   -- (3.2), sign and order reversed
        S * H - H * S = (-(Complex.I * (ħ : ℂ))) • (E * D) ∧   -- (3.3), sign and order reversed
        H * D - D * H = (-(Complex.I * (ħ : ℂ))) • (S * E) ∧   -- (3.4), sign and order reversed
        D * E - E * D = (-(Complex.I * (ħ : ℂ))) • (H * S))) ∧   -- (3.5), sign and order reversed
      -- the edge reflection Ê ↔ Ŝ, Ĥ ↔ D̂
      ((S * E - E * S = (Complex.I * (ħ : ℂ)) • (D * H) ∧   -- (3.2) under it
        E * D - D * E = (Complex.I * (ħ : ℂ)) • (H * S) ∧   -- (3.3) under it
        D * H - H * D = (Complex.I * (ħ : ℂ)) • (S * E) ∧   -- (3.4) under it
        H * S - S * H = (Complex.I * (ħ : ℂ)) • (E * D))   -- (3.5) under it
        ↔
       (E * S - S * E = (-(Complex.I * (ħ : ℂ))) • (D * H) ∧   -- (3.2), sign and order reversed
        S * H - H * S = (-(Complex.I * (ħ : ℂ))) • (E * D) ∧   -- (3.3), sign and order reversed
        H * D - D * H = (-(Complex.I * (ħ : ℂ))) • (S * E) ∧   -- (3.4), sign and order reversed
        D * E - E * D = (-(Complex.I * (ħ : ℂ))) • (H * S))) ∧   -- (3.5), sign and order reversed
      -- the edge reflection Ŝ ↔ Ĥ, D̂ ↔ Ê
      ((D * H - H * D = (Complex.I * (ħ : ℂ)) • (S * E) ∧   -- (3.2) under it
        H * S - S * H = (Complex.I * (ħ : ℂ)) • (E * D) ∧   -- (3.3) under it
        S * E - E * S = (Complex.I * (ħ : ℂ)) • (D * H) ∧   -- (3.4) under it
        E * D - D * E = (Complex.I * (ħ : ℂ)) • (H * S))   -- (3.5) under it
        ↔
       (E * S - S * E = (-(Complex.I * (ħ : ℂ))) • (D * H) ∧   -- (3.2), sign and order reversed
        S * H - H * S = (-(Complex.I * (ħ : ℂ))) • (E * D) ∧   -- (3.3), sign and order reversed
        H * D - D * H = (-(Complex.I * (ħ : ℂ))) • (S * E) ∧   -- (3.4), sign and order reversed
        D * E - E * D = (-(Complex.I * (ħ : ℂ))) • (H * S)))) ∧   -- (3.5), sign and order reversed
    (∀ ħ : ℝ, ħ ≠ 0 → ∃ E S H D : Matrix (Fin 2) (Fin 2) ℂ,
      (E * S - S * E = (-(Complex.I * (ħ : ℂ))) • (D * H) ∧   -- (3.2), sign and order reversed
       S * H - H * S = (-(Complex.I * (ħ : ℂ))) • (E * D) ∧   -- (3.3), sign and order reversed
       H * D - D * H = (-(Complex.I * (ħ : ℂ))) • (S * E) ∧   -- (3.4), sign and order reversed
       D * E - E * D = (-(Complex.I * (ħ : ℂ))) • (H * S)) ∧   -- (3.5), sign and order reversed
      ¬
       (E * S - S * E = (-(Complex.I * (ħ : ℂ))) • (H * D) ∧   -- (3.2), sign only reversed
        S * H - H * S = (-(Complex.I * (ħ : ℂ))) • (D * E) ∧   -- (3.3), sign only reversed
        H * D - D * H = (-(Complex.I * (ħ : ℂ))) • (E * S) ∧   -- (3.4), sign only reversed
        D * E - E * D = (-(Complex.I * (ħ : ℂ))) • (S * H))) := by   -- (3.5), sign only reversed
  sorry
```

Both texts are generated from the data the sympy checks use and re-parsed after generation (`gen_final.py`: every Aᵐᵒᵖ side of (i) parses to the relator set; every image side of (ii)(a) parses to −(the R⁻ set); parentheses balance; each closing token sits before its line comment). Not elaborated (no Lean written by this seat): the Challenge-stage compile is the first elaboration — see the traps.

### 6 · (4) Route to proof
**(i)** — E0. For each of the four conjuncts: `simp only [← MulOpposite.op_mul, ← MulOpposite.op_sub, ← MulOpposite.op_smul, MulOpposite.op_inj]` turns each Aᵐᵒᵖ line into the anti-image in A (op E * op D − op D * op E = c • (op H * op S) ↦ D * E − E * D = c • (S * H)), which by the table of §3 is a relation of the set; then `tauto` (or `constructor <;> rintro ⟨h₁, h₂, h₃, h₄⟩ <;> exact ⟨_, _, _, _⟩` in the table's order). Fallback if `simp` will not fold the `op`s: apply `MulOpposite.unop_injective` to each Aᵐᵒᵖ equation and `simp [MulOpposite.unop_mul, MulOpposite.unop_sub, MulOpposite.unop_smul]`. Nothing beyond `simp`/`tauto`.

**(ii) (a)** — E0. For each reflection: `constructor <;> rintro ⟨h₁, h₂, h₃, h₄⟩ <;> refine ⟨?_, ?_, ?_, ?_⟩`, each goal closed by one hypothesis through `neg_sub` and `neg_smul`: e.g. σ₁, R⁻'s (3.5)-slot `D * E - E * D = (-c) • (H * S)` from h₁ : `E * D - D * E = c • (H * S)` by `rw [neg_smul, ← h₁, neg_sub]`, and the reverse direction symmetrically (`neg_inj`, or `linear_combination (norm := module) -h` as in rz_81's Solution). The pairing is the table of §3 (the automorphism and the anti-automorphism send each relation to the same partner). No `ring` on a noncommutative A is needed.

**(ii) (b)** — E1. `intro ħ hħ`; set τ := (ħ + Real.sqrt (ħ ^ 2 + 4)) / 2; `hτ : τ ^ 2 = ħ * τ + 1` from `Real.sq_sqrt (by positivity : (0 : ℝ) ≤ ħ ^ 2 + 4)` and `ring_nf`/`nlinarith`; `hτ0 : τ ≠ 0` (τ = 0 in hτ gives 0 = 1); cast `hτC : (τ : ℂ) ^ 2 = (ħ : ℂ) * τ + 1` by `exact_mod_cast`. Witness (the transpose of a model of (3.2)–(3.5)):
- E = `!![-(τ : ℂ) ^ 2, 0; 0, -1]`, S = `!![0, 0; 1, 0]`, H = `!![1, 0; 0, (τ : ℂ) ^ 2]`, D = `!![0, 0; Complex.I * τ, 0]`.

The four R⁻ equations: `ext i j; fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]`, then `linear_combination` with `hτC` and `Complex.I_sq` on the one live entry (1, 0) of each (e.g. the (3.2)-slot reads τ² − 1 = ħτ). The negation: take the (3.2)-slot of R₋ at entry (1, 0) — it reads ħτ = ħτ³ (left τ² − 1 = ħτ, right −iħ·τ²·iτ) — so ħτ(τ² − 1) = 0, i.e. (ħτ)² = 0 by hτ, against `mul_ne_zero hħ hτ0`. Symbolically: R⁻ residuals all 0 mod τ² − ħτ − 1; R₋ residuals at (1, 0): −ħ²(ħτ + 1), ħ²(ħτ + 1), iħ²τ, −iħ²τ — every one nonzero for ħ ≠ 0 (`witness_family.py`). Fallback with smaller arithmetic, if the √ step is costly: none at the same strength — an ∃ ħ form (ħ = 3/2, τ = 2: E = diag(−4, −1), S = e₂₁, H = diag(1, 4), D = 2i·e₂₁, Gaussian-integer entries) is weaker than the paper's arbitrary ℏ ≠ 0 and would need the wall's word.

### 7 · (5) Traps
1. **Aᵐᵒᵖ, or a direct product-reversal predicate, for (i)?** Aᵐᵒᵖ. Written directly in A, the four anti-images ARE (3.2)–(3.5) (the table), so the direct form collapses to a reordering of the conjunction — indistinguishable from N2a's statement, with no trace of the reversal in Lean and the whole fidelity left to the spec's hand table. Through Aᵐᵒᵖ the reversal is in the statement (mathlib's own carrier for anti-homomorphisms, `op_mul : op (x * y) = op y * op x`), and the form discriminates: the same Aᵐᵒᵖ statement for a rotation, or for any of the sixteen relabelings outside D₄, is false (`s4_scan.py`). For (ii)(a) the inline form is the right one: there the sign and the order are the printed content, and an Aᵐᵒᵖ form would hide the sign (R⁻ at t is (3.2)–(3.5) in Aᵐᵒᵖ at op t — said in the docstring, so V₂ sees the link).
2. **Literally permuted, or equivalent forms?** (i): literally permuted — relator to relator, no sign, no scalar. (ii): the images are equivalent forms, not relations of the set — each is the negative of an R⁻ relator, so (ii)(a) needs `neg_sub`/`neg_smul`, not reordering alone. A V₂ reading (ii)(a) as "a reordering" has misread it.
3. **↔ binds looser than ∧** (↔ at 20, ∧ at 35): each reflection's iff is parenthesised, `((R) ↔ (R')) ∧ …`. Without the outer parentheses the four iffs re-associate into a different (and weaker) statement. Check this at the Challenge diff.
4. **Line comments swallow closers.** Every `)`, `∧` and `:= by` sits before its `--` comment in the texts above; keep it so in the Challenge (an early draft of this spec had `:= by` inside a comment — caught by the regeneration check).
5. **The negated scalar** is written `(-(Complex.I * (ħ : ℂ))) • x`, parenthesised, so the reading never depends on the precedence of prefix `-` against `•`; the two parses are equal anyway by `neg_smul`.
6. **SMul on Aᵐᵒᵖ:** `•` may elaborate through `MulOpposite.instSMul` or through `Algebra.toSMul` of `MulOpposite.instAlgebra` (whose definition carries `set_option backward.isDefEq.respectTransparency false` at the pin); they agree definitionally (`op_smul` is `rfl`), but if `simp` stalls, rewrite `op_smul` by hand or go through `unop_injective`. `open MulOpposite in` puts only `MulOpposite.op` in scope (not `AddOpposite.op`; the file's :281 `op_mul` is the additive twin).
7. **ħ ≠ 0 in (b) only.** (i) and (ii)(a) are identities of the presentation for every ħ (ħ = 0 included); (b) is false at ħ = 0, where R⁻ = R₋.
8. **The witness satisfies R⁻, not (3.2)–(3.5).** It is the transpose of a model of the paper's relations; (a) is what ties it to the reflections. An alternative (b) — for each σ, a model u of (3.2)–(3.5) with ¬R₋(σu), four negated blocks (≈ 20 more lines) — carries the same content given (a); the reflection-free form is chosen for length. If V₁ prefers the per-reflection form, the same matrices (transposed) serve.
9. **Universe.** (ii)'s inner `∀ {A : Type u}` is rz_81's form, with `universe u` declared in the unit; follow it rather than trying `Type*` inside the statement.
10. **Q7.** No `structure`/`class` for the operator algebra; the relations inline only; Aᵐᵒᵖ is mathlib's opposite of an arbitrary A, not an operator-algebra object; the witness is rz_81 (b)'s matrix form. V₁ on N2a noted that Q7's text names negative results only and inline relation-set symmetry statements are admitted on the same footing — this leg rides that note.
11. **Edition.** At this seat's stamp the served PDF still prints the old sentence; nothing here is read from it. If the served corrected edition's wording differs from the source :185 / `8346ab41` / `6b89ce0e` text, this spec is re-read before V₂.

### 8 · (6) The unit — NEW: U14 `RiemannZeta/CorrectedReflections`
**Recommended: a new unit; no frozen signature moves.** U11 `RiemannZeta/Corrected` is not the home, and this seat finds no reason the lane's rule admits for amending it:
1. **U11 is V₂-signed and proved** (statement_sha256 `7f9a7838…`, signed 2026-10-28T23:10:17Z; proved at commit 9758579, `manifests/build-9758579.json`, comparator PASS; V₃ CLEAN). Adding a theorem supersedes its signed digest — the rz_46a path (`statement_sha256_superseded:` / `v2_signed_superseded:`, a fresh V₂ of the whole Challenge, a rebuild). The lane allows that path, but only for a reason; there is none here: N2b needs nothing from U11 (no shared definition, no import), and
2. **today's republish flips U11's two rows** (word 1: RZ-33 and RZ-41 whole, 52 of 52). Re-signing U11 the same day would put that flip on a re-signed digest and couple N2b's V₂ to two rows that are ready to count.
3. **U12 `RiemannZeta/Accepted`** (N2a's home) is CHECKED (commit 9758579) — the same reasoning, stronger.
4. **The new unit stands alone:** `import Mathlib` only, no definitions, two theorems; one V₂, one build entry, one manifest line — the U9/U10/U11 precedent for rows that stand alone.

The orchestrator adds `import RiemannZeta.CorrectedReflections.Challenge` to `RiemannZeta.lean`, `comparator.json` (the two theorem names) and `formalization.yaml` (row L:RZ-N2b, CC-13).

### 9 · (7) Class and size
**NOW-class.** (i) E0 ≈ 0.1 pd; (ii)(a) E0 ≈ 0.1 pd; (ii)(b) E1 ≈ 0.25–0.5 pd (the √ and four 2 × 2 matrix identities). Leg total **E1, ≈ 0.5–0.75 pd**, unmeasured. When the corrected edition is served and the leg lands CHECKED, L:RZ-N2 has its N2a and N2b legs built and N2c NOT A TARGET (the wall's standing word), so the row counts: **RZ 53 of 53** if the route holds.

### 10 · Status
SPEC-DRAFT (corrected text, CC-13) 2026-10-29T17:53:23Z — unit U14 (new); the flip waits on the corrected edition being served. V₁ appends its own line.

M: M-SPEC 2026-10-29T17:53:23Z — two theorems, `rz_N2b_reflections_anti_automorphism` ((i): the four reflections as anti-automorphisms, through Aᵐᵒᵖ, carry (3.2)–(3.5) to one another, literally) and `rz_N2b_reflections_sign_up_to_order` ((ii)(a): as automorphisms, the reflected relations ⟺ the sign-AND-order-reversed set; (ii)(b): for every ħ ≠ 0 a 2 × 2 witness separates that set from the sign-only set — the "only"). All four reflections of D₄; the D₄ picture exact over the 24 relabelings (sympy scan). New unit U14 `RiemannZeta/CorrectedReflections`; E1, ≈ 0.5–0.75 pd. Read against the corrected text only (source :185; draft `8346ab41` and publish build `6b89ce0e`, p09–p10); the served `2d5287e7` still prints the old sentence. No Lean written; statements unelaborated. Scratch: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/m-n2b/`.

V1: V1-GREEN 2026-10-29T18:00:59Z — ship build `6b89ce0e` p08–p11, §3 read whole first; both statements faithful to the corrected sentence. (i) `rz_N2b_reflections_anti_automorphism`: "the reflections of the 4-cycle" = the four reflections of D₄. The sentence uses the square's vocabulary (it calls the S₄ rotoreflection "that rotation"); with N2a, the edge pair adds nothing beyond the vertex pair. The ∀-algebra iff into Aᵐᵒᵖ is the universal-property form of "a ℂ-linear anti-automorphism carries the relations to one another", the same semantic convention as N2a; all 16 Aᵐᵒᵖ lines match the computed anti-images (sympy, relator to relator, sign +). (ii) `rz_N2b_reflections_sign_up_to_order`: (a) images ⟺ R⁻ (sign and order reversed) for all four, 16 + 16 lines matched; (b) ∀ ħ ≠ 0, a witness of R⁻ ∧ ¬R₋ — the "only" at the paper's strength, equivalent with (a) to the per-reflection form; witness checked for symbolic ħ, and its transpose models (3.2)–(3.5). (a) is the same fact as (i) through op and stays: it is the printed clause and the only tie of (b) to the reflections. Precedence and parentheses checked; unelaborated (no Lean here). Unit: AGREE, new U14. Docstring sha prefix to be filled from the served edition at the flip. Sheet `specs/_V1-RZ-N2b.md`.
V2: V2-GREEN 2026-10-29T18:15:37Z — served corrected edition `6b89ce0e` p09–p10 read first (§3 whole). Both statements say what the corrected sentence says, no stronger and no weaker. (i) `rz_N2b_reflections_anti_automorphism` (Challenge.lean:42–84): for all four reflections of the square (σ₁ Ŝ ↔ D̂; σ₂ Ê ↔ Ĥ; σ₃ Ê ↔ Ŝ, Ĥ ↔ D̂; σ₄ Ŝ ↔ Ĥ, D̂ ↔ Ê), R at t ⟺ R in Aᵐᵒᵖ at op σt. All 16 Aᵐᵒᵖ lines, unfolded by op x * op y = op (y * x), are relations of (3.2)–(3.5) with sign +, a bijection (own sympy). The `•` on Aᵐᵒᵖ is ℂ-linear (`rfl`). (ii) `rz_N2b_reflections_sign_up_to_order` (:102–154): (a) all 32 lines match; every automorphism image is −(an R⁻ relator) and none is ± a relator of R or R₋. (b) ∀ ħ ≠ 0, a 2 × 2 witness of R⁻ ∧ ¬R₋, checked symbolically: the "only" at the paper strength. (a) stays as the clause's own assertion (V₁ (d)). Four reflections versus two: under the T_d-mirror reading the edge pair is entailed by the same sentence's rotation invariance. Parentheses and universes confirmed by a `lake env lean` shape probe, exit 0. yaml/comparator consistent. SIGNED: statement_sha256 `b6fb5ea6f8999345bc5115b48366496338b34661b774bed2d9514fc46e9615f5` (= draft), `v2_signed: "2026-10-29T18:15:37Z"`. Sheet `specs/_V2-U14.md`.

L-proofs: PROVED 2026-10-29T18:23:43Z — both theorems in `RiemannZeta/CorrectedReflections/Solution.lean` (sha256 efc6df01…), which imports `Mathlib` only and not the Challenge: (i) `rz_N2b_reflections_anti_automorphism` by the §6 route as written — `simp only [← op_mul, ← op_sub, ← op_smul, op_inj]` folds each Aᵐᵒᵖ line to its anti-image, then `tauto` per reflection; (ii)(a) through one helper `aux_flip` (X Y − Y X = (−c) • Z W ⟺ Y X − X Y = c • Z W, by `neg_smul`, `neg_sub`, `neg_inj`) and `tauto`; (ii)(b) the spec's τ and witness unchanged, R⁻ entrywise with the live entry (1, 0) by `linear_combination` (τ² = ħτ + 1, i² = −1), ¬R₋ from the (3.2)-slot at (1, 0): (ħτ)² = 0 against ħ ≠ 0, τ ≠ 0. Four route departures (helper for (ii)(a); τ by ∃; plain `simp`; a stated `simpa` for the linter), none in a statement. Build exit 0, no warning; axioms [propext, Classical.choice, Quot.sound]; Comparator "Your solution is okay!" (unsandboxed shim). Challenge sha256 `b6fb5ea6…15f5` unchanged. Log: `RiemannZeta/CorrectedReflections/BUILD-LOG.md` §Proofs phase.
V3: V3-CLEAN 2026-10-29T18:31:07Z — post-proof fidelity, fresh seat; served corrected edition `6b89ce0e` p08–p11 (§3 whole) read first. (i) `rz_N2b_reflections_anti_automorphism`: true for the paper's reason — the `op` fold is the opposite ring's definition (product reversal is the carrier), after which each Aᵐᵒᵖ line is literally a relation of (3.2)–(3.5) and `tauto` only permutes; probe P1 ascribes the term to R t ⟺ R(op σt) definitionally, and the same form for the rotation is false in a concrete 2 × 2 model of (3.2)–(3.5) (the statement discriminates). ℂ-linear (`op_smul` rfl); an antilinear reading would make (i) false. σ₃, σ₄ fix two relations each: "carry … to one another" is set-invariance, the theorem claims no more. (ii)(a): `aux_flip` is commutator antisymmetry — reversing the sign IS reversing the arguments — so each R⁻ line is literally an automorphism image; same fact as (i) through op (probe P3), the proof adds and hides nothing. (ii)(b): witness recomputed (symbolic ħ; exact at ħ = 37/100, −5/2, 3/2): R⁻ exact, all four R₋ relations fail at (1, 0); the negation is the real contradiction (ħτ)² = 0, cast only through ℝ → ℂ injectivity. "Only" at the paper's strength (∀ ħ ≠ 0, ∃ witness); the per-realization strengthening holds for non-vanishing products (P5, proved; tag). Axioms [propext, Classical.choice, Quot.sound]; grep 0 hits; Challenge b6fb5ea6 and Solution efc6df01 unchanged. Sheet `specs/_V3-U14.md`.
