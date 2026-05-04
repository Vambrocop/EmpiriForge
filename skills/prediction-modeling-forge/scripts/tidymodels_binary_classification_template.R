# Binary classification prediction-model template.
# Edit OUTCOME and POS_CLASS before running.

library(tidyverse)
library(tidymodels)
library(vip)
library(pROC)
library(here)

set.seed(2026)

OUTCOME <- "outcome"
POS_CLASS <- "pos"

dir.create(here("outputs", "figures"), recursive = TRUE, showWarnings = FALSE)
dir.create(here("outputs", "tables"), recursive = TRUE, showWarnings = FALSE)

# df <- readr::read_csv("data/model_data.csv")

prepare_outcome <- function(df, outcome = OUTCOME, positive = POS_CLASS) {
  y <- df[[outcome]]
  if (!is.factor(y)) {
    y <- factor(y)
  }
  if (!positive %in% levels(y)) {
    stop("POS_CLASS is not a level of the outcome.")
  }
  df[[outcome]] <- stats::relevel(y, ref = positive)
  df
}

build_recipe <- function(train_data, outcome = OUTCOME) {
  stats::as.formula(paste(outcome, "~ .")) |>
    recipe(data = train_data) |>
    step_impute_median(all_numeric_predictors()) |>
    step_impute_mode(all_nominal_predictors()) |>
    step_dummy(all_nominal_predictors()) |>
    step_zv(all_predictors()) |>
    step_normalize(all_numeric_predictors())
}

metric_bundle <- metric_set(roc_auc, accuracy, sensitivity, specificity, ppv, npv)

fit_prediction_models <- function(df, outcome = OUTCOME, positive = POS_CLASS) {
  df <- prepare_outcome(df, outcome, positive)
  split <- initial_split(df, prop = 0.7, strata = all_of(outcome))
  train_data <- training(split)
  folds <- vfold_cv(train_data, v = 5, strata = all_of(outcome))
  rec <- build_recipe(train_data, outcome)

  lr_spec <- logistic_reg() |>
    set_engine("glm") |>
    set_mode("classification")

  rf_spec <- rand_forest(mtry = tune(), trees = 500, min_n = tune()) |>
    set_engine("ranger", importance = "impurity") |>
    set_mode("classification")

  xgb_spec <- boost_tree(
    trees = tune(),
    learn_rate = tune(),
    tree_depth = tune(),
    min_n = tune(),
    loss_reduction = tune(),
    sample_size = tune(),
    mtry = tune()
  ) |>
    set_engine("xgboost") |>
    set_mode("classification")

  lr_wf <- workflow() |> add_recipe(rec) |> add_model(lr_spec)
  rf_wf <- workflow() |> add_recipe(rec) |> add_model(rf_spec)
  xgb_wf <- workflow() |> add_recipe(rec) |> add_model(xgb_spec)

  rf_grid <- grid_regular(
    mtry(range = c(2, min(8, ncol(train_data) - 1))),
    min_n(range = c(5, 25)),
    levels = 5
  )

  rf_tune <- tune_grid(
    rf_wf,
    resamples = folds,
    grid = rf_grid,
    metrics = metric_set(roc_auc, accuracy)
  )

  xgb_grid <- grid_latin_hypercube(
    trees(),
    learn_rate(),
    tree_depth(),
    min_n(),
    loss_reduction(),
    sample_size = sample_prop(),
    finalize(mtry(), train_data),
    size = 30
  )

  xgb_tune <- tune_grid(
    xgb_wf,
    resamples = folds,
    grid = xgb_grid,
    metrics = metric_set(roc_auc, accuracy),
    control = control_grid(save_pred = TRUE)
  )

  lr_result <- last_fit(lr_wf, split, metrics = metric_bundle)
  rf_result <- last_fit(finalize_workflow(rf_wf, select_best(rf_tune, "roc_auc")), split, metrics = metric_bundle)
  xgb_result <- last_fit(finalize_workflow(xgb_wf, select_best(xgb_tune, "roc_auc")), split, metrics = metric_bundle)

  list(
    split = split,
    lr = lr_result,
    rf = rf_result,
    xgb = xgb_result,
    rf_tune = rf_tune,
    xgb_tune = xgb_tune
  )
}

collect_model_metrics <- function(results) {
  bind_rows(
    collect_metrics(results$lr) |> mutate(model = "logistic_regression"),
    collect_metrics(results$rf) |> mutate(model = "random_forest"),
    collect_metrics(results$xgb) |> mutate(model = "xgboost")
  )
}
