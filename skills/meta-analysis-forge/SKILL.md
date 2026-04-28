---
name: meta-analysis-forge
description: Designs and audits systematic reviews, meta-analyses, umbrella reviews, second-order meta-analyses, and meta-analysis plus machine-learning workflows. Use for PRISMA-style protocols, search strategies, screening, coding manuals, effect-size extraction, random/multilevel/meta-regression models, publication-bias checks, second-order evidence synthesis, and ML-assisted literature screening or moderator discovery.
---

# Meta-Analysis Forge

Use this skill to build transparent evidence-synthesis workflows. It supports standard meta-analysis, second-order meta-analysis / umbrella review, and careful use of machine learning in screening, extraction, prediction, or moderator exploration.

## Core Principle

Separate:

- **search and selection**: how studies enter the evidence base;
- **coding**: how study features and effect sizes are extracted;
- **statistical synthesis**: how effects are combined;
- **bias assessment**: what could distort the evidence;
- **machine learning**: what is prediction/triage versus inferential evidence;
- **interpretation**: what the synthesis can and cannot claim.

Do not let ML turn an under-specified review into a black box. ML may assist search, screening, extraction, clustering, prediction, and moderator discovery; the review protocol and inferential estimand must remain explicit.

## Intake

Identify:

- research question;
- domain: economics, medicine, ecology, environment, omics, education, psychology, policy, or other;
- population/exposure/intervention/comparator/outcome;
- eligible study designs;
- effect-size metric;
- expected heterogeneity;
- number of studies or reviews;
- whether this is first-order meta-analysis, umbrella review, or second-order meta-analysis;
- whether ML is desired for screening, extraction, prediction, or moderator discovery.

## Workflow

1. **Protocol**: define question, eligibility, outcomes, effect sizes, and analysis plan.
2. **Search**: build database queries and grey-literature strategy.
3. **Screening**: title/abstract, full text, exclusion reasons, conflict resolution.
4. **Coding**: study characteristics, risk of bias, effect-size extraction, dependence structure.
5. **Effect-size harmonization**: convert estimates to comparable metrics where valid.
6. **Primary synthesis**: fixed/random effects, multilevel models, robust variance, or Bayesian models as appropriate.
7. **Heterogeneity**: I2/tau2, prediction intervals, subgroup analysis, meta-regression.
8. **Bias diagnostics**: funnel plot, small-study effects, selection models, p-curve/p-uniform where appropriate.
9. **Second-order layer**: if synthesizing reviews/meta-analyses, assess overlap, review quality, and duplicate primary studies.
10. **ML extension**: add machine learning only with a clear role and validation plan.
11. **Report**: generate PRISMA-style flow, evidence tables, model summary, limitations, and reproducibility package.

Route to references:

- Standard workflow: `references/meta-analysis-workflow.md`.
- Umbrella review / second-order meta-analysis: `references/second-order-meta.md`.
- Meta-analysis + machine learning: `references/meta-ml.md`.

## Output Modes

### Protocol Draft

Create a protocol with:

- question;
- eligibility criteria;
- databases;
- search strings;
- screening procedure;
- coding variables;
- effect-size plan;
- synthesis model;
- heterogeneity and bias diagnostics;
- reproducibility plan.

Use `templates/meta-analysis-protocol.md` when a full protocol is requested.

### Analysis Plan

Create:

```text
Effect size → Model → Heterogeneity → Bias check → Sensitivity → Interpretation
```

### Reviewer Audit

Check:

- search completeness;
- double screening;
- effect-size comparability;
- dependent effects;
- risk-of-bias handling;
- publication bias;
- overclaiming;
- reproducibility of extraction and code.

## Guardrails

- Do not invent included studies or effect sizes.
- Do not treat meta-regression as causal unless the design supports it.
- Do not average incompatible outcomes without a defensible mapping.
- Do not ignore dependence among multiple effects from the same study.
- Do not use ML-selected moderators as confirmatory without validation.
- Do not call an umbrella review a second-order meta-analysis unless it synthesizes meta-analytic estimates or reviews with overlap handled explicitly.

