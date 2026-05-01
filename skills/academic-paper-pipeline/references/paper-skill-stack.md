# Academic Paper Skill Stack

Use this reference to route academic-paper tasks across internal EmpiriForge/EvidenceForge skills and optional external skill repositories.

## Minimal Three-Node Pipeline

### 1. Topic

Goal:

- research question;
- contribution;
- literature gap;
- feasibility;
- proposal or opening memo.

Good outputs:

- proposal draft;
- research ledger;
- closest-paper map;
- evidence-gap list;
- data feasibility note.

EmpiriForge route:

- `academic-paper-pipeline` for orchestration;
- `empirical-research-forge` for empirical-paper ledger and contribution;
- EvidenceForge for systematic review/meta-analysis questions.

External ecosystem examples:

- `luwill/research-skills`: research proposal and slide-deck style skills.
- `kthorn/research-superpower`: literature-search oriented workflow ideas.

## 2. Manuscript

Goal:

- paper architecture;
- section-level drafting;
- methods/results alignment;
- tables and figures;
- claims tied to evidence.

Good outputs:

- manuscript outline;
- section drafts;
- evidence table;
- methods/results crosswalk;
- reviewer-risk list.

EmpiriForge route:

- `empirical-research-forge` for research ledger and manuscript audit;
- `econ-identification-skeptic` for causal designs;
- `causal-ml-estimator-selector` for CATE/ITE/uplift workflows;
- `publication-figure-forge` for journal-ready figures;
- `stata-econometrics-runner` for Stata replication packages.

External ecosystem examples:

- `lishix520/academic-paper-skills`: strategist/composer pattern for architecture and drafting.
- `K-Dense-AI/claude-scientific-writer`: scientific-writing polish patterns.
- `K-Dense-AI/claude-scientific-skills`: statistical-analysis and scientific-writing skill organization.

## 3. Delivery

Goal:

- DOCX;
- PDF;
- LaTeX;
- PPTX;
- supplement;
- replication package;
- response to reviewers.

Good outputs:

- submission folder;
- figure/table inventory;
- final manuscript;
- cover letter or response letter;
- defense slide deck;
- reproducibility archive.

EmpiriForge route:

- `academic-paper-pipeline` for delivery checklist;
- `publication-figure-forge` for figures;
- `empirical-research-forge` for pre-submission audit;
- `stata-econometrics-runner` for code/log review.

Tool/plugin route in Codex:

- Documents skill for DOCX creation/editing;
- Presentations skill for PPTX decks;
- PDF/document utilities when rendering or combining files;
- external LaTeX skill or local LaTeX workflow when the target journal requires TeX.

External ecosystem examples:

- `ndpvt-web/latex-document-skill`: LaTeX document workflow ideas.
- `tfriedel/claude-office-skills`: office document workflow ideas.
- official document/presentation/PDF skills where available in the agent environment.

## Routing Rules

- If the task is "make the paper make sense", start with the ledger.
- If the task is "write polished prose", first verify evidence and structure.
- If the task is "run statistics", route to a statistical or code skill and require logs.
- If the task is "make figures", route to `publication-figure-forge`.
- If the task is "submit", run the delivery checklist first.
- If the task is "defend", convert contribution, methods, evidence, and limitations into a slide narrative.

## Do Not Overinstall

Use a small stack:

- one orchestrator;
- one writing/structure skill;
- one analysis skill;
- one figure skill;
- one delivery tool.

Adding more skills can increase inconsistency unless each one owns a clear stage.
