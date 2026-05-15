---
name: academic-paper-pipeline
description: Orchestrates academic paper production from topic/proposal to manuscript, analysis, figures, submission files, and defense slides. Use for research-proposal planning, paper architecture, section-by-section drafting, evidence-gap tracking, statistical handoff, figure handoff, DOCX/PDF/LaTeX/PPTX delivery, revision workflows, and coordinating multiple research-writing skills without losing the paper ledger.
---

# Academic Paper Pipeline

Use this skill when the user wants to move an academic paper through the whole production line: topic, proposal, structure, draft, evidence, analysis, figures, submission package, and presentation.

## Core Principle

Keep the paper moving through three nodes:

1. **Topic**: question, contribution, feasibility, literature gap.
2. **Manuscript**: structure, evidence, methods, results, interpretation.
3. **Delivery**: Word/PDF/LaTeX/PPTX, figures, tables, appendices, response files.

Do not polish prose before the research ledger is coherent. Do not generate delivery files before evidence, figures, tables, and claims are checked.

## Intake

Identify:

- current stage: proposal, outline, drafting, analysis, figures, submission, revision, or defense;
- discipline and target journal if known;
- paper type: empirical paper, systematic review, meta-analysis, clinical paper, omics paper, methods paper, thesis, or proposal;
- language: Chinese, English, or bilingual;
- available files: draft, notes, data, code, figures, tables, references, journal instructions;
- target artifact: proposal, manuscript outline, full draft, revision plan, DOCX, PDF, LaTeX, PPTX, or checklist.

Load:

- `references/paper-skill-stack.md` for external and internal skill routing.
- `references/agricultural-systems-scope-fit.md` when an agricultural, digital-agriculture, AI, remote-sensing, LCA, farm-systems, or agronomic paper needs a systems-journal scope-fit audit.
- `templates/paper-production-ledger.md` to track the paper from idea to delivery.
- `templates/agricultural-systems-scope-fit-audit.md` when judging whether a manuscript has enough system boundary, interaction, trade-off, and decision relevance for an agricultural-systems journal.
- `templates/submission-delivery-checklist.md` before final submission or defense.

Route internally:

- empirical design or reproducibility: `empirical-research-forge`;
- identification critique: `econ-identification-skeptic`;
- causal ML: `causal-ml-estimator-selector`;
- Stata/code package: `stata-econometrics-runner`;
- publication figures: `publication-figure-forge`;
- systematic review/meta-analysis: use EvidenceForge.

## Workflow

1. Build or update the paper production ledger.
2. Name the target artifact and deadline.
3. Check whether the research question and contribution are stable.
4. Create the manuscript architecture before drafting.
5. Track every claim to evidence, table, figure, citation, or planned analysis.
6. Route data/statistics/figures to the right skill or tool.
7. Draft section by section, keeping `[evidence needed]` markers visible.
8. Run a pre-submission audit: claims, methods, results, figures, references, reproducibility, formatting.
9. Create delivery files only after content gates pass.
10. For defense, convert the paper ledger into a slide narrative.

## Output Modes

### Pipeline Plan

```text
Stage:
Target artifact:
Current blocker:
Next three actions:
Skill/tool route:
Expected output:
```

### Paper Ledger

Use `templates/paper-production-ledger.md`.

### Delivery Checklist

Use `templates/submission-delivery-checklist.md`.

### Skill Stack Recommendation

```text
Task:
Primary skill:
Supporting skill:
Why:
What to provide:
What not to ask yet:
```

### Agricultural Systems Scope-Fit Audit

Use `templates/agricultural-systems-scope-fit-audit.md` when the paper risks being a tool, model, single-trial, or single-outcome paper rather than a systems paper.

## Guardrails

- Do not invent citations, results, methods, or journal requirements.
- Do not let a writing skill hide missing evidence.
- Do not treat grammar polish as scientific revision.
- Do not generate submission files before figures/tables/citations are stable.
- Do not route a meta-analysis to an empirical-paper workflow; use EvidenceForge instead.
- Do not route identification critique to a generic writing workflow.
- Do not overinstall skills; choose the few needed for the current stage.
- Do not call an agricultural manuscript systems-oriented unless it makes the system boundary, interactions, trade-offs, scale, and decision relevance visible.
