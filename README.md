# lean-papers

Lean 4 checks of statements in the mathematics papers published by QRiemannian Research.

This repository checks, in Lean 4 against a pinned version of mathlib, the formal statements that our published papers stand on. It does not check, and no proof assistant can check, the interpretive or characterizing claims those papers make.

## What is checked

**Of the 94 statements catalogued from *The Tetrahedral Structure of the Riemann Zeta Function* (revised edition, October 2026), 53 are within a proof assistant's reach under the stated scope, and 53 of those are checked in Lean 4 against mathlib commit `db584cd6d46c92f209a44c0f1c829460d327499d`; interpretive claims are outside what a proof assistant checks.**

**Of the 56 statements catalogued from *The Invariant Structure of the Modular Surface* (revised edition, October 2026), 14 are within a proof assistant's reach under the stated scope, and 13 of those are checked in Lean 4 against mathlib commit `db584cd6d46c92f209a44c0f1c829460d327499d`; interpretive claims are outside what a proof assistant checks.**

Fifteen further statements that fall outside the agreed scope were proved along the way; `ledger/STATUS.md` lists them under their own label, *proved beyond the agreed scope*, and they are not counted above.

## Which text was checked

Every statement here is taken from the current edition of its paper, revised October 2026. Each paper's Revisions note names the areas revised; a full revision history is available on request. The editions are identified by digest:

- *The Tetrahedral Structure of the Riemann Zeta Function*, revised October 2026 (republished 29 October 2026), PDF sha256 `6b89ce0e7ae0a71301a8d792b6e80f4cb850244df83f4731810377d70e3d2d12`
- *The Invariant Structure of the Modular Surface*, revised October 2026 (republished 29 October 2026), PDF sha256 `08b0181becaa56be021886bbf478db956883da6d6a00b3c92297653b6ea5ae67`

The statements were compared with the editions served from 27 October 2026 (sha256 `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54` and `b4841489ec6bea619f8d5525ce4c788b86e0109e51d6e9d2cb252690f5b13af5`); the editions of 29 October differ from them only at the places each paper's Revisions note names, and the two zeta statements those revisions touched (`ledger/STATUS.md`, rows RZ-33 and RZ-41) are stated against the revised text. Each unit's `formalization.yaml` records the digest its statements were compared with.

## Four kinds of statement, kept apart

`ledger/STATUS.md` lists every statement we catalogued from each paper, under one of these labels:

- **Checked in Lean.** The theorem is in a `Challenge.lean` file and proved in the matching `Solution.lean`. It builds against mathlib commit `db584cd6d46c92f209a44c0f1c829460d327499d`, uses only the axioms `propext`, `Classical.choice` and `Quot.sound`, and passes Comparator (on macOS the kernel re-check runs without its Linux sandbox; see `tools/env.sh`). Before the proof was written, a reviewer who had not seen it compared each statement with the paper's printed text. Those comparisons are in `specs/`.
- **Independently reproduced.** A printed numerical value was recomputed by two programs written without sight of each other (`computations/<row>/impl-a` and `impl-b`), and both agree with the printed digits under one stated rounding rule. Seven rows carry the label: RZ-27, RZ-48, RZ-N6, MS-17, MS-33, MS-35 and MS-N5b. Two of them, RZ-27 and MS-33, did not reproduce against the edition of 27 October 2026 — one truncated table cell, and a count of nine that reads twelve under the rule the paper now states — and were corrected in the edition of 29 October 2026, against which both reproduce.
- **Cited, not checked.** These are established results from the literature that mathlib does not yet reach: the Selberg trace formula, the scattering matrix of the non-holomorphic Eisenstein series, Mayer's transfer-operator theorem, the Riemann–von Mangoldt formula, and others listed by row.
- **Interpretive.** These are the papers' readings and characterizations. They are outside what a proof assistant checks and are not presented here as checked.

The operator algebra of the zeta paper (its §3) is not formalized as an object. The only statements here that mention its relations are the two internal-consistency computations of the paper's §13. Both are negative results: they show what the algebra cannot satisfy.

## Check it yourself

```
lake exe cache get
lake build
source tools/env.sh   # macOS only: points Comparator at scripts/fake-landrun.sh (no sandbox)
bash tools/check.sh   # six checks; per unit: lake env comparator <unit>/comparator.json
```

The toolchain is `leanprover/lean4:v4.33.0`, and mathlib is pinned at `db584cd6d46c92f209a44c0f1c829460d327499d` in `lake-manifest.json`.

## Who did this

The Lean statements and proofs were written by the Claude family of models, working as agents in our review process. Every unit discloses this in `formalization.yaml` under `automation.methods`. The accountable author is **Andri Sigurgeirsson Vidalin**, QRiemannian Research, Reykjavík (Research@QRiemannian.ai). QRiemannian Research is co-founded by Andri Sigurgeirsson Vidalin and the Claude family of models.

## What this repository is not

It is not a claim of new mathematics. The mathematics checked here is established, and the papers' own contribution lies in their characterizations, which this repository does not check. It is not a registry submission.

## License

The code of this repository is released under the Apache License, Version 2.0 (see `LICENSE`). The papers remain under their authors' copyright.

