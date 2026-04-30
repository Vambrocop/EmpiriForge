---
name: empirical-research-forge
description: Orchestrates bilingual empirical research workflows from research question to reproducible paper package. Use when writing, reviewing, replicating, or packaging empirical economics/social-science papers; designing DID, IV, RDD, event-study, panel, synthetic-control, matching, or causal ML workflows; auditing tables and identification claims; checking method-source alignment; or turning research practice into reusable agent skills.
---

# Empirical Research Forge - 实证研究熔炉

Use this skill to guide an empirical research project through a disciplined, auditable workflow. Answer in the user's language by default, but preserve standard technical terms such as `DID`, `IV`, `RDD`, `event study`, `fixed effects`, `clustered SE`, `replication package`, and `identification`.

## Core Principle

Separate five things:

1. **Scientific judgment**: research question, contribution, estimand, identification assumptions, interpretation.
2. **Operational execution**: data cleaning, code running, table generation, file packaging.
3. **Verification**: checking whether outputs match claims, tables, code, and logs.
4. **Transparency**: documenting data access, deviations, restrictions, AI use, and reproducibility barriers.
5. **Writing**: turning verified evidence into a paper, report, memo, or reviewer response.

Never treat a successful code run as proof that an identification strategy is credible. Never treat fluent writing as proof that the evidence is correct.

## Intake

First identify the user's current stage:

- `idea`: vague topic, needs research question and contribution.
- `literature`: needs literature map, gap, or closest-paper comparison.
- `identification`: needs DID, IV, RDD, event-study, panel, matching, synthetic control, or causal ML design.
- `data`: needs data structure, variables, cleaning, missingness, sample construction, or provenance.
- `estimation`: needs regression specification, table plan, diagnostics, or robustness checks.
- `writing`: needs abstract, introduction, methods, results, conclusion, or revision.
- `replication`: needs code/data packaging, reproducibility check, README, environment, or run order.
- `review`: needs pre-submission audit, referee simulation, or response strategy.
- `skill-building`: wants to convert a workflow into reusable `SKILL.md` files.

If files are available, inspect them before advising. If only a concept is available, build a concrete scaffold the user can react to.

## Workflow

### 1. Build the Research Ledger

Create or infer a compact ledger:

- research question;
- one-sentence contribution;
- target literature;
- unit of observation;
- treatment/exposure;
- outcome;
- data source and data-access status;
- estimand;
- identification strategy;
- source of identifying variation;
- main specification;
- expected tables/figures;
- current evidence;
- unresolved risks.

For drafts, extract this ledger from the manuscript. For code projects, extract it from scripts, README, filenames, and outputs.

### 2. Route to the Right Reference

Load only the reference needed for the task:

- For full empirical paper workflows, read `references/economics-workflow.md`.
- For DID, IV, RDD, event studies, panel FE, matching, synthetic control, or causal ML, read `references/identification-checklist.md`.
- For causal ML estimator choice, heterogeneous treatment effects, uplift, or Python causal-inference packages, use the companion skill `causal-ml-estimator-selector`.
- For method-source grounding, read `references/method-source-map.md`.
- For replication packages, reproducibility reports, or submission preparation, read `references/reproducibility-package.md`.
- For preregistration, deviations, data provenance, AI-use disclosure, or open-science issues, read `references/research-transparency.md`.

Do not load all references by default.

### 3. Separate Claims From Evidence

For every important claim, identify:

- the table/figure/model that supports it;
- the code or data artifact that produces it, if available;
- the identification assumption it relies on;
- the method-source family that justifies the diagnostic or critique;
- the weakest point a skeptical reviewer would attack.

If evidence is missing, mark it as a gap instead of filling it with prose.

### 4. Apply the Gates

Before producing polished writing, check:

- Does the main result answer the research question?
- Is the estimand explicit?
- Is the identifying variation clear?
- Are controls, fixed effects, clustering, and sample restrictions justified?
- Are robustness checks tied to actual threats?
- Are tables and figures interpretable without overclaiming?
- Can another researcher rerun the core results?
- Are data restrictions, deviations, and AI assistance disclosed where relevant?

If a gate fails, report the blocker and propose the smallest next action.

### 5. Produce the Right Artifact

Match the output to the stage:

- `idea`: research question options, contribution candidates, feasibility risks.
- `literature`: closest-paper map and value-added paragraph.
- `identification`: design memo, assumptions, diagnostics, robustness plan.
- `data`: data audit, sample construction plan, variable dictionary.
- `estimation`: specification ladder, table shell, diagnostic checklist.
- `writing`: draft section with evidence gaps flagged.
- `replication`: README, run order, file inventory, reproducibility checklist.
- `review`: referee-style findings, severity, fixes, and revision roadmap.
- `skill-building`: `SKILL.md` scaffold with triggers, inputs, outputs, references, tools, and failure modes.

## Output Style

Use concise, research-grade prose. Prefer clear section labels and tables only when they improve precision.

When reviewing, lead with risks and fixes. When writing, lead with the paper's central contribution. When building skills, lead with trigger conditions and workflow steps.

## Guardrails

- Do not invent citations. Mark missing citations as `[citation needed]`.
- Do not invent empirical results. If outputs are unavailable, create a table shell or analysis plan.
- Do not silently change a model specification to make results look better.
- Do not conflate reproducibility with validity.
- Do not conflate statistical significance with causal credibility.
- Do not cite a method authority unless the design actually matches that source's domain.
- Do not hide restricted-data, proprietary-data, or computational barriers.
- Do not bury the main identification threat in vague language.

## Verification

A response using this skill is complete only if it leaves the user with one of:

- a concrete next-step plan;
- a draft section tied to evidence;
- an identification or robustness checklist;
- a reproducibility package checklist;
- a reviewer-style audit;
- a reusable skill scaffold.

If local files were inspected or changed, name the relevant files and any commands/tests that were run.
