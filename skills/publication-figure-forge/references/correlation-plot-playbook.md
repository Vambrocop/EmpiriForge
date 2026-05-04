# Correlation Plot Playbook

Use this reference for corrplot-based correlation matrices and correlograms.

## Input Pattern

Many omics and environmental matrices are stored as:

```text
rows = features / genes / variables
columns = samples
```

In that case, transpose before `cor()` so the variables become columns:

```r
rt <- t(rt)
cor_matrix <- cor(rt, use = "pairwise.complete.obs", method = "pearson")
```

Do not transpose blindly. If rows are already samples and columns are variables, skip the transpose.

## Nine Reusable Variants

The user's nine useful corrplot patterns can be normalized as:

| Variant | Best use | Visual encoding | Notes |
|---|---|---|---|
| `pie_upper` | clean overview | upper triangle pies | Good first look. |
| `mixed_circle_color` | mixed visual summary | lower circles, upper colors | Dense but readable for moderate feature counts. |
| `sig_color` | correlation with significance stars | upper color cells plus p-value labels | Requires p-value matrix. |
| `ellipse_sig_blank` | strength and sign with nonsignificant blanked | ellipse upper triangle | Good for print-friendly association maps. |
| `coef_color` | exact r values | colored cells plus coefficients | Use only when labels fit. |
| `lower_aoe` | compact lower triangle | lower color cells, AOE order, no diagonal | Good for reports. |
| `circle_sig` | significant circle plot | upper circles plus star labels | Works for correlation screening. |
| `shade_gray` | grayscale journal style | upper shaded cells | Useful when color is restricted. |
| `cluster_rect` | clustered modules | hclust, ward.D2, rectangles | Good for variable modules or omics blocks. |

## Statistical Choices

Correlation method:

- Pearson: linear association; sensitive to outliers and non-normality.
- Spearman: monotonic association; safer for skewed variables, ranks, and many biological/environmental indicators.
- Kendall: robust rank association; slower but useful for small samples or ordinal data.

P-values:

- `cor.test()` is pairwise and assumes the chosen correlation test is meaningful for the data.
- If there are many variables, adjust p-values with BH/FDR or another stated method.
- Stars without correction are vulnerable to reviewer criticism.

Missing values:

- `use = "pairwise.complete.obs"` keeps more data but pairwise sample sizes can differ.
- Complete-case analysis is cleaner but may drop too much information.
- Report the rule in the caption or methods.

## Figure Design Rules

- Use a diverging palette centered at zero for signed correlations.
- Keep labels readable; shrink text or filter variables if needed.
- Use vector PDF for drafts and EPS/PDF/TIFF according to journal requirements.
- Do not use significance stars without stating the test and correction.
- Use `addCoef.col` only for small to moderate matrices.
- Use cluster rectangles only when clusters have an interpretation.

## Caption Skeleton

```text
Pairwise [Pearson/Spearman/Kendall] correlations among [variables] were computed using [missing-value rule].
Cells show correlation coefficients ordered by [ordering method].
Significance labels are based on [test] with [adjustment method] correction.
Correlation patterns are exploratory associations and do not establish causal effects.
```

## Script

Use `scripts/corrplot_correlation_template.R` for a reusable implementation:

```bash
Rscript scripts/corrplot_correlation_template.R \
  --input input.txt \
  --output plot.pdf \
  --variant sig_color \
  --transpose TRUE \
  --cor_method spearman \
  --p_adjust BH
```
