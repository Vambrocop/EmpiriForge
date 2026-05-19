# XGBoost-SHAP Explainable Machine Learning Paradigm

Source status: distilled from user-provided notes on explainable machine learning (`XMI`) and XGBoost-SHAP. The WeChat link was not accessible from the current environment, so this note does not claim to summarize the full article.

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
-> leakage-safe prediction design
-> tuned XGBoost model
-> held-out validation
-> SHAP global and local explanations
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
3. Split data according to the claim:
   - random split for same-population prediction;
   - spatial split for new-region claims;
   - time split for future prediction;
   - site/study split for external validation.
4. Fit a simple baseline model.
5. Tune XGBoost inside the training folds only.
6. Evaluate the final model once on the held-out set.
7. Check residuals or calibration.
8. Compute SHAP on held-out or validation rows.
9. Report global SHAP ranking and dependence plots for top predictors.
10. Translate patterns as model-learned associations, not causal proof.

## Outputs To Save

```text
metrics.csv
test_predictions.csv
shap_importance.csv
shap_summary.png
shap_dependence_top_features.png
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
