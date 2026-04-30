---
name: causal-ml-estimator-selector
description: Selects, audits, and explains causal machine learning workflows for heterogeneous treatment effects. Use for CATE, ITE, uplift modeling, S/T/X/R/DR learners, causal forests, matching, propensity scores, IV/DRIV, CEVAE/DragonNet, treatment targeting, policy personalization, Python CausalML/EconML-style projects, and validation of causal-ML claims.
---

# Causal ML Estimator Selector

Use this skill when a project uses machine learning to estimate causal effects, especially heterogeneous treatment effects (`CATE`), individual treatment effects (`ITE`), uplift, targeting, or treatment personalization.

## Core Principle

Causal ML is not prediction with causal language. Separate:

- causal question;
- estimand;
- identification assumptions;
- treatment assignment process;
- feature set and timing;
- nuisance-model estimation;
- treatment-effect model;
- validation;
- policy or targeting use.

Good predictive performance does not prove causal validity.

## Intake

Identify:

- treatment or intervention;
- outcome;
- unit of observation;
- data source: experiment, quasi-experiment, or observational data;
- treatment timing;
- available pre-treatment covariates;
- target estimand: `ATE`, `ATT`, `CATE`, `ITE`, `LATE`, or uplift;
- assignment mechanism;
- overlap risks;
- hidden-confounding risks;
- intended tool: `causalml`, `econml`, `dowhy`, custom Python, R, Stata, or mixed stack.

Load:

- `references/causal-ml-toolkit.md` for estimator families, guardrails, and CausalML-specific notes.
- `templates/causal-ml-design-card.md` for project setup.
- `templates/causal-ml-validation-plan.csv` for validation planning.

## Workflow

1. Name the estimand.
2. Decide whether the design is experimental, quasi-experimental, or observational.
3. Check whether treatment, outcome, and covariates are temporally ordered.
4. Check overlap and treatment prevalence.
5. Select estimator family:
   - meta-learners for flexible `CATE`;
   - doubly robust learners when nuisance models and overlap are central;
   - uplift trees/forests for targeting and segmentation;
   - IV/DRIV when treatment is endogenous and a credible instrument exists;
   - neural methods only when data scale and validation justify them.
6. Plan cross-fitting or sample splitting when appropriate.
7. Compare learners and report stability.
8. Validate with multiple estimates, synthetic/placebo checks, AUUC/uplift curves, and sensitivity analysis.
9. Translate results as conditional or exploratory unless the identification design is strong.

## Output Modes

### Estimator Recommendation

```text
Estimand:
Data design:
Main identification assumption:
Recommended estimator family:
Why this estimator:
Minimum diagnostics:
Validation plan:
Interpretation limit:
```

### Causal ML Audit

```text
Verdict:
Causal question:
Treatment timing:
Feature leakage risks:
Overlap:
Learner choice:
Validation:
Heterogeneity claim:
Policy use:
Must-fix issues:
```

### Implementation Scaffold

Give package-agnostic pseudocode unless the user asks for a specific library.

```text
1. Build design card.
2. Freeze feature set.
3. Split/cross-fit.
4. Fit nuisance models if needed.
5. Fit treatment-effect estimator.
6. Validate effect stability.
7. Export CATE/ITE estimates with uncertainty and cohort summaries.
8. Write assumptions and limits.
```

## Guardrails

- Do not claim causal discovery unless graph/discovery assumptions are explicitly part of the design.
- Do not include post-treatment variables as features for treatment-effect estimation.
- Do not treat `CATE` ranking as a welfare policy without cost, constraint, and fairness checks.
- Do not write subgroup effects as confirmatory when they were searched after seeing results.
- Do not use causal ML to rescue an unidentified observational design.
- Do not hide package versions, random seeds, train/test logic, or feature construction.
