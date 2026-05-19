# XGBoost-SHAP Explainable Machine Learning Paradigm

Source status: distilled from user-provided notes and screenshots on explainable machine learning (`XMI`) and XGBoost-SHAP. The WeChat link was not accessible from the current environment, so this note does not claim to summarize the full article.

## Why This Belongs In EmpiriForge

XGBoost-SHAP is useful when a paper needs both:

```text
high-performing prediction
plus
transparent model interpretation
```

The reusable empirical structure is:

```text
multi-source tabular data
-> missingness/outlier handling
-> VIF or correlation-based feature screening
-> leakage-safe prediction design
-> K-fold validation, early stopping, and tuned XGBoost model
-> held-out validation
-> SHAP global, local, interaction, and spatial explanations
-> cautious mechanism discussion
```

This belongs in EmpiriForge because many empirical papers now use machine learning to support mechanism-oriented discussion. The key is to keep the boundary clear: SHAP explains the fitted model; it does not identify causal effects by itself.

## Research Use Cases

Good fits:

- environmental risk prediction;
- crop-yield, drought, irrigation, pollution, fire, flood, or heat-risk modeling;
- firm, county, or regional outcome prediction;
- materials/process-performance modeling;
- nonlinear threshold and interaction exploration;
- screening variables before a later causal or mechanistic design.

Weak fits:

- estimating a treatment effect;
- claiming policy impact from observational predictors;
- small samples with many correlated predictors and no external validation;
- papers where a linear model already answers the question cleanly.

## Minimum Workflow

1. Define the prediction target, unit, and intended generalization target.
2. Freeze candidate predictors and remove leakage variables.
3. Clean multi-source data and document missing-value, outlier, and transformation rules.
4. Screen redundant features with VIF, correlation clusters, or domain-based grouping.
5. Split data according to the claim:
   - random split for same-population prediction;
   - spatial split for new-region claims;
   - time split for future prediction;
   - site/study split for external validation.
6. Fit a simple baseline model.
7. Tune XGBoost inside the training folds only, using K-fold CV and early stopping.
8. Use Optuna or Bayesian search when the hyperparameter space is wide.
9. Evaluate the final model once on the held-out set.
10. Check residuals, calibration, confusion matrix, ROC-AUC, RMSE, MAE, or R2 as appropriate.
11. Compute SHAP on held-out or validation rows.
12. Report global SHAP ranking, beeswarm plots, dependence plots, interaction plots, and selected local explanations.
13. If coordinates are available, reconnect SHAP values to geography for Spatial SHAP maps.
14. Translate patterns as model-learned associations, not causal proof.

## Expanded Project Checklist

```text
Python environment and package versions
CSV/Excel import and data dictionary
multi-source merge rules
missingness and outlier log
VIF/correlation feature screening
train/test or spatial/time split
baseline model
XGBoost regression/classification
K-fold validation
early stopping
Optuna tuning log
held-out metrics
traditional feature importance
SHAP bar and beeswarm plots
SHAP dependence plots
SHAP interaction values
single-sample waterfall/force explanations
Spatial SHAP maps if coordinates exist
mechanism-discussion bridge
limitations and causal-language audit
```

## Outputs To Save

```text
metrics.csv
test_predictions.csv
shap_importance.csv
shap_summary.png
shap_dependence_top_features.png
shap_interaction_top_pairs.png
spatial_shap_map.gpkg
local_explanations.csv
model_config.json
data_dictionary.csv
leakage_audit.md
```

## Manuscript Language

Safe wording:

```text
The XGBoost model captured nonlinear associations between predictors and the outcome.
SHAP values were used to interpret the fitted model and identify variables contributing
most strongly to predictions. These attributions describe model behavior and should not
be interpreted as causal effects.
```

Threshold wording:

```text
SHAP dependence plots suggested a marked change in predicted [outcome] around
approximately [range]. We interpret this as a model-derived threshold candidate that
requires domain validation and, where relevant, causal or experimental confirmation.
```

Unsafe wording:

```text
SHAP proves that X causes Y.
The SHAP threshold is the true ecological threshold.
Changing the top SHAP variable will necessarily change the outcome.
```

## Reviewer-Proof Checks

| Risk | Fix |
| --- | --- |
| Random split inflates spatial prediction | use spatial or regional holdout |
| SHAP explains an overfit model | validate before explaining |
| Correlated predictors destabilize attribution | group correlated predictors and report stability |
| SHAP threshold overclaimed | bootstrap, check density, compare PDP/ALE |
| Mechanism language too strong | say "consistent with", not "caused by" |
| No baseline | compare against linear/logistic model or random forest |
| Optuna overfits test data | tune only inside training folds |
| Spatial SHAP overread as causal map | pair maps with spatial validation and cautious wording |
| Single-sample SHAP anecdote | use local plots for diagnosis, not universal mechanism claims |

## Two Reusable Case Frames

Environmental risk assessment:

```text
POI/building/road/climate/geography variables
-> XGBoost risk prediction
-> SHAP global drivers
-> Spatial SHAP contribution maps
-> high-risk zone interpretation and planning suggestions
```

Environmental materials or process optimization:

```text
feedstock/process/material descriptors
-> adsorption or performance prediction
-> SHAP interaction plots for temperature, pH, pore structure, dosage, or surface properties
-> candidate operating windows
-> engineering suggestions with extrapolation warnings
```

## Skill Rule To Reuse

When a paper uses XGBoost-SHAP, require:

```text
1. prediction target;
2. validation design;
3. baseline model;
4. XGBoost tuning plan;
5. held-out performance;
6. calibration/residual check;
7. SHAP background and split;
8. global and dependence explanations;
9. attribution stability;
10. no causal language unless separately identified.
```
