# EmpiriForge｜实证研究熔炉

**From papers to reproducible agent skills.**  
**Agent Skills for empirical research, causal inference, and reproducible economics writing.**  
**面向实证研究、因果推断与经济学论文写作的可复现 AI Skills 工作流。**

EmpiriForge turns research experience into reusable agent skills: research questions, literature maps, identification strategies, data workflows, regression tables, robustness checks, reproducibility packages, and reviewer-style audits.

EmpiriForge 的目标不是再写一套“论文写作提示词”，而是把实证研究中的隐性经验锻造成可安装、可审计、可复用的 `SKILL.md` 工作流。

## Quick Demo

EmpiriForge is designed for concrete research audits, not generic writing advice.

```text
Input:
  A DID paper draft + regression tables + replication folder

Skill:
  empirical-research-forge

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

For evidence synthesis:

```text
Use EvidenceForge for systematic review, meta-analysis, umbrella review,
second-order meta-analysis, and AI-assisted evidence synthesis.
```

## Why This Exists

Modern empirical research has two bottlenecks:

1. The intellectual bottleneck: clarifying the research question, contribution, identification assumptions, and interpretation.
2. The operational bottleneck: cleaning data, running code, reproducing tables, checking diagnostics, and preparing replication packages.

Large language models are useful when they are placed inside a controlled workflow: they coordinate, inspect logs, route tasks, and draft reports. Deterministic code should still own numerical computation. Human researchers should still own scientific judgment.

This repository follows the architecture suggested by *Scaling Reproducibility: An AI-Assisted Workflow for Large-Scale Replication and Reanalysis*: separate orchestration, skill memory, deterministic execution, and human review.

## What Is Included

```text
EmpiriForge/
├── skills/
│   ├── empirical-research-forge/
│   │   ├── SKILL.md
│   │   ├── references/
│   │   │   ├── economics-workflow.md
│   │   │   ├── identification-checklist.md
│   │   │   └── reproducibility-package.md
│   │   └── templates/
│   │       └── research-audit-report.md
│   ├── econ-identification-skeptic/
│   │   ├── SKILL.md
│   │   └── references/
│   │       └── design-diagnostics.md
├── docs/
│   ├── Scaling_Reproducibility_中文翻译.md
│   ├── Scaling_Reproducibility_中文解读.md
│   ├── Scaling_Reproducibility_可提炼skills.md
│   └── Related_Academic_Skills_Ecosystem.md
└── examples/
    ├── example-prompts.md
    └── demo-audit-report.md
```

## Core Skill

The core skill is:

```text
empirical-research-forge
```

Use it when you want an AI agent to help with:

- writing or reviewing an empirical economics paper;
- designing DID, IV, RDD, event-study, panel, or causal ML workflows;
- checking whether claims, tables, and identification assumptions line up;
- preparing reproducible code/data packages;
- converting a research process into reusable skills.

Specialized skills:

- `econ-identification-skeptic`: a skeptical identification and robustness reviewer for applied economics papers.

For systematic reviews, meta-analysis, umbrella reviews, second-order meta-analysis, or AI-assisted evidence synthesis, use the companion repository [EvidenceForge](https://github.com/Vambrocop/EvidenceForge).

## 中文定位

EmpiriForge 可以理解为：

> 实证研究熔炉：把研究想法、文献定位、识别策略、数据处理、回归结果、稳健性检验、论文写作和复现包整理，锻造成可复用的 AI Agent Skills。

它优先服务中文研究者，但保留英文输出能力，适合双语论文笔记、英文投稿、中文解释和 GitHub 发布。

## Install Locally

For Codex:

```powershell
Copy-Item -Recurse ".\skills\empirical-research-forge" "$env:USERPROFILE\.codex\skills\empirical-research-forge"
Copy-Item -Recurse ".\skills\econ-identification-skeptic" "$env:USERPROFILE\.codex\skills\econ-identification-skeptic"
```

For Claude Code:

```bash
cp -r skills/empirical-research-forge ~/.claude/skills/empirical-research-forge
cp -r skills/econ-identification-skeptic ~/.claude/skills/econ-identification-skeptic
```

Then ask your agent:

```text
Use empirical-research-forge to audit my DID paper draft and replication package.
```

Need evidence synthesis? Use [EvidenceForge](https://github.com/Vambrocop/EvidenceForge).

## Roadmap

- `econ-identification-skeptic`: identification and robustness reviewer for economics papers. Added.
- `replication-package-janitor`: prepare and repair reproducibility packages.
- `causal-diagnostics-runner`: deterministic diagnostics for IV, DID, RDD, and event studies.
- `paper-journalist`: structured writing and audit reports.

Companion project:

- [EvidenceForge](https://github.com/Vambrocop/EvidenceForge): systematic review, meta-analysis, umbrella review, second-order meta-analysis, and AI-assisted evidence synthesis.

## Status

This is an initial research-skill scaffold inspired by the workflow paper. The first version focuses on process quality and reproducible research discipline. Deterministic analysis scripts can be added later.
