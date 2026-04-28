# Empirical Project Context

Use this template as a project-level context file for Stata empirical research. It can be adapted for `CLAUDE.md`, `AGENTS.md`, `PROJECT_CONTEXT.md`, or another agent-readable file.

## Project

- Title:
- Short description:
- Principal research question:
- Current stage: idea / data / estimation / writing / replication / revision

## Data

- Raw data path:
- Clean data path:
- Temporary data path:
- Output path:
- Tables path:
- Figures path:
- Logs path:
- Files the agent must never edit:

## Stata Environment

- Stata version:
- Stata edition: BE / SE / MP / unknown
- Stata executable path:
- Required user-written packages:
- Installation notes:

## Do-File Workflow

- Master do-file:
- Setup scripts:
- Cleaning scripts:
- Analysis scripts:
- Table scripts:
- Figure scripts:
- Naming convention:

Recommended pattern:

```text
00_setup.do
01_clean_*.do
02_build_sample_*.do
03_analysis_*.do
04_tables_figures_*.do
run_all.do
```

## Coding Conventions

- Use relative paths where possible.
- Never overwrite raw data.
- Add `version` statement at the top of do-files when known.
- Prefer explicit logs for long-running scripts.
- Check merge results before dropping `_merge`.
- Document all sample restrictions.
- Keep table and figure filenames aligned with the manuscript.

Project-specific conventions:

- Regression command:
- Fixed effects:
- Clustered standard errors:
- Weights:
- Table export command:
- Graph scheme:

## Research Design

- Unit of observation:
- Time period:
- Geography:
- Treatment/exposure:
- Outcome:
- Main estimand:
- Identification strategy:
- Main specification:
- Key identifying assumption:
- Main threat:
- Robustness checks:

## Manuscript Links

| Manuscript item | Producing do-file | Output file | Notes |
|---|---|---|---|
| Table 1 | | | |
| Table 2 | | | |
| Figure 1 | | | |

## Agent Rules

- Separate code reproducibility from causal credibility.
- Report the first actionable Stata error from logs.
- Do not change specifications without naming the change.
- Do not claim results were reproduced unless outputs were regenerated.
- When data are too large, summarize metadata or export small samples.
