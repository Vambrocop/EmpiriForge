# Figure Type Playbook

Use this reference to choose the right publication figure and required elements.

## Scatterplot

Use for relationships between two continuous variables.

Required:

- x/y axis units;
- group color and shape if grouped;
- trend line only if the model is meaningful;
- confidence interval if estimating trend uncertainty;
- reviewer note: association is not causality.

## Boxplot / Violin / Jitter

Use for continuous distributions across groups.

Required:

- raw data points when sample size permits;
- boxplot or violin summary;
- test name for significance labels;
- multiple-testing correction if many comparisons;
- legend suppressed when x-axis already names groups.

## Bar Chart

Use for counts, proportions, or clearly summarized means.

Required:

- count/proportion/mean stated in y-axis;
- uncertainty bars for means;
- avoid bar charts for raw continuous distributions when points/boxplots are better.

## Line Plot

Use for time trends, repeated measures, or dose-response.

Required:

- time unit;
- confidence band or error bars;
- line type or shape backup for grayscale;
- clear distinction between observed data and model prediction.

## Heatmap

Use for correlation matrices, gene expression, omics features, or clustered matrices.

Required:

- scale rule: raw, row-scaled, column-scaled, z-score;
- palette centered at zero when showing signed values;
- clustering method if clustered;
- annotation legend;
- readable row/column labels or a label filtering rule.

## Volcano Plot

Use for differential expression or high-dimensional feature testing.

Required:

- log2 fold-change threshold;
- adjusted p-value threshold;
- point classes: up, down, nonsignificant;
- label rule for top genes/features;
- correction method stated in caption or notes.

## Kaplan-Meier Curve

Use for survival analysis.

Required:

- time unit;
- event definition;
- censoring logic;
- risk table;
- p-value method;
- group labels;
- median survival lines only if useful.

## Forest Plot

Use for effect estimates and confidence intervals.

Required:

- effect metric;
- reference line;
- confidence interval;
- subgroup labels;
- model or adjustment notes;
- do not mix incompatible metrics.

## Multi-Panel Figure

Use `patchwork` for ggplot panels.

Required:

- consistent base theme;
- A/B/C tags;
- consistent plot widths and margins;
- shared legends when possible;
- export as one final figure at journal size.
