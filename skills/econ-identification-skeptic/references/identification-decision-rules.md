# Identification Decision Rules

Use these rules when assigning a credibility verdict.

## Verdict Labels

### ready

Use `ready` only when:

- the estimand is explicit;
- the comparison group is clear;
- the main identifying assumptions are named;
- diagnostics are tied to the main threats;
- non-testable assumptions are defended with institutional or theoretical evidence;
- the writing does not overclaim beyond the design.

### needs design repair

Use `needs design repair` when the design may work, but one or more pillars are weak:

- unclear treatment timing or comparison group;
- incomplete diagnostics;
- clustering, fixed effects, or controls are not justified;
- robustness checks do not map to threats;
- mechanism or heterogeneity results look exploratory but are written as confirmatory.

### not causal yet

Use `not causal yet` when:

- the source of identifying variation is unclear;
- the design relies mainly on controls in observational data;
- the key assumption is contradicted by the setting or diagnostics;
- the method estimates prediction or association but the paper claims causality;
- replication succeeds but identification remains unsupported.

## Review Severity

- `major`: threatens the central claim or the paper's causal interpretation.
- `moderate`: weakens interpretation but may not overturn the main result.
- `minor`: affects clarity, reporting, or robustness presentation.

## Good Fixes

A good fix should be specific:

- "Add an event-study plot with cohort-specific estimator" is useful.
- "Do more robustness checks" is not.
- "Explain why the instrument affects employment only through treatment" is useful.
- "Discuss endogeneity" is too vague.

## Non-Testable Assumptions

Do not pretend all assumptions are testable. For non-testable assumptions, require:

- institutional detail;
- timing evidence;
- mechanism logic;
- comparison with alternative explanations;
- transparent limits on the claim.
