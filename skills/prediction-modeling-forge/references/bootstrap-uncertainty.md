# Bootstrap Uncertainty

Use this reference when a prediction or empirical modeling task needs uncertainty intervals but closed-form standard errors are fragile, unavailable, or not aligned with the statistic of interest.

## Core Idea

Bootstrap uses resampling to approximate the sampling distribution of a statistic.

The practical workflow is:

```text
original data -> resample with replacement -> refit or recompute -> collect statistic -> summarize empirical distribution
```

It is useful when the target is nonlinear, model-based, or awkward to derive analytically: medians, quantiles, AUC, calibration slope, prediction at a point, feature-stability summaries, and uncertainty bands.

## What It Can Produce

- standard error;
- bias estimate;
- percentile confidence interval;
- normal approximation interval using bootstrap standard error;
- basic interval;
- BCa interval when jackknife acceleration is implemented;
- pointwise prediction or fitted-value bands;
- model-performance intervals such as AUC, sensitivity, specificity, PPV, NPV, and calibration summaries.

## Choosing The Bootstrap Unit

Pick the unit that matches the sampling design.

| Data structure | Usually use | Why |
|---|---|---|
| Independent rows | nonparametric row bootstrap | Rows approximate independent units. |
| Regression with fixed design and iid residuals | residual bootstrap | Keeps the design matrix fixed. |
| Clustered data | cluster bootstrap | Preserves within-cluster dependence. |
| Time series or spatial sequences | block bootstrap | Preserves local dependence. |
| Known parametric data-generating model | parametric bootstrap | Simulates from fitted model assumptions. |
| Imbalanced classification | stratified bootstrap | Keeps enough events/non-events in each replicate. |

## Prediction-Model Workflow

For a trained prediction-model paper:

1. Freeze the model-development process before bootstrapping.
2. Decide whether uncertainty should cover the final performance metric, the full training process, or only the held-out evaluation set.
3. For internal validation, resample the training data and repeat preprocessing, tuning, and fitting inside each replicate if estimating model-development uncertainty.
4. For final held-out performance intervals, resample the test-set observation units and recompute metrics without changing the trained model.
5. For clustered external validation, resample clusters rather than rows.
6. Report the number of replicates, resampling unit, CI method, statistic, seed, and failure rule.

## CI Methods

- **Normal**: symmetric around the original estimate using bootstrap standard error. Simple, but can be poor for skewed distributions.
- **Percentile**: uses empirical quantiles of bootstrap estimates. Good default for many metrics, but does not correct bias.
- **Basic**: reflects percentile limits around the original estimate. Useful as a sensitivity view.
- **BCa**: adjusts for bias and acceleration using jackknife. Often better for skewed statistics, but more implementation-heavy.

## Figure Patterns

- histogram or density of bootstrap estimates;
- sorted bootstrap estimate plot;
- interval comparison plot across normal, percentile, basic, and BCa methods;
- pointwise fitted-value or prediction band;
- uncertainty-band width across a grid or time axis;
- metric table with original estimate, standard error, bias, and interval.

## Interpretation Rules

- Bootstrap reflects uncertainty under the observed data-generating process and resampling design; it does not fix a biased sample.
- If the original sample is not representative, bootstrap replicates will reproduce that problem.
- If rows are dependent, row bootstrap usually understates uncertainty.
- If the target is model performance, state whether the bootstrap resampled training data, test data, or clusters.
- If the statistic fails in some replicates, report the failure count and do not silently drop too many failures.
- If the test set is repeatedly used to choose models, bootstrap intervals do not remove test-set overfitting.

## Manuscript Wording

```text
Uncertainty for [statistic] was estimated using [B] bootstrap replicates. Resampling was performed at the [row/cluster/block] level to match the sampling design. For each replicate, we [recomputed the statistic/refit the model/recomputed test-set performance]. We report [percentile/basic/normal/BCa] 95% confidence intervals. Bootstrap intervals were interpreted as uncertainty under the observed sampling design rather than as evidence of causal effects.
```

## Reusable Prompt Skeleton

```text
Use prediction-modeling-forge to design a bootstrap uncertainty plan.

Data:
- unit:
- clusters/repeated measures:
- target statistic:
- model:
- validation design:

Return:
1. correct resampling unit;
2. bootstrap type;
3. CI method;
4. failure rules;
5. figure/table outputs;
6. manuscript wording;
7. warnings about when bootstrap would mislead.
```
