# EmpiriForge - 实证研究熔炉

**From empirical papers to reproducible agent skills.**
**Agent skills for empirical economics, causal inference, and reproducible research writing.**

EmpiriForge turns empirical research practice into reusable AI-agent workflows: research questions, contribution framing, identification strategies, data workflows, regression tables, robustness checks, reproducibility packages, and reviewer-style audits.

中文理解：EmpiriForge 是“实证研究熔炉”。它不是一组泛泛的论文写作提示词，而是把实证经济学研究中的隐性经验锻造成可安装、可审计、可复用的 `SKILL.md` 工作流。

## What This Is

EmpiriForge focuses on original empirical research, especially applied economics and quantitative social science.

Use it for:

- academic paper production from topic/proposal to manuscript and delivery;
- empirical economics paper planning and revision;
- DID, IV, RDD, event-study, panel FE, synthetic-control, matching, and causal ML design review;
- CATE/ITE/uplift estimation planning, causal-GNN audits, graph-based perturbation prediction, and causal-ML validation;
- machine-learning prediction-model papers with tidymodels, random forest, XGBoost, logistic baselines, PLS/VIP models, stable carbon-emission forecasting, distribution-shift validation, ROC/AUC, calibration, decision curves, and leakage checks;
- bootstrap uncertainty for standard errors, confidence intervals, prediction bands, AUC intervals, and model-robustness checks;
- publication-ready R figures, correlation matrices, corrplot correlograms, journal visualization standards, and reviewer-proof figure audits;
- separating identification credibility from code reproducibility;
- building replication packages and pre-submission audits;
- turning repeated research routines into reusable agent skills.

For systematic reviews, meta-analysis, umbrella reviews, second-order meta-analysis, or AI-assisted evidence synthesis, use the companion project [EvidenceForge](https://github.com/Vambrocop/EvidenceForge).

## Why This Exists

Modern empirical research has two bottlenecks:

1. The intellectual bottleneck: clarifying the research question, contribution, estimand, identification assumptions, and interpretation.
2. The operational bottleneck: cleaning data, running code, reproducing tables, checking diagnostics, and preparing replication packages.

Large language models are most useful when they sit inside a controlled workflow: they coordinate, inspect, route tasks, draft reports, and keep a research ledger. Deterministic code should still own numerical computation. Human researchers should still own scientific judgment.

This repository is inspired by *Scaling Reproducibility: An AI-Assisted Workflow for Large-Scale Replication and Reanalysis*: separate orchestration, skill memory, deterministic execution, and human review.

## Included Skills

```text
EmpiriForge/
  skills/
    academic-paper-pipeline/
      SKILL.md
      references/
        paper-skill-stack.md
      templates/
        paper-production-ledger.md
        submission-delivery-checklist.md
    empirical-research-forge/
      SKILL.md
      references/
        economics-workflow.md
        identification-checklist.md
        method-source-map.md
        reproducibility-package.md
        research-transparency.md
      templates/
        research-audit-report.md
    econ-identification-skeptic/
      SKILL.md
      references/
        design-diagnostics.md
        identification-decision-rules.md
    causal-ml-estimator-selector/
      SKILL.md
      references/
        causal-gnn.md
        causal-ml-toolkit.md
      templates/
        causal-gnn-audit.md
        causal-ml-design-card.md
        causal-ml-validation-plan.csv
        graph-causal-validation-schema.csv
    prediction-modeling-forge/
      SKILL.md
      references/
        bootstrap-uncertainty.md
        pls-vip-modeling.md
        stable-carbon-emission-forecasting.md
        tidymodels-prediction-workflow.md
      templates/
        bootstrap-uncertainty-audit.md
        pls-vip-audit.md
        prediction-model-audit.md
        prediction-model-reporting-checklist.csv
        stable-environment-validation-schema.csv
        stable-time-series-prediction-audit.md
      scripts/
        bootstrap_metric_ci.py
        pls_vip_template.R
        tidymodels_binary_classification_template.R
    publication-figure-forge/
      SKILL.md
      references/
        correlation-plot-playbook.md
        figure-type-playbook.md
        journal-figure-standards.md
      templates/
        correlation-plot-audit.md
        costar-figure-prompt.md
        figure-review-checklist.md
      scripts/
        corrplot_correlation_template.R
        publication_theme.R
    stata-econometrics-runner/
      SKILL.md
      references/
        pdf-docs-and-manuals.md
        stata-replication.md
        windows-stata.md
      templates/
        empirical-project-context.md
        stata-run-report.md
      scripts/
        find-stata.ps1
  docs/
    method-sources.md
    source-crosswalk.md
    reading-list.md
    Scaling_Reproducibility_中文翻译.md
    Scaling_Reproducibility_中文解读.md
    Scaling_Reproducibility_可提炼skills.md
  examples/
    example-prompts.md
    demo-audit-report.md
```

Pipeline skill:

```text
academic-paper-pipeline
```

Core empirical skill:

```text
empirical-research-forge
```

Specialized companion skill:

```text
econ-identification-skeptic
```

Specialized causal-ML skill:

```text
causal-ml-estimator-selector
```

It also audits causal GNN papers: graph-based therapeutic perturbation prediction, LLM-enhanced GNN mechanism analysis, causal disentangled graphs, and fault-diagnosis causal subgraphs.

Prediction-modeling skill:

```text
prediction-modeling-forge
```

PLS/VIP, bootstrap uncertainty, and stable prediction are part of `prediction-modeling-forge`, not separate repositories. Use it when a model paper needs small-sample correlated-predictor modeling, VIP ranking, confidence intervals, prediction bands, uncertainty around AUC or fitted values, or cross-region/cross-industry/cross-policy validation for time-series forecasts such as enterprise carbon emissions.

Publication-figure skill:

```text
publication-figure-forge
```

It includes a corrplot-based correlation-matrix workflow with nine reusable variants: pie, mixed circle/color, significance labels, ellipse, coefficient labels, lower triangle, circle significance, grayscale shade, and clustered rectangles.

Stata workflow skill:

```text
stata-econometrics-runner
```

## Method Grounding

EmpiriForge is method-aware, not method-omniscient. It is grounded in a small set of research traditions:

- AI-assisted reproducibility workflows;
- applied econometrics and causal inference;
- research transparency and replication-package standards;
- practical impact-evaluation resources.

See:

- [Method Sources](docs/method-sources.md)
- [Source Crosswalk](docs/source-crosswalk.md)
- [Reading List](docs/reading-list.md)
- [Stata Agent Workflow](docs/stata-agent-workflow.md)
- [Knowledge Graph Navigation](docs/knowledge-graph-navigation.md)

The repository does not replace econometrics textbooks, journal policies, or human peer review. Its purpose is to make those standards easier to apply repeatedly.

## Optional Knowledge Graph Navigation

Graphify can be used as an optional navigation layer for large empirical projects, replication packages, and notes folders. It helps an agent start from `GRAPH_REPORT.md` and focused graph queries before reading raw files. It does not replace EmpiriForge guardrails for identification, reproducibility, prediction validity, Stata execution, or figure review.

See [Knowledge Graph Navigation](docs/knowledge-graph-navigation.md).

## Quick Demo

```text
Input:
  A DID paper draft + regression tables + replication folder

Skills:
  empirical-research-forge
  econ-identification-skeptic

Output:
  Research ledger
  Identification audit
  Robustness checklist
  Reproducibility package review
  Reviewer-style action plan
```

Example prompt:

```text
Use empirical-research-forge and econ-identification-skeptic to audit my DID paper.
Separate code reproducibility from identification credibility.
```

## 中文定位

EmpiriForge 可以理解为：

> 面向经济学实证论文的 AI 研究工作流：把选题、文献定位、识别策略、数据处理、回归表、稳健性检验、复现包和审稿式批评组织成可复用的 agent skills。

它优先服务中文研究者，但保留英文输出能力，适合双语论文笔记、英文投稿、中文解释和 GitHub 发布。

## Install Locally

For Codex:

```powershell
Copy-Item -Recurse ".\skills\empirical-research-forge" "$env:USERPROFILE\.codex\skills\empirical-research-forge"
Copy-Item -Recurse ".\skills\academic-paper-pipeline" "$env:USERPROFILE\.codex\skills\academic-paper-pipeline"
Copy-Item -Recurse ".\skills\econ-identification-skeptic" "$env:USERPROFILE\.codex\skills\econ-identification-skeptic"
Copy-Item -Recurse ".\skills\causal-ml-estimator-selector" "$env:USERPROFILE\.codex\skills\causal-ml-estimator-selector"
Copy-Item -Recurse ".\skills\prediction-modeling-forge" "$env:USERPROFILE\.codex\skills\prediction-modeling-forge"
Copy-Item -Recurse ".\skills\publication-figure-forge" "$env:USERPROFILE\.codex\skills\publication-figure-forge"
Copy-Item -Recurse ".\skills\stata-econometrics-runner" "$env:USERPROFILE\.codex\skills\stata-econometrics-runner"
```

For Claude Code:

```bash
cp -r skills/empirical-research-forge ~/.claude/skills/empirical-research-forge
cp -r skills/academic-paper-pipeline ~/.claude/skills/academic-paper-pipeline
cp -r skills/econ-identification-skeptic ~/.claude/skills/econ-identification-skeptic
cp -r skills/causal-ml-estimator-selector ~/.claude/skills/causal-ml-estimator-selector
cp -r skills/prediction-modeling-forge ~/.claude/skills/prediction-modeling-forge
cp -r skills/publication-figure-forge ~/.claude/skills/publication-figure-forge
cp -r skills/stata-econometrics-runner ~/.claude/skills/stata-econometrics-runner
```

Then ask your agent:

```text
Use academic-paper-pipeline to move this project from proposal to manuscript and delivery.
```

For empirical research audits:

```text
Use empirical-research-forge to audit my DID paper draft and replication package.
```

For Stata projects:

```text
Use stata-econometrics-runner to map this Stata replication package, run the master do-file if Stata is available, and summarize log/output mismatches.
```

For causal ML projects:

```text
Use causal-ml-estimator-selector to choose between S/T/X/R/DR learners, uplift forests, and IV-style estimators for my treatment-effect project. Build a design card and validation plan.
```

For graph-based causal ML:

```text
Use causal-ml-estimator-selector to audit this causal-GNN paper. Separate graph semantics, intervention claims, proxy-graph assumptions, validation splits, and safe causal wording.
```

For publication figures:

```text
Use publication-figure-forge to turn this R data frame into a journal-ready scatterplot/boxplot/heatmap/KM curve. Include reviewer-proof checks and export as TIFF 300 DPI.
```

For correlation matrices:

```text
Use publication-figure-forge to make a corrplot correlation matrix from input.txt. Check whether rows are features or samples, use Spearman correlation with BH-adjusted p-values, and export a publication-ready PDF.
```

## Roadmap

- `replication-package-janitor`: prepare and repair reproducibility packages.
- `academic-paper-pipeline`: topic-manuscript-delivery orchestration. Added.
- `causal-diagnostics-runner`: deterministic diagnostics for IV, DID, RDD, and event studies.
- `causal-ml-estimator-selector`: CATE/ITE/uplift estimator choice, causal-GNN audit, validation workflow, and boundary checks between treatment-effect estimation and causal-invariant prediction. Added.
- `stata-econometrics-runner`: Stata `.do`/`.log` workflow for empirical replication. Added.
- `paper-journalist`: structured writing, contribution framing, and revision response.
- `publication-figure-forge`: R/ggplot2 and corrplot journal-ready visualization workflow, including correlation matrices and reviewer-proof figure audits. Added.
- `prediction-modeling-forge`: prediction modeling plus bootstrap uncertainty, stable time-series prediction, and distribution-shift validation for model-performance intervals and fitted-value uncertainty. Added.
- optional deterministic scripts for table matching, code inventory, and output verification.

Companion project:

- [EvidenceForge](https://github.com/Vambrocop/EvidenceForge): systematic review, meta-analysis, umbrella review, second-order meta-analysis, and AI-assisted evidence synthesis.

## Status

This is an early research-skill scaffold. The first version focuses on process quality, identification discipline, reproducible research, and bilingual research writing. Deterministic analysis scripts can be added later.
