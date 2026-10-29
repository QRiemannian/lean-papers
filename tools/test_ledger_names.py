# -*- coding: utf-8 -*-
"""Tests for tools/ledger_names.py (unittest; run: python3 -I tools/test_ledger_names.py).

The real-tree cases read the pinned mathlib at <repo>/.lake/packages/mathlib (skipped when absent).
The --settled cases build their git repos as hand-written .git skeletons (HEAD, config, objects/,
refs/heads/) in a temporary folder OUTSIDE this repo — $LEDGER_NAMES_SCRATCH when set, else the
system temp dir — so no git command that writes is ever run; the only git the suite causes is the
script's own named read, GIT_OPTIONAL_LOCKS=0 git status --porcelain -- '*.lean'.
"""
import contextlib
import io
import os
import shutil
import subprocess
import sys
import tempfile
import unittest
from unittest import mock

HERE = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.dirname(HERE)
sys.path.insert(0, HERE)
sys.dont_write_bytecode = True  # `-I` ignores PYTHONDONTWRITEBYTECODE; no __pycache__ in the lane
import ledger_names as ln  # noqa: E402

MATHLIB = os.path.join(REPO, ".lake", "packages", "mathlib")
SCRATCH = os.environ.get("LEDGER_NAMES_SCRATCH") or tempfile.gettempdir()


def write(path, text):
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8") as fh:
        fh.write(text)
    return path


def git_skeleton(root):
    """A repository git can read, made without running git."""
    write(os.path.join(root, ".git", "HEAD"), "ref: refs/heads/main\n")
    write(os.path.join(root, ".git", "config"), "[core]\n\trepositoryformatversion = 0\n\tbare = false\n")
    os.makedirs(os.path.join(root, ".git", "objects"), exist_ok=True)
    os.makedirs(os.path.join(root, ".git", "refs", "heads"), exist_ok=True)
    return root


FIXTURE = {
    "Mathlib/Algebra/DirectSum/Decomposition.lean": """\
@[expose] public section
/-! # Decompositions
This def Decomposition in a doc comment is not a declaration. -/
namespace DirectSum
section AddCommMonoid
-- class Decomposition (commented out)
class Decomposition where
  x : Nat
theorem Decomposition_eq : True := trivial
end AddCommMonoid
end DirectSum
""",
    "Mathlib/LinearAlgebra/Echelon.lean": """\
namespace Echelon
structure Decomposition (n : Nat) where
  y : Nat
end Echelon --namespace
def rootThing : Nat := 0
theorem _root_.otherRoot : True := trivial
""",
    "Mathlib/NumberTheory/Zeta.lean": """\
noncomputable section
def zetaFn₀ (s : Nat) : Nat := s
def zetaFn (s : Nat) : Nat := s
namespace Matrix
mutual
def evenF : Nat → Bool
  | _ => true
def oddF : Nat → Bool
  | _ => false
end
def IsHyperbolic : Prop := True
namespace GeneralLinearGroup
abbrev IsHyperbolic : Prop := True
abbrev IsElliptic : Prop := True
end GeneralLinearGroup
end Matrix
""",
}

LEDGER = """\
# LEDGER NAMES fixture

## AMBIGUOUS (2)

| name | reading | near hits | ledger lines |
|---|---|---|---|
| `IsHyperbolic` | short form | — | 3 |
| `.IsElliptic` | suffix-only | — | 4 |

## FOUND (1)

| name | module | ledger lines |
|---|---|---|
| `DirectSum.Decomposition` | Mathlib.Algebra.DirectSum.Decomposition | 2 |
"""
CLAIMS = """\
| id | cites |
| A-1 | `DirectSum.Decomposition` |
| A-2 | `Matrix.GeneralLinearGroup.IsHyperbolic` and the bare `IsHyperbolic` |
| A-3 | `Matrix.GeneralLinearGroup.IsHyperbolic`, `.IsElliptic` |
"""


def run_main(argv):
    out, err = io.StringIO(), io.StringIO()
    with contextlib.redirect_stdout(out), contextlib.redirect_stderr(err):
        rc = ln.main(argv)
    return rc, out.getvalue(), err.getvalue()


class Fixture(unittest.TestCase):
    """The expression and the confirm step on a small hand-written tree."""

    @classmethod
    def setUpClass(cls):
        cls.tmp = tempfile.mkdtemp(prefix="ledger-names-fixture-", dir=SCRATCH)
        assert not os.path.abspath(cls.tmp).startswith(REPO + os.sep)
        for rel, text in FIXTURE.items():
            write(os.path.join(cls.tmp, "ml", rel), text)
        cls.ml = ln.Mathlib(os.path.join(cls.tmp, "ml"))
        write(os.path.join(cls.tmp, "lg", "LEDGER-NAMES.md"), LEDGER)
        write(os.path.join(cls.tmp, "lg", "CLAIM-LEDGER.md"), CLAIMS)

    @classmethod
    def tearDownClass(cls):
        shutil.rmtree(cls.tmp, ignore_errors=True)

    def verdict(self, name):
        return ln.render(*ln.classify(self.ml, name))

    def test_dotted_name_found_in_its_namespace(self):
        self.assertEqual(self.verdict("DirectSum.Decomposition"),
                         "FOUND DirectSum Mathlib/Algebra/DirectSum/Decomposition.lean:7")

    def test_comment_hits_are_not_sites(self):
        sites = ln.classify(self.ml, "Decomposition")[1]
        self.assertEqual(sorted(h[2] for h in sites), ["DirectSum.Decomposition", "Echelon.Decomposition"])

    def test_end_with_trailing_comment_pops(self):
        self.assertEqual(self.verdict("rootThing"), "FOUND _root_ Mathlib/LinearAlgebra/Echelon.lean:5")

    def test_root_prefix_honoured(self):
        self.assertEqual(self.verdict("otherRoot"), "FOUND _root_ Mathlib/LinearAlgebra/Echelon.lean:6")

    def test_unicode_continuation_is_not_the_name(self):
        self.assertEqual(self.verdict("zetaFn"), "FOUND _root_ Mathlib/NumberTheory/Zeta.lean:3")

    def test_mutual_end_does_not_pop_a_namespace(self):
        self.assertEqual(self.verdict("Matrix.IsHyperbolic"), "FOUND Matrix Mathlib/NumberTheory/Zeta.lean:11")
        self.assertEqual(self.verdict("Matrix.GeneralLinearGroup.IsHyperbolic"),
                         "FOUND Matrix.GeneralLinearGroup Mathlib/NumberTheory/Zeta.lean:13")

    def test_short_form_ambiguous_and_namespace_note(self):
        self.assertEqual(self.verdict("IsHyperbolic"), "AMBIGUOUS 2 sites")
        self.assertEqual(self.verdict("Matrix.Nope"), "NOT FOUND")
        self.assertEqual(self.verdict("Echelon"),
                         "NOT FOUND — a namespace Echelon opens in 1 file(s), e.g. Mathlib/LinearAlgebra/Echelon.lean")

    def test_ledger_mode_reads_the_line_in_context(self):
        rc, out, _ = run_main([os.path.join(self.tmp, "ml"), "--ledger",
                               os.path.join(self.tmp, "lg", "LEDGER-NAMES.md"), "--only", "AMBIGUOUS"])
        self.assertEqual(rc, 0)
        rows = [l.split("\t") for l in out.splitlines() if not l.startswith("#")]
        self.assertEqual([r[0] for r in rows], ["IsHyperbolic", ".IsElliptic"])
        self.assertEqual(rows[0][2], "AMBIGUOUS 2 sites")
        self.assertIn("Matrix.GeneralLinearGroup.IsHyperbolic (CLAIM-LEDGER :3) -> FOUND Matrix.GeneralLinearGroup", rows[0][3])
        self.assertIn("Matrix.GeneralLinearGroup.IsElliptic (CLAIM-LEDGER :4) -> FOUND Matrix.GeneralLinearGroup", rows[1][3])


class Settled(unittest.TestCase):
    """--settled: the one named read-only git form; exit 2 naming the uncommitted .lean."""

    def setUp(self):
        self.tmp = tempfile.mkdtemp(prefix="ledger-names-settled-", dir=SCRATCH)
        assert not os.path.abspath(self.tmp).startswith(REPO + os.sep)
        for rel, text in FIXTURE.items():
            write(os.path.join(self.tmp, "ml", rel), text)
        self.repo = git_skeleton(os.path.join(self.tmp, "repo"))
        write(os.path.join(self.repo, "README.md"), "not lean\n")
        self.env = mock.patch.dict(os.environ, {"GIT_CEILING_DIRECTORIES": self.tmp})
        self.env.start()

    def tearDown(self):
        self.env.stop()
        shutil.rmtree(self.tmp, ignore_errors=True)

    def test_settled_tree_runs(self):
        rc, out, err = run_main([os.path.join(self.tmp, "ml"), "--settled", self.repo, "DirectSum.Decomposition"])
        self.assertEqual((rc, err), (0, ""))
        self.assertIn("FOUND DirectSum", out)

    def test_one_uncommitted_lean_refuses_with_exit_2_and_names_it(self):
        write(os.path.join(self.repo, "LeanPapers", "Dirty.lean"), "theorem x : True := trivial\n")
        rc, out, err = run_main([os.path.join(self.tmp, "ml"), "--settled", self.repo, "DirectSum.Decomposition"])
        self.assertEqual(rc, 2)
        self.assertEqual(out, "")
        self.assertIn("1 uncommitted .lean path(s); refusing", err)
        self.assertIn("LeanPapers/Dirty.lean", err)

    def test_cli_exit_code_2_from_the_shell(self):
        write(os.path.join(self.repo, "Dirty.lean"), "-- dirty\n")
        r = subprocess.run([sys.executable, "-I", os.path.join(HERE, "ledger_names.py"),
                            os.path.join(self.tmp, "ml"), "--settled", self.repo, "--ledger", "unused.md"],
                           capture_output=True, text=True,
                           env=dict(os.environ, PYTHONDONTWRITEBYTECODE="1"))
        self.assertEqual(r.returncode, 2)
        self.assertIn("Dirty.lean", r.stderr)

    def test_not_a_repository_refuses(self):
        bare = os.path.join(self.tmp, "plain")
        os.makedirs(bare)
        rc, _out, err = run_main([os.path.join(self.tmp, "ml"), "--settled", bare, "X"])
        self.assertEqual(rc, 2)
        self.assertIn("refusing", err)


@unittest.skipUnless(os.path.isdir(os.path.join(MATHLIB, "Mathlib")), "pinned mathlib checkout absent")
class RealMathlib(unittest.TestCase):
    """The directive's 342 case and the short / NOT FOUND cases, on the pinned tree."""

    @classmethod
    def setUpClass(cls):
        cls.ml = ln.Mathlib(MATHLIB)
        cls.ml.preload(["Decomposition", "orderOf", "IsHyperbolic", "abs", "bernoulli_power_series"])

    def verdict(self, name):
        return ln.render(*ln.classify(self.ml, name))

    def test_342_DirectSum_Decomposition_FOUND_in_DirectSum(self):
        v, sites, _ = ln.classify(self.ml, "DirectSum.Decomposition")
        self.assertEqual(v, "FOUND")
        self.assertEqual(ln.namespace_of(sites[0][2]), "DirectSum")
        self.assertTrue(self.verdict("DirectSum.Decomposition").startswith(
            "FOUND DirectSum Mathlib/Algebra/DirectSum/Decomposition.lean:"))

    def test_short_names(self):
        self.assertTrue(self.verdict("orderOf").startswith("FOUND _root_ Mathlib/GroupTheory/OrderOfElement.lean:"))
        self.assertEqual(self.verdict("IsHyperbolic"), "AMBIGUOUS 2 sites")

    def test_not_found(self):
        self.assertEqual(self.verdict("Complex.abs"), "NOT FOUND")
        self.assertEqual(self.verdict("bernoulli_power_series"), "NOT FOUND")


if __name__ == "__main__":
    unittest.main()
