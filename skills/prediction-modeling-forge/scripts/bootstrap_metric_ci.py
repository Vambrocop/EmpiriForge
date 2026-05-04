#!/usr/bin/env python3
"""Bootstrap confidence intervals for simple values and binary prediction metrics.

Examples:
  python bootstrap_metric_ci.py --csv predictions.csv --stat auc --truth-col truth --score-col pred_pos --positive pos
  python bootstrap_metric_ci.py --csv data.csv --stat mean --value-col income --cluster-col household_id
"""

from __future__ import annotations

import argparse
import csv
import json
import math
import random
import statistics
from collections import defaultdict
from typing import Callable, Iterable


def read_csv(path: str) -> list[dict[str, str]]:
    with open(path, newline="", encoding="utf-8-sig") as f:
        return list(csv.DictReader(f))


def to_float(value: str) -> float:
    if value is None or value == "":
        return math.nan
    return float(value)


def mean(values: list[float]) -> float:
    values = [v for v in values if not math.isnan(v)]
    if not values:
        return math.nan
    return sum(values) / len(values)


def median(values: list[float]) -> float:
    values = [v for v in values if not math.isnan(v)]
    if not values:
        return math.nan
    return statistics.median(values)


def auc_score(labels: list[bool], scores: list[float]) -> float:
    pairs = [(s, y) for y, s in zip(labels, scores) if not math.isnan(s)]
    n_pos = sum(1 for _, y in pairs if y)
    n_neg = sum(1 for _, y in pairs if not y)
    if n_pos == 0 or n_neg == 0:
        return math.nan

    pairs.sort(key=lambda p: p[0])
    rank_sum_pos = 0.0
    i = 0
    while i < len(pairs):
        j = i + 1
        while j < len(pairs) and pairs[j][0] == pairs[i][0]:
            j += 1
        avg_rank = (i + 1 + j) / 2.0
        rank_sum_pos += avg_rank * sum(1 for _, y in pairs[i:j] if y)
        i = j

    return (rank_sum_pos - n_pos * (n_pos + 1) / 2.0) / (n_pos * n_neg)


def confusion_metric(rows: list[dict[str, str]], args: argparse.Namespace, metric: str) -> float:
    truth = [row[args.truth_col] == args.positive for row in rows]
    if args.pred_col:
        pred = [row[args.pred_col] == args.positive for row in rows]
    else:
        pred = [to_float(row[args.score_col]) >= args.threshold for row in rows]

    tp = sum(y and p for y, p in zip(truth, pred))
    tn = sum((not y) and (not p) for y, p in zip(truth, pred))
    fp = sum((not y) and p for y, p in zip(truth, pred))
    fn = sum(y and (not p) for y, p in zip(truth, pred))

    if metric == "accuracy":
        return (tp + tn) / max(tp + tn + fp + fn, 1)
    if metric == "sensitivity":
        return tp / (tp + fn) if (tp + fn) else math.nan
    if metric == "specificity":
        return tn / (tn + fp) if (tn + fp) else math.nan
    if metric == "ppv":
        return tp / (tp + fp) if (tp + fp) else math.nan
    if metric == "npv":
        return tn / (tn + fn) if (tn + fn) else math.nan
    raise ValueError(f"Unsupported metric: {metric}")


def make_stat(args: argparse.Namespace) -> Callable[[list[dict[str, str]]], float]:
    if args.stat in {"mean", "median"}:
        if not args.value_col:
            raise SystemExit("--value-col is required for mean/median")

        def value_stat(rows: list[dict[str, str]]) -> float:
            values = [to_float(row[args.value_col]) for row in rows]
            return mean(values) if args.stat == "mean" else median(values)

        return value_stat

    if args.stat == "auc":
        if not args.truth_col or not args.score_col or not args.positive:
            raise SystemExit("--truth-col, --score-col, and --positive are required for auc")

        def auc_stat(rows: list[dict[str, str]]) -> float:
            labels = [row[args.truth_col] == args.positive for row in rows]
            scores = [to_float(row[args.score_col]) for row in rows]
            return auc_score(labels, scores)

        return auc_stat

    if args.stat in {"accuracy", "sensitivity", "specificity", "ppv", "npv"}:
        if not args.truth_col or not args.positive:
            raise SystemExit("--truth-col and --positive are required for classification metrics")
        if not args.pred_col and not args.score_col:
            raise SystemExit("Either --pred-col or --score-col is required for classification metrics")

        return lambda rows: confusion_metric(rows, args, args.stat)

    raise SystemExit(f"Unsupported stat: {args.stat}")


def quantile(values: list[float], q: float) -> float:
    values = sorted(values)
    if not values:
        return math.nan
    pos = (len(values) - 1) * q
    lo = math.floor(pos)
    hi = math.ceil(pos)
    if lo == hi:
        return values[int(pos)]
    return values[lo] * (hi - pos) + values[hi] * (pos - lo)


def normal_interval(theta: float, se: float, alpha: float) -> tuple[float, float]:
    z_lookup = {0.10: 1.6448536269514722, 0.05: 1.959963984540054, 0.01: 2.5758293035489004}
    z = z_lookup.get(round(alpha, 4), 1.959963984540054)
    return theta - z * se, theta + z * se


def resample_rows(rows: list[dict[str, str]], rng: random.Random) -> list[dict[str, str]]:
    return [rows[rng.randrange(len(rows))] for _ in range(len(rows))]


def resample_clusters(rows: list[dict[str, str]], cluster_col: str, rng: random.Random) -> list[dict[str, str]]:
    grouped: dict[str, list[dict[str, str]]] = defaultdict(list)
    for row in rows:
        grouped[row[cluster_col]].append(row)
    clusters = list(grouped)
    sampled = [clusters[rng.randrange(len(clusters))] for _ in range(len(clusters))]
    out: list[dict[str, str]] = []
    for cluster in sampled:
        out.extend(grouped[cluster])
    return out


def finite(values: Iterable[float]) -> list[float]:
    return [v for v in values if not math.isnan(v) and not math.isinf(v)]


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--csv", required=True)
    parser.add_argument("--stat", required=True, choices=["mean", "median", "auc", "accuracy", "sensitivity", "specificity", "ppv", "npv"])
    parser.add_argument("--value-col")
    parser.add_argument("--truth-col")
    parser.add_argument("--score-col")
    parser.add_argument("--pred-col")
    parser.add_argument("--positive")
    parser.add_argument("--threshold", type=float, default=0.5)
    parser.add_argument("--cluster-col")
    parser.add_argument("--replicates", type=int, default=1000)
    parser.add_argument("--alpha", type=float, default=0.05)
    parser.add_argument("--seed", type=int, default=2026)
    args = parser.parse_args()

    rows = read_csv(args.csv)
    if not rows:
        raise SystemExit("CSV has no rows")

    stat_fn = make_stat(args)
    theta = stat_fn(rows)
    rng = random.Random(args.seed)
    boot: list[float] = []
    failures = 0

    for _ in range(args.replicates):
        sample = resample_clusters(rows, args.cluster_col, rng) if args.cluster_col else resample_rows(rows, rng)
        value = stat_fn(sample)
        if math.isnan(value) or math.isinf(value):
            failures += 1
        else:
            boot.append(value)

    if len(boot) < max(30, args.replicates // 10):
        raise SystemExit(f"Too few valid bootstrap replicates: {len(boot)}")

    se = statistics.stdev(boot) if len(boot) > 1 else math.nan
    percentile = (quantile(boot, args.alpha / 2), quantile(boot, 1 - args.alpha / 2))
    normal = normal_interval(theta, se, args.alpha)
    basic = (2 * theta - percentile[1], 2 * theta - percentile[0])

    result = {
        "stat": args.stat,
        "estimate": theta,
        "bootstrap_mean": mean(boot),
        "bootstrap_se": se,
        "bootstrap_bias": mean(boot) - theta,
        "replicates_requested": args.replicates,
        "replicates_used": len(boot),
        "replicates_failed": failures,
        "alpha": args.alpha,
        "resampling_unit": args.cluster_col or "row",
        "ci": {
            "percentile": percentile,
            "normal": normal,
            "basic": basic,
        },
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
