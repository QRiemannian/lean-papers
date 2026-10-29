# V₂ — statement fidelity, unit U3 (`RiemannZeta/ZetaL`) — RE-SIGNED after the rz_46a repair

- opened: 2026-10-28T17:56:30Z · signed: 2026-10-28T17:57:38Z · record closed: 2026-10-28T17:58:29Z · seat V₂ (fresh context; never V₁'s, never L's, not the V₂ of `specs/_V2-U3.md`)
- dispatch: Orchestrator A, 2026-10-28; cause `specs/_V3-U3.md` (V3-FINDING rz_46a_ii_iii_xi_factor); repair by the M seat (last entries of `RiemannZeta/ZetaL/BUILD-LOG.md`) + two wording bits closed by the orchestrator by hand
- served PDF: `~/Claude/projects/qriemannian-site/public/pdfs/riemann-zeta-tetrahedral.pdf`, sha256 `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54` — match
- passage read by `pdftotext -layout -f 19 -l 19` (PDF p19, cover = p01, printed folio 18), BEFORE `specs/RZ-46a.md` and before the amended theorem
- Challenge.lean sha256 at open and at signing: `7200988ea94a50a995e69adf8e7d44c480cd72423c24fd00da215bf1e9301a27` (= `statement_sha256_draft`; unchanged through the read)
- Solution.lean: present on disk; not opened.

## 1 · The signed text, from git (read-only commands only)

```
$ git log --oneline -- RiemannZeta/ZetaL/Challenge.lean
f26b855 U3 ZetaL: rz_46a repair (hs1 : s ≠ 1) per V3-U3, lifted bar; draft digest 7200988e, V2 re-sign pending. U7 SmallArith: Solution.lean 5/5 proved, axioms clean
356e8a2 U3 ZetaL: Challenge.lean (14 statements, sorry bodies), comparator.json, formalization.yaml; index import
```

`git show <c>:RiemannZeta/ZetaL/Challenge.lean` into the scratchpad, then `shasum -a 256`:

| commit | blob sha256 |
|---|---|
| 356e8a2 | `0e7e6ca90da4fd55d8162c8f4a7b6c46dd11fbf456d473288fc6a5b0d143fb63` = the signed digest of `_V2-U3.md` |
| f26b855 | `7200988ea94a50a995e69adf8e7d44c480cd72423c24fd00da215bf1e9301a27` = the working file |

## 2 · The diff (signed 356e8a2 → current), complete

```diff
41c41
< meromorphic identity the spec states, with s ≠ 0, 1/2. -/
---
> meromorphic identity the spec states, with s ≠ 0, 1/2, 1. -/
171c171,172
< ξ(2s − 1)/ξ(2s) = ((s − 1)/s) · φ(s). Stated as the meromorphic identity of the spec (s ≠ 0, 1/2).
---
> ξ(2s − 1)/ξ(2s) = ((s − 1)/s) · φ(s). Stated as the meromorphic identity of the spec
> (s ≠ 0, 1/2, 1).
175c176
< theorem rz_46a_ii_iii_xi_factor (s : ℂ) (h₀ : s ≠ 0) (h₁ : s ≠ 1 / 2) :
---
> theorem rz_46a_ii_iii_xi_factor (s : ℂ) (h₀ : s ≠ 0) (h₁ : s ≠ 1 / 2) (hs1 : s ≠ 1) :
```

Classification, hunk by hunk:
- **41** — the `riemannXiRZ` docstring note (allowed class: the note). The definition body on line 42 is untouched.
- **171 → 171–172** — the theorem docstring's restatement of its hypotheses, rewrapped onto two lines (allowed class: the docstring lines that restate the hypotheses).
- **175 → 176** — the new hypothesis `(hs1 : s ≠ 1)` (allowed class: the hypothesis). The conclusion on lines 177–178 is byte-unchanged.

Nothing else differs. **No drift.**

## 3 · The other 13 theorems and the shared definitions

The diff touches only lines 41, 171 and 175 of the signed text. Every other line of the file — the header, `geometryConstant`, `zetaChi`, `scatteringRatio`, the body of `riemannXiRZ`, and the docstrings and statements of `rz_15_geometryConstant_writings`, `rz_16_geometryConstant_approx`, `rz_17_quaternary_product`, `rz_21_zeta_two_four`, `rz_32a_correction_q_form`, `rz_32b_zeta_three_q_form`, `rz_33a_functional_equation`, `rz_34_euler_product`, `rz_46a_o_lambda_convention`, `rz_46a_i_expansion`, `rz_47_zero_gives_pole`, `rz_49_norm_factor_eq_one`, `rz_60_golden_identities` — is byte-identical to the text signed at `0e7e6ca9…`. Their V2-GREEN verdicts in `specs/_V2-U3.md` carry over unchanged (RZ-32b's green remains fidelity only, its counting waiting on the wall).

## 4 · Judgement on the amended `rz_46a_ii_iii_xi_factor`

The print (§7.4, p19): Λ(s) := π^{−s/2}Γ(s/2)ζ(s); ξ(s) = ½s(s − 1)Λ(s) entire, from (12.4); "the ½s(s − 1) prefactors do not cancel … they contribute a factor (2s − 2)(2s − 1)/[(2s)(2s − 1)] = (s − 1)/s", followed by (7.5) φ(s) = Λ(2s − 1)/Λ(2s). The only arithmetic reading of "contribute a factor" is ξ(2s − 1)/ξ(2s) = ((s − 1)/s)·φ(s), an identity of meromorphic functions.

The statement, under `h₀ : s ≠ 0`, `h₁ : s ≠ 1/2`, `hs1 : s ≠ 1`:

- **(ii)** `(2s − 2)(2s − 1)/((2s)(2s − 1)) = (s − 1)/s`. This is the printed factor arithmetic. It needs only s ≠ 0, 1/2. The added hypothesis removes the single point s = 1 from an identity of rational functions, which is determined by its values off any finite set, so (ii) loses nothing it says.
- **(iii)** `riemannXiRZ (2s − 1) / riemannXiRZ (2s) = (s − 1)/s · scatteringRatio s`. `riemannXiRZ` = s(s − 1)/2 · `completedRiemannZeta` differs from the paper's entire ξ exactly at {0, 1}, which is also where `completedRiemannZeta` has its poles and mathlib's values are junk. The argument 2s − 1 lies in {0, 1} iff s ∈ {1/2, 1}; the argument 2s lies in {0, 1} iff s ∈ {0, 1/2}. So the excluded set {0, 1/2, 1} is **exactly** the set where an argument of ξ or Λ reaches {0, 1}. Off it, both `riemannXiRZ` values are the paper's ξ values, both Λ values are genuine, and the conjunct is the printed identity at every point where both sides are finite; where Λ(2s) = 0, both sides divide by 0 together and read 0 = 0, which is the Lean image of a common pole and asserts nothing beyond the print.
- **No stronger:** the conjunct is a true pointwise consequence of the meromorphic identity on its domain; it asserts no value at s = 1, where the earlier form asserted 0 = 0 through the local definition's deviation (the print's value there is ξ(1)/ξ(2) = 3/π, so that 0 was a value the print does not give).
- **No weaker:** a meromorphic identity is fixed by its values off a discrete set, so the pointwise statement on ℂ ∖ {0, 1/2, 1} carries the whole printed identity.

Notes: the hypothesis name `hs1` breaks the `h₀`/`h₁` pattern; that is naming only and does not enter fidelity. The `riemannXiRZ` note at line 39–41 now says correctly where the local form agrees with the paper's ξ and which points (iii) avoids.

Independent numerics (mpmath, 30 digits, paper's ξ from Λ = π^{−s/2}Γ(s/2)ζ(s)), only as a guard against a true-looking false statement: ξ(2s − 1)/ξ(2s) and ((s − 1)/s)·Λ(2s − 1)/Λ(2s) agree to 29–30 digits at s = 0.3 + 2.1i (1.00016040196239… − 0.20244196322371…i), s = −0.7 + 0.4i and s = 2.2 − 5i.

Verdict: `rz_46a_ii_iii_xi_factor` (amended) — **V2-GREEN**.

## 5 · Record writes

- `RiemannZeta/ZetaL/formalization.yaml`: the superseded `statement_sha256: "0e7e6ca9…"`, its `superseded_by_repair` marker and the old `v2_signed: "2026-10-28T17:28:36Z"` are kept as they were; directly below them (after the old stamp, so the old stamp stays beside the digest it signed) the comment `# re-signed after the rz_46a repair`, `statement_sha256: "7200988e…"` and `v2_signed: "2026-10-28T17:57:38Z"`.
- `specs/RZ-46a.md`: a `V2:` line appended.
- **Flag for the orchestrator (mechanical, not mine to fix):** `tools/check.sh` arm 5 reads the signed digest with `grep -E '^[[:space:]]*statement_sha256:' … | head -1`, which now returns the superseded `0e7e6ca9…`, so `challenge_digest` will report FAIL for ZetaL until either the superseded key is renamed (e.g. `statement_sha256_superseded:`) or the arm reads the last match. The file also now carries duplicate `statement_sha256` and `v2_signed` keys in one mapping; PyYAML-style loaders take the last value (the new pair, by the placement above), strict loaders refuse duplicates.

## Signature

V2-SIGNED 2026-10-28T17:57:38Z — statement_sha256 `7200988ea94a50a995e69adf8e7d44c480cd72423c24fd00da215bf1e9301a27` written to `RiemannZeta/ZetaL/formalization.yaml` (fresh `statement_sha256:` + `v2_signed:` below the superseded pair). Diff against the signed `0e7e6ca9…` text: the new hypothesis, the hypothesis-restating docstring lines and the `riemannXiRZ` note only — no drift. Amended `rz_46a_ii_iii_xi_factor` V2-GREEN; the 13 other theorems byte-unchanged, their greens standing. V2 line appended to `specs/RZ-46a.md`.
