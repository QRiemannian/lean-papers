# L:RZ-N2b (corrected text, CC-13; proposed unit U14 `RiemannZeta/CorrectedReflections`) — seat V₁ (spec fidelity, fresh context)

- seat: V₁ for L:RZ-N2b, dispatched by Orchestrator A 2026-10-29 in the Lean lane; method `lean-scoping/seats/TEMPLATE-V1-spec-fidelity.md` (with the sitting-71 scratch addendum); house form of `specs/_V1-U11.md` and `specs/_V1-NEW-ROWS.md`
- seat opened 2026-10-29T17:57:05Z (`date -u`); V1 line and this file written 2026-10-29T18:00:59Z+
- digests (`shasum -a 256`): ship build `Orchestrator/Papers/restructure/publish/riemann-zeta-tetrahedral-maynard-PUBLICATION.pdf` = `6b89ce0e7ae0a71301a8d792b6e80f4cb850244df83f4731810377d70e3d2d12` MATCH the brief's prefix. At 18:00:44Z the site tree's `qriemannian-site/public/pdfs/riemann-zeta-tetrahedral.pdf` reads the same `6b89ce0e…2d12`. Whether that file is deployed live was not checked (no web).
- read first, before the spec: `pdftotext -layout` of the ship build, p08–p11 (cover = p01), §3 whole: the eigenvalue table, (3.1), (3.2)–(3.5), the sentence after (3.5) across the p09/p10 break, "Non-factorizability", "Arithmetic origin". The sentence is the corrected text: "… invariant under that rotation (a cyclic subgroup of order 4 of T_d ≅ S4; the reflections of the 4-cycle, acting as anti-automorphisms — reversing the order of products — carry the four relations to one another, while as automorphisms they reverse the commutators' sign only up to the order of the product), not under all of T_d; the pairs [Ê, Ĥ] and [Ŝ, D̂] are left unspecified (§13.3)."
- then read: `specs/RZ-N2b.md` whole (the CC-CANDIDATE lines and the V1-CC line of 2026-10-28, then the M section of 2026-10-29); `specs/RZ-N2a.md`; `RiemannZeta/Accepted/Challenge.lean` (`rz_N2a_rotation_invariant`); `RiemannZeta/NoGo/Challenge.lean` (`rz_81`'s (a) ∧ (b) form, `universe u`); `specs/_V1-U11.md`, `specs/_V1-NEW-ROWS.md` (head and the N2 rows); `formalization.yaml` / specs for unit numbering (U13 = MS Accepted, so U14 is the next free number)
- own checks (scratch, `/opt/homebrew/bin/python3 -I -B`, sympy noncommutative): `check.py` (each reflection's anti-images and automorphism images, matched against the relator set, against R⁻ and against R₋; an S4 scan); `parse.py` (every equation in the spec's two Lean texts parsed and matched against the computed tuples; parenthesis balance with comments stripped; no `:= by` / closer inside a line comment); `witness.py` (the (b) witness for general ħ modulo τ² − ħτ − 1, plus exact checks at ħ = 3/2, −2, 1/7, 5; the transpose against (3.2)–(3.5))
- no Lean written, no `lake`, no git, no web, nothing under the lab's non-public research trees

## Verdict per statement

| statement | printed clause (ship build `6b89ce0e`, p09–p10) | verdict | note |
|---|---|---|---|
| `rz_N2b_reflections_anti_automorphism` (i) | "the reflections of the 4-cycle, acting as anti-automorphisms — reversing the order of products — carry the four relations to one another" | **V1-GREEN** | Four reflections. For each one: R at t ⟺ R in Aᵐᵒᵖ at op σt, over every ℂ-algebra, i.e. the ℂ-linear anti-automorphism extending σ maps the presented relation set onto itself. All 16 Aᵐᵒᵖ lines match the computed anti-images. |
| `rz_N2b_reflections_sign_up_to_order` (ii) | "while as automorphisms they reverse the commutators' sign only up to the order of the product" | **V1-GREEN** | (a): images under the automorphism ⟺ R⁻ (sign AND product order reversed), for all four reflections. (b): for every real ħ ≠ 0 a 2 × 2 witness of R⁻ ∧ ¬R₋ (the "only"). All 32 lines match. The witness checks for general ħ. |

**Count:** 2 GREEN · 0 DRIFT · 0 RESTATE · 0 CC. Unit AGREE (new U14). The leg is ready for L statements. The docstrings' sha256 prefix is still a placeholder; it is filled from the edition served at the flip (see (e)).

## Findings (a)–(g)

**(a) "the reflections of the 4-cycle": all four reflections of D₄. The print supports four.**
- The sentence uses the square's vocabulary, not the tetrahedron's. It calls the 4-cycle Ê → Ŝ → Ĥ → D̂ → Ê "that rotation", though in T_d ≅ S4 a 4-cycle of vertices is an S₄ rotoreflection, not a proper rotation. In that vocabulary, "the reflections of the 4-cycle" are the four reflections of the square:
  - two vertex reflections: Ŝ ↔ D̂ and Ê ↔ Ĥ (in T_d, the two σ_d mirror planes);
  - two edge reflections: Ê ↔ Ŝ, Ĥ ↔ D̂ and Ŝ ↔ Ĥ, D̂ ↔ Ê (in T_d, the two C₂′ proper rotations).
- A strict T_d-mirror reading would name only the first two. The two extra conjuncts add no independent content: each edge reflection is a vertex reflection composed with a rotation. Given N2a's rotation invariance, an anti-automorphism composed with an automorphism is again an anti-automorphism carrying the relation set to itself.
- So four is the print's reading, and it is not stronger in substance than two.
- The earlier hands (CC-candidate and V1-CC lines, 2026-10-28) checked one of each class (vertex Ŝ ↔ D̂, edge Ê ↔ Ŝ, Ĥ ↔ D̂). Their "both reflection types" is the same D₄ picture.
- `check.py`, S4 scan: the relator set is kept literally (relator to relator, sign +) as automorphisms by exactly the four rotations, and as anti-automorphisms by exactly the four reflections, among all 24 relabelings. This agrees with M's scan.

**(b) Is the Aᵐᵒᵖ statement the content of "acting as anti-automorphisms … carry the four relations to one another", and is Aᵐᵒᵖ the right carrier? Yes and yes.**
- *What the iff says.* The ∀-over-algebras iff R(t) ⟺ R_{Aᵐᵒᵖ}(op σt) is the universal-property form of "σ extends to an anti-automorphism of the presented algebra". Take A = the presented algebra and t = its generators: (→) gives a homomorphism into Aᵐᵒᵖ sending X ↦ op σX, i.e. an anti-endomorphism extending σ. σ is an involution, so it is an anti-automorphism.
- *Literal versus semantic.* The paper says the relations are "carried to one another", which is a literal permutation. The table (`check.py`, identical to M's §3 table) shows the permutation is literal: each anti-image is a relator of the set, sign +, no scalar. The iff is the semantic form of that fact. This is the same convention N2a's statement uses for "invariant under that rotation", signed V1/V2/V3 there.
- *Trap 1 holds.* Written directly in A, the anti-images ARE (3.2)–(3.5) reordered, so a direct product-reversal predicate is a reordering of the conjunction, the same shape as `rz_N2a_rotation_invariant`. Nothing of "reversing the order of products" would be visible in Lean. Aᵐᵒᵖ puts the reversal in the statement through mathlib's own carrier (`op_mul : op (x * y) = op y * op x`).
- *Convention confirmed: ℂ-linear.* `MulOpposite.instAlgebra` makes the anti-automorphism ℂ-linear. That is the plain sense of "anti-automorphism — reversing the order of products". An antilinear (adjoint-type) anti-automorphism would send iℏ to −iℏ and would not carry the relations to themselves. The print says nothing of conjugation, so the ℂ-linear reading is the faithful one.
- *Line-by-line check.* `parse.py`: the Aᵐᵒᵖ side of reflection k is exactly (3.2)–(3.5) at (op σₖÊ, op σₖŜ, op σₖĤ, op σₖD̂), in the order σ₁, σ₂, σ₃, σ₄ that the comments name.

**(c) Is M's (a) ∧ (b) the content of "as automorphisms they reverse the commutators' sign only up to the order of the product"? Yes, at the paper's strength.**
- *(a).* σ₁ sends (3.2) to [Ê, D̂] = iℏ ĤŜ. The set has [D̂, Ê] = iℏ ŜĤ. So the image is the set's relation with the commutator's sign reversed AND its product reversed. That is the printed "reverse the commutators' sign … up to the order of the product".
  - (a) states: the relations hold at σt ⟺ R⁻ holds at t.
  - `check.py`: every automorphism image equals −(an R⁻ relator); none equals ±(a relator of R or of R₋).
  - `parse.py`: the 16 image lines are σₖ applied to (3.2)–(3.5); the 16 R⁻ lines are (E, S | D, H), (S, H | E, D), (H, D | S, E), (D, E | H, S) with `-(I ħ)`.
- *(b), the "only".* The negation of the exact reading ("the images ⟺ R₋") is what "only" adds. (b) supplies it: for every ħ ≠ 0, some t has R⁻(t) ∧ ¬R₋(t). With (a), the same t gives R(σt) ∧ ¬R₋(t) for all four σ at once. Given (a), the reflection-free (b) is equivalent to the per-reflection form (∃ t, R(σt) ∧ ¬R₋(t), for each σ). It is not weaker.
- *Strength of (b).* The quantifier ∀ ħ ≠ 0 is the paper's strength: the paper's ℏ is an unspecified real constant, nonzero as everywhere in the lane (rz_80, rz_81). An ∃ ħ form would be weaker; M's §6 says the same.
  - At ħ = 0, R⁻ = R₋, so "only" is false there and the exclusion is right.
  - The witness happens to fail all four R₋ relations, not just their conjunction. The R₋ residuals at entry (1, 0) are −ħ²(ħτ + 1), ħ²(ħτ + 1), iħ²τ and −iħ²τ, each nonzero since ħτ + 1 = τ² and τ ≠ 0. A per-relation "only" would also hold, but the print does not ask for it.
- *Witness checks* (`witness.py`). τ = (ħ + √(ħ² + 4))/2 satisfies τ² = ħτ + 1 (simplify → 0). R⁻ has zero residuals modulo τ² − ħτ − 1 for symbolic ħ. Exact R⁻ ✓ and R₋ ✗ at ħ = 3/2, −2, 1/7, 5. The transpose satisfies (3.2)–(3.5) (zero residuals), so M's V3 tag about a non-degenerate model by transposition holds.

**(d) M's note that (i) and (ii)(a) are one fact through op: true. (a) is redundant with (i) as mathematics, and should stay.**
- R holds in Aᵐᵒᵖ at op u ⟺ R⁻(u). So (i) reads R(t) ⟺ R⁻(σt). Substitute t := σt (σ is an involution) and it becomes (ii)(a).
- Keep (a) anyway, for two reasons:
  1. The "while" clause is a printed assertion of its own, and each printed clause gets its statement. N2a and the U11 legs follow the same practice.
  2. (b) is reflection-free. Inside the Lean theorem, (a) is the only thing that ties (b) to the reflections. Drop (a) and theorem (ii) says only "R⁻ ≠ R₋", which is not about automorphisms at all.
- The independent content of the "while" clause is (b), as M says. V₂ should read (a) as "the same fact as (i), stated in the clause's own terms", not as new content.

**(e) Conventions. All the lane's, and all fine.**
- ħ : ℝ, read as the paper's real ℏ, with iℏ = `Complex.I * (ħ : ℂ)` (U5, U12).
- `[Ring A] [Algebra ℂ A]` (U5, U12); the commutator is XY − YX.
- Universes:
  - (i) binds `{A : Type*}` at the theorem, as N2a does.
  - (ii) quantifies `∀ {A : Type u} [Ring A] [Algebra ℂ A]` inside the conjunction, as rz_81 does, with `universe u` declared in the unit header.
  - The two forms differ in shape but both are universe-polymorphic. Nothing to change.
- Precedence:
  - ↔ (20) binds looser than ∧ (35). Every iff is wrapped as `((R) ↔ (R')) ∧ …`.
  - The parenthesis balance is 0 in both texts (comments stripped). The outer groups close at the points M names.
  - `¬` followed by a parenthesised conjunction is fine.
  - `(-(Complex.I * (ħ : ℂ))) • x` has no prefix-minus ambiguity.
  - No `:= by`, `)` or `∧` sits inside a line comment.
- `open MulOpposite in` before a doc-commented theorem is the `… in` command form U5 already uses (`attribute [...] in`).
- Not confirmed by this seat: elaboration. No Lean was run here. The Challenge compile is the first elaboration (M's traps 6 and 9).
- Edition: the docstrings carry "PDF sha256 prefix: the corrected edition's, at the republish". At the flip that placeholder becomes the served edition's prefix. The ship build read here is `6b89ce0e`, and the site tree holds the same file at 18:00:44Z. M's trap 11 applies only if the served wording differs from the text above.

**(f) The unit: AGREE, a new unit U14 `RiemannZeta/CorrectedReflections`.**
- U14 is the next free number (U13 = MS `Accepted`).
- Housing the leg in an existing unit would supersede a signed `statement_sha256`:
  - U11 `Corrected` is V₂-signed and proved, and its two rows flip at today's republish.
  - U12 `Accepted` (N2a's home) is CHECKED.
- That supersession is the rz_46a path, and it needs a reason. The leg gives none: it imports nothing, shares no definition and uses no restated `def`.
- A stand-alone unit is the U9/U10/U11 precedent. I find no lane rule that says otherwise.

**(g) What the sentence says and the statements do not, and the reverse.**
- *Printed but not stated:*
  - The literal relator-to-relator permutation. It is stated semantically, as in N2a; the table and `check.py` carry the literal fact.
  - That these four are the only symmetries of each kind, and that T_d as a whole is not a symmetry. Both are N2c's territory ("not under all of T_d"), so this is correct scoping.
  - That the reflections lie in T_d. They are relabelings of four letters, which is trivial.
- *Stated but not printed:*
  - The 2 × 2 complex matrices in (b), as an existential. This is rz_81 (b)'s house form; any witness does the work.
  - The non-degenerate model of (3.2)–(3.5) by transposition. Lean does not state it; M's §3 and its V3 tag declare it.
- Neither direction carries anything that moves the verdict.

## What I did not read
- The markdown source `Orchestrator/Papers/restructure/riemann-zeta-tetrahedral-maynard.md` :185.
- The pass-2 draft PDF `8346ab41…`. I read only the ship build `6b89ce0e`.
- The CC-13 entry in `REKEY-2026-10-28.md`, and the wall's word file `WORD-wall-2026-10-29-read-and-ship.md`.
- M's scratch scripts (`refl_check.py`, `s4_scan.py`, `witness*.py`, `gen_final.py`). I wrote my own.
- The mathlib tree at the pin. M's name-check table (§4) is not re-checked here.
- The served (deployed) edition over the web.

## Misses / limits
- No elaboration. The statements' Lean well-formedness rests on the parse check above and on M's notes. The `•` on Aᵐᵒᵖ (instance path, trap 6) and the inner-∀ instance binders (trap 9) are first exercised at the Challenge compile.
- The sympy checks are relator-level and witness-level. The "∀ A" iffs are argued, not machine-checked. Their proofs are E0 by M's route.

## Tags
- **V1** — the V₁ template's one question names "the SERVED paper", and its digest line pins RZ to `2d5287e7…3e54`. For corrected-text seats, the served file still prints the old sentence when the seat reads the ship build, as this seat and V₁-U11 both did. A "corrected edition" arm for the template would let the seat name the edition read and the re-read trigger without improvising: read the ship or draft digest, re-read at the flip only if the served wording differs.
- **V3** — M's tag confirmed independently: the transpose of the (b) witness, E = diag(−τ², −1)ᵀ, S = e₁₂, H = diag(1, τ²), D = iτ e₁₂, satisfies (3.2)–(3.5) for every real ħ, with all four matrices nonzero and E, H invertible. It is a non-degenerate 2 × 2 model of the four relations, beyond rz_81 (b)'s six-relation model. Orthogonal to the leg.
- **V8** — `pdftotext -layout` renders the hats with a stray space (e.g. "𝑆 ̂"). The relations read cleanly, but a grep for "Ŝ" misses them, so search the layout dump by display number. Noncommutative `sympy.symbols(..., commutative=False)` is enough to match relators by `expand(a − b) == 0` with no ordering artefacts.

## Scratch (named for a later stage)
`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/v1-n2b/`:
- `rz.txt` — ship build p08–p11
- `check.py` — the reflection and S4 tables
- `parse.py` — the spec's Lean text, parsed and matched
- `witness.py` — the (b) witness and its transpose
