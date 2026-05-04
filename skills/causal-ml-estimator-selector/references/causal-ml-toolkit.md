# Causal Machine Learning Toolkit

Use this reference for causal ML projects using `causalml`, `econml`, `dowhy`, custom Python, or related tools.

## Source Anchors

Zhao and Liu (2023), "Causal ML: Python package for causal inference machine learning," SoftwareX 21, 101294, is useful as a software-paper example. It presents Causal ML as a Python package for uplift modeling and causal inference that estimates `CATE` or `ITE` from experimental or observational data.

Useful facts from the paper and official project documentation:

- journal: SoftwareX;
- publication date: February 2023;
- DOI: https://doi.org/10.1016/j.softx.2022.101294;
- open access license: CC BY on ScienceDirect metadata;
- code license for the package: Apache License 2.0;
- package family: uplift modeling and causal inference with ML;
- core estimands: `CATE`, `ITE`, and uplift; sometimes `ATE`, `ATT`, or `LATE`;
- algorithm families: uplift trees/forests, meta-learners, matching, propensity-score methods, IV/2SLS, neural methods, treatment optimization, feature importance, simulated data, and validation utilities;
- official repository: https://github.com/uber/causalml;
- official documentation: https://causalml.readthedocs.io/.

The SoftwareX article emphasizes that causal inference requires causal adequacy before estimation. The official CausalML documentation emphasizes that treatment-effect estimation cannot be validated like ordinary prediction because the true individual causal effect is usually unobserved.

## Estimator Families

### Meta-Learners

Use when the treatment is observed and the goal is flexible heterogeneous treatment effects.

- `S-learner`: one outcome model with treatment indicator included as a feature. Simple, but may shrink treatment effects when treatment signal is weak.
- `T-learner`: separate outcome models for treated and control groups. Useful when treatment/control response surfaces differ and both groups have enough data.
- `X-learner`: good candidate when treatment and control sizes are imbalanced; imputes treatment effects before combining.
- `R-learner`: residualizes outcome and treatment with cross-fitting; useful for flexible nuisance models and honest heterogeneity.
- `DR-learner`: uses outcome and propensity models with doubly robust pseudo-outcomes; strong default when overlap and nuisance-model quality can be checked.

### Uplift Trees And Forests

Use when the goal is targeting, segmentation, or ranking who benefits most from treatment.

Typical split criteria include KL divergence, Euclidean distance, chi-square divergence, delta-delta-p, interaction trees, causal inference trees, and contextual treatment selection.

Guardrail: uplift ranking is not automatically a welfare rule. Add treatment cost, capacity constraints, fairness concerns, and uncertainty.

### IV And DRIV

Use when treatment is endogenous but there is a credible instrument.

Guardrail: a machine-learning IV estimator still needs relevance, exclusion, monotonicity, and a clear complier interpretation. ML flexibility does not solve an invalid instrument.

### Matching And Propensity Methods

Use for transparent design and overlap diagnostics, especially when the causal claim relies on observed confounder adjustment.

Guardrail: matching balances observed variables only. Hidden confounding remains a substantive threat.

### Neural Methods

Examples include CEVAE and DragonNet-style methods.

Use only when data scale, feature quality, and validation justify added complexity. Treat them as modeling tools, not causal proof.

## Design Card Questions

Before choosing an estimator, answer:

- Is the treatment assigned by experiment, policy threshold, timing shock, instrument, or selection?
- Which variables are definitely pre-treatment?
- What variables might be mediators or post-treatment controls?
- Is there common support across treatment groups?
- Are there enough observations in each treatment arm?
- Is the target `ATE`, `ATT`, `CATE`, `ITE`, or policy ranking?
- Will the final claim be confirmatory, exploratory, or predictive targeting?

## Validation Plan

Use multiple validation surfaces:

- compare estimates across learners;
- report cohort and segment stability;
- check overlap and propensity distributions;
- use out-of-sample or cross-fitted scoring;
- use synthetic data when the true effect is known;
- use AUUC or uplift curves for targeting tasks;
- use placebo treatment or placebo outcome tests;
- add irrelevant confounder or random-replace checks;
- run hidden-confounding sensitivity analysis where feasible.

## Interpretation Rules

- `CATE` estimates are conditional effects under the design assumptions, not guaranteed individual truth.
- `ITE` should usually be described as model-estimated individual effect, not observed individual effect.
- Heterogeneity discovered after many model choices should be labeled exploratory.
- Treatment targeting requires a policy objective and cost-benefit rule.
- Software validity, reproducibility, and causal identification are separate gates.

## Boundary: Stable Prediction Is Not Treatment-Effect Estimation

Some papers use causal-invariance or stable-learning ideas for prediction under distribution shift. For example, enterprise carbon-emission forecasting may try to identify features whose predictive role is stable across regions, industries, firms, or policy phases.

Route these projects to `prediction-modeling-forge` when the main task is forecasting. Use this causal-ML skill only to audit language:

- stable predictive feature does not equal `ATE`, `ATT`, `CATE`, or `ITE`;
- cross-environment feature stability does not by itself identify an intervention effect;
- a policy-phase holdout validates robustness to a regime shift, not the causal effect of the policy;
- feature importance, SHAP, gradient consistency, and mutual-information stability are model or stability diagnostics unless paired with a causal design;
- treatment-effect language requires a treatment definition, estimand, timing, assumptions, overlap, and sensitivity analysis.

## Package Notes

As of the official CausalML documentation consulted in 2026, installation is supported through conda, pip, uv, or source. Current documentation states Python 3.11 or later is required, and optional TensorFlow or PyTorch dependencies are needed for `DragonNet` or `CEVAE`.

Use environment capture:

```text
python --version
pip freeze
conda env export
random seed
package version
git commit
```

Do not rely on old paper metadata for current installation constraints; check official docs for the active version.
