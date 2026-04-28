# Identification Checklist

Use this reference when the task involves causal inference, identification strategy, robustness, or reviewer-style critique.

## Universal Questions

For any empirical design, ask:

- What is the estimand?
- What is the source of identifying variation?
- Who or what is compared to whom or what?
- What assumptions make the comparison causal?
- What would violate those assumptions?
- Which violations are testable?
- Which violations are not testable but must be argued?
- What robustness checks map to the main threats?
- Does the manuscript claim more than the design can support?

## DID and Event Studies

Check:

- treatment timing and whether treatment is absorbing;
- never-treated or not-yet-treated comparison group;
- anticipation;
- dynamic effects;
- heterogeneous treatment effects;
- pre-treatment outcome patterns;
- negative-weighting or forbidden-comparison risk in simple TWFE designs;
- spillovers and compositional change;
- clustering at the treatment-assignment level.

Expected diagnostics:

- event-study plot with readable confidence intervals;
- cohort-specific or modern DID estimator if staggered adoption matters;
- sensitivity to event window and control group;
- placebo timing or placebo outcomes;
- pre-treatment covariate trends;
- explicit discussion that insignificant pre-trends do not prove parallel trends.

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

- first-stage coefficient and weak-instrument diagnostics;
- reduced form;
- OLS vs 2SLS comparison, interpreted carefully;
- weak-IV robust inference where relevant;
- sensitivity to controls and samples;
- substantive defense of exclusion restriction, not just statistical tests.

## RDD

Check:

- precise running variable and cutoff rule;
- manipulation around cutoff;
- local comparability near the cutoff;
- bandwidth choice;
- polynomial order;
- covariate balance;
- density around cutoff;
- local interpretation and external validity limits.

Expected diagnostics:

- binned scatter around cutoff;
- density or manipulation test;
- bandwidth sensitivity;
- polynomial-order sensitivity;
- donut RDD if manipulation is plausible;
- covariate continuity.

## Synthetic Control

Check:

- donor pool construction;
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
- leave-one-out donor sensitivity;
- transparent donor-pool exclusions.

## Matching / Weighting

Check:

- overlap and common support;
- balance before and after matching or weighting;
- pre-treatment status of matching variables;
- sensitivity to hidden confounding;
- target estimand: ATT, ATE, or ATC.

Expected diagnostics:

- covariate balance table;
- standardized mean differences;
- propensity-score overlap;
- robustness to caliper, trimming, weighting, or matching choices.

## Causal ML / DML

Check:

- whether ML estimates nuisance functions or causal effects;
- target estimand;
- cross-fitting;
- sample splitting;
- leakage;
- overlap;
- interpretable heterogeneity;
- honest inference.

Expected diagnostics:

- nuisance-model performance;
- overlap checks;
- sensitivity to learners;
- honest confidence intervals where applicable;
- pre-specified heterogeneity dimensions when possible.

## Credibility Verdict

Use one of three labels:

- `ready`: the design, assumptions, diagnostics, and writing are aligned.
- `needs design repair`: the idea is plausible, but diagnostics or design choices are not yet defensible.
- `not causal yet`: the current evidence supports description or prediction, not a causal claim.
