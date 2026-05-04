# Stable Time-Series Prediction Audit

## Study

- Citation / project:
- DOI / URL:
- Domain:
- Target variable:
- Unit of observation:
- Time index and frequency:
- Forecast horizon:
- Data/code:

## Environment Definition

Use `stable-environment-validation-schema.csv` for a machine-readable validation ledger.

| Environment dimension | Values | Why it matters | Held out? |
|---|---|---|---|
| Region | | | |
| Industry / sector | | | |
| Firm type / size | | | |
| Policy phase | | | |
| Market or macro regime | | | |
| Year / period | | | |

## Predictor Ledger

| Predictor family | Examples | Timing | Expected stability | Leakage / shift risk |
|---|---|---|---|---|
| Energy and production inputs | | | stable structural driver | |
| Capital and labour | | | stable structural driver | |
| Operational performance | | | environment dependent | |
| Financial variables | | | spurious or regime-specific risk | |
| Policy and institution | | | policy-phase dependent | |
| Region / industry markers | | | environment labels or controls | |

## Model And Correction Stack

| Layer | Method | Purpose | Validation | Failure mode |
|---|---|---|---|---|
| Baseline forecast | naive / ARIMA / FE / panel / ML | comparison | | |
| Temporal model | LSTM / GRU / TCN / custom | sequence learning | | |
| Stable representation | invariant learning / risk consistency | reduce environment-specific fitting | | |
| Normalization | adaptive / environment-specific | align scales | | |
| Reweighting | sample or covariate weights | reduce shift or imbalance | | |
| Feature stability | coefficient / gradient / SHAP / MI stability | audit robustness | | |

## Validation Design

- IID/random split:
- Forward time split:
- Leave-region-out:
- Leave-industry-out:
- Leave-policy-phase-out:
- External validation:
- Hyperparameter tuning isolated from test environments:
- Test environment used only once:

## Evaluation

| Metric | In-environment | Out-of-region | Out-of-industry | Out-of-policy | Notes |
|---|---:|---:|---:|---:|---|
| MAE | | | | | |
| RMSE | | | | | |
| MAPE / sMAPE | | | | | |
| Directional accuracy | | | | | |
| Calibration / uncertainty | | | | | |

## Feature Stability

- Stable features:
- Environment-dependent features:
- Spurious or unstable features:
- Stability metric:
- Threshold or rule:
- Does the feature interpretation match economic mechanism?
- What should not be called causal?

## Interpretation

- Main generalization result:
- Most credible deployment setting:
- Weakest shift setting:
- Policy or carbon-market use:
- What the model cannot support:
- Follow-up evidence needed:

## Guardrail Check

- Are environments defined before modeling?
- Is validation aligned with the deployment claim?
- Are temporal and panel dependencies respected?
- Are future values or post-policy outcomes excluded from predictors?
- Are stable features separated from causal effects?
- Are baselines strong enough?
- Are carbon accounting changes, missing emissions, and policy shocks discussed?
