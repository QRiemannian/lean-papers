# UNIT U11 — `RiemannZeta/Corrected` (the two corrected legs: L:RZ-33b, L:RZ-41b) — seat M summary

- unit: U11 · seat: M (statement author), dispatched by Orchestrator A 2026-10-28 for LANE 1 of the wall's word (`Orchestrator/Chat-Design/cc-handoff/projects/priority/inbox/WORD-wall-2026-10-28-night-words.md`: "once CC-13 and CC-16's corrections land, RZ-33 and RZ-41 unblock — draft their Lean legs' specs in the same wave so the headline can reach 50 of 50 the moment the wall's read lands")
- paper: RZ, served edition sha256 2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54 (re-read with `shasum -a 256` at the seat's start, 2026-10-28T22:35:43Z; matches). **The corrected edition is not yet served**: the specs quote the corrected wording the RZ draft seat is applying (CC-15, CC-16 of `reputation-play/correction-wave/CC-11-to-14-candidates-2026-10-28.md`); the corrected edition's sha256 replaces `2d5287e7` in the docstrings and in V₁'s read when the republish lands.
- mathlib pin: db584cd6d46c92f209a44c0f1c829460d327499d · Lean leanprover/lean4:v4.33.0
- pages read from the served PDF by `pdftotext -layout` (cover = p01): p14 (§5.4), p17–p18 (§7.1–§7.2), p31 (§12.5)
- inputs read: TEMPLATE-M (whole, with the sitting-71 addendum), `specs/RZ-33a.md`, `RZ-33b.md`, `RZ-41a.md`, `RZ-41b.md`, `RZ-41c.md`, `_UNIT-U3.md`, `_UNIT-U4.md`, `_UNIT-U10.md`, `_V2-U3-resign.md` (head), the correction sheet's CC-15/CC-16 entries and corroborations, `RiemannZeta/ZetaL/Challenge.lean` + `comparator.json` + `formalization.yaml`, `RiemannZeta/MatricesMobius/Challenge.lean` + `Solution.lean` (rz_41a block), `ledger/STATUS.md` rows RZ-33, RZ-41
- summary_clock: 2026-10-28T22:40:59Z

## M-amend at V₁-U11's DRIFT (2026-10-28T22:56:18Z) — supersedes the amendment paragraph below where they differ
V₁-U11 (`specs/_V1-U11.md`): RZ-41b V1-GREEN (cusp clause stays); RZ-33b V1-DRIFT (weaker) — the printed first clause predicates the symmetry of the EQUATION (5.2), which the 22:46:46Z statement never mentioned. **Fixed as V₁ asked** (`specs/RZ-33b.md`, last section): the χ-triple is back as conjunct (0) — for s ∉ ℤ, χ(s)χ(1 − s) = 1 ∧ (5.2) at s ∧ (5.2) at 1 − s — beside (i) involution + fixed point {1/2}, (ii-a) the line fixed by s ↦ 1 − s̄, (ii-b) non-trivial zeros to non-trivial zeros. **The unit again restates one U3 definition, `zetaChi`**, byte-identical to `ZetaL/Challenge.lean:29–30` (`diff`: identical) and equal to the χ the draft prints in (5.2) — the U10 decision-2 pattern; U11's `Solution.lean` may import `RiemannZeta.ZetaL.Solution` for `rz_33a` (or restate its steps). No signature of U3 or U4 moves; the new-unit decision stands (V₁ AGREE). The full statement elaborates with `sorry` (`<scratchpad>/m-u11/Probe5.lean`, exit 0). RZ-33b class E1, 0.75–1 pd. Read the paragraph below's "the unit now carries no definition from U3 or U4 at all", "no longer restates `zetaChi`", "no longer needs the `ZetaL.Solution` import" and "the χ-triple … withdrawn" as superseded by this one.

## Amendment at the landed draft (2026-10-28T22:46:46Z) — read this first
The RZ draft seat's landed text (`priority/outbox/CORRECTION-WAVE-2026-10-28/RZ-APPLIED.md`; draft PDF sha256 `1b2af75cc5975dea65088d6742aa55ef422afd9f5b0dedf0cf572c88af04c4e2`, p14 and p17–18 read) prints CC-15 with a second clause: "… with fixed point s = 1/2 [CV] … Together with ζ(s̄) = conj ζ(s) it makes the non-trivial zeros symmetric about the line Re(s) = 1/2, the line fixed by s ↦ 1 − s̄ [CV]." **RZ-33b is re-specced** (`specs/RZ-33b.md`, last section, which supersedes the earlier statement): (i) s ↦ 1 − s involutive with fixed-point set {1/2}; (ii-a) the fixed points of s ↦ 1 − s̄ are the line Re s = 1/2; (ii-b) the NON-TRIVIAL zeros (read literally: ρ ≠ −2(n+1)) map to non-trivial zeros under s ↦ 1 − s̄ — never the whole zero set (−2n ↦ 1 + 2n, where ζ ≠ 0). (ii) is at the pin cleanly (`riemannZeta_conj`, ZetaAsymp.lean:458, root namespace; `riemannZeta_one_sub`; `riemannZeta_ne_zero_of_one_le_re`, Nonvanishing.lean:411; `Complex.cos_eq_zero_iff`, Trigonometric/Complex.lean:33), so the leg states (i) and (ii) in Lean. The earlier χ-triple (χ(s)χ(1 − s) = 1, (5.2) at s and 1 − s) is **withdrawn**: RZ-33b no longer restates `zetaChi` and no longer needs the `ZetaL.Solution` import — the unit now carries no definition from U3 or U4 at all, which strengthens reason 1 below. RZ-33b's class moves to E1 0.5–0.75 pd (the strip-location step carries the weight). RZ-41b: the draft prints CC-16's wording exactly; statement unchanged (the Parabolic row breaks onto draft p18, typography only). Wherever the sections below mention `zetaChi`, the χ-triple, or the Solution import for RZ-33b, read them as superseded by this paragraph.

## The unit decision: a NEW unit, `RiemannZeta/Corrected`, carrying both legs

**Recommended: new unit U11, module `RiemannZeta/Corrected/`, namespace `RiemannZeta.Corrected`; U3 and U4 stay untouched.** Reasons:
1. **Both statements stand alone.** RZ-33b needs one definition, `zetaChi`, restated byte-identically from U3; RZ-41b needs no unit definition at all (mathlib's predicates and actions only). Nothing in either leg requires a frozen signature to change.
2. **U3 and U4 are not just frozen — they are CHECKED** (commit 5c6a9cd, `manifests/build-5c6a9cd.json`, comparator PASS, axioms clean). An amendment supersedes each unit's signed `statement_sha256` (the U3 rz_46a precedent: `statement_sha256_superseded:` / `v2_signed_superseded:` keys, a fresh V₂ re-sign of the whole Challenge, a rebuild) — twice, once per unit, and re-exposes eleven-plus CHECKED rows to a re-read for two new theorems. A new unit costs one V₂ over two statements and leaves every CHECKED digest and manifest exactly as it is.
3. **The precedent of tonight:** U9 (`Provenance`) and U10 (`LValue`) were opened as new units for rows that could stand alone; U10's CO decision 2 settled how a new unit reuses a frozen one — its `Solution.lean` MAY import another unit's `Solution` (never a `Challenge`), and a byte-identical restated definition links by `rfl`. U11 uses exactly that for RZ-33b's conjunct (a).
4. **The CC-shaped pair travels together.** Both legs exist because of corrections landing in one wave and flip on one wall read; one unit gives the flip one Challenge, one V₂, one build entry, one manifest line.

Ledger effect when the flip lands: `ledger/STATUS.md` rows L:RZ-33b and L:RZ-41b read unit U11 (their siblings keep U3/U4); L:RZ-33 and L:RZ-41 become whole; RZ reaches 50 of 50 — **the flip waits on the wall's read of the correction drafts** (and on the republish the docstrings name).

## Rows specced (2 legs, 2 spec files, each with a dated "M — the corrected claim" section appended)

| spec / row | ledger row | locus (served) | corrected wording (CC) | status |
|---|---|---|---|---|
| `specs/RZ-33b.md` → **RZ-33b** | L:RZ-33 → b | §5.4 after (5.2), p14 | "has reflection symmetry s ↔ 1 − s with fixed point s = 1/2" (CC-15; the served edition's own words at §12.5 p31) | SPEC-DRAFT (corrected claim) · NOW |
| `specs/RZ-41b.md` → **RZ-41b** | L:RZ-41 → b | §7.1 intro sentence + Parabolic row, p17 | "its elements other than ±I classify into three types by fixed-point behavior"; Parabolic "\|tr(γ)\| = 2, γ ≠ ±I — fixes a single boundary point (cusp)" (CC-16) | SPEC-DRAFT (corrected claim) · NOW |

No new split; no CC-CANDIDATE in the corrected text: both corrected claims read true (checked numerically / by enumeration, a check on the reading, not a proof).

## Names table

**Declarations the unit exports (proposed):**
| name | kind | row |
|---|---|---|
| `RiemannZeta.Corrected.zetaChi` | `noncomputable def` — restated byte-identically from `RiemannZeta.ZetaL.zetaChi` (χ(s) = 2^s π^{s−1} sin(πs/2) Γ(1 − s), the χ printed in (5.2)) | 33b |
| `RiemannZeta.Corrected.rz_33b_reflection_fixed_point` | theorem: (0) off ℤ, χ(s)χ(1 − s) = 1 and (5.2) at s and at 1 − s; (i) s ↦ 1 − s involutive with `Function.fixedPoints = {1/2}`; (ii) the fixed points of s ↦ 1 − s̄ are the line Re s = 1/2; a non-trivial zero ρ (ρ ≠ −2(n+1)) has 1 − ρ̄ a non-trivial zero | 33b |
| `RiemannZeta.Corrected.rz_41b_noncentral_trichotomy` | theorem: γ ≠ ±I ⇒ exactly one type, by trace; parabolic class-invariant; parabolic fixes no point of ℍ and exactly one of ℝ ∪ {∞}, which is ∞ or rational | 41b |

Header of the Challenge: `import Mathlib`, `open scoped MatrixGroups`, `open UpperHalfPlane`, `namespace RiemannZeta.Corrected`. Both statements (with `sorry`) elaborate through `lake env lean` on the scratch probe `<scratchpad>/m-u11/Probe.lean` — exit 0, two `sorry` warnings, nothing else.

**What the new legs add beyond the frozen siblings.** RZ-33b: the fixed point of the reflection and the equation's invariance under it (χ(s)χ(1 − s) = 1 and the reflected equation), beyond U3's one-way (5.2). RZ-41b: the Parabolic row for non-central γ (trace, class invariance, none in ℍ, exactly one boundary fixed point, a cusp) and the trichotomy's exhaustiveness and exclusivity on SL(2, ℤ) ∖ {±I} — U4's rz_41a carries only the hyperbolic and elliptic rows. The boundary action is at the pin, so RZ-41b's fixed-point reading is stated in Lean, not carried as a docstring gloss.

**Mathlib declarations the rows target** (full tables with file:line and namespace in each spec's §4):
- **33b:** `riemannZeta`, `riemannZeta_one_sub`, `Complex.Gamma`, `Complex.Gamma_mul_Gamma_one_sub` (Gamma/Beta.lean:398), `Complex.Gamma_ne_zero` (Beta.lean:427), `Complex.sin_ne_zero_iff` (Trigonometric/Complex.lean:58), `Complex.sin_two_mul`, `Complex.sin_pi_div_two_sub` (Trigonometric/Basic.lean:1153), `Complex.cos_pi_div_two_sub` (:1159), `Complex.cpow_add` / `cpow_neg` / `cpow_one` / `cpow_neg_one` / `mul_cpow_ofReal_nonneg`, `Function.fixedPoints` (Dynamics/FixedPoints/Defs.lean:28), `Function.mem_fixedPoints` (:36), `Function.Involutive` (Logic/Function/Basic.lean:1010); and, through the Solution import, `RiemannZeta.ZetaL.rz_33a_functional_equation`.
- **41b:** `Matrix.IsParabolic` (FinTwo.lean:40), `Matrix.IsHyperbolic` (:137), `Matrix.IsElliptic` (:140), `Matrix.isParabolic_conj_iff` (:46), `Matrix.GeneralLinearGroup.IsParabolic` (:210), `Matrix.discr_fin_two`, `Matrix.discr_conj`, `Matrix.trace_fin_two`, `Matrix.det_fin_two`, `Matrix.SpecialLinearGroup.det_coe` / `coe_mul` / `mapGL`, `UpperHalfPlane.SLAction` (MoebiusAction.lean:285), `UpperHalfPlane.gl_smul_eq_self_iff_quadratic` (FixedPoints.lean:115), `UpperHalfPlane.isElliptic_of_exists_smul_eq_self` (:122), `OnePoint.instGLAction` (ProjectiveLine.lean:128), `Matrix.GeneralLinearGroup.parabolicFixedPoint` (:188), `Matrix.GeneralLinearGroup.IsParabolic.smul_eq_self_iff` (:191).

**Name check — one hit pasted with its namespace (the sitting-71 form, run on the real tree):** `Mathlib/Topology/Compactification/OnePoint/ProjectiveLine.lean:191:lemma IsParabolic.smul_eq_self_iff {g : GL (Fin 2) K} (hg : g.IsParabolic) [NeZero (2 : K)]`, inside `namespace Matrix.GeneralLinearGroup` (:167–:244) → `Matrix.GeneralLinearGroup.IsParabolic.smul_eq_self_iff`, confirmed by `#check`. A short name the old grep form would have mis-placed: `Mathlib/Analysis/Complex/UpperHalfPlane/FixedPoints.lean:122:theorem isElliptic_of_exists_smul_eq_self`, inside `namespace UpperHalfPlane` (:38–:214) → `UpperHalfPlane.isElliptic_of_exists_smul_eq_self`.

**Names not found at the pin:** `Matrix.SpecialLinearGroup.center_eq_bot_or` (probe: unknown constant; not on the route — ±I handled by entries); a short-name `cpow_ne_zero` (no hit; not on the route — `cpow_add` takes the base ≠ 0 directly). No gap in either row.

## Recommended build order (tonight, clean-resumable at every step)
1. **U11 Challenge** — header, `zetaChi` (diff the block against `ZetaL/Challenge.lean`: byte-identical), the two statements with `sorry`; compile; `statement_sha256_draft`; `comparator.json` with the two theorem names; `formalization.yaml` naming the rows' units and the CC numbers. (E0)
2. **V₂ on U11** — reads the two statements against the corrected wording (and against the republished edition if it has landed by then; otherwise against the correction drafts, re-read at the republish).
3. **RZ-41b** — E1, 0.5–1 pd; route in `RZ-41b.md` §7 (steps 1–4 are integer arithmetic on the U4 rz_41a pattern; 5–8 the transfer to ℝ and the two fixed-point lemmas).
4. **RZ-33b** — E1, 0.25–0.5 pd; route in `RZ-33b.md` §7. `Solution.lean` imports `RiemannZeta.ZetaL.Solution` for conjunct (a) per the CO's U10 decision 2 (or restates U3's (a) proof if the CO rules U11 self-contained).
5. **V₃ on U11**, build entry, manifest line; `ledger/STATUS.md` rows staged, not flipped.
6. **The flip** — RZ-33b and RZ-41b to CHECKED, L:RZ-33 and L:RZ-41 whole, RZ 50 of 50 — only after the wall's read of the correction drafts lands; docstrings' PDF prefix updated to the corrected edition's at the republish (a docstring change before V₂ signs, or a re-sign if after).

## CC note
**The flip waits on the wall's read of the correction drafts.** The statements are written to the corrected wording; until the wall reads CC-15 and CC-16's drafts and the corrected edition is served, both rows stay OPEN and uncounted in `ledger/STATUS.md`, whatever their build state.

## The one thing V₁ should look hardest at, per row
- **RZ-33b (after the M-amend):** that (0) states the equation's symmetry as V₁ asked and (ii-b) stays non-trivial-only. Earlier wording, kept: whether "the functional equation … has reflection symmetry s ↔ 1 − s" is faithfully the triple (5.2) at s, (5.2) at 1 − s, and χ(s)χ(1 − s) = 1 on s ∉ ℤ — in particular that the product identity is the content of "symmetry" (without it the two instances say nothing), and that no Λ / zero-set conjunct is owed by the corrected sentence. And "fixed point s = 1/2" read as the full fixed-point set {1/2}.
- **RZ-41b:** the "(cusp)" reading — the boundary fixed point lies in ℚ ∪ {∞} — as the parenthesis's content rather than an added claim; and that carrying the hyperbolic/elliptic trace equivalences again (under γ ≠ ±I) is the Condition column of the trichotomy, not a duplication that changes the count.

## Working files (scratch, `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/m-u11/`; a later stage may read them)
- `p14.txt`, `p17-18.txt`, `p31.txt` — the served pages by `pdftotext -layout`.
- `Probe.lean` + `Probe.out` — both statements (namespace `RiemannZeta.Corrected`) and the route names, compiled with `lake env lean` (exit 0, two `sorry` warnings); `Probe2.lean`/`.out`, `Probe3.lean`/`.out` — further `#check`s.
- `check_chi.py` — χ(s)χ(1 − s) = 1 and both equation residuals at 40 digits; the parabolic enumeration on SL(2, ℤ) ∩ [−6, 6]⁴.
- `namecheck.sh` — the sitting-71 name-check form as a script.

No git run, no web, nothing under the lab's non-public research trees read; no Lean file written in the repo.

*Status:* SPEC-DRAFT 2026-10-28T22:40:59Z — V₁ appends its own line.
