# Journal Figure Standards

Use this reference for default scientific-figure requirements before writing plotting code.

## Submission Defaults

Use these defaults unless the target journal says otherwise:

- font: Arial or Helvetica;
- base text size: 11 pt;
- title size: 12 pt;
- theme: `theme_classic()` for ggplot2;
- background: white;
- grid: off unless it improves quantitative reading;
- resolution: 300 DPI or higher;
- format: TIFF first, EPS/PDF for vector when appropriate;
- single-column width: about 3.5 in;
- double-column width: about 7.5 in;
- color: color-blind safe or grayscale-friendly;
- legend: inside the plotting area when it does not cover data;
- axis labels: include units in parentheses;
- margins: enough for axis labels and panel tags.

## Recommended R Setup

Core packages:

```r
install.packages(c(
  "tidyverse",
  "here",
  "scales",
  "patchwork",
  "ggrepel",
  "ggpubr",
  "survival",
  "survminer",
  "pheatmap",
  "RColorBrewer"
))
```

Load the reusable helper:

```r
source("skills/publication-figure-forge/scripts/publication_theme.R")
```

If used outside this repository, copy `publication_theme.R` into the project and source it from a stable path.

## Review Failure Points

Common reviewer or editor complaints:

- low resolution;
- wrong font;
- gray ggplot default background;
- missing units;
- legend outside the panel wasting space;
- colors fail in grayscale or for color-blind readers;
- axis text too small;
- panels have inconsistent dimensions;
- p-value stars are unexplained;
- heatmap or volcano labels are unreadable;
- figure does not match the statistical method.

## Export Rules

Use:

```r
save_figure(p, "figure_name", width = 7, height = 5, dpi = 300, device = "tiff")
```

For vector-friendly journals:

```r
save_figure(p, "figure_name", width = 7, height = 5, device = "pdf")
save_figure(p, "figure_name", width = 7, height = 5, device = "eps")
```

Do not use draft PNGs for final submission unless explicitly accepted.

## Accessibility Palette

Default color-blind safe palette:

```r
publication_palette <- c(
  "orange" = "#E69F00",
  "sky" = "#56B4E9",
  "green" = "#009E73",
  "yellow" = "#F0E442",
  "blue" = "#0072B2",
  "vermillion" = "#D55E00",
  "purple" = "#CC79A7",
  "black" = "#000000",
  "grey" = "#888888"
)
```

For black-and-white print, combine color with shape, linetype, or fill pattern logic. Color alone is not enough.
