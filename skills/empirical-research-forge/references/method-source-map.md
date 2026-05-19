# Method Source Map

Use this reference when the user asks where EmpiriForge's workflow comes from, or when an audit should explicitly connect recommendations to method families.

## Source Families

| Source family | Use for | Do not use for |
|---|---|---|
| AI-assisted reproducibility workflow | agent orchestration, skill memory, deterministic execution, audit trails, human review | claiming that an empirical design is causally valid |
| Applied econometrics | estimand, credible comparison, design-specific diagnostics, regression interpretation | automatic proof that a preferred specification is correct |
| Causal inference | counterfactual language, assumptions, target-trial thinking, treatment timing, selection bias | hiding weak data behind formal language |
| Research transparency | data/code access, README, environment, deviations, logs, restricted data | proving that the estimate is unbiased |
| Impact-evaluation practice | field implementation, randomization, data quality, attrition, compliance, ethical constraints | generalizing beyond the study context without argument |
| External empirical-agent ecosystems | discovery of reusable skills, optional execution engines such as StatsPAI, comparison with hosted products such as CoPaper.AI | replacing local identification review, security review, version pinning, or replication-package discipline |

## Practical Mapping

- If the task is "Can my result be believed?", use applied econometrics and causal inference.
- If the task is "Can someone rerun my result?", use reproducibility and transparency sources.
- If the task is "Can an AI agent help repeatedly?", use the AI-assisted workflow source.
- If the task is "Can this policy evaluation be implemented credibly?", use impact-evaluation practice sources.
- If the task is "Can an external empirical agent tool help?", use the external ecosystem as a candidate execution layer while keeping EmpiriForge's research ledger and audit gates.

## Citation Discipline

Do not invent citations. If a source is not in the user-provided materials or known project references, mark it as `[citation needed]` or ask to search.

When writing a manuscript, cite sources in the user's target citation style. When writing an internal audit, method-family labels are usually enough.
