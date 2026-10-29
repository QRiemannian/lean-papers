#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""ledger_names.py — classify Lean names against a mathlib checkout: FOUND / NOT FOUND / AMBIGUOUS.

Origin. Day 0 of the Lean lane (2026-10-28) ran a scratch classifier (four versions, names.py ..
names4.py, in a session scratchpad) that wrote
Orchestrator/Chat-Design/cc-handoff/projects/reputation-play/lean-scoping/LEDGER-NAMES-v0.1-2026-10-28.md.
It was adopted into this lane file at the wall's word 6 of 2026-10-29
(priority/inbox/WORD-wall-2026-10-29-read-and-ship.md: "the LEDGER-NAMES classifier: AUTHORIZED as a
flow task"), routed as row R2 of DIRECTIVE-2026-10-28-governor-sitting-71-routed-items.md, after
UPGRADE-682 found that a name-check grep read the NAMESPACE, not the dotted name
(`DirectSum.Decomposition` read as not found). From names4.py it keeps the ledger-token extraction rules
and the namespace/section/end stack; its declaration index (one regex over a pre-made grep dump) is
replaced by the expression below.

THE classifier — the M-template expression, quoted from
lean-scoping/seats/TEMPLATE-M-statement-author.md, "Addendum — governor-agent sitting 71 (2026-10-28)":

    Grep the LAST component `<short>` of the name over every declaration keyword, qualified or not:
    /usr/bin/grep -rnE "(^|[[:space:]])(theorem|lemma|def|abbrev|structure|class|instance|inductive)
    [[:space:]]+([A-Za-z0-9_'.]*\\.)?<short>([^A-Za-z0-9_'.!?]|$)" .lake/packages/mathlib/Mathlib/;
    then confirm the namespace at each hit's file — /usr/bin/grep -n '^namespace \\|^end ' <file> and
    read the innermost namespace open above the hit line [...]. Record `file:line` and the namespace.
    A name is NEEDS-DEVELOPMENT only after this check returns no hit in the right namespace.

How it is run here (stdlib only, no grep binary): the expression above, as a Python regex, is matched
against the CODE part of every line of every .lean file under <mathlib-root>/Mathlib (comment text —
`--` lines and `/- ... -/` blocks, nested — is not a declaration and is not matched). The confirm step
then (i) reads the declared identifier in full and keeps the hit only when its last component IS
<short> (the expression's terminal class admits Unicode continuations: `completedRiemannZeta` matches
`def completedRiemannZeta₀`), and (ii) rebuilds the fully-qualified name from the file's
namespace / section / mutual / end stack at the hit line (`_root_.` honoured).

Verdict for a queried name N (a site = one file:line):
  * FOUND <namespace> <file>:<line>   exactly one site declares N fully-qualified; or N carries no dot,
                                      no site declares it at the root, and exactly one site declares a
                                      name ending in it (a short form). <namespace> is the declaring
                                      namespace, `_root_` at the root.
  * AMBIGUOUS <n> sites               several sites declare N, or (no dot / a leading-dot token) no
                                      root declaration and several sites declare a name ending in it.
  * NOT FOUND                         none of these. Two notes may follow, neither a verdict: a
                                      `namespace N` opens in k files; an @[to_additive] source exists.

CLI
  ledger_names.py <mathlib-root> <name> [<name> ...]     one line per name:  <name><TAB><verdict>
  ledger_names.py <mathlib-root> --ledger <LEDGER-NAMES.md> [--claims <CLAIM-LEDGER.md>] [--only SECTION]
        re-reads the ledger file's table rows (first cell a backticked name; the section is the `## `
        heading above the row) and prints, per row: name, the ledger's verdict, the bare re-reading,
        and the in-context re-reading. In context: a leading-dot token `.X` takes the namespace of the
        nearest preceding dotted backticked cite on its CLAIM-LEDGER line (the ledger's elision); a
        dot-less token takes the namespace of the one dotted cite on its line that ends in it. --claims
        defaults to CLAIM-LEDGER.md beside the ledger file.
  --sites                print every site under an AMBIGUOUS line
  --settled <repo>       refuse unless <repo> holds no uncommitted .lean: exit 2, naming the paths.

Git. The ONE git form this script runs, read-only, and only under --settled:
    GIT_OPTIONAL_LOCKS=0 git status --porcelain -- '*.lean'     (cwd = <repo>)
It is named here and in the dispatching brief, which is what places it outside the no-git rule's class
(the wall's word 5, 2026-10-29: the rule's substance is git that WRITES; a read-only form named by the
dispatching brief or the running script's header is outside it). GIT_OPTIONAL_LOCKS=0 keeps `status`
from refreshing the index. The script runs no other git.

Exit codes: 0 classified (whatever the verdicts) · 2 refused (dirty or unreadable --settled repo; bad
arguments; no Mathlib tree).
"""
import argparse
import os
import re
import subprocess
import sys
from collections import OrderedDict, defaultdict

KEYWORDS = ("theorem", "lemma", "def", "abbrev", "structure", "class", "instance", "inductive")
TEMPLATE = (r"(^|\s)(" + "|".join(KEYWORDS) + r")\s+([A-Za-z0-9_'.]*\.)?{short}([^A-Za-z0-9_'.!?]|$)")
NS_RE = re.compile(r"^namespace\s+(\S+)")
SEC_RE = re.compile(r"^(?:@\[[^\]]*\]\s*)?(?:(?:public|private|noncomputable|protected)\s+)*section\b(?:\s+(\S+))?")
MUTUAL_RE = re.compile(r"^mutual\b")
END_RE = re.compile(r"^end\b(?:\s+(\S+))?")
IDENT_STOP = re.compile(r"[\s({\[:⦃]")
ADD2MUL = [("tsum", "tprod"), ("sum", "prod"), ("Sum", "Prod"), ("add", "mul"), ("Add", "Mul"),
           ("zero", "one"), ("Zero", "One"), ("neg", "inv"), ("sub", "div")]

# ledger-token extraction (kept from the Day-0 names4.py)
TACTICS = {"norm_num", "field_simp", "decide", "noncomm_ring"}
NONNAME = {"shared", "1", "5", "automation.methods"}
TOKEN_SHAPE = re.compile(r"^\.?[A-Za-z_Ͱ-Ͽ][\w'Ͱ-Ͽ₀-₉.]*$")
NOT_A_NAME = ("/", ".md", ".lean", ".yaml", ".json", ".pdf", '"', "#", "…", "\\", " -")


def code_lines(text):
    """Yield (lineno, code) with comment text blanked: `--` to end of line, nested `/- ... -/`."""
    depth = 0
    for n, line in enumerate(text.split("\n"), 1):
        out = []
        i, L = 0, len(line)
        while i < L:
            two = line[i:i + 2]
            if depth:
                if two == "/-":
                    depth += 1; i += 2; continue
                if two == "-/":
                    depth -= 1; i += 2; continue
                i += 1; continue
            if two == "/-":
                depth += 1; i += 2; continue
            if two == "--":
                break
            if line[i] == '"':  # a string literal: copy through its close
                j = i + 1
                while j < L and line[j] != '"':
                    j += 2 if line[j] == "\\" else 1
                out.append(line[i:j + 1]); i = j + 1; continue
            out.append(line[i]); i += 1
        yield n, "".join(out)


class Mathlib:
    """One pass over the tree; namespace stacks and hits are computed per short name, on demand."""

    def __init__(self, root):
        root = os.path.abspath(root)
        tree = os.path.join(root, "Mathlib")
        if not os.path.isdir(tree):
            if os.path.basename(root.rstrip("/")) == "Mathlib" and os.path.isdir(root):
                tree, root = root, os.path.dirname(root)
            else:
                raise SystemExit(f"ledger_names: no Mathlib/ tree under {root}")
        self.root, self.tree = root, tree
        self.files = []
        for d, dirs, fs in os.walk(tree):
            dirs.sort()
            for f in sorted(fs):
                if f.endswith(".lean"):
                    self.files.append(os.path.join(d, f))
        self._code = {}
        self._cache = {}

    def pin(self):
        head = os.path.join(self.root, ".git", "HEAD")
        try:
            with open(head, encoding="utf-8") as fh:
                return fh.read().strip()
        except OSError:
            return "UNREAD"

    def code(self, path):
        if path not in self._code:
            with open(path, encoding="utf-8", errors="replace") as fh:
                self._code[path] = list(code_lines(fh.read()))
        return self._code[path]

    def rel(self, path):
        return os.path.relpath(path, self.root)

    def preload(self, shorts):
        """One sweep for many short names: fills the per-short hit cache."""
        todo = sorted({s for s in shorts if s and s not in self._cache})
        if not todo:
            return
        pats = {s: re.compile(TEMPLATE.format(short=re.escape(s))) for s in todo}
        hits = {s: [] for s in todo}
        for path in self.files:
            with open(path, encoding="utf-8", errors="replace") as fh:
                raw = fh.read()
            if not any(s in raw for s in todo):
                continue
            present = [s for s in todo if s in raw]
            stack = []
            for n, code in code_lines(raw):
                m = NS_RE.match(code)
                if m:
                    stack.append(("ns", m.group(1))); continue
                m = SEC_RE.match(code)
                if m:
                    stack.append(("sec", m.group(1) or "")); continue
                if MUTUAL_RE.match(code):
                    stack.append(("mutual", "")); continue
                if END_RE.match(code):
                    if stack:
                        stack.pop()
                    continue
                for s in present:
                    for m in pats[s].finditer(code):
                        rest = code[m.end(2):]
                        start = m.end(2) + len(rest) - len(rest.lstrip())
                        ident = IDENT_STOP.split(code[start:], 1)[0].replace("«", "").replace("»", "")
                        if ident.split(".")[-1] != s:
                            continue  # confirm (i): the declared name's last component IS <short>
                        ns = ".".join(x[1] for x in stack if x[0] == "ns")
                        if ident.startswith("_root_."):
                            fqn = ident[len("_root_."):]
                        else:
                            fqn = f"{ns}.{ident}" if ns else ident
                        hits[s].append((self.rel(path), n, fqn, code.strip()))
        self._cache.update(hits)

    def hits(self, short):
        self.preload([short])
        return self._cache[short]

    def namespace_files(self, name):
        pat = re.compile(r"^namespace\s+" + re.escape(name) + r"\s*$")
        out = set()
        for path in self.files:
            for _n, code in self.code(path):
                if pat.match(code):
                    out.add(self.rel(path)); break
        return out


def namespace_of(fqn):
    return fqn.rsplit(".", 1)[0] if "." in fqn else "_root_"


def classify(ml, name):
    """Return (verdict, sites, note). verdict in FOUND / AMBIGUOUS / NOT FOUND."""
    dot_token = name.startswith(".")
    q = name.lstrip(".")
    short = q.split(".")[-1]
    hs = ml.hits(short)
    sites = []
    if not dot_token:
        sites = [h for h in hs if h[2] == q]
    if not sites and (dot_token or "." not in q):
        sites = hs if dot_token else [h for h in hs if h[2].endswith("." + q) or h[2] == q]
    uniq = sorted({(h[0], h[1]) for h in sites})
    if len(uniq) == 1:
        return "FOUND", sites, ""
    if len(uniq) > 1:
        return "AMBIGUOUS", sites, ""
    notes = []
    if not dot_token:
        nsf = ml.namespace_files(q)
        if nsf:
            notes.append(f"a namespace {q} opens in {len(nsf)} file(s), e.g. {sorted(nsf)[0]}")
        mul = q
        for a, b in ADD2MUL:
            mul = mul.replace(a, b)
        if mul != q:
            for h in ml.hits(mul.split(".")[-1]):
                if h[2] == mul and _to_additive_near(ml, h):
                    notes.append(f"@[to_additive] source {mul} at {h[0]}:{h[1]}")
                    break
    return "NOT FOUND", [], "; ".join(notes)


def _to_additive_near(ml, hit):
    path = os.path.join(ml.root, hit[0])
    with open(path, encoding="utf-8", errors="replace") as fh:
        lines = fh.read().split("\n")
    lo = max(0, hit[1] - 12)
    return any("to_additive" in l for l in lines[lo:hit[1]])


def render(verdict, sites, note):
    if verdict == "FOUND":
        f, n, fqn, _ = sites[0]
        return f"FOUND {namespace_of(fqn)} {f}:{n}"
    if verdict == "AMBIGUOUS":
        return f"AMBIGUOUS {len({(h[0], h[1]) for h in sites})} sites"
    return "NOT FOUND" + (f" — {note}" if note else "")


def site_lines(sites):
    return [f"    {fqn}  {f}:{n}" for f, n, fqn, _ in sorted(sites)]


# ---- --settled -------------------------------------------------------------------------------
def settled_or_refuse(repo):
    """The one named read-only git form. Returns None when settled, else the refusal text."""
    env = dict(os.environ, GIT_OPTIONAL_LOCKS="0")
    try:
        r = subprocess.run(["git", "status", "--porcelain", "--", "*.lean"], cwd=repo, env=env,
                           capture_output=True, text=True)
    except (OSError, FileNotFoundError) as e:
        return f"ledger_names: --settled {repo}: git status could not run ({e}); refusing"
    if r.returncode != 0:
        return f"ledger_names: --settled {repo}: git status exit {r.returncode}: {r.stderr.strip()}; refusing"
    dirty = [l for l in r.stdout.splitlines() if l.strip()]
    if dirty:
        return (f"ledger_names: --settled {repo}: {len(dirty)} uncommitted .lean path(s); refusing:\n"
                + "\n".join("  " + l for l in dirty))
    return None


# ---- --ledger ---------------------------------------------------------------------------------
ROW_RE = re.compile(r"^\|\s*`([^`]+)`\s*\|")


def ledger_rows(path):
    """(section, name, ledger-lines list, raw row) for every table row whose first cell is a name."""
    rows, section = [], ""
    with open(path, encoding="utf-8") as fh:
        for line in fh:
            if line.startswith("## "):
                section = re.sub(r"\s*\(\d+\)\s*$", "", line[3:].strip())
                continue
            m = ROW_RE.match(line)
            if not m:
                continue
            cells = [c.strip() for c in line.strip().strip("|").split("|")]
            lns = [int(x) for x in re.findall(r"\d+", cells[-1])]
            rows.append((section, m.group(1), lns, line.rstrip("\n")))
    return rows


def claims_tokens(claims_path):
    out = {}
    with open(claims_path, encoding="utf-8") as fh:
        for n, line in enumerate(fh, 1):
            toks = []
            for tok in re.findall(r"`([^`]+)`", line):
                if any(s in tok for s in NOT_A_NAME):
                    continue
                for part in (p.strip() for p in tok.split(",")):
                    if part and part not in TACTICS and part not in NONNAME and TOKEN_SHAPE.match(part):
                        toks.append(part)
            out[n] = toks
    return out


def in_context(name, lns, ctoks):
    """The ledger line's own reading of a short or leading-dot token; None when the line gives none."""
    for ln in lns:
        toks = ctoks.get(ln, [])
        if name.startswith("."):
            if name not in toks:
                continue
            before = toks[:toks.index(name)]
            dotted = [t for t in before if "." in t and not t.startswith(".")]
            if dotted:
                return dotted[-1].rsplit(".", 1)[0] + name, ln
        elif "." not in name:
            full = sorted({t for t in toks if not t.startswith(".") and t.endswith("." + name)})
            if len(full) == 1:
                return full[0], ln
    return None


def run_ledger(ml, ledger, claims, only, show_sites):
    rows = ledger_rows(ledger)
    if only:
        rows = [r for r in rows if r[0].upper().startswith(only.upper())]
    ctoks = claims_tokens(claims) if claims and os.path.exists(claims) else {}
    ml.preload([r[1].lstrip(".").split(".")[-1] for r in rows])
    print(f"# ledger_names --ledger {ledger}")
    print(f"# claims {claims if ctoks else 'NONE'} · mathlib {ml.root} · pin {ml.pin()}")
    print("# name\tledger verdict\tbare re-reading\tin-context re-reading")
    for section, name, lns, _raw in rows:
        v, s, note = classify(ml, name)
        bare = render(v, s, note)
        ctx = in_context(name, lns, ctoks) if ctoks and (name.startswith(".") or "." not in name) else None
        if ctx:
            cv, cs, cn = classify(ml, ctx[0])
            ctx_s = f"{ctx[0]} (CLAIM-LEDGER :{ctx[1]}) -> {render(cv, cs, cn)}"
        else:
            ctx_s = "—"
        print(f"{name}\t{section}\t{bare}\t{ctx_s}")
        if show_sites and v == "AMBIGUOUS":
            print("\n".join(site_lines(s)))
    return 0


def main(argv=None):
    ap = argparse.ArgumentParser(prog="ledger_names.py", description=__doc__.split("\n")[0])
    ap.add_argument("mathlib_root")
    ap.add_argument("names", nargs="*")
    ap.add_argument("--ledger")
    ap.add_argument("--claims")
    ap.add_argument("--only")
    ap.add_argument("--sites", action="store_true")
    ap.add_argument("--settled", metavar="REPO")
    try:
        a = ap.parse_args(argv)
    except SystemExit as e:
        return 2 if e.code else 0
    if a.settled:
        refusal = settled_or_refuse(a.settled)
        if refusal:
            print(refusal, file=sys.stderr)
            return 2
    if not a.names and not a.ledger:
        print("ledger_names: give names or --ledger", file=sys.stderr)
        return 2
    try:
        ml = Mathlib(a.mathlib_root)
    except SystemExit as e:
        print(e, file=sys.stderr)
        return 2
    if a.ledger:
        claims = a.claims or os.path.join(os.path.dirname(os.path.abspath(a.ledger)), "CLAIM-LEDGER.md")
        return run_ledger(ml, a.ledger, claims, a.only, a.sites)
    ml.preload([n.lstrip(".").split(".")[-1] for n in a.names])
    for name in a.names:
        v, s, note = classify(ml, name)
        print(f"{name}\t{render(v, s, note)}")
        if a.sites and v == "AMBIGUOUS":
            print("\n".join(site_lines(s)))
    return 0


if __name__ == "__main__":
    sys.exit(main())
