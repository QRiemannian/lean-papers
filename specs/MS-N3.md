# L:MS-N3 — §3.1 / §3.2: φ = exp(¼ · systole), i.e. log φ = ¼ · systole

## 1 · Header
- row: L:MS-N3 — NEW row of the re-keyed ledger (§"MS — NEW rows"; the second head's / words sheet's "MS-05", the identity form — not ledger MS-05, which is the fixed points φ, −1/φ). Proposed bucket there: NOW (E0 with systole := 4 log φ).
- unit: — (NEW row; suggested home: U8 `ModularSurface/Now`, beside L:MS-22, in the same hypothesis form)
- paper: MS — *The Invariant Structure of the Modular Surface* (2026, revised October 2026)
- pdf_sha256: `b4841489ec6bea619f8d5525ce4c788b86e0109e51d6e9d2cb252690f5b13af5`
- locus: §3.1, the "φ from the systole" bullet, the sentence after display (3.5), served PDF p09 (printed folio 8); §3.2, served PDF p11 (printed folio 10)
- spec_clock: 2026-10-28T20:34:52Z

## 2 · Printed statement, verbatim
§3.1 (p09): "The framework reads φ off this systole datum, through the identity φ = exp(¼ · systole)."
§3.2 (p11): "Since φ = (1 + √5)/2, the quantities φ and √5 are not independent: they are two coordinates on one datum — the systolic class, read metrically (log φ = ¼ · systole) and arithmetically (√5 = √d_K) [CV]."

Context (p09): "systole(X(1)) = 4 log φ (3.5) (§2.2). Here "systole" is the standard restricted minimum, over closed geodesics arising from hyperbolic conjugacy classes".

## 3 · Formal reading
- As in L:MS-22 (`ms_22_halfSystole`), the systole enters as a real number with the hypothesis systole = 4 log φ — the value (3.5) is L:MS-06 = L:RZ-06b (EFFORT, provenance lane) and carried out of Q5 by `rz_63b_geometric`; it is not re-proved here.
- φ is `Real.goldenRatio`; exp and log are `Real.exp`, `Real.log`; "¼ · systole" is systole / 4.
- The row states both printed forms: φ = exp(systole/4) (§3.1) and log φ = systole/4 (§3.2, the metric coordinate). The arithmetic coordinate √5 = √d_K is (3.3), carried by its own row (L:MS-20 = L:RZ-09 / L:RZ-10), not restated.

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
| declaration | kind | file:line | namespace |
|---|---|---|---|
| `Real.goldenRatio` | abbrev | Mathlib/NumberTheory/Real/GoldenRatio.lean:37 | `Real` (opened :34) |
| `Real.goldenRatio_pos` | theorem | GoldenRatio.lean:90 | `Real` |
| `Real.exp_log` | theorem | Mathlib/Analysis/SpecialFunctions/Log/Basic.lean:59 | `Real` (opened :35) |
No gap.

## 5 · Intended Lean statement
Prose: for a systole equal to 4 log φ, φ = exp(systole/4) and log φ = systole/4.

```lean
/-- L:MS-N3 — MS §3.1, after (3.5), served p09, and §3.2, served p11 (sha256 b4841489…):
"φ = exp(¼ · systole)" and "log φ = ¼ · systole", for a systole equal to 4 log φ (the value is
L:MS-06 = L:RZ-06b, EFFORT; a hypothesis here, as in L:MS-22). -/
theorem ms_N3_phi_from_systole (systole : ℝ) (h : systole = 4 * Real.log Real.goldenRatio) :
    Real.goldenRatio = Real.exp (systole / 4) ∧
    Real.log Real.goldenRatio = systole / 4 := by
  sorry
```

Cost class: E0 (`Real.exp_log` with `Real.goldenRatio_pos`, `field_simp`); ≈ 0.1 pd.

## 6 · What the row does not claim
- Not systole(X(1)) = 4 log φ (L:MS-06 = L:RZ-06b, provenance lane; `rz_63b_geometric` out of Q5), nor the restricted-minimum / horocycle statement (L:MS-21, CITED).
- Not √5 = √d_K (L:MS-20), nor "two independent data, not three" [D] or the transcendence-degree remark.
- Not "the framework reads φ off this systole datum" as anything beyond the identity.

## 7 · Status
SPEC-DRAFT 2026-10-28T20:34:52Z

V1: V1-GREEN 2026-10-28T20:50:09Z — p09 and p11 read first: "through the identity φ = exp(¼ · systole)" and "read metrically (log φ = ¼ · systole)". Both printed forms stated, systole/4 for ¼ · systole, `Real.exp`/`Real.log`/`Real.goldenRatio`. The hypothesis is (3.5)'s printed value on the same page, the `ms_22_halfSystole` house form (ModularSurface/Now/Challenge.lean:206); it does not assert systole(X(1)) = 4 log φ, which stays L:MS-06 = L:RZ-06b. No stronger, no weaker.

V2: V2-GREEN 2026-10-28T22:54:12Z — U13 statement freeze, fresh seat: p09 and p11 read first. Both printed forms: φ = exp(¼·systole) and log φ = ¼·systole, ¼·systole as systole / 4 in ℝ. The hypothesis is (3.5)'s value in the `ms_22_halfSystole` binder text (ModularSurface/Now/Challenge.lean:206), so the systole's value is not asserted. No junk value enters (φ > 0). Byte-equal to §5. Unit SIGNED, statement_sha256 d7307749…3af. Sheet `_V2-U13.md`.

L-proofs: PROVED 2026-10-28T23:01:37Z — `ms_N3_phi_from_systole` in `ModularSurface/Accepted/Solution.lean`: systole/4 = log φ from h, then `Real.exp_log Real.goldenRatio_pos`. Build exit 0; axioms [propext, Classical.choice, Quot.sound]. Log: `ModularSurface/Accepted/BUILD-LOG.md` §Proofs phase.

V3: V3-CLEAN 2026-10-28T23:06:14Z: post-proof fidelity, fresh seat; p09 and p11 read first. phi = exp(systole/4) follows from systole/4 = log phi (from h) and Real.exp_log on phi > 0; the log form is the same equation reversed. The hypothesis has the ms_22_halfSystole binder text (Now/Challenge.lean:206) and is satisfiable. The row is thin but carries the exp-log inversion that MS-22 does not; it is the printed identity at the printed strength. Axioms [propext, Classical.choice, Quot.sound]. Sheet `_V3-U13.md`.
