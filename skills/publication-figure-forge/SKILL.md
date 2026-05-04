---
name: publication-figure-forge
description: Creates and audits publication-ready scientific figures in R. Use for ggplot2, corrplot, journal figure standards, TIFF/EPS/PDF export, COSTAR prompts, scatterplots, boxplots, bar charts, line plots, heatmaps, correlation matrices, correlograms, corrplot significance plots, volcano plots, Kaplan-Meier curves, forest plots, multi-panel figures, clinical figures, omics figures, ecology/environment figures, and reviewer-proof visualization checks.
---

# Publication Figure Forge

Use this skill when a research project needs publication-ready figures or reviewer-proof figure code, especially in R/ggplot2.

## Core Principle

A figure should be designed for submission before it is exported. Do not treat font, units, legend position, resolution, and color as afterthoughts.

Separate:

- data meaning;
- statistical summary;
- figure type;
- journal requirements;
- accessibility;
- export format;
- reviewer failure points.

## Intake

Identify:

- figure purpose;
- data frame name and `glimpse()` output if available;
- x, y, grouping, facet, label, time, survival, or effect-size variables;
- units for every axis;
- target journal or field;
- single-column or double-column size;
- color needs: grayscale, color-blind safe, or journal palette;
- output format: TIFF, EPS, PDF, PNG for draft only;
- whether the result needs clinical, omics, ecology, economics, or general science conventions.

Load:

- `references/journal-figure-standards.md` for submission defaults and review checks.
- `references/figure-type-playbook.md` for choosing plot type and expected elements.
- `references/correlation-plot-playbook.md` for corrplot-based correlation matrices, significance labels, clustering, p-value handling, and nine reusable correlation-plot variants.
- `templates/costar-figure-prompt.md` when the user wants a prompt for another AI assistant.
- `templates/correlation-plot-audit.md` when the figure is a correlation matrix or correlogram.
- `templates/figure-review-checklist.md` before finalizing.
- `scripts/publication_theme.R` when generating R code.
- `scripts/corrplot_correlation_template.R` when the user has a tab-delimited matrix and wants reproducible corrplot PDFs.

## Workflow

1. Confirm the figure claim and variables.
2. Choose the figure type.
3. Specify axis labels with units.
4. Choose an accessible palette and shape/linetype backup.
5. Use `theme_publication()` from `scripts/publication_theme.R`.
6. Place legends inside the panel when space allows.
7. Export with `save_figure()` at 300 DPI or higher.
8. Check the figure against reviewer failure points.
9. If combining panels, tag panels with A/B/C and keep sizes consistent.

For correlation matrices, also:

- confirm whether rows are variables or samples before transposing;
- choose Pearson, Spearman, or Kendall based on the variable scale and distribution;
- compute p-values only when the sample size and assumptions are defensible;
- use multiple-testing correction when many correlations are tested;
- state that correlation is association, not causation.

## Output Modes

### R Figure Code

```text
Packages:
Data assumptions:
Plot code:
Export code:
Reviewer checks:
```

### COSTAR Prompt

Use `templates/costar-figure-prompt.md` and fill in:

- Context;
- Objective;
- Style;
- Tone;
- Audience;
- Response format.

### Figure Audit

```text
Verdict:
Figure type:
Axis units:
Font:
Palette:
Legend:
Export:
Common reviewer issue:
Fix:
```

### Correlation Plot Plan

```text
Input orientation:
Correlation method:
Missing-value rule:
P-value method:
Multiple-testing correction:
Plot variant:
Ordering / clustering:
Palette:
Significance display:
Output size and format:
Interpretation limit:
```

## Guardrails

- Do not export final submission figures with the IDE export button.
- Do not omit units from axes.
- Do not use red/green as the only contrast.
- Do not use low-resolution PNG for journal submission unless the journal explicitly allows it.
- Do not label exploratory associations as causal.
- Do not add significance stars without naming the statistical test and correction.
- Do not hide raw data in group-comparison plots when sample size allows jitter/points.
- Do not overcrowd volcano or heatmap labels; label rules must be explicit.
- Do not transpose a correlation matrix input without checking whether rows are features or samples.
- Do not show unadjusted significance stars across many correlations without explaining multiplicity.
