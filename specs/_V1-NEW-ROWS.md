# NEW rows (Lane 4) — seat V₁ (spec fidelity, fresh context)

- seat: V₁, dispatched by Orchestrator A for Lane 4 of the wall's word (`priority/inbox/WORD-wall-2026-10-28-now-wave-words.md`); method `lean-scoping/seats/TEMPLATE-V1-spec-fidelity.md` (with the sitting-71 scratch addendum)
- seat opened 2026-10-28T20:39:22Z (`date -u`); placeholder written 20:45:22Z; V1 lines appended 2026-10-28T20:50:09Z; this file written 2026-10-28T20:51:24Z
- digests with `shasum -a 256` at 20:39Z: RZ `qriemannian-site/public/pdfs/riemann-zeta-tetrahedral.pdf` = `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54` MATCH; MS `modular-surface-characterization.pdf` = `b4841489ec6bea619f8d5525ce4c788b86e0109e51d6e9d2cb252690f5b13af5` MATCH
- every page dumped by `pdftotext -layout` (cover = p01) and the loci read BEFORE the sheet (only the sheet's locus tokens were extracted first, by grep): RZ p03, p08, p09, p10, p11, p12, p19, p20, p21, p22, p34, p38; MS p02, p03, p09, p10, p11, p14, p18, p19, p20, p21, p26
- independent recomputation (mpmath 1.3.0, 50–120 digits): the RZ-N1 lengths and least traces; the ζ(5) identity; |φ(1/2 + it)|, φ near 1/2, φ(ρ₁); g_c; the Mayer–Gauss Fredholm determinants at s = 3/2, 5/2 in the Taylor basis at z = 1 (Mayer's disc), converged at N = 50 to 25 digits; Z(3/2)/Z(5/2) twice — from the determinants and from an enumeration of the 78,441 primitive hyperbolic classes of PSL(2, ℤ) with trace ≤ 1000 plus a tail estimate; the zeros of ζ and of L(s, χ5) on the critical line up to t = 40; the Hecke closed form at 1/2, 2, 0, −2, −4. Mathlib pin `db584cd6` spot-checks: `Real.arcosh` / `strictMonoOn_arcosh`, the `∑'` body precedence (67), `riemannZeta_conj`, `completedRiemannZeta_one_sub`, `riemannZeta_ne_zero_of_one_le_re`; no Selberg zeta, Mayer operator, nuclear operator, non-holomorphic Eisenstein series or ζ(1/2) ≠ 0 at the pin.
- no git, no web, nothing under the lab's non-public research trees; M's reasoning read only as the sheet and the specs, after the pages.

## Per-row verdicts (spec rows carry a `V1:` line)

| row / leg | M's disposition | V₁ verdict | reason in one line |
|---|---|---|---|
| RZ-N1 | full spec, NOW | **V1-GREEN** | least-trace pairing is the print's (it is what gives "not in the discriminant" content); 2.6339158 / 3.5254943 recomputed, margin 5.65 × 10⁻⁶ |
| RZ-N2 (split a/b/c) | 3 legs | **V1-SPLIT-OK** (a, b) · class disagreement on c | — |
| RZ-N2a | full spec, NOW | **V1-GREEN** | the iff is the relation set reordered under ρ; Q7 inline, no object |
| RZ-N2b | CC-CANDIDATE (= CC-13) | **V1-CC** (agree) | both reflection types reverse the sign only with the product's order reversed |
| RZ-N2c | NOT A TARGET (Q7) | **V1-DISAGREE-CLASS** → a target, NOW-class (E0, ≈ 0.25 pd) | a counter-model is a negative result about the relations, the RZ-81 (b) form; witness below |
| RZ-N3 | full spec, OUT-OF-Q5 | **V1-GREEN**; concur OUT-OF-Q5 | coefficients and signs as printed; 50 digits, difference 0; tsum parse confirmed |
| RZ-N4 (split a/b/c) | 3 legs | **V1-SPLIT-OK** | — |
| RZ-N4a | ALREADY CARRIED (`rz_47`) | **V1-GREEN** (claim true) | conjunct 1 (pole at ρ/2) and conjunct 4 (re ≠ 1/2); CHECKED at 5c6a9cd |
| RZ-N4b | full spec, NOW | **V1-GREEN** | Λ-convention of (7.5); the s = 1/2 exclusion is equivalent under the L:RZ-33a rule |
| RZ-N4c | CITED | **V1-GREEN** (class) | scattering/Lax–Phillips language; its unit-modulus half is N4b's content glossed |
| RZ-N5 | CITED (= MS-N4) | **V1-GREEN** (class) | Selberg zeta, Mayer's determinant, Lewis–Zagier: none at the pin |
| RZ-N6 | COMP | **V1-GREEN** (card unambiguous) | recomputed A = 0.6629522627, B = 0.8349229736; each rounds to its print; A ≠ B |
| MS-N1 | CITED | **V1-GREEN** (class) | the pin's Eisenstein series are holomorphic weight-k only; no geodesic periods |
| MS-N2 (split a/b) | 2 legs | **V1-SPLIT-OK** | — |
| MS-N2a | full spec, NOW | **V1-GREEN** | the limit reading is the print's own sense of "vanishes", not a repair (weighed below) |
| MS-N2b | CITED (inherits MS-N1) | **V1-GREEN** (class) | the period equals the closed form only through Hecke's formula |
| MS-N3 | full spec, NOW | **V1-GREEN** | both printed forms; `ms_22` hypothesis house form; no value smuggled |
| MS-N4 | CITED (= RZ-N5) | **V1-GREEN** (class) | as RZ-N5 |
| MS-N5 (split a/b) | 2 legs | **V1-SPLIT-OK** | — |
| MS-N5a | full spec, NOW | **V1-DRIFT** (weaker by "further") | t = 0 not itself a ζ·L zero is not carried; fix by a §6 declaration (recommended) or a conjunct |
| MS-N5b | COMP | **V1-GREEN** (card unambiguous) | 32.93506159 / 33.00045601, gap 0.06539, closest across ζ/L, ζ/ζ and L/L pairs |
| MS-24b | DONE (U8) | **V1-GREEN** (DONE confirmed) | `ms_24b` states (3.9) at five decimals; distance 2.509 × 10⁻⁶; counting caveat below |

**Count:** 7 spec legs read — 6 GREEN (RZ-N1, N2a, N3, N4b, MS-N2a, MS-N3), 1 DRIFT (MS-N5a); 1 CC agreed (RZ-N2b = CC-13), **0 new CC** (one optional scope note); 1 class disagreement (RZ-N2c); 4 splits, all SPLIT-OK; every CITED, COMP and ALREADY-CARRIED class confirmed; MS-24b confirmed.

## Weighings asked for

**MS-N2a — is "vanishes" as a limit the print's reading, or a repair?** The print's. The printed sentence is about a function of s ("its Eisenstein period vanishes at every nontrivial zero ρ with Re ρ ≥ 1/2"); for a function analytic or meromorphic in s, "vanishes at ρ" means "has a zero at ρ". At every ρ ≠ 1/2 with Re ρ ≥ 1/2 the closed form is holomorphic at ρ — Γ(ρ/2), Γ(ρ) finite, Γ(ρ) ≠ 0, L(·, χ5) entire, ζ(2ρ) ≠ 0 because Re 2ρ ≥ 1 and 2ρ ≠ 1 — so "tends to 0 on the punctured neighbourhood" is exactly "continuous at ρ with value 0", the literal pointwise content of the printed mathematics. The paper uses the limit sense itself in the caption of the same figure: "the pole of ζ(2s) at s = 1/2 sends the period to zero". The Lean pointwise form F(ρ) = 0 would be empty (x·0/y = 0 for any y, including a vanishing ζ(2ρ)), so the limit is the faithful encoding. It is no stronger (for meromorphic F, limit 0 is a zero) and no weaker (Lean's pointwise form is weaker). The ρ = 1/2 branch (vacuous in fact, ζ(1/2) = −1.46035…) is closed by the pole without a ζ(1/2) ≠ 0 lemma, which is right because none is at the pin.

**RZ-N1 — minimal-trace reading of the pairings.** The print's. "Monotone in the trace, not in the discriminant" contrasts two parametrizations of one length; the discriminant parametrization exists only if each d names a geodesic, which is the least trace with t² − 4 = d·u² (the fundamental unit of norm +1: 2 + √3 for 12; (1 + √2)² = 3 + 2√2 for 8). §2.3's previous sentence links trace and discriminant the same way ("t = 3, produces exactly the discriminant of ℚ(√5)"). With d fundamental, the fundamental discriminant of t² − 4 is forced to be d, so the spec carries both directions. The bare Pell identities would be weaker than the parenthesis.

**RZ-N2c — class disagreement: a target, Q7-clean.** "Not under all of T_d", read semantically as N2a reads "invariant under that rotation", is the negation of an invariance: some element of T_d ≅ S4 does not map the relation set to an equivalent one. Its witness is a counter-model, a negative result about the relations, which is the class Q7 admits and the RZ-81 (b) matrix form already uses. A witness exists for every ħ, so it is no harder than RZ-81 (b): take S = D = 0, E = [[0, 1], [0, 0]], H = [[0, 0], [1, 0]]. All four relations hold (each commutator is 0 and each right side contains S or D), while the transposition E ↔ S sends (3.3) to [E, H] = iℏ D S = 0, and [E, H] = diag(1, −1) ≠ 0. Proposed form, for M to write: `∀ ħ : ℝ, ∃ E S H D : Matrix (Fin 2) (Fin 2) ℂ, R(E, S, H, D) ∧ ¬ R(S, E, H, D)`, with R the four relations inline. E0, ≈ 0.25 pd. The row stays blocked by N2b (CC-13) either way; when CC-13 lands, RZ-N2 enters T with N2a and N2c as its built legs. If the wall keeps NOT A TARGET, nothing else moves: the leg simply stays uncounted.

**RZ-N4b — excluding s = 1/2.** Equivalent to the print under the L:RZ-33a rule ("the excluded points keep the pointwise statement equivalent to the meromorphic one"): φ continues through the removable point along the line (recomputed limit −1), so |φ| = 1 off 1/2 fixes |φ(1/2)| = 1 for the continued φ. Not weaker.

**MS-N5a — window, overlap, merge.** Conjunct (iii) on the printed window (0, 40] is the print's; the whole-line form is true but stronger than the caption, so keep the window. The MS-N2a ↔ MS-N5a overlap (ζ-zeros on the line) is two printed sentences saying overlapping things; keep two rows, no merge.

## Drifts

- **MS-N5a (weaker).** Printed: "the cross at t = 0 marks the one further node, where the pole of ζ(2s) at s = 1/2 sends the period to zero". The spec's conjuncts carry the node at s = 1/2 and "one" (every other node in (0, 40] is a zero of ζ·L(·, χ5)) but not "further", the claim that t = 0 is not itself a zero of ζ·L(·, χ5): ζ(1/2)·L(1/2, χ5) ≠ 0. That is true (ζ(1/2) = −1.4603545…, L(1/2, χ5) = 0.2317509…) but at the pin for neither factor. Back to M. Fix (a), recommended: declare in §6 "not claimed: that t = 0 is not a zero of ζ·L(·, χ5) — ζ(1/2) ≠ 0 and L(1/2, χ5) ≠ 0 are not at the pin". That costs nothing and makes the spec GREEN. Fix (b): add the conjunct, ≈ 2–4 pd, unmeasured.

## Correction-track items

- **CC-13 (RZ-N2b): agreed.** Both reflection types checked. The vertex reflection Ŝ ↔ D̂ gives [Ê, D̂] = iℏ ĤŜ against (3.5)'s −iℏ ŜĤ. The edge reflection Ê ↔ Ŝ, Ĥ ↔ D̂ gives [Ê, Ŝ] = −iℏ D̂Ĥ against (3.2)'s iℏ ĤD̂. As anti-automorphisms, both preserve the relations with no sign change.
- **Optional scope note (MS Figure 1 caption), not a CC.** I concur with M. "Every zero of ζ_ℚ(√5)(s) = ζ(s)L(s, χ5) is a node" is true on the plotted line and false read globally: at the trivial zeros s = 0, −2, −4, … the closed form is finite and nonzero (1.92484… = 4 log φ, 3.69306…, 4.78832…). The caption's scope rescues it. Inserting "on the critical line" would close the reading; uncounted.
- No new CC.

## The COMP cards (for seat C), recomputed

- **RZ-N6.** A = det(1 − ℒ_{3/2}) = 0.6629522626573949… (Taylor basis at z = 1, N = 20/30/40/50 agree to 15+ digits); |A − 0.663| = 4.8 × 10⁻⁵. Z(3/2) = det(1 − ℒ²_{3/2}) = 0.8230838120222124…, Z(5/2) = 0.9858200552837627…, B = 0.8349229736306109; |B − 0.835| = 7.7 × 10⁻⁵. The class enumeration gives B ≈ 0.83491 (tail-corrected, trace ≤ 1000), which agrees. The card's definitions (Mayer's disc |z − 1| < 3/2; primitive hyperbolic classes of PSL(2, ℤ); N = λ²; B = Π_p (1 − N(p)^{−3/2})) leave no second reading. A Chebyshev collocation on [0, 1] drifts in its fourth eigenvalue (spurious, ∼ 1/N), so seat C should use the disc basis or a proven-convergent scheme.
- **MS-N5b.** γ_ζ = 32.9350615877, γ_L = 33.0004560069, gap 0.0653944. Both round to the printed three decimals. The sixteen L-zeros in (0, 40] begin 6.648453, 9.831444, 11.958846. The next-closest ζ/L pair is 0.422 apart; the minimum ζ/ζ gap is 2.510 and the minimum L/L gap 1.140, so "closest pair" is unambiguous in either reading.

## Recommended numbers (the wall rules; V₁ beside M)

| | M | V₁ |
|---|---|---|
| catalogued | RZ 88 → 94 · MS 51 → 56 | **concur**: RZ 94 · MS 56 (MS-24b moves nothing) |
| T, NOW-class widening | RZ 50 → 52 (N1, N4); → 53 after CC-13 · MS 11 → 14 (N2, N3, N5); → 15 with MS-24 | **RZ 52** (N1, N4); → 53 after CC-13, with N2c as a built leg (+0.25 pd) · **MS 14** once MS-N5a's drift closes (by declaration, at no cost); → 15 only if the wall states that MS-24 counts in MS, with its (3.8) leg read CARRIED by `rz_15` (the Word-6 class) — today shared rows count by their RZ row, so this is a convention to state, not a consequence |
| N on the day | RZ 40 · MS 11 → 12 with MS-24 | **concur**: RZ 40; MS 11 → 12 iff the MS-24 convention is stated |
| cost of the widening | ≈ 4.6–8 pd | **≈ 4.6–8.6 pd** (RZ-N1 0.5–1.5 · RZ-N4b 1–2 · MS-N3 0.1 · MS-N2a 2–3 · MS-N5a 1–2) + 0.25 for N2c when CC-13 lands; all E0–E2, unmeasured |
| OUT-OF-Q5 | RZ-N3 | **concur** |
| public sentence once built | RZ 94 · 52 · 42; MS 56 · 15 · 15 | **concur** as a projection; without the MS-24 convention, MS 56 · 14 · 14 |

## Files

Written by V₁ (the orchestrator commits; V₁ ran no git):
- `<repo>/specs/_V1-NEW-ROWS.md` (this file)
- `V1:` lines appended to `specs/RZ-N1.md`, `RZ-N2a.md`, `RZ-N2b.md`, `RZ-N3.md`, `RZ-N4b.md`, `MS-N2a.md`, `MS-N3.md`, `MS-N5a.md`
- `## V₁ read` appended to `specs/_NEW-ROWS-2026-10-28.md`

Scratch: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/v1-new/`. It holds the page dumps and `scripts/` (`num1.py`, `mayer_taylor.py`, `selberg_classes.py`, `nodes.py`, and the drifting collocation `mayer.py`, kept as a negative). Seat C may want `scripts/mayer_taylor.py` for RZ-N6; no other stage needs the scratch.

*Two hands on every new sentence: one wrote the theorem, one read the page against it. Let's cook.*
