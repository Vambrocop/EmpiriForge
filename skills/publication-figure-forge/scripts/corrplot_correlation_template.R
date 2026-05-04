#!/usr/bin/env Rscript

args <- commandArgs(trailingOnly = TRUE)

parse_args <- function(args) {
  out <- list(
    input = "input.txt",
    output = "correlation_plot.pdf",
    variant = "sig_color",
    transpose = TRUE,
    cor_method = "pearson",
    p_adjust = "BH",
    width = 8,
    height = 8,
    sep = "\t"
  )

  i <- 1
  while (i <= length(args)) {
    key <- args[[i]]
    if (!startsWith(key, "--")) {
      stop("Unexpected argument: ", key)
    }
    if (i == length(args)) {
      stop("Missing value for argument: ", key)
    }
    value <- args[[i + 1]]
    name <- sub("^--", "", key)
    out[[name]] <- value
    i <- i + 2
  }

  out$transpose <- toupper(as.character(out$transpose)) %in% c("TRUE", "T", "1", "YES", "Y")
  out$width <- as.numeric(out$width)
  out$height <- as.numeric(out$height)
  out
}

stop_if_missing_package <- function(pkg) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    stop("Package '", pkg, "' is required. Install it with install.packages('", pkg, "').")
  }
}

read_matrix <- function(path, sep = "\t", transpose = TRUE) {
  dat <- read.table(
    path,
    sep = sep,
    header = TRUE,
    check.names = FALSE,
    row.names = 1,
    stringsAsFactors = FALSE,
    comment.char = "",
    quote = "\""
  )

  numeric_dat <- as.data.frame(lapply(dat, function(x) suppressWarnings(as.numeric(x))))
  rownames(numeric_dat) <- rownames(dat)

  if (transpose) {
    numeric_dat <- as.data.frame(t(as.matrix(numeric_dat)))
  }

  keep <- vapply(numeric_dat, function(x) {
    sum(!is.na(x)) >= 3 && stats::sd(x, na.rm = TRUE) > 0
  }, logical(1))

  dropped <- names(keep)[!keep]
  if (length(dropped) > 0) {
    message("Dropped constant or too-sparse variables: ", paste(dropped, collapse = ", "))
  }

  numeric_dat <- numeric_dat[, keep, drop = FALSE]
  if (ncol(numeric_dat) < 2) {
    stop("Need at least two numeric, non-constant variables after cleaning.")
  }

  numeric_dat
}

cor_mtest <- function(mat, method = "pearson", conf.level = 0.95, adjust = "BH") {
  mat <- as.matrix(mat)
  n <- ncol(mat)
  p.mat <- matrix(NA_real_, n, n)
  diag(p.mat) <- 0

  for (i in seq_len(n - 1)) {
    for (j in (i + 1):n) {
      ok <- stats::complete.cases(mat[, i], mat[, j])
      if (sum(ok) >= 3) {
        tmp <- stats::cor.test(mat[ok, i], mat[ok, j], method = method, conf.level = conf.level)
        p.mat[i, j] <- p.mat[j, i] <- tmp$p.value
      }
    }
  }

  if (!is.null(adjust) && !tolower(adjust) %in% c("none", "no", "raw")) {
    upper <- upper.tri(p.mat)
    adjusted <- stats::p.adjust(p.mat[upper], method = adjust)
    p.mat[upper] <- adjusted
    p.mat[lower.tri(p.mat)] <- t(p.mat)[lower.tri(p.mat)]
  }

  colnames(p.mat) <- rownames(p.mat) <- colnames(mat)
  p.mat
}

draw_corrplot <- function(cor_matrix, p_matrix, variant) {
  pal_main <- grDevices::colorRampPalette(c("#2166AC", "white", "#B2182B"))(200)
  pal_alt <- grDevices::colorRampPalette(c("#313695", "#74ADD1", "white", "#F46D43", "#A50026"))(300)
  pal_ellipse <- grDevices::colorRampPalette(c("#3B4CC0", "white", "#B40426"))(200)
  pal_lower <- grDevices::colorRampPalette(c("navy", "white", "firebrick3"))(100)
  pal_gray <- grDevices::colorRampPalette(c("white", "black"))(200)

  variant <- tolower(variant)
  if (variant %in% c("1", "pie", "pie_upper")) {
    corrplot::corrplot(cor_matrix, method = "pie", type = "upper", order = "hclust",
                       col = pal_main, tl.col = "black", tl.srt = 45)
  } else if (variant %in% c("2", "mixed", "mixed_circle_color")) {
    corrplot::corrplot.mixed(cor_matrix, lower = "circle", upper = "color",
                             tl.col = "black", tl.pos = "lt", tl.srt = 45,
                             lower.col = pal_main, upper.col = pal_main)
  } else if (variant %in% c("3", "sig_color")) {
    corrplot::corrplot(cor_matrix, method = "color", type = "upper", order = "hclust",
                       p.mat = p_matrix, sig.level = c(0.001, 0.01, 0.05),
                       insig = "label_sig", pch.cex = 1.5, pch.col = "black",
                       col = pal_main, tl.col = "black", tl.srt = 45)
  } else if (variant %in% c("4", "ellipse", "ellipse_sig_blank")) {
    corrplot::corrplot(cor_matrix, method = "ellipse", type = "upper", order = "hclust",
                       p.mat = p_matrix, sig.level = 0.05, insig = "blank",
                       col = pal_ellipse, tl.col = "black", tl.cex = 0.8, tl.srt = 45)
  } else if (variant %in% c("5", "coef", "coef_color")) {
    corrplot::corrplot(cor_matrix, method = "color", type = "upper", order = "hclust",
                       addCoef.col = "black", number.cex = 0.6,
                       p.mat = p_matrix, sig.level = 0.05, insig = "blank",
                       col = pal_main, tl.col = "black", tl.srt = 45)
  } else if (variant %in% c("6", "lower", "lower_aoe")) {
    corrplot::corrplot(cor_matrix, method = "color", type = "lower", order = "AOE",
                       p.mat = p_matrix, sig.level = 0.05, insig = "blank",
                       diag = FALSE, col = pal_lower, tl.col = "black", tl.cex = 0.9)
  } else if (variant %in% c("7", "circle", "circle_sig")) {
    corrplot::corrplot(cor_matrix, method = "circle", type = "upper", order = "hclust",
                       p.mat = p_matrix, sig.level = c(0.001, 0.01, 0.05),
                       insig = "label_sig", pch.col = "black", pch.cex = 1.5,
                       col = pal_main, tl.col = "black", tl.srt = 45)
  } else if (variant %in% c("8", "shade", "shade_gray")) {
    corrplot::corrplot(cor_matrix, method = "shade", type = "upper", order = "hclust",
                       p.mat = p_matrix, sig.level = 0.05, insig = "blank",
                       col = pal_gray, tl.col = "black", tl.cex = 0.8)
  } else if (variant %in% c("9", "cluster", "cluster_rect")) {
    corrplot::corrplot(cor_matrix, method = "color", order = "hclust",
                       hclust.method = "ward.D2", addrect = 4,
                       rect.col = "black", rect.lwd = 2,
                       p.mat = p_matrix, sig.level = 0.05, insig = "blank",
                       col = pal_alt, tl.col = "black", tl.cex = 0.8, tl.srt = 45)
  } else {
    stop("Unknown variant: ", variant)
  }
}

main <- function() {
  stop_if_missing_package("corrplot")
  opt <- parse_args(args)

  dat <- read_matrix(opt$input, sep = opt$sep, transpose = opt$transpose)
  cor_matrix <- stats::cor(dat, use = "pairwise.complete.obs", method = opt$cor_method)
  p_matrix <- cor_mtest(dat, method = opt$cor_method, adjust = opt$p_adjust)

  grDevices::pdf(opt$output, width = opt$width, height = opt$height)
  on.exit(grDevices::dev.off(), add = TRUE)
  draw_corrplot(cor_matrix, p_matrix, opt$variant)

  message("Correlation plot saved: ", opt$output)
  message("Correlation method: ", opt$cor_method, "; p-value adjustment: ", opt$p_adjust)
}

main()
