---
name: prediction-modeling-forge
description: Builds and audits tabular-data prediction-model workflows for research papers. Use for clinical, environmental, biological, social-science, environmental-economics, or economics prediction models; tidymodels, random forest, XGBoost, logistic-regression baselines, partial least squares regression, PLS VIP, NDVI or environmental indicator models, enterprise carbon-emission forecasting, stable time-series prediction, causal-invariant prediction, distribution shift, cross-region/cross-industry/cross-policy validation, train/test splits, cross-validation, hyperparameter tuning, ROC/AUC, calibration, decision-curve analysis, bootstrap uncertainty, confidence intervals, prediction bands, variable importance, leakage checks, and manuscript-ready methods/results language.
---

# Prediction Modeling Forge

Use this skill when a research project wants a credible predictive model from tabular data, not a causal effect estimate.

## Core Principle

Prediction credibility depends on evaluation design. Code that runs is not enough: splitting, tuning, feature engineering, calibration, and final test evaluation must be separated.

## Intake

Identify:

- outcome type: binary, multiclass, continuous, survival, count;
- positive class or target direction;
- unit of observation;
- sample size and event count;
- candidate predictors;
- predictor timing relative to outcome;
- missingness and imputation plan;
- split strategy;
- validation target: random future patients, new sites, new years, new regions, or external data;
- environmental split target: region, industry, firm, policy phase, market regime, year, or site;
- baseline model;
- uncertainty target: coefficient, prediction, AUC, calibration, or threshold metric;
- intended paper claim.

Load:

- `references/tidymodels-prediction-workflow.md` for the R/tidymodels workflow.
- `references/pls-vip-modeling.md` for partial least squares regression, small-sample correlated predictors, NDVI/environmental indicators, component selection, and VIP interpretation.
- `references/bootstrap-uncertainty.md` for bootstrap standard errors, confidence intervals, prediction bands, and model-performance uncertainty.
- `references/stable-carbon-emission-forecasting.md` for stable time-series prediction under distribution shift, enterprise carbon-emission forecasting, causal-invariant features, adaptive normalization, sample reweighting, and cross-environment validation.
- `templates/prediction-model-audit.md` for study-level audit.
- `templates/pls-vip-audit.md` when the user needs a PLS/VIP model card for small-sample environmental, biological, economic, or social-science predictors.
- `templates/bootstrap-uncertainty-audit.md` when the user needs confidence intervals, uncertainty bands, or bootstrap robustness checks.
- `templates/stable-time-series-prediction-audit.md` and `templates/stable-environment-validation-schema.csv` when the claim depends on cross-region, cross-industry, cross-policy, or cross-period generalization.
- `templates/prediction-model-reporting-checklist.csv` for paper reporting checks.
- `scripts/tidymodels_binary_classification_template.R` when the user wants a starting R script for binary classification.
- `scripts/pls_vip_template.R` when the user wants a reusable R script for PLS regression and VIP ranking.
- `scripts/bootstrap_metric_ci.py` when the user has a CSV of values or predictions and wants deterministic bootstrap CIs for means, medians, AUC, or classification metrics.

## Workflow

1. Define the prediction target and positive class.
2. Freeze candidate predictors and remove post-outcome or leakage variables.
3. Split data before tuning, using stratification for imbalanced binary outcomes or group/time/environment splits for distribution-shift claims.
4. Put preprocessing inside a recipe so it is learned from training folds only.
5. Compare a simple baseline model, usually logistic regression, against ML models.
6. Tune random forest and/or XGBoost using resampling inside the training data only.
7. Use `last_fit()` or an equivalent one-time final test evaluation.
8. Report discrimination, calibration, classification metrics, and decision utility when appropriate.
9. For PLS/VIP models, choose the component count with cross-validation, report RMSEP or Q2/R2, and interpret VIP as predictive contribution, not causal importance.
10. For stable prediction papers, evaluate out-of-environment performance and feature stability across the claimed shifts.
11. Add uncertainty intervals for key estimates using the resampling unit that matches the study design.
12. Export figures and tables from code.
13. Write methods and results with the validation design visible.

## Output Modes

### Model Plan

```text
Outcome:
Positive class:
Unit:
Candidate predictors:
Leakage exclusions:
Split / resampling:
Models:
Tuning metric:
Final metrics:
Calibration:
Decision utility:
Uncertainty interval:
Main limitation:
```

### Bootstrap Uncertainty Plan

```text
Target statistic:
Original estimate:
Bootstrap unit:
Bootstrap type:
Replicates:
CI method:
Cluster/block/strata handling:
Failure or singular-fit rule:
Figure/table output:
Interpretation limit:
```

### Stable Time-Series Prediction Audit

```text
Target series:
Unit:
Environment definition:
Forecast horizon:
Stable feature candidates:
Environment-dependent feature candidates:
Split design:
Baselines:
Out-of-environment metrics:
Feature-stability evidence:
Distribution-shift correction:
Interpretation limit:
```

### PLS/VIP Model Card

```text
Outcome:
Unit and sample size:
Predictors:
Scaling:
Component choice:
Validation design:
RMSEP / Q2 / R2:
VIP threshold:
Top VIP variables:
Coefficient direction:
Collinearity concern:
Interpretation limit:
```

### Leakage Audit

Flag:

- imputation before splitting;
- feature selection on the full dataset;
- tuning on test data;
- multiple final test evaluations after model changes;
- repeated patients, sites, years, or clusters split across train/test when claiming external generalization;
- post-treatment or post-outcome variables used as predictors;
- reporting AUC without calibration or threshold-dependent metrics.
- row-level bootstrap when data are clustered by patient, site, year, school, county, trial, or repeated measurement;
- bootstrap CIs computed after repeatedly changing the model using the test set.
- random row splits for panel or time-series studies that claim future, new-region, new-industry, or new-policy generalization;
- causal-stability language when no environment definition or out-of-environment test is provided.
- treating PLS VIP > 1 as a causal or mechanistic threshold rather than a predictive-screening rule;
- choosing PLS components by in-sample fit instead of cross-validation;
- using random CV for time-ordered ecological or economic series when future-period prediction is the claim.

### Manuscript Language

Produce concise Methods and Results wording that states:

- R version and package family;
- train/test split and stratification;
- cross-validation and tuning metric;
- for PLS: scaling, component count, CV design, RMSEP/Q2/R2, VIP threshold, and coefficient direction;
- baseline model;
- final held-out test evaluation;
- AUC, sensitivity, specificity, PPV, NPV, calibration, decision curve, and uncertainty intervals when available.

## Guardrails

- Do not call a prediction model causal.
- Do not optimize hyperparameters on the test set.
- Do not report the best model without a baseline comparator.
- Do not treat feature importance as mechanism or intervention priority.
- Do not claim deployment readiness without external validation, calibration, uncertainty, and data-latency checks.
- Do not let high AUC override sample-size, class-imbalance, or leakage concerns.
- Do not use ordinary row bootstrap for dependent data; use cluster, block, stratified, residual, or parametric bootstrap when the design requires it.
- Do not use bootstrap intervals as a cure for biased sampling, severe leakage, or a nonrepresentative training set.
- Do not treat "causally stable features" as verified intervention effects unless a separate causal identification design supports that claim.
- Do not use in-environment accuracy to support cross-environment or future-policy deployment claims.
- Do not treat PLS VIP rankings as causal drivers; they are model-dependent predictive summaries under the chosen component count and scaling.
- Do not overfit small-sample PLS by choosing too many components or reporting VIP without cross-validated performance.
