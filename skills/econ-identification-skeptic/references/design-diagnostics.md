# Design Diagnostics

Use this reference for applied economics identification review.

## DID / Event Study

Core questions:

- Who is treated, when, and why?
- What is the comparison group?
- Is treatment timing staggered?
- Are effects dynamic or heterogeneous?
- Is anticipation plausible?
- Are pre-treatment trends informative and visually credible?
- Is treatment absorbing, reversible, or repeated?

Diagnostics:

- event-study coefficients and plot;
- cohort-specific estimators for staggered adoption;
- placebo timing;
- placebo outcomes;
- alternative control groups;
- sensitivity to event window;
- treatment-specific trends only as sensitivity, not a default fix;
- clustering at the assignment or policy level.

Reviewer pressure points:

- pre-trend tests have low power;
- bad controls affected by treatment;
- endogenous timing;
- spillovers;
- compositional change;
- TWFE weights or forbidden comparisons.

## IV

Core questions:

- What does the instrument shift?
- Who are the compliers?
- Why should the instrument affect the outcome only through treatment?
- Is monotonicity plausible?
- Is the first stage strong enough?
- Is the LATE population relevant to the paper's claim?

Diagnostics:

- first-stage coefficient and weak-instrument diagnostics;
- reduced form;
- OLS vs 2SLS comparison;
- weak-IV robust inference;
- sensitivity to controls and samples;
- overidentification tests if multiple instruments exist, with caution.

Reviewer pressure points:

- exclusion restriction;
- direct instrument effects;
- invalid control variables;
- weak instruments;
- LATE not relevant to policy claim.

## RDD

Core questions:

- What rule creates the cutoff?
- Can units manipulate the running variable?
- Is the cutoff locally as-good-as-random?
- What is the bandwidth?
- Is the estimand local to the cutoff?

Diagnostics:

- density or manipulation test;
- covariate continuity;
- bandwidth sensitivity;
- polynomial-order sensitivity;
- donut RDD;
- local plots.

Reviewer pressure points:

- sorting around cutoff;
- functional-form dependence;
- multiple cutoffs;
- external validity beyond cutoff.

## Synthetic Control

Core questions:

- Is the donor pool credible?
- Is pre-treatment fit strong?
- Are treated and donor units comparable?
- Are there spillovers?
- Were donor exclusions decided before seeing results?

Diagnostics:

- treated vs synthetic path;
- gap plot;
- placebo distribution;
- leave-one-out donors;
- predictor balance.

Reviewer pressure points:

- cherry-picked donor pool;
- poor pre-fit;
- post-treatment shocks unrelated to treatment;
- weak inference with few units.

## Matching / Weighting

Core questions:

- Is there overlap?
- Are matching variables pre-treatment?
- Which estimand is targeted?
- Are unobservables still plausible?

Diagnostics:

- propensity overlap;
- standardized mean differences;
- covariate balance;
- sensitivity to caliper, weights, or matching algorithm.

Reviewer pressure points:

- hidden confounding;
- post-treatment controls;
- lack of common support.

## Causal ML

Core questions:

- Is ML estimating nuisance functions or the causal effect itself?
- Is cross-fitting used?
- Is there leakage?
- Is overlap adequate?
- Are heterogeneity claims pre-specified or exploratory?
- Is the target estimand `ATE`, `ATT`, `CATE`, `ITE`, `LATE`, or uplift?
- Is the chosen estimator family aligned with the assignment mechanism?

Diagnostics:

- sample splitting / cross-fitting;
- nuisance model performance;
- overlap and propensity-score distribution;
- sensitivity across learners;
- honest inference.
- placebo treatment/outcome checks where appropriate;
- AUUC or uplift curves when the use case is targeting;
- hidden-confounding sensitivity analysis.

Reviewer pressure points:

- black-box heterogeneity fishing;
- overfitting;
- no clear estimand;
- ML performance confused with causal validity.
- post-treatment feature leakage;
- treatment targeting without cost, capacity, or fairness analysis.
