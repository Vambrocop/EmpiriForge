# Method Sources

EmpiriForge is grounded in a practical mix of AI-assisted reproducibility, applied econometrics, causal inference, and research transparency. This file names the methodological traditions that shaped the skills. It is not a complete bibliography and does not replace field-specific textbooks or journal instructions.

## AI-Assisted Reproducibility

- *Scaling Reproducibility: An AI-Assisted Workflow for Large-Scale Replication and Reanalysis*.
  - Used for the repository architecture: orchestration, reusable skills, deterministic execution, audit trails, and human review.
  - Local notes are in `docs/Scaling_Reproducibility_中文解读.md` and `docs/Scaling_Reproducibility_可提炼skills.md`.

## Applied Econometrics and Causal Inference

- Angrist and Pischke, *Mostly Harmless Econometrics* and *Mastering 'Metrics*.
  - Used as the applied-economics style anchor: clear estimands, credible comparisons, transparent assumptions, and design-first writing.
- Cunningham, *Causal Inference: The Mixtape*.
  - Used for applied design navigation across DID, IV, RDD, matching, synthetic control, and panel designs.
  - Online version: https://mixtape.scunning.com/
- Hernan and Robins, *Causal Inference: What If*.
  - Used for causal language discipline: target trial thinking, counterfactual estimands, time-varying treatments, and explicit assumptions.
  - Book page: https://www.hsph.harvard.edu/miguel-hernan/causal-inference-book/
- Imbens and Rubin, *Causal Inference for Statistics, Social, and Biomedical Sciences*.
  - Used as a potential-outcomes reference point for experiments, treatment assignment, and estimands.

## Research Transparency and Replication Packages

- AEA Data and Code Availability Policy.
  - Used for replication-package expectations: data access, code access, documentation, and reproducibility checks.
  - Official page: https://www.aeaweb.org/journals/data/data-code-policy
- AEA Data and Code Policies and Guidance.
  - Used as a gateway to AEA data editor guidance and author-facing replication materials.
  - Official page: https://www.aeaweb.org/journals/data
- DIME Analytics reproducible research resources.
  - Used for practical project organization, reproducible workflows, and research data management habits.
  - DIME Wiki: https://dimewiki.worldbank.org/Reproducible_Research
  - DIME Data Handbook: https://worldbank.github.io/dime-data-handbook/reproducibility.html
- BITSS Research Transparency and Reproducibility Training.
  - Used for open science norms: preregistration, transparency, reproducible workflows, and credible social-science evidence.
  - Official page: https://www.bitss.org/education/rt2/

## Impact Evaluation Practice

- J-PAL Research Resources.
  - Used for practical randomized-evaluation design, field implementation, data quality, and research workflow norms.
  - Official page: https://www.povertyactionlab.org/research-resources
- J-PAL Data Publication guidance.
  - Used for de-identified data, code sharing, and publication-stage documentation.
  - Official page: https://www.povertyactionlab.org/resource/data-publication?lang=en

## How To Use These Sources

EmpiriForge uses sources as guardrails, not as decorative citations. When a skill produces an audit, it should connect each recommendation to a method family:

- identification critique: econometrics and causal inference;
- reproducibility critique: AEA, DIME, BITSS, J-PAL style transparency expectations;
- AI workflow critique: skill routing, logs, deterministic execution, and human oversight from the reproducibility workflow paper.

Do not cite a source as authority unless the paper's design actually matches the source's domain.
