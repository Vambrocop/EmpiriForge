# EmpiriForge｜实证研究熔炉

**Agent Skills for empirical research, causal inference, and reproducible economics writing.**  
**面向实证研究、因果推断与经济学论文写作的可复现 AI Skills 工作流。**

EmpiriForge turns research experience into reusable agent skills: research questions, literature maps, identification strategies, data workflows, regression tables, robustness checks, reproducibility packages, and reviewer-style audits.

EmpiriForge 的目标不是再写一套“论文写作提示词”，而是把实证研究中的隐性经验锻造成可安装、可审计、可复用的 `SKILL.md` 工作流。

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
│   └── empirical-research-forge/
│       ├── SKILL.md
│       ├── references/
│       │   ├── economics-workflow.md
│       │   ├── identification-checklist.md
│       │   └── reproducibility-package.md
│       └── templates/
│           └── research-audit-report.md
├── docs/
│   ├── Scaling_Reproducibility_中文翻译.md
│   ├── Scaling_Reproducibility_中文解读.md
│   └── Scaling_Reproducibility_可提炼skills.md
└── examples/
    └── example-prompts.md
```

## Core Skill

The first skill is:

```text
empirical-research-forge
```

Use it when you want an AI agent to help with:

- writing or reviewing an empirical economics paper;
- designing DID, IV, RDD, event-study, panel, or causal ML workflows;
- checking whether claims, tables, and identification assumptions line up;
- preparing reproducible code/data packages;
- converting a research process into reusable skills.

## 中文定位

EmpiriForge 可以理解为：

> 实证研究熔炉：把研究想法、文献定位、识别策略、数据处理、回归结果、稳健性检验、论文写作和复现包整理，锻造成可复用的 AI Agent Skills。

它优先服务中文研究者，但保留英文输出能力，适合双语论文笔记、英文投稿、中文解释和 GitHub 发布。

## Install Locally

For Codex:

```powershell
Copy-Item -Recurse ".\skills\empirical-research-forge" "$env:USERPROFILE\.codex\skills\empirical-research-forge"
```

For Claude Code:

```bash
cp -r skills/empirical-research-forge ~/.claude/skills/empirical-research-forge
```

Then ask your agent:

```text
Use empirical-research-forge to audit my DID paper draft and replication package.
```

## Roadmap

- `econ-identification-skeptic`: identification and robustness reviewer for economics papers.
- `replication-package-janitor`: prepare and repair reproducibility packages.
- `causal-diagnostics-runner`: deterministic diagnostics for IV, DID, RDD, and event studies.
- `paper-journalist`: structured writing and audit reports.
- `meta-analysis-forge`: systematic review, meta-analysis, and second-order meta-analysis workflow.
- `omics-workflow-forge`: genomics, transcriptomics, single-cell, and multi-omics analysis workflow.

## Status

This is an initial research-skill scaffold inspired by the workflow paper. The first version focuses on process quality and reproducible research discipline. Deterministic analysis scripts can be added later.

