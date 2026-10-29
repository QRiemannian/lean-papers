**CC-CANDIDATE** — the fixed-point set of the map s ↦ 1 − s on ℂ is the single point {1/2}, not the line Re(s) = 1/2; the reflection whose fixed locus is Re(s) = 1/2 is s ↦ 1 − s̄. The row is stopped, not repaired; it stays OPEN and uncounted.

# L:RZ-33b — "reflection symmetry s ↔ 1 − s with fixed locus Re(s) = 1/2"

**Split of L:RZ-33:** the display (5.2) is L:RZ-33a; this sub-row is the clause after it.

## 1 · Header
- row: L:RZ-33b (sub-row of L:RZ-33)
- unit: U3 (`RiemannZeta/ZetaL`)
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
- locus: §5.4, the clause after display (5.2), PDF p14 (printed folio 13)
- spec_clock: 2026-10-28T17:08:33Z

## 2 · Printed statement, verbatim
§5.4 (p14): "The functional equation ⟦ζ(s) = χ(s) ζ(1 − s) (5.2)⟧ has reflection symmetry s ↔ 1 − s with fixed locus Re(s) = 1/2 [CV], read here as exchanging the inward and outward channels [I]."

## 3 · The defect (one line, then the detail)
**Defect:** "fixed locus" of s ↔ 1 − s is {1/2}, not Re(s) = 1/2.

Detail, for the correction track (no repair is made here):
- The involution σ(s) = 1 − s of ℂ is the point reflection (rotation by π) about 1/2. Its fixed-point set is {s : 1 − s = s} = {1/2}. Read with the standard meaning of "fixed locus", the clause is false.
- What σ does to the line Re(s) = 1/2: it maps the line onto itself (1/2 + it ↦ 1/2 − it) without fixing it pointwise; Re(s) = 1/2 is the unique vertical line σ maps to itself, and the fixed point of the induced map Re(s) ↦ 1 − Re(s) is Re(s) = 1/2. A reading "the invariant line" or "the fixed locus of the action on Re(s)" would be true — but choosing it is a rewording, so it is not made here.
- The map whose fixed locus is exactly Re(s) = 1/2 is s ↦ 1 − s̄; the zero set of ζ is symmetric under it by (5.2) together with ζ(s̄) = conj ζ(s).
- Echoes of the same phrasing in the served text (for the correction track's echo-sweep, not this row): §5.4 "the critical line is the functional-equation symmetry axis s ↔ 1 − s" (p14); §7.4 "the symmetry axis of the functional equation E(z, s) ↔ E(z, 1 − s)" (p19).

## 4 · Target mathlib declarations
None specced while the row is stopped. (If the correction lands as the invariant-line reading, the content is elementary `Complex.ext` / `Complex.sub_re` algebra; if it lands as s ↦ 1 − s̄, `riemannZeta_one_sub` plus a conjugation lemma for `riemannZeta` would be needed — not searched for at this stop.)

## 5 · Intended Lean statement
Not written: the row is a `CC-CANDIDATE` and waits for the corrected text to be republished (plan §4 step 3).

## 6 · What the row does not claim
- Not the functional equation itself (L:RZ-33a).
- Not "exchanging the inward and outward channels" ([I]).

## 7 · Status
CC-CANDIDATE 2026-10-28T17:08:33Z — OPEN, uncounted, to the correction track (second head, then JC-9, then republish)

V1: V1-CC (AGREE with M) + V1-SPLIT-OK 2026-10-28T17:18:31Z — p14 "has reflection symmetry s ↔ 1 − s with fixed locus Re(s) = 1/2 [CV]" is FALSE as printed: the fixed set of s ↦ 1 − s on ℂ is {1/2}. The invariant-line reading is NOT the paper's own meaning: (a) the served text itself prints the correct fact at §12.5, PDF p31 — "the functional equation's reflection symmetry s ↔ 1 − s, whose fixed point is s = 1/2" — so the paper uses "fixed" in the standard sense and the two loci contradict each other within one edition; (b) even read as "invariant line", the point reflection about 1/2 leaves EVERY line through 1/2 invariant (the real axis included), so Re(s) = 1/2 is singled out only as the invariant VERTICAL line or as the fixed value of Re(s) ↦ 1 − Re(s) — both rewordings. Correction candidates for the track: "with fixed point s = 1/2" or "fixing Re(s) = 1/2 as a set (the axis of s ↦ 1 − s̄, by (5.2) with ζ(s̄) = conj ζ(s))". Echoes beyond M's two: §11.2 PDF p27 "the functional-equation symmetry axis s ↔ 1 − s"; §14.1 table PDF p34 "(functional-equation axis)"; the §5.4 heading p14. OPEN, uncounted.

V2: NO-STATEMENT 2026-10-28T17:28:31Z — no theorem in Challenge.lean by V1's ruling (V1-CC, correction track); not part of the statement freeze; nothing to read for fidelity.

## M — the corrected claim (2026-10-28T22:40:59Z; the wall's word of 2026-10-28, lane 1)

*Seat M (statement author) for the corrected leg, dispatched by Orchestrator A under `Orchestrator/Chat-Design/cc-handoff/projects/priority/inbox/WORD-wall-2026-10-28-night-words.md`, lane 1. The CC-CANDIDATE text above is kept as written; this section specs the claim as the RZ draft seat is correcting it (CC-15). Unit: **U11 `RiemannZeta/Corrected`** (new; see `specs/_UNIT-U11.md`), not an amendment of U3. The flip of this row waits on the wall's read of the correction drafts.*

### 1 · Header
- row: L:RZ-33b (sub-row of L:RZ-33; sibling L:RZ-33a CHECKED in U3)
- unit: **U11** `RiemannZeta/Corrected`
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256 (the edition read): `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54` (re-hashed by this seat at 2026-10-28T22:35:43Z, match). **The corrected edition is not yet served**; its sha256 replaces this one in the docstring and in V₁'s read when the republish lands.
- locus: §5.4 "The critical line as functional-equation symmetry axis", the clause after display (5.2), PDF p14 (printed folio 13); kin: §12.5, PDF p31 (the served edition's own wording of the corrected fact)
- spec_clock: 2026-10-28T22:40:59Z

### 2 · Printed statement — the corrected wording, verbatim
As served at `2d5287e7` (p14): "The functional equation ⟦ζ(s) = χ(s) ζ(1 − s) (5.2)⟧ has reflection symmetry s ↔ 1 − s with fixed locus Re(s) = 1/2 [CV], read here as exchanging the inward and outward channels [I]."

As corrected (CC-15; the wording the RZ draft seat is applying, which is the served edition's own phrase at §12.5 p31, "the functional equation's reflection symmetry s ↔ 1 − s, whose fixed point is s = 1/2"):
> "The functional equation ζ(s) = χ(s) ζ(1 − s) (5.2) has reflection symmetry s ↔ 1 − s with fixed point s = 1/2 [CV], read here as exchanging the inward and outward channels [I]."

V₁ reads the corrected sentence against the republished edition when it lands; if the served wording differs from this, the spec is re-read against it before the flip.

### 3 · Formal reading
- **The reflection** is σ(s) = 1 − s on ℂ. "Reflection" = σ is an involution (σ∘σ = id): `Function.Involutive (fun s : ℂ ↦ 1 − s)`.
- **"with fixed point s = 1/2"** = the fixed-point set of σ is exactly {1/2}: `Function.fixedPoints (fun s : ℂ ↦ 1 − s) = {1 / 2}`. Read as the full set, not "1/2 is a fixed point": "the fixed point" names the unique one, and that uniqueness is what the correction restores (the uncorrected text named a line).
- **"The functional equation … has reflection symmetry s ↔ 1 − s"** = the equation (5.2) is carried to itself by σ: (a) it holds at s; (b) it holds at σ(s) = 1 − s, i.e. ζ(1 − s) = χ(1 − s) ζ(s); (c) the two are the same equation — χ(s) χ(1 − s) = 1, so (b) is (a) solved for ζ(1 − s). Without (c) the conjunction (a) ∧ (b) would be two instances of one formula and say nothing about symmetry; (c) is the content that makes the reflected equation the original one.
- **χ** is U3's `zetaChi` restated byte-identically: χ(s) = 2^s π^{s−1} sin(πs/2) Γ(1 − s) (L:RZ-33a §3 and V₁'s ruling there: forced as a meromorphic identity).
- **Domain: s ∉ ℤ.** (a) needs s ∉ ℕ (L:RZ-33a); (b) needs 1 − s ∉ ℕ, i.e. s ∉ {1, 0, −1, −2, …}; (c) needs both Γ(s) and Γ(1 − s) off their poles and sin(πs) ≠ 0, i.e. s ∉ ℤ — at every integer mathlib's product is 0 (one Γ factor sits at a non-positive integer, where `Complex.Gamma` takes the junk value 0), so the pointwise identity fails there. Off ℤ all three hold pointwise; equality on ℂ ∖ ℤ is equivalent to the meromorphic identities — no weaker than the print.
- **Is a second conjunct about the completed ζ or the zero set owed?** No. The corrected sentence asserts the symmetry *of the functional equation (5.2)*, and its fixed point; it does not name Λ or the zeros. The symmetric form Λ(1 − s) = Λ(s) (`completedRiemannZeta_one_sub`) and the zero-set symmetry are not stated (§6). The equation's own reflection is stated through `zetaChi` and the functional equation as frozen in `rz_33a_functional_equation` — restated in U11, not imported into the Challenge.
- Numerical check of the reading (not a proof): at s ∈ {0.3 + 2.1i, −3.7 + 0.4i, 0.5 + 14.13i, 0.5, 5.5 − i}, |χ(s)χ(1 − s) − 1| < 4 × 10⁻⁴⁰ and both equation residuals < 6 × 10⁻⁴² at 40 digits (`<scratchpad>/m-u11/check_chi.py`).

### 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`; sitting-71 name form, namespaces confirmed and each name `#check`ed through `lake env lean` on a scratch probe)
| declaration | kind | file:line | namespace |
|---|---|---|---|
| `riemannZeta` | def | NumberTheory/LSeries/RiemannZeta.lean:121 | root |
| `riemannZeta_one_sub` | theorem | NumberTheory/LSeries/RiemannZeta.lean:178 | root |
| `Complex.Gamma` | def | Analysis/SpecialFunctions/Gamma/Basic.lean:287 | `Complex` |
| `Complex.Gamma_mul_Gamma_one_sub` | theorem | Analysis/SpecialFunctions/Gamma/Beta.lean:398 | `Complex` (`#check`: Γ z · Γ (1 − z) = π / sin (π z)) |
| `Complex.Gamma_ne_zero` | theorem | Analysis/SpecialFunctions/Gamma/Beta.lean:427 | `Complex` |
| `Complex.sin_ne_zero_iff` | theorem | Analysis/SpecialFunctions/Trigonometric/Complex.lean:58 | `Complex` |
| `Complex.sin_two_mul` | theorem | Analysis/Complex/Trigonometric.lean:480 | `Complex` |
| `Complex.sin_pi_div_two_sub` | theorem | Analysis/SpecialFunctions/Trigonometric/Basic.lean:1153 | `Complex` |
| `Complex.cos_pi_div_two_sub` | theorem | Analysis/SpecialFunctions/Trigonometric/Basic.lean:1159 | `Complex` |
| `Complex.cpow_add` | theorem | Analysis/SpecialFunctions/Pow/Complex.lean:81 | `Complex` |
| `Complex.cpow_neg` | theorem | Analysis/SpecialFunctions/Pow/Complex.lean:90 | `Complex` |
| `Complex.mul_cpow_ofReal_nonneg` | theorem | Analysis/SpecialFunctions/Pow/Complex.lean:186 | `Complex` |
| `Function.fixedPoints` | def | Dynamics/FixedPoints/Defs.lean:28 | `Function` (:23–:54) |
| `Function.mem_fixedPoints` | theorem | Dynamics/FixedPoints/Defs.lean:36 | `Function` |
| `Function.Involutive` | def | Logic/Function/Basic.lean:1010 | `Function` |
| `completedRiemannZeta_one_sub` | theorem | NumberTheory/LSeries/RiemannZeta.lean:106 | root — named for §6 only, not on the route |
`Complex.cpow_one`, `Complex.cpow_neg_one`, `Complex.cpow_sub`, `Complex.ofReal_ne_zero`, `Real.pi_ne_zero` `#check` at the pin (scratch probe `Probe2.out`). No gap.

### 5 · Intended Lean statement
Prose: the map s ↦ 1 − s of ℂ is an involution whose only fixed point is 1/2; and for every complex s that is not an integer, χ(s)·χ(1 − s) = 1, ζ(s) = χ(s) ζ(1 − s), and ζ(1 − s) = χ(1 − s) ζ(s).

```lean
/-- The standard factor of the asymmetric functional equation, χ(s) = 2^s π^(s−1) sin(πs/2) Γ(1−s).
Restated byte-identically from U3 (`RiemannZeta.ZetaL.zetaChi`, L:RZ-33a §3). -/
noncomputable def zetaChi (s : ℂ) : ℂ :=
  2 ^ s * (Real.pi : ℂ) ^ (s - 1) * Complex.sin (Real.pi * s / 2) * Complex.Gamma (1 - s)

/-- **L:RZ-33b** — RZ §5.4, as corrected (CC-15): "The functional equation ζ(s) = χ(s) ζ(1 − s)
(5.2) has reflection symmetry s ↔ 1 − s with fixed point s = 1/2". The reflection s ↦ 1 − s is
an involution of ℂ whose fixed-point set is {1/2}; off ℤ the equation holds at s and at 1 − s,
and χ(s) χ(1 − s) = 1, so the reflected equation is the original one.

Served locus: §5.4, the clause after display (5.2), PDF p14 (printed folio 13); the corrected
wording is the served edition's own at §12.5, PDF p31. PDF sha256 prefix `2d5287e7` (the edition
read; the corrected edition's prefix replaces it at the republish). -/
theorem rz_33b_reflection_fixed_point :
    Function.Involutive (fun s : ℂ ↦ 1 - s) ∧
    Function.fixedPoints (fun s : ℂ ↦ 1 - s) = {1 / 2} ∧
    ∀ s : ℂ, (∀ n : ℤ, s ≠ n) →
      zetaChi s * zetaChi (1 - s) = 1 ∧
      riemannZeta s = zetaChi s * riemannZeta (1 - s) ∧
      riemannZeta (1 - s) = zetaChi (1 - s) * riemannZeta s := by
  sorry
```
Compiled with `sorry` through `lake env lean` on a scratch probe (`<scratchpad>/m-u11/Probe.lean`, namespace `RiemannZeta.Corrected`): elaborates, only the `sorry` warning.

### 6 · What the row does not claim
- Not "fixed locus Re(s) = 1/2" (the uncorrected text, CC-15); not that the line Re(s) = 1/2 is fixed pointwise by anything; not the map s ↦ 1 − s̄.
- Not the symmetric form Λ(1 − s) = Λ(s), not ξ(1 − s) = ξ(s), not the symmetry of the zero set of ζ — the corrected sentence does not name them.
- Not the §5.4 heading or the earlier sentence "the critical line is the functional-equation symmetry axis s ↔ 1 − s" (the echoes CC-15 lists, loose wording for the sweep, not this row).
- Not "read here as exchanging the inward and outward channels" ([I]); nothing about RH or the location of zeros ("forces nothing about RH").
- Not the functional equation as a separate row: its occurrence here is conjunct (a) of the symmetry, restated; L:RZ-33a stays CHECKED in U3 untouched.

### 7 · Proof route for L
1. Involution: `intro s; ring` (or `sub_sub_cancel`).
2. Fixed points: `ext s; simp only [Function.mem_fixedPoints, Function.IsFixedPt, Set.mem_singleton_iff]`; then `constructor` and `linear_combination` each way (1 − s = s ↔ s = 1/2 over ℂ).
3. From `hs : ∀ n : ℤ, s ≠ n` derive `hsN : ∀ n : ℕ, s ≠ n` (cast ℕ → ℤ), `hs1N : ∀ n : ℕ, 1 - s ≠ n` (else s = 1 − n ∈ ℤ), `hΓs : ∀ m : ℕ, s ≠ -m`, `hΓ1s : ∀ m : ℕ, 1 - s ≠ -m`, and `hsin : Complex.sin (π * s) ≠ 0` via `Complex.sin_ne_zero_iff` (π s = k π ⇒ s = k).
4. (a) ζ(s) = χ(s) ζ(1 − s): take U3's proof. U11's `Solution.lean` imports `RiemannZeta.ZetaL.Solution` (the CO's U10 decision 2: a Solution may import another unit's Solution, never a Challenge) and closes (a) by `RiemannZeta.ZetaL.rz_33a_functional_equation s hsN`, after `show` that `RiemannZeta.Corrected.zetaChi = RiemannZeta.ZetaL.zetaChi` by `rfl` (byte-identical bodies). Fallback if the CO rules U11 self-contained: copy U3's (a) proof (`riemannZeta_one_sub` at 1 − s; `Complex.cos_pi_div_two_sub`; `Complex.mul_cpow_ofReal_nonneg` to split (2π)^{s−1}).
5. (b) ζ(1 − s) = χ(1 − s) ζ(s): step 4's lemma at 1 − s (hypothesis `hs1N`), rewriting `1 - (1 - s) = s`.
6. (c) χ(s)χ(1 − s) = 1: unfold; `1 - (1 - s) = s`; sin(π(1 − s)/2) = cos(πs/2) by `Complex.sin_pi_div_two_sub` after `π(1 − s)/2 = π/2 − πs/2` (`ring_nf`/`congr 1; ring`); 2^s · 2^{1−s} = 2 and π^{s−1} · π^{−s} = π⁻¹ by `Complex.cpow_add` (bases ≠ 0: `two_ne_zero`, `Complex.ofReal_ne_zero.mpr Real.pi_ne_zero`), `Complex.cpow_one`, `Complex.cpow_neg_one`; 2 sin(πs/2) cos(πs/2) = sin(πs) by `Complex.sin_two_mul` (argument `2 * (π s/2) = π s`); Γ(s)Γ(1 − s) = π / sin(πs) by `Complex.Gamma_mul_Gamma_one_sub`; close with `field_simp` using `hsin` and π ≠ 0.
7. Assemble `⟨step1, step2, fun s hs ↦ ⟨(c), (a), (b)⟩⟩`. Class E1 (0.25–0.5 pd); every lemma at the pin.

### 8 · Status
SPEC-DRAFT (corrected claim) 2026-10-28T22:40:59Z — unit U11; the flip waits on the wall's read of the correction drafts and on the republish. V₁ appends its own line.

## M — the corrected claim, re-read against the landed draft (2026-10-28T22:46:46Z; supersedes §§2, 3, 5, 6, 7 of the section above)

*Cause: the coordinator's correction to the brief, from the RZ draft seat's landed text (`Orchestrator/Chat-Design/cc-handoff/projects/priority/outbox/CORRECTION-WAVE-2026-10-28/RZ-APPLIED.md`, CC-15 row and item 3). The corrected §5.4 sentence carries a second clause that the section above did not have, and the "zero set" in the brief is false for the full zero set. The section above stays as written (its χ-triple statement is withdrawn here, not edited away); this section is the spec V₁ reads.*

### 1 · Header (changes only)
- correction draft read: `RZ-DRAFT-riemann-zeta-tetrahedral-2026-10-28.pdf` (same outbox folder), sha256 `1b2af75cc5975dea65088d6742aa55ef422afd9f5b0dedf0cf572c88af04c4e2`, PDF p14 by `pdftotext -layout` (draft only — not served; the served edition stays `2d5287e7` until the republish)
- spec_clock: 2026-10-28T22:46:46Z

### 2 · Printed statement — the corrected wording, verbatim (draft p14, `1b2af75c`)
> "The functional equation ζ(s) = χ(s) ζ(1 − s) (5.2) has reflection symmetry s ↔ 1 − s with fixed point s = 1/2 [CV], read here as exchanging the inward and outward channels [I]. Together with ζ(s̄) = \overline{ζ(s)} it makes the non-trivial zeros symmetric about the line Re(s) = 1/2, the line fixed by s ↦ 1 − s̄ [CV]."

### 3 · Formal reading
- **(i) "reflection symmetry s ↔ 1 − s with fixed point s = 1/2"**: σ(s) = 1 − s is an involution of ℂ (`Function.Involutive`) and its fixed-point set is exactly {1/2} (`Function.fixedPoints σ = {1/2}`). Printed exactly; stated exactly.
- **(ii-a) "the line fixed by s ↦ 1 − s̄"**: the fixed-point set of τ(s) = 1 − s̄ is the line {s : Re s = 1/2} (`Function.fixedPoints τ = {s | s.re = 1/2}`; s̄ = `starRingEnd ℂ s`). Printed [CV]; one-line algebra.
- **(ii-b) "makes the non-trivial zeros symmetric about the line Re(s) = 1/2"**: τ maps the non-trivial zeros into the non-trivial zeros — if ζ(ρ) = 0 and ρ is not a trivial zero (ρ ≠ −2(n + 1) for every n ∈ ℕ), then ζ(1 − ρ̄) = 0 and 1 − ρ̄ is not a trivial zero. τ is an involution, so this is the symmetry of the set (the image is the set itself).
  - **"non-trivial" is read literally** — a zero other than −2, −4, −6, … (mathlib's `riemannZeta_neg_two_mul_nat_add_one` names exactly these) — not through the critical strip. The strip form (ζ(ρ) = 0, 0 < Re ρ < 1 ⇒ ζ(1 − ρ̄) = 0) is equivalent but the equivalence is a theorem, not the word; the literal form is the statement, and the strip enters only in the proof (route step 4).
  - **Never the whole zero set:** the trivial zeros −2n map under τ to 1 + 2n, where ζ ≠ 0 (Re ≥ 1). The hypothesis on ρ is what keeps the conjunct true.
  - **"Together with ζ(s̄) = \overline{ζ(s)}"** names the proof's ingredients (the functional equation + conjugation symmetry); it is at the pin as `riemannZeta_conj` (valid for all s) and is not stated as a separate conjunct — it is a library theorem, not the paper's claim about the zeros.
- **Withdrawn from the section above:** the triple χ(s)χ(1 − s) = 1 ∧ (5.2) at s ∧ (5.2) at 1 − s. The landed sentence spells out what the symmetry asserts — the fixed point and the zero symmetry — so the leg states those and no reading of "symmetry of the equation" beyond them. Consequence: RZ-33b needs no U3 definition (`zetaChi` no longer restated) and no Solution import.
- **(ii) is at the pin cleanly** — `riemannZeta_conj`, `riemannZeta_one_sub`, `riemannZeta_ne_zero_of_one_le_re`, `Complex.cos_eq_zero_iff`, `Complex.Gamma_ne_zero` are all there — so the leg is (i) and (ii) both in Lean, not (i) with a docstring reading.

### 4 · Target mathlib declarations (additions; sitting-71 name form, each `#check`ed through `lake env lean`, `<scratchpad>/m-u11/Probe4.out`)
| declaration | kind | file:line | namespace |
|---|---|---|---|
| `riemannZeta_conj` | theorem | NumberTheory/Harmonic/ZetaAsymp.lean:458 | root (`namespace ZetaAsymptotics` closes at :411) — `ζ (conj s) = conj (ζ s)` for all s |
| `riemannZeta_one_sub` | theorem | NumberTheory/LSeries/RiemannZeta.lean:178 | root |
| `riemannZeta_ne_zero_of_one_le_re` | lemma | NumberTheory/LSeries/Nonvanishing.lean:411 | written `_root_.` → root |
| `riemannZeta_zero` | theorem | NumberTheory/LSeries/RiemannZeta.lean:151 | root |
| `riemannZeta_neg_two_mul_nat_add_one` | theorem | NumberTheory/LSeries/RiemannZeta.lean:173 | root (names the trivial zeros; not on the route) |
| `Complex.cos_eq_zero_iff` | theorem | Analysis/SpecialFunctions/Trigonometric/Complex.lean:33 | `Complex` |
| `Complex.Gamma_ne_zero` | theorem | Analysis/SpecialFunctions/Gamma/Beta.lean:427 | `Complex` |
| `Complex.conj_re`, `Complex.conj_im` | theorems | (`#check`ed) | `Complex` |
| `Function.fixedPoints`, `Function.mem_fixedPoints`, `Function.Involutive` | as in the section above | | `Function` |
No gap.

### 5 · Intended Lean statement
Prose: s ↦ 1 − s is an involution of ℂ whose only fixed point is 1/2; the fixed points of s ↦ 1 − s̄ are exactly the line Re s = 1/2; and for every zero ρ of ζ that is not a trivial zero, 1 − ρ̄ is a zero of ζ and is not a trivial zero.

```lean
/-- **L:RZ-33b** — RZ §5.4, as corrected (CC-15): "The functional equation ζ(s) = χ(s) ζ(1 − s)
(5.2) has reflection symmetry s ↔ 1 − s with fixed point s = 1/2 [CV] … Together with
ζ(s̄) = conj ζ(s) it makes the non-trivial zeros symmetric about the line Re(s) = 1/2, the line
fixed by s ↦ 1 − s̄ [CV]." Non-trivial = not one of −2, −4, −6, … ; the full zero set is NOT
symmetric (−2n ↦ 1 + 2n, where ζ ≠ 0).

Served locus: §5.4, the clause after display (5.2), PDF p14 (printed folio 13). PDF sha256
prefix `2d5287e7` (the edition read; the corrected edition's prefix replaces it at the republish;
correction draft read: `1b2af75c`). -/
theorem rz_33b_reflection_fixed_point :
    Function.Involutive (fun s : ℂ ↦ 1 - s) ∧
    Function.fixedPoints (fun s : ℂ ↦ 1 - s) = {1 / 2} ∧
    Function.fixedPoints (fun s : ℂ ↦ 1 - starRingEnd ℂ s) = {s : ℂ | s.re = 1 / 2} ∧
    ∀ ρ : ℂ, riemannZeta ρ = 0 → (∀ n : ℕ, ρ ≠ -2 * (n + 1)) →
      riemannZeta (1 - starRingEnd ℂ ρ) = 0 ∧ ∀ n : ℕ, 1 - starRingEnd ℂ ρ ≠ -2 * (n + 1) := by
  sorry
```
Compiled with `sorry` through `lake env lean` (`<scratchpad>/m-u11/Probe4.lean`, namespace `RiemannZeta.Corrected`): exit 0, only the `sorry` warning.

### 6 · What the row does not claim
- Not that the whole zero set of ζ is symmetric about Re s = 1/2 (false at the trivial zeros).
- Not RH, nor that any zero lies on the line; not "fixed locus Re(s) = 1/2" for s ↦ 1 − s (the uncorrected text).
- Not χ(s)χ(1 − s) = 1, Λ(1 − s) = Λ(s), ξ(1 − s) = ξ(s) — not named by the sentence (the χ-triple of the section above is withdrawn).
- Not ζ(s̄) = conj ζ(s) as a claim of the paper (a library theorem the sentence cites as an ingredient).
- Not "read here as exchanging the inward and outward channels" ([I]); not the §5.4 heading or the ¶1 echo.

### 7 · Proof route for L
1. Involution: `intro s; ring`.
2. Fixed points of σ: `ext s`; `Function.mem_fixedPoints`, `Function.IsFixedPt`, `Set.mem_singleton_iff`; `constructor` with `linear_combination` each way.
3. Fixed points of τ: `ext s`; `Complex.ext_iff` on 1 − s̄ = s: the imaginary part is `-(-s.im) = s.im` (always true, `Complex.conj_im`), the real part is 1 − s.re = s.re ⇔ s.re = 1/2 (`Complex.conj_re`, `linarith`).
4. Locate ρ in the strip: ρ ≠ 0 (`riemannZeta_zero`: ζ 0 = −1/2 ≠ 0); Re ρ < 1 (else `riemannZeta_ne_zero_of_one_le_re`). Re ρ > 0: suppose Re ρ ≤ 0. Apply `riemannZeta_one_sub` at s := 1 − ρ (hypotheses: Re(1 − ρ) ≥ 1 > 0 rules out s = −n; s ≠ 1 since ρ ≠ 0), giving 0 = ζ(ρ) = 2 (2π)^{−(1−ρ)} Γ(1 − ρ) cos(π(1 − ρ)/2) ζ(1 − ρ). Then ζ(1 − ρ) ≠ 0 (Re ≥ 1), Γ(1 − ρ) ≠ 0 (`Complex.Gamma_ne_zero`, Re > 0), the power ≠ 0 (`Complex.cpow_eq_zero_iff`, Pow/Complex.lean:45: base 2π ≠ 0); so cos(π(1 − ρ)/2) = 0, and `Complex.cos_eq_zero_iff` gives ρ = −2k for some k ∈ ℤ; Re ρ ≤ 0 and ρ ≠ 0 force k ≥ 1, i.e. ρ = −2((k − 1) + 1) — contradicting the hypothesis. So 0 < Re ρ < 1.
5. ζ(1 − ρ) = 0: `riemannZeta_one_sub` at s := ρ (ρ ≠ −n since Re ρ > 0; ρ ≠ 1 since Re ρ < 1) — the right side has the factor ζ(ρ) = 0.
6. ζ(1 − ρ̄) = 0: 1 − ρ̄ = conj (1 − ρ) (`map_sub`, `map_one`), so `riemannZeta_conj` gives ζ(1 − ρ̄) = conj ζ(1 − ρ) = conj 0 = 0.
7. 1 − ρ̄ is not trivial: Re(1 − ρ̄) = 1 − Re ρ > 0, while Re(−2(n + 1)) < 0.
8. Assemble. Class E1 (0.5–0.75 pd; step 4 carries the weight); every lemma at the pin.

### 8 · Status
SPEC-DRAFT (corrected claim, re-read against the landed draft) 2026-10-28T22:46:46Z — unit U11; supersedes the statement in the section above; the flip waits on the wall's read of the correction drafts and on the republish. V₁ appends its own line.

V1: V1-DRIFT (weaker) 2026-10-28T22:55:14Z — read against the correction DRAFT `1b2af75c` p14 (not served; re-read at the republish). Draft: "The functional equation ζ(s) = χ(s) ζ(1 − s), χ(s) = 2^s π^{s−1} sin(πs/2) Γ(1 − s), (5.2) has reflection symmetry s ↔ 1 − s with fixed point s = 1/2 [CV] … Together with ζ(s̄) = conj ζ(s) it makes the non-trivial zeros symmetric about the line Re(s) = 1/2, the line fixed by s ↦ 1 − s̄ [CV]." The live statement's conjuncts 2–4 are faithful (fixed-point set {1/2}; fixedPoints (1 − conj ·) = the line, pointwise; non-trivial read literally as mathlib's RiemannHypothesis form, the whole zero set correctly not claimed; no junk zero — ζ(1) ≠ 0 at the pin). But the first clause's SUBJECT, the equation (5.2), is stated nowhere: `Function.Involutive (fun s ↦ 1 − s)` mentions neither ζ nor χ, and the second sentence draws a consequence from the equation's symmetry rather than replacing it. Fix: restore the withdrawn χ-triple as a conjunct beside the live (ii) — ∀ s ∉ ℤ, zetaChi s * zetaChi (1 − s) = 1 ∧ ζ s = zetaChi s * ζ (1 − s) ∧ ζ (1 − s) = zetaChi (1 − s) * ζ s, with `zetaChi` byte-identical to U3 (= the χ the draft prints in (5.2)). The presupposed ζ(s̄) = conj ζ(s) is not owed as a conjunct. Detail: `specs/_V1-U11.md`. Back to M; the flip waits on the wall's read.

## M-amend — the equation's own symmetry restored (2026-10-28T22:56:18Z; at V₁-U11's DRIFT, `specs/_V1-U11.md`; supersedes §§3, 5, 6, 7 of the 22:46:46Z section where they differ)

*Cause: V₁-U11 returned RZ-33b `V1-DRIFT (weaker)` — the printed first clause predicates the symmetry of the EQUATION (5.2), and the 22:46:46Z statement's (i) is a fact about s ↦ 1 − s alone, true whatever (5.2) said. V₁'s fix, taken as asked: the χ-triple of the 22:40:59Z section goes back in as a conjunct, beside (i), (ii-a), (ii-b). The 22:46:46Z section's "withdrawn" line is itself withdrawn; that section and the 22:40:59Z one stay as written.*

### 2 · Printed statement (draft p14, `1b2af75c`; unchanged from the section above, with χ now printed in the display)
> "The functional equation ζ(s) = χ(s) ζ(1 − s), χ(s) = 2^s π^{s−1} sin(πs/2) Γ(1 − s), (5.2) has reflection symmetry s ↔ 1 − s with fixed point s = 1/2 [CV], read here as exchanging the inward and outward channels [I]. Together with ζ(s̄) = \overline{ζ(s)} it makes the non-trivial zeros symmetric about the line Re(s) = 1/2, the line fixed by s ↦ 1 − s̄ [CV]."

### 3 · Formal reading (the conjuncts, in statement order)
- **(0) "The functional equation … (5.2) has reflection symmetry s ↔ 1 − s"** — the equation is carried to itself by s ↦ 1 − s: for s ∉ ℤ, χ(s)χ(1 − s) = 1, (5.2) holds at s, and (5.2) holds at 1 − s; the product identity is what makes the reflected instance the same equation (22:40:59Z §3). χ = `zetaChi`, restated byte-identically from U3 (`ZetaL/Challenge.lean:29–30`; `diff` of the two lines: identical), and equal to the χ the draft now prints beside (5.2). Domain s ∉ ℤ exactly as in 22:40:59Z §3.
- **(i)** s ↦ 1 − s is an involution with fixed-point set {1/2} — "with fixed point s = 1/2".
- **(ii-a)** the fixed points of s ↦ 1 − s̄ are the line Re s = 1/2 — "the line fixed by s ↦ 1 − s̄".
- **(ii-b)** a non-trivial zero ρ (ρ ≠ −2(n + 1), read literally) has 1 − ρ̄ a non-trivial zero — the second sentence's consequence, never the whole zero set (22:46:46Z §3).

### 4 · Target mathlib declarations
The union of the two sections above (22:40:59Z §4 for (0), 22:46:46Z §4 for (ii)); no new name, no gap.

### 5 · Intended Lean statement (all conjuncts)
```lean
/-- The factor χ of the asymmetric functional equation (5.2), χ(s) = 2^s π^(s−1) sin(πs/2) Γ(1−s):
the χ the corrected edition prints beside (5.2). Restated byte-identically from U3
(`RiemannZeta.ZetaL.zetaChi`, L:RZ-33a §3). -/
noncomputable def zetaChi (s : ℂ) : ℂ :=
  2 ^ s * (Real.pi : ℂ) ^ (s - 1) * Complex.sin (Real.pi * s / 2) * Complex.Gamma (1 - s)

/-- **L:RZ-33b** — RZ §5.4, as corrected (CC-15): "The functional equation ζ(s) = χ(s) ζ(1 − s),
χ(s) = 2^s π^(s−1) sin(πs/2) Γ(1 − s), (5.2) has reflection symmetry s ↔ 1 − s with fixed point
s = 1/2 [CV] … Together with ζ(s̄) = conj ζ(s) it makes the non-trivial zeros symmetric about the
line Re(s) = 1/2, the line fixed by s ↦ 1 − s̄ [CV]." (0) off ℤ, χ(s)χ(1 − s) = 1 and (5.2) holds
at s and at 1 − s, so s ↦ 1 − s carries the equation to itself; (i) s ↦ 1 − s is an involution
with fixed-point set {1/2}; (ii) s ↦ 1 − s̄ fixes exactly the line Re s = 1/2 and maps non-trivial
zeros (ρ ≠ −2, −4, …) to non-trivial zeros. The full zero set is NOT symmetric (−2n ↦ 1 + 2n).

Served locus: §5.4, display (5.2) and the clause after it, PDF p14 (printed folio 13). PDF sha256
prefix `2d5287e7` (the edition read; the corrected edition's prefix replaces it at the republish;
correction draft read: `1b2af75c`). -/
theorem rz_33b_reflection_fixed_point :
    (∀ s : ℂ, (∀ n : ℤ, s ≠ n) →
      zetaChi s * zetaChi (1 - s) = 1 ∧
      riemannZeta s = zetaChi s * riemannZeta (1 - s) ∧
      riemannZeta (1 - s) = zetaChi (1 - s) * riemannZeta s) ∧
    Function.Involutive (fun s : ℂ ↦ 1 - s) ∧
    Function.fixedPoints (fun s : ℂ ↦ 1 - s) = {1 / 2} ∧
    Function.fixedPoints (fun s : ℂ ↦ 1 - starRingEnd ℂ s) = {s : ℂ | s.re = 1 / 2} ∧
    ∀ ρ : ℂ, riemannZeta ρ = 0 → (∀ n : ℕ, ρ ≠ -2 * (n + 1)) →
      riemannZeta (1 - starRingEnd ℂ ρ) = 0 ∧ ∀ n : ℕ, 1 - starRingEnd ℂ ρ ≠ -2 * (n + 1) := by
  sorry
```
Compiled with `sorry` through `lake env lean` (`<scratchpad>/m-u11/Probe5.lean`, namespace `RiemannZeta.Corrected`): exit 0, only the `sorry` warning.

### 6 · What the row does not claim
As 22:46:46Z §6, except its third bullet: χ(s)χ(1 − s) = 1 IS now claimed (conjunct (0)); Λ(1 − s) = Λ(s) and ξ(1 − s) = ξ(s) remain unclaimed. L:RZ-33a stays CHECKED in U3, untouched; (0)'s middle conjunct is its restatement inside the symmetry, not a second count.

### 7 · Proof route for L
1. (0): the 22:40:59Z §7 steps 3–6 — `Solution.lean` imports `RiemannZeta.ZetaL.Solution` (U10 decision 2) for (5.2) via `RiemannZeta.ZetaL.rz_33a_functional_equation` with `zetaChi` linked by `rfl`, or restates U3's steps if the CO rules U11 self-contained; the reflected instance at 1 − s; the product by `Complex.sin_pi_div_two_sub`, `Complex.cpow_add`, `Complex.sin_two_mul`, `Complex.Gamma_mul_Gamma_one_sub`, `field_simp`.
2. (i), (ii-a), (ii-b): the 22:46:46Z §7 steps 1–7 unchanged.
3. Assemble. Class E1, 0.75–1 pd for the row.

### 8 · Status
SPEC-DRAFT (M-amend at V₁'s DRIFT) 2026-10-28T22:56:18Z — unit U11; back to V₁ for this section; the flip waits on the wall's read of the correction drafts and on the republish.

V1: V1-GREEN 2026-10-28T22:58:43Z — re-read of the M-amend section (22:56:18Z) only, against the correction DRAFT `1b2af75c` p14 (not served; re-read at the republish). The drift is closed: conjunct (0) now states the subject of the first clause, "The functional equation … (5.2) has reflection symmetry s ↔ 1 − s", as the equation carried to itself by s ↦ 1 − s (χ(s)χ(1 − s) = 1, (5.2) at s, (5.2) at 1 − s). The domain s ∉ ℤ is the forced pointwise version of the meromorphic identities (at integers a Γ factor takes mathlib's default value 0). `zetaChi` is byte-identical to U3 `ZetaL/Challenge.lean:29–30` (diff empty) and equals the χ the draft prints in (5.2). (i), (ii-a), (ii-b) are unchanged and faithful as ruled at 22:55:14Z. §6 now claims the product identity and leaves Λ/ξ symmetry unclaimed — correct. Own probe: the full statement compiles (exit 0, one `sorry`); the three identities hold at 40 digits at five sample points (residuals < 4 × 10⁻⁴⁰). Detail: `specs/_V1-U11.md` §Re-read. The flip waits on the wall's read.

V2: V2-GREEN 2026-10-28T23:10:29Z — read against the correction DRAFT pass 2 `8346ab41` p14 (folio 13; not served — re-read at the republish), served `2d5287e7` p14 read first. The theorem says what the corrected §5.4 says: (0) off ℤ, χ(s)χ(1 − s) = 1 and (5.2) at s and at 1 − s — "(5.2) has reflection symmetry s ↔ 1 − s", with `zetaChi` byte-identical to U3 (`ZetaL/Challenge.lean:26–30`, diff empty) and equal to the χ printed beside (5.2); s ∉ ℤ is exactly the set where the Lean triple fails (at every integer one Γ factor of the product is mathlib's 0), and off ℤ is the full meromorphic content; (i) involution with fixed-point set {1/2}; (ii-a) the line fixed by s ↦ 1 − s̄, pointwise; (ii-b) non-trivial zeros (read literally) to non-trivial zeros, never the whole zero set. No junk value makes a conjunct true. Signed at statement_sha256 `7f9a7838…8b1`. Detail: `specs/_V2-U11.md`. The flip waits on the wall's read.

L-proofs: PROVED 2026-10-28T23:21:00Z — `rz_33b_reflection_fixed_point` in `RiemannZeta/Corrected/Solution.lean` (sha256 ce4df2f0…), which imports `RiemannZeta.ZetaL.Solution` (CO decision; U10 decision-2 pattern): (0) (5.2) at s and at 1 − s from U3's `rz_33a_functional_equation` (`zetaChi` linked by `rfl`), χ(s)χ(1 − s) = 1 by cpow_add, sin_pi_div_two_sub, sin_two_mul, Euler's reflection and sin(πs) ≠ 0 off ℤ (`aux_chi_mul`); (i) `ring` / `linear_combination`; (ii-a) real and imaginary parts; (ii-b) the strip by U3's rz_47 steps restated (`aux_strip`), ζ(1 − ρ) = 0 by `riemannZeta_one_sub`, then `riemannZeta_conj`. Build exit 0, no warning; axioms [propext, Classical.choice, Quot.sound]. The row flip waits on the wall's read. Log: `RiemannZeta/Corrected/BUILD-LOG.md` §Proofs phase.

V3: V3-CLEAN 2026-10-28T23:27:56Z — post-proof fidelity, row-independent, against the served `2d5287e7` p14 and the correction DRAFT pass 2 `8346ab41` p14 (not served; re-read at the republish). All five conjuncts true for the paper's reason: (0) χ(s)χ(1 − s) = 1 from Euler's reflection with every Γ factor genuine and nonzero off ℤ (no junk zero; at s = 0 the Lean product is 0, so the domain is load-bearing), (5.2) at s and 1 − s from U3's genuine `rz_33a` (hypothesis s ∉ ℕ; ℕ ∪ (1 − ℕ) = ℤ, so s ∉ ℤ is exact); (i), (ii-a) elementary; (ii-b) the strip honestly derived (`aux_strip`: ζ(0) = −1/2, non-vanishing on Re ≥ 1, Λ(1 − ρ) = Λ(ρ) at genuine points), then `riemannZeta_one_sub` and `riemannZeta_conj` at a genuine point. The hypothesis omits mathlib RH's `s ≠ 1`; the sets are extensionally equal (probe, `riemannZeta_one_ne_zero`) and ρ = 1 is a pole, not a zero, in the paper too — agreement, not a loophole. Axioms standard. Detail: `specs/_V3-U11.md`. The flip waits on the wall's read.
