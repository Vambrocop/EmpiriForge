# Partial least squares regression with VIP ranking.
# Edit OUTCOME and PREDICTORS before using on a real project.

required <- c("pls", "ggplot2", "readr")
missing <- required[!vapply(required, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing) > 0) {
  stop("Install required packages first: ", paste(missing, collapse = ", "))
}

set.seed(2026)

OUTCOME <- "NDVI"
PREDICTORS <- c("RH", "Precip", "Sunshine", "Temp", "Wind")

dir.create("outputs/figures", recursive = TRUE, showWarnings = FALSE)
dir.create("outputs/tables", recursive = TRUE, showWarnings = FALSE)

simulate_ndvi_data <- function(n = 30, seed = 123) {
  set.seed(seed)
  data.frame(
    NDVI = rnorm(n, 0.6, 0.1),
    RH = rnorm(n, 60, 10),
    Precip = rnorm(n, 800, 150),
    Sunshine = rnorm(n, 2000, 300),
    Temp = rnorm(n, 15, 5),
    Wind = rnorm(n, 3, 1)
  )
}

calc_pls_vip <- function(pls_model, ncomp = pls_model$ncomp) {
  if (!inherits(pls_model, "mvr")) {
    stop("pls_model must be a fitted pls::plsr object.")
  }

  W <- pls_model$loading.weights[, seq_len(ncomp), drop = FALSE]
  T_scores <- pls_model$scores[, seq_len(ncomp), drop = FALSE]
  Q <- pls_model$Yloadings[, seq_len(ncomp), drop = FALSE]

  # Y variance explained by each component. For one response, this is q_a^2 * sum(t_a^2).
  ss_y <- colSums(T_scores^2) * colSums(Q^2)
  if (sum(ss_y) <= 0) {
    stop("Cannot compute VIP because explained Y variance is zero.")
  }

  # Normalize weights within each component before aggregating.
  w_norm <- sweep(W^2, 2, colSums(W^2), "/")
  vip <- sqrt(nrow(W) * rowSums(sweep(w_norm, 2, ss_y, "*")) / sum(ss_y))
  names(vip) <- rownames(W)
  vip
}

fit_pls_vip <- function(data, outcome = OUTCOME, predictors = PREDICTORS,
                        max_ncomp = NULL, validation = "CV", segments = 10) {
  stopifnot(outcome %in% names(data))
  stopifnot(all(predictors %in% names(data)))

  model_data <- stats::na.omit(data[, c(outcome, predictors)])
  if (nrow(model_data) < 10) {
    warning("Very small sample. Treat PLS/VIP as exploratory.")
  }

  max_possible <- min(length(predictors), nrow(model_data) - 1)
  if (is.null(max_ncomp)) {
    max_ncomp <- min(5, max_possible)
  }

  formula <- stats::as.formula(paste(outcome, "~", paste(predictors, collapse = " + ")))
  fit <- pls::plsr(
    formula,
    data = model_data,
    ncomp = max_ncomp,
    validation = validation,
    segments = min(segments, nrow(model_data)),
    scale = TRUE
  )

  rmsep <- pls::RMSEP(fit, estimate = "CV")
  cv_rmsep <- drop(rmsep$val[1, 1, -1])
  selected_ncomp <- which.min(cv_rmsep)
  vips <- calc_pls_vip(fit, ncomp = selected_ncomp)
  coef_array <- stats::coef(fit, ncomp = selected_ncomp, intercept = FALSE)
  coefs <- as.numeric(coef_array)
  names(coefs) <- dimnames(coef_array)[[1]]

  vip_table <- data.frame(
    variable = names(vips),
    vip = as.numeric(vips),
    coefficient = as.numeric(coefs[names(vips)]),
    direction = ifelse(as.numeric(coefs[names(vips)]) >= 0, "positive", "negative"),
    vip_flag = ifelse(as.numeric(vips) >= 1, "VIP >= 1", "VIP < 1"),
    row.names = NULL
  )
  vip_table <- vip_table[order(-vip_table$vip), ]

  list(
    data = model_data,
    fit = fit,
    selected_ncomp = selected_ncomp,
    cv_rmsep = cv_rmsep,
    vip_table = vip_table
  )
}

plot_vip <- function(vip_table) {
  ggplot2::ggplot(vip_table, ggplot2::aes(x = stats::reorder(variable, vip), y = vip, fill = vip >= 1)) +
    ggplot2::geom_col(width = 0.7) +
    ggplot2::geom_hline(yintercept = 1, linetype = "dashed", color = "grey35") +
    ggplot2::coord_flip() +
    ggplot2::scale_fill_manual(values = c("TRUE" = "#2166AC", "FALSE" = "#999999"), guide = "none") +
    ggplot2::theme_classic(base_size = 11, base_family = "Arial") +
    ggplot2::labs(x = NULL, y = "VIP")
}

# Example run. Replace with readr::read_csv("data/model_data.csv") for real data.
example_data <- simulate_ndvi_data()
result <- fit_pls_vip(example_data)

print(result$vip_table)
readr::write_csv(result$vip_table, "outputs/tables/pls_vip_results.csv")

vip_plot <- plot_vip(result$vip_table)
ggplot2::ggsave(
  filename = "outputs/figures/pls_vip_plot.tiff",
  plot = vip_plot,
  width = 6,
  height = 4,
  units = "in",
  dpi = 300
)

message("Selected components by CV RMSEP: ", result$selected_ncomp)
message("Outputs written to outputs/tables and outputs/figures.")
