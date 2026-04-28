# Economics Paper Workflow

Use this reference when the user is writing, planning, or revising an empirical economics or social-science paper.

## Research Question

A strong empirical paper can state the question in one sentence:

```text
What is the causal/descriptive relationship between X and Y in setting Z, and why does it matter for economics?
```

Check:

- Is the unit of observation clear?
- Is the outcome economically meaningful?
- Is the treatment/exposure interpretable?
- Is the setting important beyond convenience?
- Is the contribution one main idea, not a list?

## Contribution Formula

A practical contribution paragraph should cover:

1. What literature believes or does now.
2. What gap remains.
3. What this paper adds.
4. Why the result changes interpretation, measurement, policy, or method.

Avoid vague claims like "this paper contributes to the literature by studying an important topic." State the exact gap.

## Empirical Paper Sequence

1. **Question and motivation**: why the question matters.
2. **Institutional context**: what the reader needs to understand variation.
3. **Data**: source, construction, unit, sample, variables.
4. **Identification strategy**: source of variation and assumptions.
5. **Main specification**: equation, fixed effects, controls, clustering.
6. **Main results**: effect size, economic magnitude, interpretation.
7. **Threats and robustness**: organized by identifying threat.
8. **Mechanisms or heterogeneity**: only if they help explain the main result.
9. **Conclusion**: what we learned and what remains unresolved.
10. **Replication package**: code, data, README, and environment.

## Table Ladder

A common applied economics table ladder:

1. Descriptive statistics or balance.
2. Main result, parsimonious to saturated.
3. Identification diagnostic or event-study figure.
4. Robustness to alternative samples/specifications.
5. Heterogeneity or mechanisms.
6. Appendix extensions.

Each table should answer one question. Do not use robustness checks as decoration; tie each to a specific concern.

## Writing Results

A strong results paragraph includes:

- table/figure reference;
- sign and magnitude;
- economic interpretation;
- comparison to baseline or mean;
- uncertainty;
- what the estimate does and does not imply.

## Pre-Submission Audit

Before submission, check:

- Abstract states question, method, result, and contribution.
- Introduction reveals main result early.
- Identification assumptions are explicit.
- Standard errors and clustering are justified.
- All tables can be regenerated.
- All sample restrictions are documented.
- Data limitations are disclosed.
- Appendix is navigable.
- Replication package runs from a clean environment.

