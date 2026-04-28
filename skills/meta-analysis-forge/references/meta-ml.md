# Meta-Analysis + Machine Learning

Use this reference when the user wants to combine evidence synthesis with machine learning.

## Valid Roles for ML

ML can help with:

- search expansion;
- deduplication;
- title/abstract screening prioritization;
- full-text triage;
- study classification;
- extraction assistance;
- risk-of-bias triage;
- topic modeling;
- effect-size prediction;
- moderator discovery;
- heterogeneity exploration.

ML does not replace:

- eligibility criteria;
- human adjudication for final inclusion;
- transparent effect-size extraction;
- bias assessment;
- statistical inference;
- domain interpretation.

## Screening ML

For active learning or classifier-assisted screening:

- create a human-labeled seed set;
- report training labels and features;
- keep human review for uncertain/excluded records unless protocol permits otherwise;
- validate recall;
- preserve audit logs;
- report how ML changed screening workload.

Output:

```text
Records → ML score → human decision → exclusion reason → audit trail
```

## Extraction ML

For LLM-assisted extraction:

- use structured fields;
- require source quotes or page anchors;
- validate a sample manually;
- track uncertainty;
- do not use extracted numbers without verification.

Fields:

- study design;
- sample size;
- population;
- exposure/intervention;
- outcome;
- effect estimate;
- standard error / CI / p-value;
- covariates;
- follow-up time;
- risk-of-bias notes.

## Moderator Discovery

For ML-based heterogeneity exploration:

- distinguish exploratory from confirmatory analysis;
- use cross-validation or holdout where possible;
- avoid post-hoc causal claims;
- report variable importance cautiously;
- confirm important moderators with pre-specified or externally validated models when possible.

Candidate methods:

- penalized meta-regression;
- random forests for effect-size prediction;
- gradient boosting;
- causal forests only when individual-level or suitable structured data exist;
- Bayesian hierarchical models with shrinkage;
- topic models for textual moderators.

## Meta-ML Reporting

Report:

- the ML task;
- labeled data size;
- features;
- model class;
- validation metric;
- human verification step;
- how ML outputs affect final synthesis;
- failure cases.

## Guardrail

The most common error is using ML to create a sense of objectivity around subjective coding decisions. Keep human judgment visible and auditable.

