# Meta-Analysis Workflow

Use this reference for first-order systematic reviews and meta-analyses of primary studies.

## Question Framework

Choose a framework appropriate to the field:

- PICO: population, intervention/exposure, comparator, outcome.
- PECO: population, exposure, comparator, outcome.
- SPIDER: sample, phenomenon, design, evaluation, research type.
- PICOS: population, intervention, comparator, outcome, study design.

## Protocol Components

- research question;
- eligibility criteria;
- databases and search dates;
- search strings;
- screening process;
- data extraction fields;
- risk-of-bias tool;
- effect-size metric;
- statistical model;
- heterogeneity plan;
- publication-bias plan;
- sensitivity analyses;
- reproducibility materials.

## Effect-Size Families

Common effect sizes:

- standardized mean difference;
- raw mean difference;
- log odds ratio;
- log risk ratio;
- log hazard ratio;
- correlation / Fisher z;
- regression coefficient;
- elasticity;
- partial correlation;
- marginal effect.

Before pooling, check whether effects measure the same construct, scale, population, and estimand.

## Model Choices

Use fixed effect only when the target is a common effect and heterogeneity is not substantive. Use random effects when true effects vary across studies. Use multilevel or robust variance models when multiple dependent effect sizes come from the same study.

Common modeling layers:

- fixed effect;
- random effects;
- multilevel / three-level meta-analysis;
- robust variance estimation;
- meta-regression;
- Bayesian hierarchical model;
- network meta-analysis, if comparing multiple interventions with a connected evidence graph.

## Heterogeneity

Report:

- tau2 or between-study variance;
- I2, with caution;
- prediction interval;
- subgroup or moderator analysis when pre-specified;
- leave-one-out sensitivity;
- influence diagnostics.

## Bias and Selective Reporting

Consider:

- funnel plot;
- Egger-type small-study test;
- trim-and-fill, with caution;
- selection models;
- p-curve or p-uniform where appropriate;
- risk-of-bias sensitivity;
- grey literature and preprints.

## Reproducible Artifacts

Produce:

- search log;
- screening decisions;
- exclusion reasons;
- coding sheet;
- effect-size calculation script;
- analysis script;
- PRISMA flow diagram;
- model output;
- final report.

