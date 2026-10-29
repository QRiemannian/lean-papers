# L:RZ-44a — the orbifold Euler characteristic arithmetic of §7.2: χ_orb(X(1)) = −1/6; cusp filled smooth → +5/6 > 0; cusp filled with a cone point of order m ≥ 7 → negative

## 1 · Header
- row: `L:RZ-44a` (the ledger's own split of `L:RZ-44`; sibling `L:RZ-44b` — "positive χ_orb ⇒ no finite-area hyperbolic structure; (2, 3, m), m ≥ 7, compact hyperbolic" — is EFFORT-FAR, out of Q5, and is not specced here)
- unit: U7 `RiemannZeta/SmallArith`
- paper: RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (April 2026, revised October 2026)
- pdf_sha256: `2d5287e7bd039434cfa14324ddb329b745f45aa9649f278fd53252d70f533e54`
- locus: §7.2 "Verification of the mapping", paragraph "Parabolic → Dimensional", sentences 3–5 — served PDF page p18 (printed folio 17). No equation tag. (`L:MS-42`, MS §4.3, is shared with this row and is re-keyed by V₁; not read here.)
- spec_clock: 2026-10-28T17:24:16Z
- Re-key change column: UNCHANGED.

## 2 · Printed statement, verbatim
Served p18, `pdftotext -layout`, mathematical-italic letters written plain:

> What the cusp is necessary for can be stated exactly, and the statement is conditional: given genus 0 and the (2, 3) cone structure of X(1), whose orbifold Euler characteristic is χ_orb = −1/6, filling the cusp with a smooth point raises it to χ_orb = +5/6 > 0, so the filled surface carries no finite-area hyperbolic structure — hence no vol, no π = 3 ⋅ vol, and no g_c [D]. The factor 3 therefore encodes the cusp count as well as the two cone orders: obtaining it requires fixing all three of (e₂, e₃, n_cusp) = (2, 3, 1), not two. The conditional is load-bearing and the unconditional form is false: filling the cusp with a cone point of order m ≥ 7, rather than a smooth point, yields a compact hyperbolic (2, 3, m) orbifold.

Taken here (the arithmetic): "χ_orb = −1/6" for genus 0, cone orders (2, 3), one cusp; "+5/6 > 0" after filling the cusp with a smooth point; and, for the (2, 3, m) orbifold with m ≥ 7, the sign of χ_orb that makes it hyperbolic. Not taken: the geometric consequences (no finite-area hyperbolic structure; compact hyperbolic orbifold) — `L:RZ-44b`, EFFORT-FAR; "no vol, no π = 3·vol, no g_c [D]"; "the factor 3 encodes …".

## 3 · Formal reading
- **χ_orb (convention named; not printed).** The paper uses the orbifold Euler characteristic without writing its formula. The standard formula (Thurston; Scott) for a 2-orbifold of genus g with cone points of orders m₁, …, m_k and n cusps (punctures) is
  χ_orb = 2 − 2g − Σᵢ (1 − 1/mᵢ) − n.
  The spec carries it as a local definition over ℚ. Filling the cusp with a smooth point is (g, cones, n) ↦ (g, cones, n − 1); filling it with a cone point of order m is ↦ (g, cones ++ [m], n − 1).
- **The data are hypotheses of the arithmetic, not theorems.** "given genus 0 and the (2, 3) cone structure of X(1)": the spec does not claim that the modular surface X(1) has genus 0, cone orders (2, 3) and one cusp (that is geometry, `L:RZ-43b` for the cone orders, and not in mathlib as an orbifold). It evaluates the formula on (g, cones, n) = (0, [2, 3], 1), exactly the data the print fixes ("(e₂, e₃, n_cusp) = (2, 3, 1)").
- **The three numbers.** (i) χ_orb(0, [2, 3], 1) = −1/6; (ii) χ_orb(0, [2, 3], 0) = 5/6 and 5/6 > 0; (iii) for every natural m ≥ 7, χ_orb(0, [2, 3, m], 0) < 0 (it equals 1/m − 1/6). The print's claim for m ≥ 7 is the geometric "compact hyperbolic"; its arithmetic leg is (iii), negativity being the hyperbolicity criterion that `L:RZ-44b` would use. Only the direction "m ≥ 7 ⇒ negative" is printed; the converse (m ≤ 6 ⇒ χ_orb ≥ 0, with equality at m = 6) is true but not printed and not stated.
- Arithmetic over ℚ (`norm_num`, `field_simp`); m enters as a natural number cast to ℚ.

## 4 · Target mathlib declarations (pin `db584cd6d46c92f209a44c0f1c829460d327499d`)
| name | kind (file:line) | module |
|---|---|---|
| `List.sum` | def (Lean core, toolchain v4.33.0 `src/lean/Init/Data/List/Basic.lean:2069`) | Init.Data.List.Basic |
| `List.map` | def (Lean core, `Init.Prelude`/`Init.Data.List.Basic`) | Init |
| `Nat.cast` to ℚ, `Rat` field structure | — | Mathlib.Data.Rat.Defs, Mathlib.Algebra.Order.Field.Rat |
| tactics `norm_num`, `field_simp`, `linarith` / `positivity` | — | Mathlib.Tactic |

Searched and absent (named for the gap, not needed for this row): no orbifold Euler characteristic in mathlib at the pin (`/usr/bin/grep -rni "orbifold" .lake/packages/mathlib/Mathlib/` → one hit, a docstring in Geometry/Diffeology/Basic.lean:125 pointing at an external repository; no declaration). The local `def` below is the formula, carried as a convention; this is not a NEEDS-DEVELOPMENT gap for 44a (the row is arithmetic), but it is the gap 44b names.

## 5 · Intended Lean statement
**Prose.** With χ_orb(g, cones, n) := 2 − 2g − Σ_{m ∈ cones}(1 − 1/m) − n over ℚ: χ_orb(0, [2, 3], 1) = −1/6; χ_orb(0, [2, 3], 0) = 5/6 > 0; and χ_orb(0, [2, 3, m], 0) < 0 for every natural m ≥ 7.

**Proposed signature** (shape only):
```lean
/-- The orbifold Euler characteristic of a 2-orbifold of genus `g` with cone points of orders `cones`
and `n` cusps: 2 − 2g − Σ (1 − 1/m) − n (standard convention; RZ §7.2 uses it without the formula). -/
def orbEulerChar (g : ℕ) (cones : List ℕ) (n : ℕ) : ℚ :=
  2 - 2 * g - (cones.map fun m : ℕ => 1 - 1 / (m : ℚ)).sum - n

/-- L:RZ-44a · RZ §7.2 "Parabolic → Dimensional", served p18. For genus 0, cone orders (2, 3)
and one cusp: χ_orb = −1/6; filling the cusp with a smooth point gives +5/6 > 0; filling it with
a cone point of order m ≥ 7 gives a negative χ_orb. -/
theorem rz_44a_orbifold_euler_arith :
    orbEulerChar 0 [2, 3] 1 = -1 / 6 ∧
    orbEulerChar 0 [2, 3] 0 = 5 / 6 ∧ (0 : ℚ) < 5 / 6 ∧
    ∀ m : ℕ, 7 ≤ m → orbEulerChar 0 [2, 3, m] 0 < 0 := by
  sorry
```

## 6 · What the row does not claim
- Not that X(1) = SL(2, ℤ)\ℍ has genus 0, elliptic points of orders 2 and 3 and one cusp (the data are fixed, not derived).
- Not that positive χ_orb precludes a finite-area hyperbolic structure, nor that the (2, 3, m) orbifold, m ≥ 7, is compact hyperbolic — `L:RZ-44b` (EFFORT-FAR; orbifold Gauss–Bonnet / uniformization not in mathlib).
- Not "no vol, no π = 3·vol, no g_c [D]", nor "the factor 3 encodes the cusp count as well as the two cone orders" — readings and consequences that ride on 44b and on vol(X(1)) = π/3 (`L:RZ-14`/`L:RZ-15`). The geometry constant g_c enters this row only as a word in the quoted sentence.
- Not the converse for m ≤ 6.

## 7 · Status line
- `SPEC-DRAFT 2026-10-28T17:24:16Z`
- V1: V1-GREEN 2026-10-28T17:32:07Z — served p18 prints χ_orb = −1/6 for genus 0, (2, 3), one cusp; +5/6 > 0 after a smooth filling; and, for a cone point of order m ≥ 7, a compact hyperbolic (2, 3, m) orbifold; the local def 2 − 2g − Σ(1 − 1/m) − n is FAITHFUL — it is the standard (Thurston/Scott) formula, it reproduces both printed values, and it agrees with the paper's own geometry (−2π·χ_orb = π/3 = vol, the print's "π = 3·vol"); (iii) is the arithmetic leg of "m ≥ 7 ⇒ compact hyperbolic", forward only (the ledger's "iff" is rightly dropped: the converse is not printed); geometry left to L:RZ-44b. Shared MS row re-keyed: MS served PDF (sha256 b4841489…3af5 verified) §4.3 p15–p16 ("What the cusp is necessary for, conditionally") prints the same three numbers and the same m ≥ 7 sentence — L:MS-42 = this row, same mathematics.
- V2: V2-GREEN 2026-10-28T17:44:42Z — read served p18 §7.2 "Parabolic → Dimensional" sentences 3–5. `rz_44a_orbifold_euler_arith` with local `orbEulerChar g cones n = 2 − 2g − Σ(1 − 1/m) − n` over ℚ (the standard Thurston/Scott formula, used unprinted by the paper; casts at the leaves, no ℕ subtraction; the 1/0 junk value is never reached — cone orders 2, 3, m ≥ 7): χ(0,[2,3],1) = −1/6; χ(0,[2,3],0) = 5/6 and 0 < 5/6; ∀ m ≥ 7, χ(0,[2,3,m],0) = 1/m − 1/6 < 0 — the printed numbers and the arithmetic leg of "a cone point of order m ≥ 7 … yields a compact hyperbolic (2, 3, m) orbifold", forward only (χ = 0 at m = 6 recomputed; the converse is not printed and not stated). The data (0, [2, 3], 1) are the print's "given genus 0 and the (2, 3) cone structure" — fixed, not derived; the geometry is L:RZ-44b. Faithful as a split leg.
