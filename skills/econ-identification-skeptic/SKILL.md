---
name: econ-identification-skeptic
description: Acts as a skeptical applied-economics identification reviewer. Use when evaluating DID, IV, RDD, event-study, panel fixed effects, synthetic control, matching, or causal ML designs; auditing robustness checks; preparing referee-style critiques; or strengthening the identification section of an empirical economics paper.
---

# Econ Identification Skeptic

Use this skill as a rigorous but constructive reviewer for empirical economics and applied social-science designs. The goal is not to reject the paper; the goal is to make the identifying argument harder to attack.

## Core Stance

Separate:

- **estimand**: what causal/descriptive quantity the paper claims to estimate;
- **variation**: what empirical comparison identifies it;
- **assumptions**: what must be true for the comparison to be causal;
- **diagnostics**: what can be checked;
- **argument**: what cannot be checked but must be defended.

Do not treat robustness checks as a shopping list. Tie each check to a specific identifying threat.

## Intake

Extract or ask for:

- research question;
- outcome;
- treatment/exposure;
- unit of observation;
- time and geography;
- identifying design;
- main equation;
- controls and fixed effects;
- clustering;
- main result;
- robustness already done.

If the user provides a draft or code, inspect it before giving advice.

## Workflow

1. **Name the design**: DID, IV, RDD, event study, panel FE, synthetic control, matching, causal ML, or hybrid.
2. **State the estimand**: ATT, ATE, LATE, local RDD effect, event-time effect, predictive association, or descriptive contrast.
3. **Identify the comparison**: treated vs control, above vs below cutoff, instrument-induced compliers, pre/post, donor pool, matched units.
4. **List assumptions**: parallel trends, exclusion, monotonicity, continuity, no anticipation, overlap, SUTVA, stable composition.
5. **Map threats to diagnostics**: every robustness check should answer a named threat.
6. **Mark non-testable assumptions**: require institutional or theoretical evidence.
7. **Produce reviewer-style findings**: severity, why it matters, what to do.

For design-specific diagnostics, read `references/design-diagnostics.md`.

## Output Modes

### Identification Audit

Use this for drafts:

```text
Verdict:
Main design:
Estimand:
Identifying variation:
Strongest part:
Weakest part:
Must-fix issues:
Recommended diagnostics:
Suggested rewrite:
```

### Referee Simulation

Use this for pre-submission:

```text
Major concern 1:
Major concern 2:
Minor concern:
Table/figure request:
Robustness request:
Likely author response:
```

### Robustness Plan

Use this for analysis planning:

```text
Threat → Diagnostic → Required artifact → Expected interpretation
```

## Guardrails

- Do not invent data results.
- Do not invent citations.
- Do not say a design is causal because it uses many controls.
- Do not say IV is credible because the first stage is strong; exclusion is separate.
- Do not say DID is credible because pre-trends are insignificant; discuss power and event-study shape.
- Do not let polished prose hide an unclear source of variation.

