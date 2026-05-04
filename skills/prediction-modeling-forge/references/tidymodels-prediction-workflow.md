# Tidymodels Prediction Workflow

Use this reference for tabular-data prediction-model papers that need a reproducible R workflow.

## Running Pattern

The useful pattern from clinical ML tutorials is portable beyond medicine:

```text
data cleaning -> split -> resampling -> recipe -> baseline model -> RF/XGBoost tuning -> final test evaluation -> ROC/calibration/DCA -> manuscript wording
```

This belongs in a prediction-model skill because its central risk is leakage, not causal identification.

## Recommended R Stack

Core:

- `tidyverse` for data manipulation;
- `tidymodels` for unified modeling workflows;
- `ranger` for random forest;
- `xgboost` for gradient boosted trees;
- `yardstick` for metrics;
- `pROC` for ROC/AUC and intervals;
- `vip` for variable importance;
- `probably` or custom binning for calibration;
- `dcurves` or equivalent for decision-curve analysis when clinically or operationally relevant;
- `flextable` for Word tables;
- `here` for paths.

## Workflow Details

1. Set a random seed before splitting.
2. Use stratified train/test split for classification.
3. Create cross-validation folds only from the training set.
4. Put normalization, imputation, dummy variables, interactions, and zero-variance filters in a `recipe`.
5. Tune random forest parameters such as `mtry` and `min_n`.
6. Tune XGBoost parameters such as `trees`, `learn_rate`, `tree_depth`, `min_n`, `loss_reduction`, `sample_size`, and `mtry`.
7. Fit logistic regression as the baseline unless a stronger domain baseline exists.
8. Use the test set once for final evaluation.
9. Report AUC plus threshold metrics: accuracy, sensitivity, specificity, PPV, and NPV.
10. Add calibration and decision-curve analysis when predicted probabilities guide action.
11. Export all figures and tables from code.

## Figure And Table Set

Minimum:

- ROC comparison plot;
- variable importance plot for each ML model;
- calibration plot for the selected model or all candidate models;
- performance table with AUC and threshold metrics.

Optional:

- tuning plot;
- confusion matrix;
- decision-curve analysis;
- subgroup performance table;
- external-validation performance table.

## Manuscript Wording

Methods skeleton:

```text
We developed prediction models using the tidymodels framework in R. Data were split into training and test sets before modeling, with stratification by the outcome. Hyperparameters were tuned using cross-validation within the training set, optimizing AUC. The final models were evaluated once on the held-out test set. Logistic regression was used as a baseline comparator. Model performance was assessed using AUC, accuracy, sensitivity, specificity, PPV, NPV, and calibration.
```

Results skeleton:

```text
On the held-out test set, [model] achieved the highest AUC ([value]), compared with [baseline]. Variable-importance analysis identified [predictors] as the highest-ranked predictors. Calibration assessment showed [brief result]. These results indicate predictive discrimination under the validation design used, but do not establish causal effects of individual predictors.
```

## Common Failure Modes

- AUC near 1.0 from tuning and testing on the same data.
- Imputation, normalization, or feature selection performed before the split.
- No baseline model.
- Only ROC/AUC reported, with no calibration.
- No event-per-variable or class-imbalance discussion.
- Feature importance written as biological, clinical, or policy mechanism.
- Random row split used while claiming new-site, new-year, or external deployment.
