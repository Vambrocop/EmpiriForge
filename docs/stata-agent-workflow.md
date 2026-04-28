# Stata Agent Workflow for Empirical Economists

This note explains why Stata users need a specialized agent workflow and how EmpiriForge supports it through `stata-econometrics-runner`.

## Why Stata Needs Special Handling

Stata is central to empirical economics, but it is not usually exposed to terminal-based agents in the same way as Python, R, or JavaScript.

Common friction points:

- Stata is proprietary and often not available on `PATH`.
- The executable name differs by edition and operating system.
- Stata datasets are binary `.dta` files, so agents should summarize or export them rather than load them directly into context.
- Stata projects rely on distinctive conventions: `.do` files, `.ado` files, logs, macros, globals, `preserve`/`restore`, user-written packages, and table-export commands.
- Official documentation often lives in large PDFs that are too expensive to load directly into an AI context.
- Empirical Stata work is rarely just code execution; it is tied to identification, table reproduction, and manuscript interpretation.

EmpiriForge handles this by separating Stata execution from research judgment.

## Three-Layer Design

### 1. Setup Layer

Goal: help the agent find and invoke Stata.

Tasks:

- detect Stata on `PATH`;
- inspect Windows registry or common install paths;
- identify the actual executable;
- document edition/version when possible;
- avoid pretending Stata can run when only an install record is found.

In EmpiriForge, this is supported by:

```text
skills/stata-econometrics-runner/scripts/find-stata.ps1
skills/stata-econometrics-runner/references/windows-stata.md
```

### 2. Runner Layer

Goal: run or statically audit a Stata replication workflow.

Tasks:

- find `run_all.do`, `master.do`, or the documented entry point;
- map code stages: setup, cleaning, analysis, tables/figures;
- detect package dependencies such as `reghdfe`, `estout`, `outreg2`, `ivreg2`, `csdid`, `rdrobust`, `coefplot`, `boottest`, `psmatch2`, and `synth`;
- run Stata when a verified executable is available;
- inspect logs and summarize actionable errors.

In EmpiriForge, this is supported by:

```text
skills/stata-econometrics-runner/references/stata-replication.md
skills/stata-econometrics-runner/templates/stata-run-report.md
```

### 3. Auditor Layer

Goal: connect Stata outputs to empirical research standards.

Tasks:

- check whether tables/figures can be regenerated;
- compare outputs with manuscript references;
- separate code reproducibility from identification credibility;
- route DID, IV, RDD, event-study, panel FE, synthetic-control, matching, or causal-ML concerns to `econ-identification-skeptic`;
- route paper-level research workflow concerns to `empirical-research-forge`.

## PDF Manual Strategy

Do not load large Stata manuals directly into an AI conversation.

Prefer:

- search first;
- extract only relevant pages or commands;
- convert reusable documentation to Markdown once;
- keep command-specific notes in focused references;
- cite official documentation when writing public-facing materials.

See:

```text
skills/stata-econometrics-runner/references/pdf-docs-and-manuals.md
```

## Project Context Template

For recurring research projects, create a project-level context file so the agent does not need to rediscover conventions in every session.

EmpiriForge provides a template:

```text
skills/stata-econometrics-runner/templates/empirical-project-context.md
```

Use it to record:

- data paths;
- do-file naming;
- Stata version;
- table-export conventions;
- regression commands;
- clustering rules;
- identification strategy;
- output locations;
- files the agent should not edit.

## Optional MCP Layer

MCP can make a Stata workflow more interactive: the agent can send commands to Stata, read outputs, and iterate. This is useful, but it should be treated as an advanced layer.

Before using MCP:

- make sure the basic Stata executable can be found;
- keep project scope clear;
- avoid unrestricted access to sensitive data;
- log commands and outputs;
- preserve human review over specification changes.

MCP is not required for EmpiriForge. A well-designed skill plus logs and replication-package checks already covers many useful workflows.

## Recommended User Prompts

```text
Use stata-econometrics-runner to inspect this Stata replication package.
Find the master do-file, identify dependencies, and summarize what can run.
```

```text
Use stata-econometrics-runner and empirical-research-forge to audit this paper's Stata replication package.
Separate operational reproducibility from identification credibility.
```

```text
Use stata-econometrics-runner to read the logs and explain why Table 3 was not regenerated.
Give me the first actionable error and the smallest safe fix.
```

```text
Use stata-econometrics-runner to refactor these old do-files.
Keep raw data untouched, replace absolute paths with relative paths, and generate a master do-file.
```

## Boundary

EmpiriForge can help run, repair, and audit Stata workflows. It should not:

- rewrite the empirical design just to make results significant;
- hide failed merges or sample changes;
- treat successful execution as causal validity;
- fabricate results from missing data;
- install unknown dependencies without naming them.
