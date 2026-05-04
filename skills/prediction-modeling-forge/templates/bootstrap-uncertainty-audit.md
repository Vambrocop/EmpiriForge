# Bootstrap Uncertainty Audit

## Study Or Analysis

- Project:
- Data source:
- Outcome / target:
- Unit of observation:
- Sample size:
- Cluster / time / spatial structure:
- Statistic needing uncertainty:
- Intended claim:

## Resampling Design

| Design feature | Choice | Reason | Risk if wrong |
|---|---|---|---|
| Bootstrap type | row / residual / cluster / block / stratified / parametric | | |
| Resampling unit | | | |
| Number of replicates | | | |
| Random seed | | | |
| Failure rule | | | |
| CI method | normal / percentile / basic / BCa | | |

## Statistic Definition

- Original estimate:
- Statistic function:
- Model refit inside each replicate:
- Preprocessing repeated inside each replicate:
- Hyperparameter tuning repeated or frozen:
- Test set resampled or training set resampled:
- Positive class / threshold, if classification:

## Outputs

| Output | Required | Notes |
|---|---|---|
| Bootstrap SE | | |
| Bias estimate | | |
| 95% CI | | |
| Bootstrap distribution plot | | |
| CI method comparison | | |
| Prediction or fitted-value band | | |
| Bandwidth plot | | |
| Failure count | | |

## Interpretation

- Main uncertainty result:
- Does the interval reflect the intended design?
- What does the interval not fix?
- Sensitivity check needed:
- Manuscript sentence:

## Guardrail Check

- Is the bootstrap unit aligned with the sampling unit?
- Are dependent rows, repeated measures, clusters, time blocks, or spatial units handled?
- Is model selection separated from final test evaluation?
- Are skipped or failed bootstrap replicates reported?
- Are intervals interpreted as uncertainty, not causality?
- Is the sample representative enough for bootstrap to be meaningful?
