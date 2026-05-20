# Empirical Agent Ecosystem Bridge

This note records how EmpiriForge should relate to external empirical-research agent ecosystems.

## Key External Links

| Resource | Role | How EmpiriForge should use it |
| --- | --- | --- |
| [`Awesome-Agent-Skills-for-Empirical-Research`](https://github.com/brycewang-stanford/Awesome-Agent-Skills-for-Empirical-Research) | Discovery index for empirical-research skills across social-science workflows | Use for scouting, comparison, and finding candidate skill patterns. Do not vendor the whole collection into EmpiriForge. |
| [`CoPaper.AI`](https://copaper.ai) | Hosted AI empirical-research product | Use as a reference point for what an end-to-end empirical workflow product can look like. Do not treat as an open reproducibility backend unless outputs and code are exported. |
| [`StatsPAI`](https://github.com/brycewang-stanford/StatsPAI) | Python package for causal inference and applied econometrics | Use as an optional execution engine for empirical examples, with pinned versions, captured outputs, and independent validation against R/Stata where possible. |
| [`nature-skills`](https://github.com/Yuan1z0825/nature-skills) | Nature-style academic reading, writing, citation, figure, data-availability, reviewer-response, and paper-to-PPT skill collection | Use as a publication-facing companion to EmpiriForge. Install as external skills; do not vendor the whole repository. |
| [`academic-research-skills`](https://github.com/Imbad0202/academic-research-skills) / [`academic-research-skills-codex`](https://github.com/Imbad0202/academic-research-skills-codex) | Broad academic research-to-publication pipeline for Claude Code and Codex | Use as a broad orchestration, Socratic planning, paper drafting, and reviewer-simulation companion. Keep EmpiriForge in charge of identification and reproducibility gates. |

## Relationship To EmpiriForge

EmpiriForge should stay focused on:

```text
research ledger
-> identification audit
-> reproducibility package
-> writing and revision workflow
-> skill-building from actual research traces
```

External skill collections are useful, but they should not blur EmpiriForge's boundary.

`nature-skills` should be treated as a companion layer:

```text
EmpiriForge: identification, empirical design, reproducibility, research ledger
nature-skills: reading, polishing, figures, citation support, response letters, PPT
```

Useful installed skills:

- `nature-reader` for full-paper bilingual Markdown reading;
- `nature-writing` and `nature-polishing` for manuscript prose;
- `nature-citation` for citation support;
- `nature-data` for Data Availability statements;
- `nature-response` for reviewer response letters;
- `nature-paper2ppt` for journal-club decks;
- `nature-figure` for high-impact figure styling;
- `nature-academic-search` for literature search workflows.

`academic-research-suite` should be treated as a broader planning and pipeline layer:

```text
academic-research-suite: Socratic topic refinement, broad research planning, drafting pipeline, reviewer simulation
EmpiriForge: estimand, identification strategy, empirical design, code/data reproducibility, interpretation limits
```

Useful ARS routes:

- `deep-research` for research-question narrowing and literature review planning;
- `academic-paper` for outline and drafting support;
- `academic-paper-reviewer` for simulated peer review;
- `academic-pipeline` for end-to-end staged workflow;
- `experiment-agent` for experiment planning and reproducibility validation in the Codex-native suite.

Because ARS is licensed CC BY-NC 4.0 and is broad in scope, prefer external installation and citation rather than copying its full content into EmpiriForge.

## Why Not Copy Everything

A large external skill repository can be valuable as a map, but wholesale copying creates problems:

- duplicated maintenance burden;
- mixed licenses and unclear downstream permissions;
- security review burden for hooks and scripts;
- inconsistent style and trigger rules;
- lower signal for the user's own research workflows.

Preferred approach:

```text
link -> summarize -> audit -> selectively adapt -> cite source -> keep local rule small
```

## StatsPAI Integration Rule

StatsPAI can be useful when the task requires a Python-native empirical engine for:

- DID;
- IV;
- RDD;
- synthetic control;
- matching;
- panel and high-dimensional fixed effects;
- causal ML;
- publication tables.

But use the same EmpiriForge gates:

```text
1. define estimand;
2. identify source of variation;
3. check assumptions;
4. run deterministic code;
5. compare against expected reference behavior;
6. record package version and random seed;
7. report interpretation limits.
```

StatsPAI output should be treated like any other software output:

```text
successful run != credible identification
```

## Possible Future Folder

If EmpiriForge later adds executable examples, use:

```text
examples/statspai-bridge/
  README.md
  environment.yml or requirements.txt
  01_did_example.py
  02_iv_example.py
  03_rd_example.py
  output-log.md
```

Do not put private data, API keys, licenses, or unpublished manuscript material in this folder.

## Recommended Prompt

```text
Use EmpiriForge with StatsPAI as an optional execution engine.
First build the research ledger and identification audit.
Then, if the design is appropriate, run a pinned StatsPAI example and compare its output to R/Stata or known reference results.
Do not treat software output as proof of causal validity.
```
