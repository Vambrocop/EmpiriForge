# Prediction Model Audit

## Study

- Citation / project:
- Data source:
- Outcome:
- Positive class or target direction:
- Unit of observation:
- Sample size:
- Event count / class balance:
- Intended use:

## Predictor Ledger

| Predictor family | Examples | Timing | Missingness | Leakage risk |
|---|---|---|---|---|
| Demographic / baseline | | | | |
| Clinical / biological / environmental | | | | |
| Treatment / process | | | | |
| Site / time / geography | | | | |
| Derived features | | | | |

## Split And Resampling

- Split ratio:
- Stratification:
- Cluster / site / year grouping:
- Cross-validation:
- Nested tuning:
- External validation:
- Test set touched before final evaluation:

## Model Set

| Model | Engine | Tuned parameters | Tuning metric | Notes |
|---|---|---|---|---|
| Logistic regression | glm | | | baseline |
| Random forest | ranger | mtry, min_n | | |
| XGBoost | xgboost | trees, learn_rate, tree_depth, min_n, loss_reduction, sample_size, mtry | | |
| Other | | | | |

## Evaluation

| Metric | Model 1 | Model 2 | Baseline | Notes |
|---|---:|---:|---:|---|
| AUC | | | | |
| Accuracy | | | | |
| Sensitivity | | | | |
| Specificity | | | | |
| PPV | | | | |
| NPV | | | | |
| Calibration intercept / slope | | | | |
| Decision-curve net benefit | | | | |

## Uncertainty

Use `bootstrap-uncertainty-audit.md` when intervals are needed.

- Statistics with uncertainty intervals:
- Bootstrap unit:
- Bootstrap type:
- Number of replicates:
- CI method:
- Failed replicate count:
- Metrics reported without intervals:

## Interpretation

- Best model:
- Baseline comparison:
- Calibration:
- Uncertainty interval:
- Variable importance:
- Decision utility:
- Generalization limit:
- What should not be inferred:

## Guardrail Check

- Was all preprocessing learned inside resampling?
- Was the test set used only once?
- Is the validation split aligned with the intended deployment setting?
- Is there a simple baseline comparator?
- Are calibration and threshold metrics reported?
- Are feature-importance results separated from causal claims?
