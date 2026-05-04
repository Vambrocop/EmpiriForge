# Knowledge Graph Navigation With Graphify

Graphify is an optional external navigator for large empirical research folders. It can turn a repository, replication package, paper folder, or notes archive into a graph report and queryable graph, which helps an agent decide what to read first.

Use it for:

- mapping how do-files, R/Python scripts, README files, tables, figures, manuscripts, and skill references connect;
- orienting an agent before it audits a replication package;
- finding cross-links between identification notes, analysis scripts, table outputs, and figure workflows;
- reducing blind keyword search when a project has many old files.

Do not use it for:

- deciding whether identification is credible;
- proving that code is reproducible;
- replacing a full script/log audit;
- replacing statistical validation;
- treating graph edges as causal pathways.

## Install And Run

Graphify's official repository is `safishamsi/graphify`; the Python package is `graphifyy`, while the command remains `graphify`.

Typical setup:

```bash
uv tool install graphifyy && graphify install
```

For Codex, the Graphify README also documents a Codex-specific install path and then uses:

```text
$graphify .
```

Common navigation commands:

```text
$graphify .
$graphify ./replication-package
$graphify ./replication-package --update
graphify query "what connects Table 3 to the main regression do-file?" --graph graphify-out/graph.json
```

## EmpiriForge Pattern

When using Graphify with EmpiriForge:

1. Run it at the repository root or project folder.
2. Start with `graphify-out/GRAPH_REPORT.md`, not the full `graph.json`.
3. Use `graphify query` for a focused subgraph.
4. Ask the agent to cite source files from the graph output.
5. Route judgment back to the relevant skill, such as `empirical-research-forge`, `econ-identification-skeptic`, `stata-econometrics-runner`, `prediction-modeling-forge`, or `publication-figure-forge`.

Suggested prompt:

```text
Read graphify-out/GRAPH_REPORT.md first.
Use graph queries only to locate relevant files.
Then apply EmpiriForge guardrails to judge identification, reproducibility, prediction validity, or figure quality.
Do not treat graph edges as evidence of causality or correctness.
```

## Privacy And Hygiene

Graphify can process code, Markdown, PDFs, images, audio, and video. That is powerful, but empirical projects often contain restricted data and private drafts.

Create `.graphifyignore` before scanning sensitive folders:

```gitignore
.env
.venv/
raw-data/
restricted-data/
private-drafts/
irb/
confidential/
graphify-out/cache/
graphify-out/manifest.json
graphify-out/cost.json
```

Treat `graphify-out/GRAPH_REPORT.md` and focused query outputs as shareable only after checking that they do not reveal restricted data, reviewer-identifying notes, or unpublished findings.
