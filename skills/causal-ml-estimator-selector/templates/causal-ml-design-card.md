# Causal ML Design Card

## Research Question

- Question:
- Unit of observation:
- Treatment:
- Outcome:
- Timing:
- Data source:

## Estimand

- Target estimand: ATE / ATT / CATE / ITE / LATE / uplift
- Target population:
- Policy or decision use:
- Confirmatory or exploratory:

## Identification

- Assignment mechanism:
- Main assumption:
- Pre-treatment covariates:
- Possible post-treatment variables to exclude:
- Overlap concern:
- Hidden-confounding concern:
- Spillover or interference concern:

## Estimator Choice

| Candidate | Why plausible | Main risk | Required diagnostic |
|---|---|---|---|
| S-learner | | | |
| T-learner | | | |
| X-learner | | | |
| R-learner | | | |
| DR-learner | | | |
| Uplift tree/forest | | | |
| IV/DRIV | | | |
| Neural causal model | | | |

## Feature And Data Rules

- Frozen feature list:
- Leakage checks:
- Missing data handling:
- Train/test or cross-fitting plan:
- Random seed:
- Package versions:

## Validation

- Learner comparison:
- Overlap diagnostics:
- Placebo checks:
- AUUC / uplift curve:
- Sensitivity analysis:
- Segment stability:

## Interpretation

- Main effect claim:
- Heterogeneity claim:
- Targeting recommendation:
- What would invalidate the conclusion:
- What should not be claimed:
