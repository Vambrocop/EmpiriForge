# PLS/VIP Modeling

Use this reference when predictors are numerous, correlated, and the sample is small enough that ordinary multiple regression is unstable. Typical examples include NDVI or vegetation indices explained by climate variables, soil or microbial indicators explained by environmental gradients, spectroscopy/omics predictors, and small panel-style environmental or economic indicators.

## When PLS Is Useful

Partial least squares regression compresses correlated predictors into latent components chosen to help predict the outcome. It is useful when:

- predictors are strongly collinear;
- sample size is modest relative to predictors;
- the goal is prediction or screening, not causal identification;
- standardized variables and component-level interpretation are acceptable;
- the paper reports cross-validated performance, not only in-sample fit.

## Minimum Workflow

1. Define the outcome and candidate predictors before modeling.
2. Handle missing values explicitly.
3. Standardize predictors with `scale = TRUE`.
4. Choose the number of components using cross-validation or a pre-specified rule.
5. Report RMSEP, cross-validated R2/Q2 where available, and the selected component count.
6. Compute VIP after fixing the component count.
7. Report coefficient direction alongside VIP; high VIP alone does not tell direction.
8. Treat VIP > 1 as a screening convention, not a universal significance test.
9. For time-ordered data, prefer blocked or future-period validation over random folds when the claim is future prediction.

## VIP Interpretation

VIP means variable importance in projection. It summarizes how much each predictor contributes to the PLS components that explain the outcome.

Interpret as:

- "important for this fitted predictive PLS model";
- "worth checking in domain interpretation";
- "candidate variable for follow-up, robustness, or mechanism discussion."

Do not interpret as:

- causal effect;
- independent marginal effect;
- proof of mechanism;
- stable importance across sites, years, or domains without external validation.

## Audit Questions

- Was the component count selected by CV rather than in-sample fit?
- Was the outcome time series or panel split in a way that matches the claim?
- Were variables scaled?
- Are VIP and coefficient direction both shown?
- Are correlated predictors discussed as groups rather than over-separated?
- Are prediction metrics reported?
- Are residuals checked for trend, autocorrelation, or influential years?
- Is the sample size large enough for the number of predictors and components?

## Prompt Skeleton

```text
Use prediction-modeling-forge to audit this PLS/VIP model.

Outcome:
Predictors:
Sample size:
Time/site/cluster structure:
Component count:
Validation design:
Reported metrics:
VIP table:

Return:
1. PLS model card;
2. component-selection audit;
3. VIP interpretation with coefficient direction;
4. leakage and overfitting risks;
5. manuscript-ready methods/results wording.
```
