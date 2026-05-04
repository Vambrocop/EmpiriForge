# Source Crosswalk

This crosswalk explains how each EmpiriForge skill uses the method sources. It helps future contributors extend the repository without turning it into an unfocused pile of prompts.

| Repository artifact | Main source families | What the source changes in the workflow |
|---|---|---|
| `academic-paper-pipeline` | Academic writing skill-stack patterns; reproducible manuscript delivery; EmpiriForge/EvidenceForge routing | Creates the topic-manuscript-delivery ledger and routes proposal, writing, analysis, figures, and delivery tasks to the smallest useful skill stack. |
| `empirical-research-forge` | Scaling Reproducibility; applied econometrics; AEA/DIME transparency | Creates the research ledger, routes to references, separates code execution from causal credibility, and produces audit artifacts. |
| `econ-identification-skeptic` | Angrist and Pischke; Cunningham; Hernan and Robins; Imbens and Rubin | Forces estimand, variation, assumptions, diagnostics, and non-testable threats to be named before writing becomes polished. |
| `causal-ml-estimator-selector` | Potential outcomes; heterogeneous treatment effects; CausalML/causal-inference software docs; causal GNNs; perturbation prediction; mechanism identification; causal-invariant prediction boundary cases | Selects S/T/X/R/DR learners, uplift methods, IV-style estimators, causal-GNN audit modes, and validation plans only after design assumptions, graph semantics, feature timing, overlap, and policy or intervention use are explicit; routes stable prediction to `prediction-modeling-forge` unless a treatment effect is actually defined. |
| `prediction-modeling-forge` | Predictive modeling practice; tidymodels workflows; PLS/VIP for small-sample correlated predictors; bootstrap uncertainty; stable carbon-emission forecasting; model-performance validation | Separates training/tuning/test evaluation, reports discrimination and calibration, uses PLS/VIP only as predictive screening after component selection and scaling, uses bootstrap only after choosing the correct resampling unit, and requires out-of-environment validation for cross-region, cross-industry, cross-policy, or future-period prediction claims. |
| `publication-figure-forge` | Scientific visualization practice; journal figure requirements; R/ggplot2 workflows; corrplot correlation matrices | Turns analysis outputs into submission-ready figures with explicit font, theme, units, color, export, panel, correlation method, p-value correction, and reviewer-check requirements. |
| `stata-econometrics-runner` | Stata replication practice; AEA/DIME reproducibility; applied econometrics; agent workflow setup | Maps `.do` files, runs Stata when available, audits logs and outputs, handles Stata/PDF friction, and routes econometric concerns back to identification review. |
| `docs/knowledge-graph-navigation.md` | Graphify-style repository and corpus graph navigation | Uses `GRAPH_REPORT.md` and focused graph queries to locate relevant scripts, notes, tables, figures, and method references before raw file reading; does not judge identification, reproducibility, prediction validity, or causality. |
| `references/economics-workflow.md` | Applied economics paper conventions; impact-evaluation practice | Converts a paper into gates: question, contribution, setting, data, identification, estimation, results, threats, reproducibility. |
| `references/identification-checklist.md` | DID/IV/RDD/synthetic-control/matching/causal-ML methods | Maps each design to its core assumptions, diagnostics, and reviewer pressure points. |
| `references/reproducibility-package.md` | AEA Data and Code Policy; DIME Analytics; J-PAL data publication | Defines a minimum replication-package structure, README expectations, restricted-data handling, and output verification. |
| `references/research-transparency.md` | BITSS; AEA; DIME; J-PAL | Adds preregistration, deviations, data provenance, code review, AI-use disclosure, and ethical constraints. |
| `templates/research-audit-report.md` | All of the above | Produces one structured report that distinguishes reproducibility, identification, writing, and next actions. |

## Design Boundary

EmpiriForge does not own systematic reviews or meta-analysis. Those live in [EvidenceForge](https://github.com/Vambrocop/EvidenceForge).

EmpiriForge owns original empirical research workflows:

- "How do I move this paper from idea to manuscript to delivery?"
- "Can this DID/IV/RDD claim be defended?"
- "Can this table be regenerated?"
- "Does the paper's contribution match the evidence?"
- "What would a skeptical economics referee attack?"
- "What should be in the replication package?"
- "Can this Stata replication package run and regenerate the expected outputs?"
- "Which causal-ML estimator family matches this estimand and assignment mechanism?"
- "Is this causal-GNN paper really estimating interventions, or only using graph structure for robust prediction?"
- "Can this figure pass basic journal and reviewer checks?"
- "Can this correlation matrix show associations clearly without overclaiming causality?"
- "How uncertain is this AUC, prediction, fitted curve, or model-performance metric?"
- "Will this carbon-emission forecast remain stable under new regions, industries, firms, policy phases, or future periods?"

EvidenceForge owns evidence synthesis workflows:

- "How should this systematic review search, screen, and extract studies?"
- "How should this meta-analysis estimate pooled effects and heterogeneity?"
- "How should an umbrella or second-order meta-analysis judge evidence quality?"
