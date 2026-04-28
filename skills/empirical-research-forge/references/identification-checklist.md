# Identification Checklist

Use this reference when the task involves causal inference, identification strategy, robustness, or reviewer-style critique.

## Universal Questions

For any empirical design, ask:

- What is the source of identifying variation?
- Who or what is compared to whom or what?
- What assumptions make the comparison causal?
- What would violate those assumptions?
- Which violations are testable?
- Which violations are not testable but must be argued?
- What robustness checks map to the main threats?

## DID and Event Studies

Check:

- treatment timing;
- treatment reversibility;
- never-treated or not-yet-treated comparison group;
- pre-trends;
- anticipation;
- dynamic effects;
- heterogeneous treatment effects;
- negative weighting risk in TWFE;
- clustering at treatment assignment level;
- placebo outcomes or placebo timing.

Expected diagnostics:

- event-study plot;
- cohort-specific or modern DID estimator if staggered adoption matters;
- sensitivity to window choice;
- robustness to alternative control groups;
- pre-treatment covariate trends.

## IV

Check:

- relevance;
- exclusion restriction;
- monotonicity;
- first-stage strength;
- interpretation of LATE;
- instrument manipulation or sorting;
- direct effects of the instrument;
- multiple instruments and overidentification, if applicable.

Expected diagnostics:

- first-stage coefficient and F statistic;
- weak-IV robust inference where relevant;
- reduced form;
- OLS vs 2SLS comparison;
- sensitivity to controls and samples;
- discussion of exclusion restriction, not just statistical tests.

## RDD

Check:

- precise running variable;
- cutoff rule;
- manipulation around cutoff;
- bandwidth choice;
- polynomial order;
- covariate balance;
- density test;
- local interpretation.

Expected diagnostics:

- binned scatter around cutoff;
- McCrary/density test;
- bandwidth sensitivity;
- donut RDD if manipulation is plausible;
- covariate continuity.

## Synthetic Control

Check:

- donor pool;
- pre-treatment fit;
- predictor balance;
- treatment timing;
- spillovers;
- placebo units;
- inference method.

Expected diagnostics:

- treated vs synthetic outcome path;
- gap plot;
- placebo distribution;
- leave-one-out donor sensitivity.

## Matching / PSM

Check:

- overlap/common support;
- balance before and after matching;
- matching variables chosen before outcomes;
- sensitivity to hidden confounding;
- estimand: ATT, ATE, or ATC.

Expected diagnostics:

- covariate balance table;
- standardized mean differences;
- propensity score overlap;
- robustness to caliper or weighting choices.

## Causal ML / DML

Check:

- nuisance model choice;
- cross-fitting;
- target estimand;
- sample splitting;
- leakage;
- overlap;
- interpretability of heterogeneous effects.

Expected diagnostics:

- nuisance performance;
- overlap checks;
- sensitivity to learners;
- honest inference;
- pre-specified heterogeneity dimensions where possible.

