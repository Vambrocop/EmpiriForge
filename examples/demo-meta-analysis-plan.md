# Demo: Meta-Analysis Forge Plan

## Input

```text
Topic:
Do green finance policies improve firm-level environmental performance?

Goal:
Systematic review + meta-analysis + umbrella review layer + machine-learning assisted screening.
```

## Skill

```text
Use meta-analysis-forge to design a protocol.
```

## Example Output

### Review Type

Hybrid evidence synthesis:

- first-order meta-analysis of primary empirical studies;
- umbrella review of existing reviews, if available;
- ML-assisted screening and moderator exploration.

### Question

Among firms exposed to green finance policies, what is the average effect on environmental performance outcomes such as emissions intensity, pollution discharge, ESG environmental scores, or green innovation?

### Inclusion Criteria

| Domain | Criteria |
|---|---|
| Population | Firms or plants |
| Exposure | green credit, green bonds, green finance regulation, climate finance policy |
| Comparator | unexposed or less-exposed firms/plants |
| Outcomes | emissions, pollution, green patents, environmental scores |
| Designs | DID, IV, RDD, panel FE, matched designs |

### Effect-Size Plan

Prefer standardized effect sizes only when outcomes are comparable. For economics papers, preserve elasticities, percentage changes, or standardized beta coefficients separately rather than forcing incompatible estimates into one pooled number.

### ML Extension

Use ML for:

- deduplication;
- title/abstract screening prioritization;
- tagging study design and outcome class;
- exploratory moderator discovery.

Do not use ML-screened exclusions without human audit. Do not treat ML-discovered moderators as confirmatory.

### Second-Order Layer

If existing meta-analyses are found:

1. Extract review-level pooled estimates.
2. Build primary-study overlap matrix.
3. Assess whether reviews duplicate the same evidence base.
4. Prefer narrative umbrella synthesis if overlap is high.
5. Use second-order statistical pooling only if estimates are comparable and dependence is handled.

