# COSTAR Prompt Template For Publication Figures

```text
【C · Context】
Data:
[Describe the data and paste `glimpse(df)` output.]

Figure purpose:
[SCI submission / thesis / clinical report / omics analysis / ecology paper / economics paper.]

Variables:
- x-axis: [variable], meaning [meaning], unit [unit]
- y-axis: [variable], meaning [meaning], unit [unit]
- group/fill/color: [variable], levels [levels]
- facet/time/label/effect-size variables: [if relevant]

【O · Objective】
Use R and ggplot2 to draw a publication-ready [scatterplot / boxplot / bar chart / line plot / heatmap / volcano plot / Kaplan-Meier curve / forest plot / multi-panel figure].

Requirements:
- [trend line / confidence interval / raw points / significance labels / risk table / feature labels / panel tags]
- output must be directly suitable for journal submission.

【S · Style】
Strict journal figure style:
- font: Arial 11 pt
- theme: theme_classic()
- background: white
- axis labels include units
- legend: inside the plot at [c(0.85, 0.85)] unless it covers data
- palette: color-blind safe or grayscale-friendly
- export: TIFF, 300 DPI, width [N] inches, height [N] inches

【T · Tone】
Add concise comments explaining key parameters, especially color, shape, alpha, test method, and export settings.

【A · Audience】
Researchers preparing a manuscript for peer review. Reviewers and journal editors are the final audience.

【R · Response】
Return:
1. complete runnable R code;
2. package loading code;
3. plotting code;
4. `ggsave()` or `save_figure()` export code;
5. no more than three common reviewer comments and how this code prevents them.
```
