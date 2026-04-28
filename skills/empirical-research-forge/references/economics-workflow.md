# Economics Paper Workflow

Use this reference when the user is writing, planning, or revising an empirical economics or quantitative social-science paper.

## Design-First Paper Logic

A strong empirical paper can state:

```text
What causal or descriptive relationship between X and Y is studied in setting Z,
what comparison identifies it, and why the answer changes economic understanding?
```

Check:

- Is the unit of observation clear?
- Is the outcome economically meaningful?
- Is the treatment/exposure interpretable?
- Is the estimand explicit?
- Is the setting important beyond convenience?
- Is the contribution one main idea, not a list?
- Is the source of identifying variation visible before the regression table appears?

## Contribution Formula

A practical contribution paragraph should cover:

1. What the closest literature currently believes or can measure.
2. What gap remains.
3. What this paper adds: setting, data, identification, mechanism, or external validity.
4. Why the result changes interpretation, measurement, policy, or method.

Avoid vague claims like "this paper contributes to the literature by studying an important topic." State the exact gap.

## Empirical Paper Sequence

1. **Question and motivation**: why the question matters.
2. **Institutional context**: what the reader needs to understand variation.
3. **Data**: source, construction, unit, sample, variables, missingness, restrictions.
4. **Estimand**: ATT, ATE, LATE, local RDD effect, event-time effect, or descriptive contrast.
5. **Identification strategy**: comparison, assumptions, and threats.
6. **Main specification**: equation, fixed effects, controls, clustering, weights.
7. **Main results**: effect size, uncertainty, economic magnitude, interpretation.
8. **Threats and robustness**: organized by identifying threat, not by convenience.
9. **Mechanisms or heterogeneity**: only if they help explain the main result and are not fishing.
10. **Conclusion**: what we learned and what remains unresolved.
11. **Replication package**: code, data, README, environment, and expected outputs.

## Table Ladder

A common applied-economics table ladder:

1. Descriptive statistics, sample construction, or balance.
2. Main result, parsimonious to saturated.
3. Identification diagnostic or event-study figure.
4. Robustness to alternative samples/specifications.
5. Heterogeneity or mechanism tests.
6. Appendix extensions and sensitivity.

Each table should answer one question. Do not use robustness checks as decoration; tie each to a specific concern.

## Writing Results

A strong results paragraph includes:

- table/figure reference;
- sign and magnitude;
- uncertainty and inference;
- economic interpretation relative to a baseline or mean;
- what the estimate does and does not imply;
- the design assumption that readers must believe.

## Method-Source Alignment

Use method sources as guardrails:

- applied econometrics sources for estimand, variation, and diagnostic design;
- causal inference sources for counterfactual language and assumption clarity;
- AEA/DIME/J-PAL/BITSS-style transparency sources for data, code, and reproducibility;
- the AI-assisted reproducibility paper for agent workflow, audit trails, deterministic execution, and skill memory.

Do not add a citation merely to decorate a paragraph. Add it only when it changes the research decision.

## Pre-Submission Audit

Before submission, check:

- Abstract states question, method, result, and contribution.
- Introduction reveals the main result early.
- Identification assumptions are explicit.
- Standard errors and clustering are justified.
- Main tables can be regenerated.
- All sample restrictions are documented.
- Data limitations and access restrictions are disclosed.
- Appendix is navigable.
- Replication package runs from a clean environment.
- AI assistance, if used materially, is disclosed according to the target journal or institution.
