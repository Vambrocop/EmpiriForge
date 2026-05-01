# Reusable publication figure helpers for ggplot2 projects.

theme_publication <- function(base_size = 11, base_family = "Arial") {
  ggplot2::theme_classic(base_size = base_size, base_family = base_family) +
    ggplot2::theme(
      text = ggplot2::element_text(family = base_family, size = base_size),
      axis.title = ggplot2::element_text(size = base_size, face = "bold"),
      axis.text = ggplot2::element_text(size = base_size - 1, color = "black"),
      legend.title = ggplot2::element_text(size = base_size, face = "bold"),
      legend.text = ggplot2::element_text(size = base_size - 1),
      plot.title = ggplot2::element_text(size = base_size + 1, face = "bold", hjust = 0.5),
      legend.background = ggplot2::element_rect(fill = "white", color = "grey80", linewidth = 0.3),
      legend.key.size = grid::unit(0.4, "cm"),
      plot.background = ggplot2::element_rect(fill = "white", color = NA),
      panel.background = ggplot2::element_rect(fill = "white", color = NA),
      plot.margin = ggplot2::margin(10, 15, 10, 10)
    )
}

save_figure <- function(plot, filename, width = 7, height = 5, dpi = 300,
                        device = "tiff", output_dir = file.path("outputs", "figures")) {
  if (!dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)
  }

  output_path <- file.path(output_dir, paste0(filename, ".", device))
  ggplot2::ggsave(
    filename = output_path,
    plot = plot,
    width = width,
    height = height,
    units = "in",
    dpi = dpi,
    device = device
  )
  message("Figure saved: ", output_path)
  invisible(output_path)
}

publication_palette <- c(
  orange = "#E69F00",
  sky = "#56B4E9",
  green = "#009E73",
  yellow = "#F0E442",
  blue = "#0072B2",
  vermillion = "#D55E00",
  purple = "#CC79A7",
  black = "#000000",
  grey = "#888888",
  light_grey = "#CCCCCC"
)

publication_shapes <- c(16, 17, 15, 18, 3, 7, 8)

inside_legend <- function(x = 0.85, y = 0.85) {
  ggplot2::theme(legend.position = c(x, y))
}
