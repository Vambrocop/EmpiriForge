# EmpiriForge - 实证研究熔炉

**From empirical papers to reproducible agent skills.**
**Agent skills for empirical economics, causal inference, and reproducible research writing.**

EmpiriForge turns empirical research practice into reusable AI-agent workflows: research questions, contribution framing, identification strategies, data workflows, regression tables, robustness checks, reproducibility packages, and reviewer-style audits.

中文理解：EmpiriForge 是“实证研究熔炉”。它不是一组泛泛的论文写作提示词，而是把实证经济学研究中的隐性经验锻造成可安装、可审计、可复用的 `SKILL.md` 工作流。

## What This Is

EmpiriForge focuses on original empirical research, especially applied economics and quantitative social science.

Use it for:

- empirical economics paper planning and revision;
- DID, IV, RDD, event-study, panel FE, synthetic-control, matching, and causal ML design review;
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

Core skill:

```text
empirical-research-forge
```

Specialized companion skill:

```text
econ-identification-skeptic
```

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

The repository does not replace econometrics textbooks, journal policies, or human peer review. Its purpose is to make those standards easier to apply repeatedly.

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
Copy-Item -Recurse ".\skills\econ-identification-skeptic" "$env:USERPROFILE\.codex\skills\econ-identification-skeptic"
Copy-Item -Recurse ".\skills\stata-econometrics-runner" "$env:USERPROFILE\.codex\skills\stata-econometrics-runner"
```

For Claude Code:

```bash
cp -r skills/empirical-research-forge ~/.claude/skills/empirical-research-forge
cp -r skills/econ-identification-skeptic ~/.claude/skills/econ-identification-skeptic
cp -r skills/stata-econometrics-runner ~/.claude/skills/stata-econometrics-runner
```

Then ask your agent:

```text
Use empirical-research-forge to audit my DID paper draft and replication package.
```

For Stata projects:

```text
Use stata-econometrics-runner to map this Stata replication package, run the master do-file if Stata is available, and summarize log/output mismatches.
```

## Roadmap

- `replication-package-janitor`: prepare and repair reproducibility packages.
- `causal-diagnostics-runner`: deterministic diagnostics for IV, DID, RDD, and event studies.
- `stata-econometrics-runner`: Stata `.do`/`.log` workflow for empirical replication. Added.
- `paper-journalist`: structured writing, contribution framing, and revision response.
- optional deterministic scripts for table matching, code inventory, and output verification.

Companion project:

- [EvidenceForge](https://github.com/Vambrocop/EvidenceForge): systematic review, meta-analysis, umbrella review, second-order meta-analysis, and AI-assisted evidence synthesis.

## Status

This is an early research-skill scaffold. The first version focuses on process quality, identification discipline, reproducible research, and bilingual research writing. Deterministic analysis scripts can be added later.
