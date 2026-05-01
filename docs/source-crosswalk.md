# Source Crosswalk

This crosswalk explains how each EmpiriForge skill uses the method sources. It helps future contributors extend the repository without turning it into an unfocused pile of prompts.

| Repository artifact | Main source families | What the source changes in the workflow |
|---|---|---|
| `empirical-research-forge` | Scaling Reproducibility; applied econometrics; AEA/DIME transparency | Creates the research ledger, routes to references, separates code execution from causal credibility, and produces audit artifacts. |
| `econ-identification-skeptic` | Angrist and Pischke; Cunningham; Hernan and Robins; Imbens and Rubin | Forces estimand, variation, assumptions, diagnostics, and non-testable threats to be named before writing becomes polished. |
| `causal-ml-estimator-selector` | Potential outcomes; heterogeneous treatment effects; CausalML/causal-inference software docs | Selects S/T/X/R/DR learners, uplift methods, IV-style estimators, and validation plans only after design assumptions, feature timing, overlap, and policy use are explicit. |
| `publication-figure-forge` | Scientific visualization practice; journal figure requirements; R/ggplot2 workflows | Turns analysis outputs into submission-ready figures with explicit font, theme, units, color, export, panel, and reviewer-check requirements. |
| `stata-econometrics-runner` | Stata replication practice; AEA/DIME reproducibility; applied econometrics; agent workflow setup | Maps `.do` files, runs Stata when available, audits logs and outputs, handles Stata/PDF friction, and routes econometric concerns back to identification review. |
| `references/economics-workflow.md` | Applied economics paper conventions; impact-evaluation practice | Converts a paper into gates: question, contribution, setting, data, identification, estimation, results, threats, reproducibility. |
| `references/identification-checklist.md` | DID/IV/RDD/synthetic-control/matching/causal-ML methods | Maps each design to its core assumptions, diagnostics, and reviewer pressure points. |
| `references/reproducibility-package.md` | AEA Data and Code Policy; DIME Analytics; J-PAL data publication | Defines a minimum replication-package structure, README expectations, restricted-data handling, and output verification. |
| `references/research-transparency.md` | BITSS; AEA; DIME; J-PAL | Adds preregistration, deviations, data provenance, code review, AI-use disclosure, and ethical constraints. |
| `templates/research-audit-report.md` | All of the above | Produces one structured report that distinguishes reproducibility, identification, writing, and next actions. |

## Design Boundary

EmpiriForge does not own systematic reviews or meta-analysis. Those live in [EvidenceForge](https://github.com/Vambrocop/EvidenceForge).

EmpiriForge owns original empirical research workflows:

- "Can this DID/IV/RDD claim be defended?"
- "Can this table be regenerated?"
- "Does the paper's contribution match the evidence?"
- "What would a skeptical economics referee attack?"
- "What should be in the replication package?"
- "Can this Stata replication package run and regenerate the expected outputs?"
- "Which causal-ML estimator family matches this estimand and assignment mechanism?"
- "Can this figure pass basic journal and reviewer checks?"

EvidenceForge owns evidence synthesis workflows:

- "How should this systematic review search, screen, and extract studies?"
- "How should this meta-analysis estimate pooled effects and heterogeneity?"
- "How should an umbrella or second-order meta-analysis judge evidence quality?"
