# Correlation Plot Audit

## Data

- Input file or data frame:
- Rows are:
- Columns are:
- Transpose needed:
- Number of variables:
- Number of samples:
- Missing-value rule:
- Constant or near-constant variables removed:

## Statistical Plan

- Correlation method: Pearson / Spearman / Kendall
- Test used for p-values:
- Multiple-testing correction:
- Significance threshold:
- Pairwise sample-size concern:
- Outlier or transformation concern:

## Figure Plan

| Choice | Selected | Reason |
|---|---|---|
| Variant | pie_upper / mixed_circle_color / sig_color / ellipse_sig_blank / coef_color / lower_aoe / circle_sig / shade_gray / cluster_rect | |
| Triangle | upper / lower / full | |
| Ordering | original / hclust / AOE / ward.D2 | |
| Palette | blue-white-red / grayscale / journal-specific | |
| Significance display | none / blank nonsignificant / stars / coefficients | |
| Output | PDF / TIFF / EPS | |
| Size | | |

## Reviewer Checks

- Are labels readable?
- Are colors interpretable in grayscale or color-blind-safe mode?
- Are p-values adjusted when many correlations are shown?
- Is the caption clear about correlation not implying causation?
- Are clusters/modules interpreted cautiously?
- Is the input orientation documented?

## Caption Draft

```text
Pairwise [method] correlations were calculated among [variables] using [missing-value rule].
The matrix was ordered by [ordering method]. [Significance display] indicates [test/correction].
Correlations are exploratory associations and should not be interpreted as causal effects.
```
