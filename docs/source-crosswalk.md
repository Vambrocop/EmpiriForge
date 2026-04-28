# Source Crosswalk

This crosswalk explains how each EmpiriForge skill uses the method sources. It helps future contributors extend the repository without turning it into an unfocused pile of prompts.

| Repository artifact | Main source families | What the source changes in the workflow |
|---|---|---|
| `empirical-research-forge` | Scaling Reproducibility; applied econometrics; AEA/DIME transparency | Creates the research ledger, routes to references, separates code execution from causal credibility, and produces audit artifacts. |
| `econ-identification-skeptic` | Angrist and Pischke; Cunningham; Hernan and Robins; Imbens and Rubin | Forces estimand, variation, assumptions, diagnostics, and non-testable threats to be named before writing becomes polished. |
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

EvidenceForge owns evidence synthesis workflows:

- "How should this systematic review search, screen, and extract studies?"
- "How should this meta-analysis estimate pooled effects and heterogeneity?"
- "How should an umbrella or second-order meta-analysis judge evidence quality?"
