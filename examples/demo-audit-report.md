# Demo: Applied Economics Identification Audit

This is a compact example of the kind of output EmpiriForge is meant to produce.

## Input

```text
Draft claim:
We estimate the effect of a city-level green subsidy on firm employment using staggered DID.

Data:
Firm-year panel, 2010-2022.

Main model:
employment_it = beta subsidy_ct + firm FE + year FE + controls + error_it
```

## Skill

```text
Use empirical-research-forge and econ-identification-skeptic to audit the design.
```

## Example Output

### Verdict

`needs design repair`. The design has a plausible panel structure, but the current TWFE specification may be vulnerable to staggered-adoption bias, endogenous city adoption, spillovers, and unclear clustering.

### Research Ledger

| Item | Value |
|---|---|
| Unit | firm-year |
| Treatment | city-level subsidy adoption |
| Outcome | firm employment |
| Estimand | likely ATT for firms exposed to subsidy adoption |
| Design | staggered DID |
| Main comparison | firms in treated cities vs firms in not-yet/never-treated cities |
| Core assumption | untreated employment trends would have evolved similarly |

### Method-Source Alignment

| Decision | Source family | Note |
|---|---|---|
| DID design | applied econometrics / causal inference | Needs explicit treatment timing, comparison group, and parallel-trends argument. |
| Replication package | AEA / DIME-style reproducibility | Needs run order, data provenance, logs, and regenerated table map. |
| Agent workflow | AI-assisted reproducibility | Audit should separate code run success from identification credibility. |

### Must-Fix Issues

1. Clarify adoption timing and whether treatment is absorbing.
2. Replace or supplement TWFE with a staggered DID estimator.
3. Add event-study plot with pre-treatment coefficients.
4. Cluster at the city or policy-assignment level, and test sensitivity.
5. Discuss endogenous adoption: cities may subsidize sectors already growing or declining.

### Robustness Plan

| Threat | Diagnostic |
|---|---|
| Pre-trends | Event-study plot and joint pre-period test, interpreted with power limits |
| Endogenous adoption | Policy predictors, alternative controls, matched cities, timing discussion |
| Spillovers | Drop neighboring cities or high-commuting zones |
| Composition | Balanced panel and entry/exit decomposition |
| Heterogeneous timing | Cohort-specific DID estimator |

### Suggested Rewrite

The identifying variation comes from within-firm changes in employment around city-level subsidy adoption, relative to firms in cities not yet exposed to the policy. The credibility of this comparison depends on the absence of differential pre-treatment trends and on adoption timing not being driven by unobserved shocks to local labor demand.
