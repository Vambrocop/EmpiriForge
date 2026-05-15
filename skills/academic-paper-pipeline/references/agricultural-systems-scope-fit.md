# Agricultural Systems Scope-Fit Audit

Use this reference when a paper, proposal, or idea is about agriculture but may be too narrow for an agricultural-systems journal or systems-oriented audience.

## Running Source

Timsina, J., van Wijk, M., Devkota, K., Schut, A. G. T., Parra-Lopez, C., Martin, G., et al. (2026). *Evolving perspectives on agricultural systems research: Contemporary trends and editorial directions*. *Agricultural Systems*, Article 104796. DOI: `10.1016/j.agsy.2026.104796`.

Public journal scope information for *Agricultural Systems* emphasizes research on interactions within agricultural systems, interactions between agricultural and other systems, and whole-farm or landscape-level questions.

## Core Lesson

Agricultural systems research is moving from isolated model or method development toward decision-relevant system analysis.

The central question is not:

```text
Did this method, treatment, or model work?
```

The stronger systems question is:

```text
How does this intervention, technology, model, or decision change interactions among production, resources, environment, economics, management, and policy at a farm, landscape, regional, or food-system scale?
```

## Why This Matters

Many agricultural manuscripts are technically sound but weakly positioned for systems journals because they are:

- single-crop trials with only yield reporting;
- model-comparison papers that stop at accuracy metrics;
- machine-learning papers with no management or decision interpretation;
- LCA or farm-typology papers that remain descriptive;
- economic regressions that do not connect back to farm-system mechanisms;
- technology or equipment papers without whole-system relevance.

The manuscript may still be valuable, but it needs either a different journal target or a stronger systems framing.

## Scope-Fit Gates

A systems-oriented agricultural paper should usually pass most of these gates:

1. **System boundary**: define the farm, landscape, region, value chain, or food-system boundary.
2. **System components**: identify production, soil, water, climate, management, economics, policy, or technology components.
3. **Interactions**: show how components influence one another.
4. **Scale**: explain whether the inference is plot, farm, landscape, regional, or policy scale.
5. **Trade-offs**: evaluate at least two outcomes such as yield, profit, resource use, emissions, biodiversity, resilience, or adoption.
6. **Decision relevance**: identify who can use the result: farmers, advisers, policy makers, supply chains, or system designers.
7. **Method fit**: connect models, AI, LCA, economics, or experiments to a system question rather than presenting them as ends in themselves.
8. **Implementation realism**: discuss constraints, adoption, uncertainty, or transition costs where relevant.

## AI, Remote Sensing, and Digital Agriculture

For AI or digital-agriculture manuscripts, systems fit requires more than predictive accuracy.

Ask:

- What decision does the model support?
- Which agricultural-system component changes because of the information?
- Does the model reveal a production-resource-environment trade-off?
- Does it generalize across farms, seasons, regions, or management regimes?
- Are adoption, equity, farmer behavior, or policy implications visible?

If the answer is only "the algorithm predicts yield better," the manuscript is probably a prediction-method paper rather than an agricultural-systems paper.

## LCA, TEA, and Sustainability Assessment

LCA, TEA, and farm-typology papers can fit agricultural-systems journals when they are embedded in:

- scenario analysis;
- multi-criteria assessment;
- farm or landscape decision support;
- policy evaluation;
- technology adoption or transition pathways;
- trade-off analysis among production, environment, profit, and resilience.

Descriptive accounting alone is usually weaker.

## Introduction Reframing Pattern

Weak generic framing:

```text
This study applies machine learning to predict crop yield.
```

Systems framing:

```text
This study evaluates whether machine-learning yield prediction can support irrigation, input allocation, or risk-management decisions across heterogeneous farm contexts, and examines the trade-off between production gains, resource use, and decision uncertainty.
```

Weak generic framing:

```text
This study tests whether a soil amendment increases yield.
```

Systems framing:

```text
This study evaluates how a soil amendment changes yield formation, water retention, nutrient dynamics, profitability, and adoption-relevant constraints within a specific production system.
```

## Desk-Reject Risk Signals

Flag high risk when the manuscript:

- has no explicit system boundary;
- studies one treatment and one outcome only;
- reports model accuracy without agronomic interpretation;
- treats social or economic context as an afterthought;
- uses "sustainability" language but measures only one dimension;
- lacks trade-off, scenario, resilience, adoption, or decision relevance;
- could be moved to a methods, crop, remote-sensing, or economics journal without changing the introduction.

## Output Prompt

```text
Use academic-paper-pipeline to run an Agricultural Systems scope-fit audit.

Paper idea/draft:
Target journal:
Methods:
Outcomes:
Decision audience:

Return:
1. current scope-fit verdict;
2. desk-reject risk signals;
3. missing system components;
4. how to reframe the Introduction;
5. which journal family fits if Agricultural Systems is not right.
```

## Source Links

- Editorial DOI: https://doi.org/10.1016/j.agsy.2026.104796
- Agricultural Systems journal page: https://www.sciencedirect.com/journal/agricultural-systems
