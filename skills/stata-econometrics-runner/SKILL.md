---
name: stata-econometrics-runner
description: Work with Stata-based empirical economics projects. Use when reading, editing, running, or auditing Stata .do/.ado files, .log files, Stata replication packages, regression-table workflows, or Stata-to-R/Python conversion in applied economics. Can execute Stata when a local Stata executable is available; otherwise performs code/log/package review.
---

# Stata Econometrics Runner

Use this skill for Stata-centered empirical research workflows. It complements `empirical-research-forge`: this skill handles Stata operations and replication mechanics, while `empirical-research-forge` and `econ-identification-skeptic` handle research design, identification, and interpretation.

## Core Principle

Separate:

1. **Execution**: whether Stata can run the `.do` files.
2. **Reproduction**: whether outputs match the paper or expected tables.
3. **Code quality**: whether paths, seeds, dependencies, logs, and outputs are documented.
4. **Econometric credibility**: whether the specification and identification claims are defensible.

A clean Stata log proves that code ran. It does not prove the empirical design is causal.

## Environment Detection

Before running Stata:

- Check whether a Stata executable is on `PATH`.
- If not, run `scripts/find-stata.ps1` or inspect the Windows registry/common install paths.
- On this machine, registry discovery may report `C:\Program Files\Stata17\`; verify the actual executable before running.
- If Stata is unavailable, review `.do`, `.ado`, `.log`, README, and output files without execution.

For Windows-specific notes, read `references/windows-stata.md`.
For Stata manuals, codebooks, and large PDF documentation, read `references/pdf-docs-and-manuals.md`.

## Intake

Identify what the user has provided:

- `.do` files;
- `.ado` or project-specific programs;
- `.log` files;
- `.dta` files;
- README or replication instructions;
- output tables, figures, or manuscript references;
- paper draft or appendix.

Inspect files before advising. Never assume the run order from filenames alone if a README or `run_all.do` exists.

## Workflow

### 1. Map the Stata Project

Create a compact inventory:

- entry point: `run_all.do`, `master.do`, or manual sequence;
- code stages: setup, cleaning, analysis, tables/figures;
- data inputs and outputs;
- user-written package dependencies;
- global/local path conventions;
- log files;
- expected manuscript outputs.

For replication checks, read `references/stata-replication.md`.
For recurring project setup, use `templates/empirical-project-context.md`.

### 2. Decide Run vs Review

Run Stata only when:

- an executable is found;
- the user-provided working directory is clear;
- the command will not overwrite raw data;
- expected runtime is reasonable;
- restricted data rules are respected.

Otherwise produce a static audit.

### 3. Execute Safely

Prefer batch execution from the project root. Capture logs. Do not hand-edit generated outputs unless the user explicitly requests formatting fixes.

For a typical Windows run, use a discovered executable path and a command shaped like:

```powershell
& $stataExe /e do "run_all.do"
```

Exact flags differ by Stata edition and install. If a run fails, report the command, exit status, and the first actionable error from the log.

### 4. Audit Logs and Outputs

Check:

- errors, breaks, or stopped runs;
- warnings that affect inference or output;
- missing packages;
- path failures;
- dropped observations;
- failed merges;
- changed sample sizes;
- overwritten raw data;
- output files that do not match the manuscript.

Use `templates/stata-run-report.md` for run reports.

### 5. Link Back to Research Design

When the issue is econometric rather than operational, hand off mentally to `empirical-research-forge` or `econ-identification-skeptic`:

- clustering and fixed effects;
- DID/event-study specification;
- IV first stage and exclusion concerns;
- RDD bandwidth and manipulation checks;
- robustness mapping to threats;
- interpretation of coefficient magnitudes.

### 6. Treat MCP as Optional Advanced Execution

If the user's environment has a Stata MCP server, use it only after confirming project scope, executable access, and data-safety constraints. MCP can close the loop between command execution and log inspection, but it does not remove the need for reproducibility reports or human review of specifications.

## Guardrails

- Do not overwrite raw data.
- Do not silently change specifications to make results work.
- Do not install untrusted `.ado` files without naming the dependency.
- Do not claim reproduction if only part of the pipeline ran.
- Do not read huge `.dta` files directly into context; summarize or export samples.
- Do not treat Stata execution as identification validation.
- Do not load entire Stata PDF manuals into context when a targeted search or extraction would work.
- Do not use MCP to make unrestricted changes in a sensitive research folder.

## Completion

A response using this skill should leave the user with one of:

- a Stata project map;
- a run command and log summary;
- a replication failure diagnosis;
- a code repair plan;
- a table/output match report;
- a bridge from Stata results to identification review.
