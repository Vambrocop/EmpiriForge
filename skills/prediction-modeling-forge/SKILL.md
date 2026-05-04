---
name: prediction-modeling-forge
description: Builds and audits tabular-data prediction-model workflows for research papers. Use for clinical, environmental, biological, social-science, or economics prediction models; tidymodels, random forest, XGBoost, logistic-regression baselines, train/test splits, cross-validation, hyperparameter tuning, ROC/AUC, calibration, decision-curve analysis, variable importance, leakage checks, and manuscript-ready methods/results language.
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
- baseline model;
- intended paper claim.

Load:

- `references/tidymodels-prediction-workflow.md` for the R/tidymodels workflow.
- `templates/prediction-model-audit.md` for study-level audit.
- `templates/prediction-model-reporting-checklist.csv` for paper reporting checks.
- `scripts/tidymodels_binary_classification_template.R` when the user wants a starting R script for binary classification.

## Workflow

1. Define the prediction target and positive class.
2. Freeze candidate predictors and remove post-outcome or leakage variables.
3. Split data before tuning, using stratification for imbalanced binary outcomes.
4. Put preprocessing inside a recipe so it is learned from training folds only.
5. Compare a simple baseline model, usually logistic regression, against ML models.
6. Tune random forest and/or XGBoost using resampling inside the training data only.
7. Use `last_fit()` or an equivalent one-time final test evaluation.
8. Report discrimination, calibration, classification metrics, and decision utility when appropriate.
9. Export figures and tables from code.
10. Write methods and results with the validation design visible.

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
Main limitation:
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

### Manuscript Language

Produce concise Methods and Results wording that states:

- R version and package family;
- train/test split and stratification;
- cross-validation and tuning metric;
- baseline model;
- final held-out test evaluation;
- AUC, sensitivity, specificity, PPV, NPV, calibration, and decision curve when available.

## Guardrails

- Do not call a prediction model causal.
- Do not optimize hyperparameters on the test set.
- Do not report the best model without a baseline comparator.
- Do not treat feature importance as mechanism or intervention priority.
- Do not claim deployment readiness without external validation, calibration, uncertainty, and data-latency checks.
- Do not let high AUC override sample-size, class-imbalance, or leakage concerns.
