# STATUS — every row of both papers

| row | paper | status | commit | manifest |
|---|---|---|---|---|

*Row skeleton drafted 2026-10-28T17:56:40Z (`date -u`) by a procedural seat from disk: `CLAIM-LEDGER-v0.2-rekeyed.md` (every v0.1 row and every NEW row), `WAVE-PLAN-2026-10-28.md` (units), `FAN-OUT-PLAN-v1.md` §2/§4/§9 (scope and vocabulary), each `specs/<ROW>.md` §7, and the theorem names of every `RiemannZeta/*/Challenge.lean` read by docstring row id. No row carries the build disposition here: CO writes it, from a build manifest only. `STATED — awaiting manifest` means only that a theorem for the row sits in a `Challenge.lean`; `(manifest)` is the placeholder CO fills. "— (unsettled; see flags)" marks a row whose disposition disk does not settle.*

## RZ — *The Tetrahedral Structure of the Riemann Zeta Function* (served sha256 `6b89ce0e…2d12` since 2026-10-29; the rows below were read against the edition `2d5287e7…3e54` served 2026-10-27, which the republish changed only at the corrected loci named in its Revisions note — see §Republished)

| row | unit | theorem(s) | disposition | evidence |
|---|---|---|---|---|
| L:RZ-01 | — | — | CITED, NOT CHECKED | ledger bucket EFFORT-FAR (plan §9: Q9) |
| L:RZ-02 | U1 | `rz_02_fib_sq`, `rz_02_fib_sq_mem_SL` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 2 theorem(s); comparator PASS |
| L:RZ-03 | U2 | `rz_03_two_lt_abs_trace_of_isHyperbolic`, `rz_03_two_lt_abs_trace_of_isHyperbolic_GL`, `rz_03_min_hyperbolic_abs_trace` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 3 theorem(s); comparator PASS |
| L:RZ-04 | U2 | `rz_04_fib_det_charpoly`, `rz_04_fib_eigenvalues`, `rz_04_fib_sq_eigenvalues` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 3 theorem(s); comparator PASS |
| L:RZ-05 | U9 | `rz_05_translation_length` | CHECKED (commit c856d59, manifests/build-c856d59.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-06a | U2 | `rz_06a_two_log_sq_eq`, `rz_06a_four_log_phi_approx` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 2 theorem(s); comparator PASS |
| L:RZ-06b | U9 | `rz_06b_systole_at_F2` | CHECKED (commit c856d59, manifests/build-c856d59.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-07 | U1 | — | — (split: L:RZ-07a · L:RZ-07b) | legs below |
| L:RZ-07a | U1 | `rz_07a_golden_conj_products` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-07b | U1 | `rz_07b_field_norm` | PROVED BEYOND THE AGREED SCOPE (counted under its own label — the wall, WORD 2026-10-28 word 5) | proved (commit 5c6a9cd, build-5c6a9cd.json; axioms clean; comparator PASS); uncounted pending the wall |
| L:RZ-08 | — | — | — (unsettled; see flags) | ledger bucket EFFORT, outside Q5 (plan §2) |
| L:RZ-09 | U9 | `rz_09_Q_sqrt5_invariants` | CHECKED (commit c856d59, manifests/build-c856d59.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-10 | U7 | — | CARRIED by consumer rows (the wall, WORD 2026-10-28 word 6) | definitional; carried by L:RZ-09 (EFFORT lane), echoed by L:RZ-11 (`_UNIT-U7.md`) |
| L:RZ-11 | U1 | `rz_11_gaussSum_chi5` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-12 | U2 | `rz_12_anchoring_identity` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-13 | U9 | `rz_13_min_real_quadratic_discr` | CHECKED (commit c856d59, manifests/build-c856d59.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-14a | U9 | `rz_14a_area_fd` | CHECKED (commit c856d59, manifests/build-c856d59.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-14b | U9 | `rz_14b_vol_X1`, `rz_14b_gaussBonnet_value` | CHECKED (commit c856d59, manifests/build-c856d59.json) | axioms propext · Classical.choice · Quot.sound on 2 theorem(s); comparator PASS |
| L:RZ-15 | U3 | `rz_15_geometryConstant_writings` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-16 | U3 | `rz_16_geometryConstant_approx` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-17 | U3 | `rz_17_quaternary_product` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-18 | U5 | — | NOT A TARGET (Q7) | plan §4 rule 9; wave plan U5 |
| L:RZ-19 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:RZ-20 | U1 | — | — (split: L:RZ-20a · L:RZ-20b) | legs below |
| L:RZ-20a | U1 | `rz_20a_zeta_two_mul_nat`, `rz_20a_zeta_two_mul_nat_rat_mul_pi_pow` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 2 theorem(s); comparator PASS |
| L:RZ-20b | U1 | — | INTERPRETIVE | spec §7: CONCEPT leg, no Lean statement; V1-SPLIT-OK (uncounted) |
| L:RZ-21 | U3 | `rz_21_zeta_two_four` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-22 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:RZ-23 | U1 | `rz_23_bernoulli_odd_eq_zero` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-24 | U7 | `rz_24_bernoulli_gf_symmetry` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-25 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:RZ-26 | — | — | — (unsettled; see flags) | ledger bucket EFFORT, outside Q5 (plan §2); plan §9: a later ruling |
| L:RZ-27 | seat C | — (numerical row) | REPRODUCED (against the edition of 2026-10-29: the §4.3 k = 2 cell now prints 99.99999 %, which is the value 99.99998710 % at five decimals; both programs) | two independent programs, computations/RZ-27/impl-a + impl-b (2026-10-28): every numeral the row lists reproduces under the stated rounding rule; the §4.3 table's k = 2 cumulative cell prints 99.9999% where the value 99.99998710% rounds to 100.000% at six significant digits (a truncated display; both programs) — correction track; the cell corrected at the republish (JC-9 event 25) |
| L:RZ-28 | — | — | — (unsettled; see flags) | ledger v0.1 CONCEPT; v0.2 proposes CONCEPT → EFFORT (E3) — M/V₁ |
| L:RZ-29 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:RZ-30 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:RZ-31 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:RZ-32 | U3 | — | — (split: L:RZ-32a · L:RZ-32b) | legs below |
| L:RZ-32a | U3 | `rz_32a_correction_q_form` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-32b | U3 | `rz_32b_zeta_three_q_form` | OUT-OF-Q5 pending the wall | spec §7 / header: OUT-OF-Q5 (pending the wall) — theorem in Challenge.lean, uncounted |
| L:RZ-33 | U3 | — | — (split: L:RZ-33a · L:RZ-33b) | legs below |
| L:RZ-33a | U3 | `rz_33a_functional_equation` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-33b | U11 | `rz_33b_reflection_fixed_point` | CHECKED (commit 9758579, manifests/build-9758579.json; counted from the republish of 2026-10-29, the corrected edition served `6b89ce0e…2d12` — stated against the corrected text, CC-15) | U11 RiemannZeta/Corrected; V2 signed 7f9a7838 2026-10-28T23:10:17Z; proved (commit 9758579, build-9758579.json; axioms clean; comparator PASS); V₃ CLEAN (specs/_V3-U11.md); the row joins N when the correction is read and republished |
| L:RZ-34 | U3 | `rz_34_euler_product` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-35 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:RZ-36 | — | — | — (unsettled; see flags) | ledger bucket EFFORT, outside Q5 (plan §2) |
| L:RZ-37 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:RZ-38 | U7 | `rz_38_xp_trajectories` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-39 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:RZ-40 | U7 | — | CARRIED by consumer rows (the wall, WORD 2026-10-28 word 6) | definitional; carried by L:RZ-61a and L:RZ-63a (`_UNIT-U7.md`); no theorem names it |
| L:RZ-41 | U4 | — | — (split: L:RZ-41a · L:RZ-41b · L:RZ-41c) | legs below |
| L:RZ-41a | U4 | `rz_41a_hyperbolic_elliptic` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-41b | U11 | `rz_41b_noncentral_trichotomy` | CHECKED (commit 9758579, manifests/build-9758579.json; counted from the republish of 2026-10-29, the corrected edition served `6b89ce0e…2d12` — stated against the corrected text, CC-16) | U11 RiemannZeta/Corrected; V2 signed 7f9a7838 2026-10-28T23:10:17Z; proved (commit 9758579, build-9758579.json; axioms clean; comparator PASS); V₃ CLEAN (specs/_V3-U11.md); the row joins N when the correction is read and republished |
| L:RZ-41c | U4 | `rz_41c_normal_forms` | PROVED BEYOND THE AGREED SCOPE (counted under its own label — the wall, WORD 2026-10-28 word 5) | proved (commit 5c6a9cd, build-5c6a9cd.json; axioms clean; comparator PASS); uncounted pending the wall |
| L:RZ-42 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:RZ-43 | U4 | — | — (split: L:RZ-43a · L:RZ-43b) | legs below |
| L:RZ-43a | U4 | `rz_43a_elliptic_orders` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-43b | U4 | `rz_43b_orbifold_points` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-44a | U7 | `rz_44a_orbifold_euler_arith` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-44b | — | — | CITED, NOT CHECKED | ledger bucket EFFORT-FAR (plan §9: Q9) |
| L:RZ-45 | — | — | CITED, NOT CHECKED | ledger bucket EFFORT-FAR (plan §9: Q9) |
| L:RZ-46a | U3 | `rz_46a_o_lambda_convention`, `rz_46a_i_expansion`, `rz_46a_ii_iii_xi_factor` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 3 theorem(s); comparator PASS |
| L:RZ-46b | — | — | CITED, NOT CHECKED | ledger bucket EFFORT-FAR (plan §9: Q9) |
| L:RZ-47 | U3 | `rz_47_zero_gives_pole` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-48 | seat C | — (numerical row) | REPRODUCED | two independent programs, computations/RZ-48/impl-a + impl-b (2026-10-28): 6 of 6 printed values reproduce (φ_Λ(ρ₁), the first pole ρ₁/2, φ_ξ(ρ₁)); mpmath at 50–80 digits in both |
| L:RZ-49 | U3 | `rz_49_norm_factor_eq_one` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-50 | — | — | CITED, NOT CHECKED | ledger bucket EFFORT-FAR (plan §9: Q9) |
| L:RZ-51 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:RZ-52 | — | — | CITED, NOT CHECKED | ledger bucket EFFORT-FAR (plan §9: Q9) |
| L:RZ-53 | U4 | — | — (split: L:RZ-53a · L:RZ-53b · L:RZ-53c) | legs below |
| L:RZ-53a | U4 | `rz_53a_gaussMap_mapsTo`, `rz_53a_hypLaplacian_eq` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 2 theorem(s); comparator PASS |
| L:RZ-53b | U4 | — | OUT-OF-Q5 pending the wall | spec §7 / header: OUT-OF-Q5 (pending the wall); NEEDS-DEVELOPMENT |
| L:RZ-53c | U4 | `rz_53c_gauss_generates_cf`, `rz_53c_mayer_is_transfer` | PROVED BEYOND THE AGREED SCOPE (counted under its own label — the wall, WORD 2026-10-28 word 5) | proved (commit 5c6a9cd, build-5c6a9cd.json; axioms clean; comparator PASS); uncounted pending the wall |
| L:RZ-54 | — | — | CITED, NOT CHECKED | ledger bucket EFFORT-FAR (plan §9: Q9) |
| L:RZ-55 | U4 | `rz_55_gauss_branches` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-56 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:RZ-57 | — | — | — (unsettled; see flags) | ledger bucket EFFORT, outside Q5 (plan §2); plan §9: a later ruling |
| L:RZ-58 | U10 | — | — (split: L:RZ-58a · L:RZ-58b · L:RZ-58c) | legs below |
| L:RZ-58a | U10 | `rz_58a_LFunction_chi5_one` | CHECKED (commit c856d59, manifests/build-c856d59.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-58b | U10 | `rz_58b_chi5_kronecker`, `rz_58b_chi5_real_primitive_conductor`, `rz_58b_chi5_unique` | CHECKED (commit c856d59, manifests/build-c856d59.json) | axioms propext · Classical.choice · Quot.sound on 3 theorem(s); comparator PASS |
| L:RZ-58c | U10 | `rz_58c_value_approx` | CHECKED (commit c856d59, manifests/build-c856d59.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-59 | — | — | — (unsettled; see flags) | ledger bucket EFFORT, outside Q5 (plan §2); plan §9: a later ruling |
| L:RZ-60 | U3 | `rz_60_golden_identities` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-61 | U2 | — | — (split: L:RZ-61a · L:RZ-61b · L:RZ-61c) | legs below |
| L:RZ-61a | U2 | `rz_61a_weight_chain`, `rz_61a_weight_approx` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 2 theorem(s); comparator PASS |
| L:RZ-61b | U2 | `rz_61b_factor_two` | PROVED BEYOND THE AGREED SCOPE (counted under its own label — the wall, WORD 2026-10-28 word 5) | proved (commit 5c6a9cd, build-5c6a9cd.json; axioms clean; comparator PASS); uncounted pending the wall |
| L:RZ-61c | U2 | `rz_61c_weight_eq_two_L` | CHECKED (commit c856d59, manifests/build-c856d59.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-62 | — | — | — (unsettled; see flags) | ledger v0.1 CONCEPT; v0.2 proposes a split, (a) NOW — its (a) leg is stated as L:RZ-61b (OUT-OF-Q5); M/V₁ |
| L:RZ-63 | U4 | — | — (split: L:RZ-63a · L:RZ-63b) | legs below |
| L:RZ-63a | U4 | `rz_63a_sinh_identity` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-63b | U4 | `rz_63b_geometric` | PROVED BEYOND THE AGREED SCOPE (counted under its own label — the wall, WORD 2026-10-28 word 5) | proved (commit 5c6a9cd, build-5c6a9cd.json; axioms clean; comparator PASS); uncounted pending the wall |
| L:RZ-64 | U4 | — | — (split: L:RZ-64a · L:RZ-64b · L:RZ-64c) | legs below |
| L:RZ-64a | U4 | `rz_64a_gamma2_min_trace` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-64b | U4 | `rz_64b_disc_Q_sqrt2` | PROVED BEYOND THE AGREED SCOPE (counted under its own label — the wall, WORD 2026-10-28 word 5) | proved (commit 5c6a9cd, build-5c6a9cd.json; axioms clean; comparator PASS); uncounted pending the wall |
| L:RZ-64c | U4 | `rz_64c_conductor_one` | PROVED BEYOND THE AGREED SCOPE (counted under its own label — the wall, WORD 2026-10-28 word 5) | proved (commit 5c6a9cd, build-5c6a9cd.json; axioms clean; comparator PASS); uncounted pending the wall |
| L:RZ-65 | U6 | `rz_65_gal_cyclotomic_five` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-66 | U1 | `rz_66_discr_cyclotomic_five` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-67 | U1 | `rz_67_classNumber_cyclotomic_five` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-68 | — | — | — (unsettled; see flags) | ledger bucket EFFORT, outside Q5 (plan §2); plan §9: a later ruling |
| L:RZ-69 | — | — | — (unsettled; see flags) | ledger bucket EFFORT, outside Q5 (plan §2); plan §9: a later ruling |
| L:RZ-70 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:RZ-71 | U6 | — | — (split: L:RZ-71a · L:RZ-71b) | legs below |
| L:RZ-71a | U6 | `rz_71a_cyclotomic_completeness_legs12` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-71b | U6 | `rz_71b_unique_quadratic_subfield`, `rz_71b_leg3_selects_five` | PROVED BEYOND THE AGREED SCOPE (counted under its own label — the wall, WORD 2026-10-28 word 5) | proved (commit 5c6a9cd, build-5c6a9cd.json; axioms clean; comparator PASS); uncounted pending the wall |
| L:RZ-72 | U6 | — | — (split: L:RZ-72a · L:RZ-72b · L:RZ-72c) | legs below |
| L:RZ-72a | U6 | `rz_72a_degrees`, `rz_72a_gal_seven_no_quartic`, `rz_72a_units_cyclic`, `rz_72a_units_contain_quartic`, `rz_72a_examples`, `rz_72a_quartic_layer_infinitely_often`, `rz_72a_degree_four_only_five`, `rz_72a_cyclotomic_five_does_not_recur` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 8 theorem(s); comparator PASS |
| L:RZ-72b | U6 | `rz_72b_sqrt_five_does_not_recur` | PROVED BEYOND THE AGREED SCOPE (counted under its own label — the wall, WORD 2026-10-28 word 5) | proved (commit 5c6a9cd, build-5c6a9cd.json; axioms clean; comparator PASS); uncounted pending the wall |
| L:RZ-72c | U6 | — | OUT-OF-Q5 pending the wall | spec §7 / header: OUT-OF-Q5 (pending the wall); NEEDS-DEVELOPMENT |
| L:RZ-73 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:RZ-74 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:RZ-75 | — | — | CITED, NOT CHECKED | ledger bucket EFFORT-FAR (plan §9: Q9) |
| L:RZ-76 | U7 | — | — (split: L:RZ-76a · L:RZ-76b) | legs below |
| L:RZ-76a | U7 | `rz_76a_seven_eighths_arith` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-76b | U7 | — | — (unsettled; see flags) | spec §7: NOT A LEAN TARGET (CONCEPT / EFFORT-FAR), uncounted; V1-SPLIT-OK |
| L:RZ-77 | U7 | — | — (split: L:RZ-77a · L:RZ-77b) | legs below |
| L:RZ-77a | U7 | `rz_77a_casimir_arith` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-77b | U7 | — | OUT-OF-Q5 pending the wall | spec §7 / header: OUT-OF-Q5 (pending the wall); NEEDS-DEVELOPMENT |
| L:RZ-78 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:RZ-79 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:RZ-80 | U5 | `rz_80_z2_grading_incompatible` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-81 | U5 | `rz_81_jacobi_forces_DEH_zero` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-82 | U5 | — | — (split: L:RZ-82a · L:RZ-82b) | legs below |
| L:RZ-82a | U5 | `rz_82a_cartan_sl2` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-82b | U5 | `rz_82b_cartan_decomposition` | OUT-OF-Q5 pending the wall | spec §7 / header: OUT-OF-Q5 (pending the wall) — theorem in Challenge.lean, uncounted; NEEDS-DEVELOPMENT |
| L:RZ-83 | U4 | `rz_83_hyperbolic_products` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-84 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:RZ-N1 | — | — | ACCEPTED by the wall 2026-10-28 (night-words, word 2) — disposition and legs in the NEW-rows section below | ledger v0.2 NEW row; proposed bucket: NOW (E1) / numerals COMP |
| L:RZ-N2 | — | — | ACCEPTED by the wall 2026-10-28 (night-words, word 2) — disposition and legs in the NEW-rows section below | ledger v0.2 NEW row; proposed bucket: NOW-candidate (E1), gated by CC-13 and Q7 |
| L:RZ-N3 | — | — | ACCEPTED by the wall 2026-10-28 (night-words, word 2) — disposition and legs in the NEW-rows section below | ledger v0.2 NEW row; proposed bucket: EFFORT (E3) |
| L:RZ-N4 | — | — | ACCEPTED by the wall 2026-10-28 (night-words, word 2) — disposition and legs in the NEW-rows section below | ledger v0.2 NEW row; proposed bucket: NOW (E1–E2) |
| L:RZ-N5 | — | — | ACCEPTED by the wall 2026-10-28 (night-words, word 2) — disposition and legs in the NEW-rows section below | ledger v0.2 NEW row; proposed bucket: EFFORT-FAR (= MS-N4) |
| L:RZ-N6 | — | — | ACCEPTED by the wall 2026-10-28 (night-words, word 2) — disposition and legs in the NEW-rows section below | ledger v0.2 NEW row; proposed bucket: COMP |

## MS — *The Invariant Structure of the Modular Surface* (served sha256 `08b0181b…ae67` since 2026-10-29; the rows below were read against the edition `b4841489…3af5` served 2026-10-27, which the republish changed only at the corrected loci named in its Revisions note — see §Republished)

| row | unit | theorem(s) | disposition | evidence |
|---|---|---|---|---|
| L:MS-01 | — | — | CITED, NOT CHECKED | ledger bucket EFFORT-FAR (plan §9: Q9) |
| L:MS-02 | U8 | `ms_02_triangleFamily` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:MS-03 | U8 | `ms_03_heckeFamily` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:MS-04 | — | — | — (unsettled; see flags) | ledger NOW, shared = L:RZ-02, L:RZ-04; plan §9 step 6: counts by its RZ row |
| L:MS-05 | U8 | `ms_05_fixedPoints_F2` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:MS-06 | — | — | — (unsettled; see flags) | ledger bucket EFFORT, outside Q5 (plan §2); shared = L:RZ-05, L:RZ-06a, L:RZ-06b |
| L:MS-07 | U8 | `ms_07_selbergNorm_F2` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:MS-08 | — | — | — (unsettled; see flags) | ledger NOW, shared = L:RZ-07; plan §9 step 6: counts by its RZ row |
| L:MS-09 | U8 | — | — (split: L:MS-09a · L:MS-09b) | legs below |
| L:MS-09a | U8 | `ms_09a_goldenRatio_sq` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:MS-09b | U8 | `ms_09b_fundamental_automorph` | PROVED BEYOND THE AGREED SCOPE (counted under its own label — the wall, WORD 2026-10-28 word 5) | proved (commit 5c6a9cd, build-5c6a9cd.json; axioms clean; comparator PASS); uncounted pending the wall |
| L:MS-10 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:MS-11 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:MS-12 | — | — | — (unsettled; see flags) | ledger NOW, shared = L:RZ-12, L:RZ-03; plan §9 step 6: counts by its RZ row |
| L:MS-13 | U8 | `ms_13_smallest_fundDisc` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:MS-14 | U8 | — | — (split: L:MS-14a · L:MS-14b · L:MS-14c) | legs below |
| L:MS-14a | U8 | `ms_14a_listed_in_negPellSet` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:MS-14b | U8 | `ms_14b_negPellSet_infinite` | PROVED BEYOND THE AGREED SCOPE (counted under its own label — the wall, WORD 2026-10-28 word 5) | proved (commit 5c6a9cd, build-5c6a9cd.json; axioms clean; comparator PASS); uncounted pending the wall |
| L:MS-14c | U8 | `ms_14c_negPellSet_initial` | PROVED BEYOND THE AGREED SCOPE (counted under its own label — the wall, WORD 2026-10-28 word 5) | proved (commit 5c6a9cd, build-5c6a9cd.json; axioms clean; comparator PASS); uncounted pending the wall |
| L:MS-15 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:MS-16 | — | — | — (unsettled; see flags) | ledger bucket EFFORT, outside Q5 (plan §2); shared = L:RZ-08 |
| L:MS-17 | seat C | — (numerical row) | REPRODUCED | two independent programs, computations/MS-17/impl-a + impl-b (2026-10-28): Lehmer's number 1.17628 and the plastic number 1.32472 reproduce, both below φ (decided exactly); "smallest known" is a literature claim, not computed |
| L:MS-18 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:MS-19 | — | — | — (unsettled; see flags) | ledger bucket EFFORT, outside Q5 (plan §2); shared = L:RZ-14a, L:RZ-14b |
| L:MS-20 | — | — | — (unsettled; see flags) | ledger bucket EFFORT, outside Q5 (plan §2); shared = L:RZ-09/L:RZ-10, L:RZ-11 |
| L:MS-21 | — | — | CITED, NOT CHECKED | ledger bucket EFFORT-FAR (plan §9: Q9) |
| L:MS-22 | U8 | `ms_22_halfSystole` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:MS-23 | — | — | — (unsettled; see flags) | ledger bucket EFFORT, outside Q5 (plan §2); shared = L:RZ-58 |
| L:MS-24 | — | — | — (unsettled; see flags) | ledger NOW, shared = L:RZ-15, L:RZ-16; plan §9 step 6: counts by its RZ row |
| L:MS-24b | U8 | `ms_24b_geometryConstant_approx5` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:MS-25 | U8 | `ms_25_productRelation_logCollapse` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:MS-26 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:MS-27 | — | — | — (unsettled; see flags) | ledger v0.1 CONCEPT; v0.2 proposes a split CONCEPT/EFFORT — M/V₁ |
| L:MS-28 | — | — | — (unsettled; see flags) | ledger NOW, shared = L:RZ-17; plan §9 step 6: counts by its RZ row |
| L:MS-29 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:MS-30 | — | — | — (unsettled; see flags) | ledger bucket EFFORT, outside Q5 (plan §2) |
| L:MS-31 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:MS-32 | U8 | — | — (split: L:MS-32a · L:MS-32b) | legs below |
| L:MS-32a | U8 | `ms_32a_certificate_max_and_next_rung` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:MS-32b | U8 | `ms_32b_certificate_max_fields` | PROVED BEYOND THE AGREED SCOPE (counted under its own label — the wall, WORD 2026-10-28 word 5; the revisit AUTHORIZED by the night-words, word 3, on the δ route, the standard loop whole) | proved (commit 9758579, build-9758579.json; axioms clean; comparator PASS); uncounted; V₂ re-signed and V₃ CLEAN at specs/_V2-MS32b-revisit.md · _V3-MS32b-revisit.md |
| L:MS-33 | seat C | — (counting row) | REPRODUCED (against the edition of 2026-10-29: twelve, with the value rule printed; both programs) | two independent programs, computations/MS-33/impl-a + impl-b (2026-10-28): under the 2026-08-16 record's own rule (the field of the shortest geodesic) the count of Γ₀(N), N ≤ 60, at the X(1) value is TWELVE (N = 1, 5, 9, 11, 19, 29, 31, 41, 45, 55, 57, 59), not nine; nine holds only under the narrower trace-3 reading; the paper states no rule — CC-18 candidate on the correction track; which rule is the wall's word; corrected at the republish (JC-9 event 26; the wall's value-rule word of 2026-10-28) |
| L:MS-34 | — | — | — (unsettled; see flags) | ledger bucket EFFORT, outside Q5 (plan §2); plan §9: a later ruling |
| L:MS-35 | seat C | — (numerical row) | REPRODUCED | two independent programs, computations/MS-35/impl-a + impl-b (2026-10-28): r₁ = 9.5337, r₂ = 12.173 reproduce by two different methods (Hejhal collocation; a transfer-operator determinant), no even form below 13.5; floating-point, not a certified enclosure |
| L:MS-36 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:MS-37 | — | — | CITED, NOT CHECKED | ledger bucket EFFORT-FAR (plan §9: Q9) |
| L:MS-38 | — | — | CITED, NOT CHECKED | ledger bucket EFFORT-FAR (plan §9: Q9) |
| L:MS-39 | U8 | `ms_39_mayer_on_constant` | CHECKED (commit 5c6a9cd, manifests/build-5c6a9cd.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:MS-40 | — | — | CITED, NOT CHECKED | ledger bucket EFFORT-FAR (plan §9: Q9) |
| L:MS-41 | — | — | — (unsettled; see flags) | ledger NOW, shared = L:RZ-46a; plan §9 step 6: counts by its RZ row |
| L:MS-42 | — | — | — (unsettled; see flags) | ledger NOW, shared = L:RZ-44a; plan §9 step 6: counts by its RZ row |
| L:MS-43 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:MS-44 | — | — | — (unsettled; see flags) | ledger NOW, shared = L:RZ-46a; plan §9 step 6: counts by its RZ row |
| L:MS-45 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:MS-46 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:MS-47 | — | — | — (unsettled; see flags) | ledger bucket EFFORT, outside Q5 (plan §2); shared = L:RZ-57 |
| L:MS-48 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:MS-49 | — | — | CITED, NOT CHECKED | ledger bucket EFFORT-FAR (plan §9: Q9) |
| L:MS-50 | — | — | — (unsettled; see flags) | ledger bucket EFFORT, outside Q5 (plan §2); plan §9: a later ruling |
| L:MS-51 | — | — | INTERPRETIVE | ledger bucket CONCEPT |
| L:MS-N1 | — | — | ACCEPTED by the wall 2026-10-28 (night-words, word 2) — disposition and legs in the NEW-rows section below | ledger v0.2 NEW row; proposed bucket: EFFORT-FAR |
| L:MS-N2 | — | — | ACCEPTED by the wall 2026-10-28 (night-words, word 2) — disposition and legs in the NEW-rows section below | ledger v0.2 NEW row; proposed bucket: closed-form half NOW (E2) |
| L:MS-N3 | — | — | ACCEPTED by the wall 2026-10-28 (night-words, word 2) — disposition and legs in the NEW-rows section below | ledger v0.2 NEW row; proposed bucket: NOW (E0) |
| L:MS-N4 | — | — | ACCEPTED by the wall 2026-10-28 (night-words, word 2) — disposition and legs in the NEW-rows section below | ledger v0.2 NEW row; proposed bucket: EFFORT-FAR (= RZ-N5) |
| L:MS-N5 | — | — | ACCEPTED by the wall 2026-10-28 (night-words, word 2) — disposition and legs in the NEW-rows section below | ledger v0.2 NEW row; proposed bucket: COMP |

## Counting block

**T** here is the brief's target count: the rows that are Lean targets under Q5 (the 62 in-scope ledger rows, plan §2), less NOT A TARGET (Q7), CITED, INTERPRETIVE and NEW-pending rows. Counted per **ledger row**; a split row counts once, and it is STATED only when every in-scope leg (OUT-OF-Q5, CONCEPT and NOT-A-LEAN-TARGET legs set aside; an OPEN leg blocks) has a theorem in a `Challenge.lean`. The plan §7 denominator (every ledger row) is a different number and is given last.

| paper | T | STATED |
|---|---|---|
| RZ | 50 | 39 |
| MS | 11 | 0 |
| both | 61 | 39 |

- **RZ T (50):** RZ-02, RZ-03, RZ-04, RZ-05, RZ-06a, RZ-06b, RZ-07, RZ-09, RZ-10, RZ-11, RZ-12, RZ-13, RZ-14a, RZ-14b, RZ-15, RZ-16, RZ-17, RZ-20, RZ-21, RZ-23, RZ-24, RZ-32, RZ-33, RZ-34, RZ-38, RZ-40, RZ-41, RZ-43, RZ-44a, RZ-46a, RZ-47, RZ-49, RZ-53, RZ-55, RZ-58, RZ-60, RZ-61, RZ-63, RZ-64, RZ-65, RZ-66, RZ-67, RZ-71, RZ-72, RZ-76, RZ-77, RZ-80, RZ-81, RZ-82, RZ-83
- **RZ STATED (39):** RZ-02, RZ-03, RZ-04, RZ-06a, RZ-07, RZ-11, RZ-12, RZ-15, RZ-16, RZ-17, RZ-20, RZ-21, RZ-23, RZ-24, RZ-32, RZ-34, RZ-38, RZ-43, RZ-44a, RZ-46a, RZ-47, RZ-49, RZ-53, RZ-55, RZ-60, RZ-61, RZ-63, RZ-64, RZ-65, RZ-66, RZ-67, RZ-71, RZ-72, RZ-76, RZ-77, RZ-80, RZ-81, RZ-82, RZ-83
- **RZ in T, not STATED (11):** RZ-05, RZ-06b, RZ-09, RZ-10, RZ-13, RZ-14a, RZ-14b, RZ-33, RZ-40, RZ-41, RZ-58
- **MS T (11):** MS-02, MS-03, MS-05, MS-07, MS-09, MS-13, MS-14, MS-22, MS-25, MS-32, MS-39
- **MS STATED (0):** (none)
- **Excluded from RZ T within the 51 RZ scope rows:** RZ-18 (NOT A TARGET, Q7).

**Per leg (for CO's flips):** in-scope counting legs RZ 54, of which STATED 43; MS 11, of which STATED 0.

- RZ legs: RZ-02, RZ-03, RZ-04, RZ-05, RZ-06a, RZ-06b, RZ-07a, RZ-09, RZ-10, RZ-11, RZ-12, RZ-13, RZ-14a, RZ-14b, RZ-15, RZ-16, RZ-17, RZ-20a, RZ-21, RZ-23, RZ-24, RZ-32a, RZ-33a, RZ-33b, RZ-34, RZ-38, RZ-40, RZ-41a, RZ-41b, RZ-43a, RZ-43b, RZ-44a, RZ-46a, RZ-47, RZ-49, RZ-53a, RZ-55, RZ-58, RZ-60, RZ-61a, RZ-61c, RZ-63a, RZ-64a, RZ-65, RZ-66, RZ-67, RZ-71a, RZ-72a, RZ-76a, RZ-77a, RZ-80, RZ-81, RZ-82a, RZ-83
- RZ legs STATED: RZ-02, RZ-03, RZ-04, RZ-06a, RZ-07a, RZ-11, RZ-12, RZ-15, RZ-16, RZ-17, RZ-20a, RZ-21, RZ-23, RZ-24, RZ-32a, RZ-33a, RZ-34, RZ-38, RZ-41a, RZ-43a, RZ-43b, RZ-44a, RZ-46a, RZ-47, RZ-49, RZ-53a, RZ-55, RZ-60, RZ-61a, RZ-61c, RZ-63a, RZ-64a, RZ-65, RZ-66, RZ-67, RZ-71a, RZ-72a, RZ-76a, RZ-77a, RZ-80, RZ-81, RZ-82a, RZ-83
- MS legs: MS-02, MS-03, MS-05, MS-07, MS-09a, MS-13, MS-14a, MS-22, MS-25, MS-32a, MS-39

**Plan §7 denominator (every ledger row, CONCEPT / CITED / NOT-A-TARGET included):** RZ 88 v0.1 rows (94 once M/V₁ accept the 6 NEW rows), MS 51 (56 with the 5 NEW rows) — `CLAIM-LEDGER-v0.2-rekeyed.md` §5.


## CO flip — 2026-10-28T18:49:42Z, from manifest `manifests/build-5c6a9cd.json` (verdict PASS, six of six checks)

Flipped by the orchestrator (CO) from the manifest: a leg reads CHECKED only when every theorem it names is in the manifest's axiom list with axioms ⊆ {propext, Classical.choice, Quot.sound} and in its unit's `comparator.json` `theorem_names` (Comparator PASS on all eight units). An OPEN leg blocks its parent row; OUT-OF-Q5 legs stay uncounted whatever their proof state (their evidence column records "proved; uncounted pending the wall" where a proof exists).

| paper | N (CHECKED) | T | CHECKED ids | not CHECKED (reason class) |
|---|---|---|---|---|
| RZ | **38** | 50 | 02 03 04 06a 07 11 12 15 16 17 20 21 23 24 32 34 38 43 44a 46a 47 49 53 55 60 63 64 65 66 67 71 72 76 77 80 81 82 83 | 05 06b 09 13 14a 14b 58 (EFFORT lane, after the reset) · 10 40 (definitional rows, no theorem — the wall's) · 33 41 (an OPEN leg on the correction track: 33b, 41b/CC-16) · 61 (61c GATED on L:RZ-58) |
| MS | **11** | 11 | 02 03 05 07 09 13 14 22 25 32 39 | — |

Legs flipped: 54. Statements CHECKED by theorem count: 86 proved theorems across eight Solution files (U1 10 · U2 12 · U3 13 · U4 15 · U5 3 · U6 13 · U7 5 · U8 15), of which the out-of-Q5 theorems (RZ-07b, 41c, 53c ×2, 61b, 63b, 64b, 64c, 71b ×2, 72b, MS-09b, 14b, 14c — fourteen theorems in twelve legs) are proved but uncounted pending the wall; RZ-32b, RZ-82b, RZ-61c and MS-32b are stated, frozen, unproved and recorded under `statements_not_checked`. MS-24b (NEW leg) is CHECKED but outside T until the wall accepts the NEW rows. Toolchain `leanprover/lean4:v4.33.0`, mathlib `db584cd6d46c92f209a44c0f1c829460d327499d`, Comparator v4.33.0 run through the macOS shim (no sandbox; see the report to the wall).


## The wall's words installed — 2026-10-28T20:21:21Z (`priority/inbox/WORD-wall-2026-10-28-now-wave-words.md`)

- **Word 5:** the out-of-Q5 statements proved along the way — FOURTEEN theorems in twelve legs, not the sixteen the close report said (RZ-32b and RZ-82b were trimmed from their units' theorem_names and never proved; erratum 2026-10-28T20:23:26Z) — are COUNTED under their own label, *proved beyond the agreed scope* (rows relabeled above: 12 legs). They do not enter N; they are named in the README as a class.
- **Word 6:** RZ-10 and RZ-40 (definitional) read CARRIED by their consumer rows. The zeta headline therefore reads **N = 40 of T = 50** (38 CHECKED rows + 2 CARRIED). MS unchanged at 11 of 11.
- **Word 1:** the public sentence carries both numbers: RZ 88 catalogued · 50 reachable · 40 checked; MS 51 · 11 · 11. If the NEW rows (six RZ, five MS) are accepted, the catalogued numbers move with this ledger.
- **Word 4:** the REPRODUCED label stays in this ledger; the README bullet returns when seat C lands rows in `computations/` (RZ-27, 48; MS-17, 33, 35 — running tonight).
  - *Landed 2026-10-28T21:02:30Z:* both programs ran on all five rows and agree on every verdict. REPRODUCED: RZ-48, MS-17, MS-35. Not as printed: RZ-27 at one table cell (a truncated display), MS-33 (nine → twelve under the record's rule). The README bullet is restored for the three rows that carry two agreeing programs.

## Second count — 2026-10-28T21:49:07Z (`manifests/build-c856d59.json`, six of six PASS at commit c856d59; the provenance cluster and RZ-58 built tonight by the wall's word, lane 3)

| paper | N CHECKED | CARRIED (word 6) | headline | T | not counted |
|---|---|---|---|---|---|
| RZ | **46** | 2 (RZ-10, RZ-40) | **48 of 50** | 50 | RZ-33 (leg 33b OPEN, correction track) · RZ-41 (leg 41b OPEN, CC-16) |
| MS | **11** | 0 | **11 of 11** | 11 | — |

Flipped tonight (10 legs): RZ-05, 06b, 09, 13, 14a, 14b (U9 `RiemannZeta/Provenance`, seven theorems), RZ-58a/b/c (U10 `RiemannZeta/LValue`, five theorems), RZ-61c (U2, closed through the ruled Bridge → LValue import) — which completes L:RZ-61 (a CHECKED · b proved beyond the agreed scope · c CHECKED). Statement theorems proved: 99 across ten Solution files (86 at the first count + 7 + 5 + 1); the gate's axiom census reads 382 theorem constants because U10's Solution carries 34 proof-side auxiliaries, none of them statements. Each new unit passed a fresh V₂ before its proofs (U9 b2552d65, U10 ed3c5e79) and a fresh V₃ after them (seven of seven and six of six CLEAN). The two rows still outside the count both wait on the correction track, not on Lean.

## NEW rows — ACCEPTED by the wall 2026-10-28 (WORD-wall-2026-10-28-night-words, word 2) — catalogued RZ 94 · MS 56; T RZ 52 · MS 14

*The eleven NEW rows of the re-key (`specs/_NEW-ROWS-2026-10-28.md`, M; `specs/_V1-NEW-ROWS.md`, V₁) enter this ledger as dispositioned. T: RZ gains N1 and N4b (52; N2a joins when CC-13's correction lands → 53); MS gains N2a, N3 and N5a (14; N5a in T and uncounted, NEEDS-DEVELOPMENT). MS-24b was already counted. Rows written 2026-10-28T22:44:04Z.*

### RZ

| row | unit | theorem(s) | disposition | evidence |
|---|---|---|---|---|
| L:RZ-N1 | U12 | `rz_N1_length_monotone_in_trace` | CHECKED (commit 9758579, manifests/build-9758579.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-N2 | — | — | — (split: L:RZ-N2a · L:RZ-N2b · L:RZ-N2c) | legs below; NEW row accepted |
| L:RZ-N2a | U12 | `rz_N2a_rotation_invariant` | CHECKED (commit 9758579, manifests/build-9758579.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-N2b | U14 | `rz_N2b_reflections_anti_automorphism`, `rz_N2b_reflections_sign_up_to_order` | CHECKED (commit 3302cca, manifests/build-3302cca.json) | axioms propext · Classical.choice · Quot.sound on 2 theorem(s); comparator PASS; stated against the corrected text (CC-13), served `6b89ce0e…2d12` since 2026-10-29 — M, V₁, V₂ (`b6fb5ea6`), V₃ CLEAN the same day; was OPEN (= CC-13) until the republish |
| L:RZ-N2c | — | — | NOT A TARGET (Q7) | catalogue only; M's Q7 reading and V₁'s matrix-witness reading carried side by side until a drafting pass picks one (the wall, word 2) |
| L:RZ-N3 | — | `rz_N3_zeta_five` (spec only) | OUT-OF-Q5 — NEEDS-DEVELOPMENT | NEW row accepted into the catalogue; EFFORT (E3); RZ-26's machinery not at the pin; not in T |
| L:RZ-N4 | — | — | — (split: L:RZ-N4a · L:RZ-N4b · L:RZ-N4c) | legs below; NEW row accepted |
| L:RZ-N4a | U3 | `rz_47_zero_gives_pole` | CARRIED by L:RZ-47 (CHECKED) | already carried: rz_47's first and fourth conjuncts |
| L:RZ-N4b | U12 | `rz_N4b_scatteringRatio_norm_one` | CHECKED (commit 9758579, manifests/build-9758579.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:RZ-N4c | — | — | CITED, NOT CHECKED | scattering-theory language; no Eisenstein / Lax–Phillips objects at the pin |
| L:RZ-N5 | — | — | CITED, NOT CHECKED | = L:MS-N4; Lewis–Zagier 2001 Ch. IV §3 |
| L:RZ-N6 | seat C | — (numerical row) | REPRODUCED | two independent programs, computations/RZ-N6/impl-a + impl-b (2026-10-28): A = det(1 − ℒ_{3/2}) = 0.66295 and B = Z(3/2)/Z(5/2) = 0.83492 reproduce the printed 0.663 / 0.835 by a Taylor–Hurwitz basis + class enumeration (A) and a Bessel-kernel Nyström determinant + Gauss-cycle Euler products (B); A ≠ B as printed; roundings, not truncations (margins 4.5e-4, 4.2e-4) |

### MS

| row | unit | theorem(s) | disposition | evidence |
|---|---|---|---|---|
| L:MS-N1 | — | — | CITED, NOT CHECKED | Hecke 1917 / Zagier 1981: the Eisenstein period (5.2a); EFFORT-FAR |
| L:MS-N2 | — | — | — (split: L:MS-N2a · L:MS-N2b) | legs below; NEW row accepted |
| L:MS-N2a | U13 | `ms_N2a_closedForm_vanishes` | CHECKED (commit 9758579, manifests/build-9758579.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:MS-N2b | — | — | CITED, NOT CHECKED | inherits L:MS-N1 (the period equals the closed form only through Hecke's formula); a CITED leg does not block the row |
| L:MS-N3 | U13 | `ms_N3_phi_from_systole` | CHECKED (commit 9758579, manifests/build-9758579.json) | axioms propext · Classical.choice · Quot.sound on 1 theorem(s); comparator PASS |
| L:MS-N4 | — | — | CITED, NOT CHECKED | = L:RZ-N5 |
| L:MS-N5 | — | — | — (split: L:MS-N5a · L:MS-N5b) | legs below; NEW row accepted |
| L:MS-N5a | U13 | `ms_N5a_figure1_nodes` | STATED — NEEDS-DEVELOPMENT | (manifest) NOT FLIPPED: ms_N5a_figure1_nodes: not in manifest axioms |
| L:MS-N5b | seat C | — (numerical row) | REPRODUCED | two independent programs, computations/MS-N5b/impl-a + impl-b (2026-10-28): γ_ζ = 32.93506 and γ_L = 33.00046 reproduce the printed 32.935 / 33.000 (Hardy-function sign changes + argument-principle count (A); theta-form evaluation + box winding (B)); the closest ζ/L pair in 0 ≤ t ≤ 40 over all 96 pairs, gap 0.0654, next 0.4224; both ordinate lists complete: 6 ζ zeros, 16 L zeros |

## Third count — 2026-10-28T23:46:02Z (`manifests/build-9758579.json`, six of six PASS at commit 9758579; the finishing stretch of WORD-wall-2026-10-28-night-words)

| paper | N CHECKED | CARRIED (word 6) | headline | T | not counted |
|---|---|---|---|---|---|
| RZ | **48** | 2 (RZ-10, RZ-40) | **50 of 52** | 52 | RZ-33 and RZ-41 — legs 33b and 41b PROVED in U11 against the corrected text (CC-15, CC-16), COUNT HELD pending the wall's read of CORRECTION-WAVE-2026-10-28; they join N when the correction is read and republished (52 of 52). RZ-N2a joins T when CC-13 lands (→ 53). |
| MS | **13** | 0 | **13 of 14** | 14 | MS-N5a — STATED, NEEDS-DEVELOPMENT (ζ(1/2)·L(1/2, χ₅) ≠ 0 is not at the pin); in T and uncounted. |

Flipped at this count (5 legs): RZ-N1, RZ-N2a, RZ-N4b (U12 `RiemannZeta/Accepted`, three theorems), MS-N2a, MS-N3 (U13 `ModularSurface/Accepted`, two theorems). Proved and HELD: RZ-33b, RZ-41b (U11 `RiemannZeta/Corrected`, two theorems; V₂ `7f9a7838`, V₃ CLEAN). Proved beyond the agreed scope: ms_32b (U8, the authorized revisit on the δ route) — the class now reads FIFTEEN theorems in thirteen legs. Statement theorems proved: 106 across thirteen Solution files (99 at the second count + 2 in U11 + 3 in U12 + 2 in U13), the two of U11 held from the headline. The manifest counts 450 theorem constants across the thirteen units, every axiom set within {propext, Classical.choice, Quot.sound}, Comparator okay on all thirteen (the macOS shim, unsandboxed, as flagged), every Challenge digest equal to its V₂ signature, zero hits for the retired names. Seat C: RZ-N6 and MS-N5b REPRODUCED by two blind programs each — five rows now carry the label.

## Republished — 2026-10-29T18:06:09Z (the wall's ship word, WORD-wall-2026-10-29-read-and-ship; JC-9 events 25 and 26)

The corrected editions are served: RZ `6b89ce0e7ae0a71301a8d792b6e80f4cb850244df83f4731810377d70e3d2d12` (41 pp; was `2d5287e7…`), MS `08b0181becaa56be021886bbf478db956883da6d6a00b3c92297653b6ea5ae67` (27 pp; was `b4841489…`). Each differs from the edition the rows were read against only at the loci its Revisions note names (the correction track CC-11 to CC-18 and the RZ-27 cell; typography at the ship build). **Flipped at the republish:** L:RZ-33b and L:RZ-41b, proved in U11 `RiemannZeta/Corrected` against the corrected text, now CHECKED — **RZ 50 CHECKED + 2 CARRIED = 52 of 52**; MS unchanged at **13 of 14**. **T moves to 53** for RZ: with CC-13 in print the row L:RZ-N2 is a target; its leg N2a is CHECKED (U12) and its leg N2b (the corrected sentence) is in the loop today as U14 `RiemannZeta/CorrectedReflections` (M and V₁ GREEN) — until U14 lands the row is uncounted and the headline reads 52 of 53; when it lands, 53 of 53. L:MS-33 reads REPRODUCED against the printed twelve. The per-unit `formalization.yaml` files keep the `pdf_sha256` of the edition each statement was compared with (U11's reads the corrected edition's); the README names the served digests.

## Fourth count — 2026-10-29T18:55:57Z (`manifests/build-3302cca.json`, six of six PASS at commit 3302cca; U14 landed the same day as the republish)

| paper | N CHECKED | CARRIED (word 6) | headline | T | not counted |
|---|---|---|---|---|---|
| RZ | **51** | 2 (RZ-10, RZ-40) | **53 of 53** | 53 | — |
| MS | **13** | 0 | **13 of 14** | 14 | MS-N5a — STATED, NEEDS-DEVELOPMENT; the development pass queues after the reset. |

Flipped at this count: L:RZ-N2b (U14 `RiemannZeta/CorrectedReflections`, two theorems, the corrected CC-13 sentence as printed since 2026-10-29), which completes the row L:RZ-N2 (N2a CHECKED · N2b CHECKED · N2c NOT A TARGET). Statement theorems proved: 108 across fourteen Solution files (106 + 2). The manifest counts 458 theorem constants across the fourteen units, every axiom set within {propext, Classical.choice, Quot.sound}, Comparator okay on all fourteen (the macOS shim, unsandboxed, as flagged), every Challenge digest equal to its V₂ signature, zero hits for the retired names. Every statement of the zeta paper within the agreed scope is now checked; the one open row of the modular-surface paper waits on development, not on a correction.
