# Related Academic and Scientific Skills Ecosystem

This note records the surrounding skill ecosystem as of 2026-04-28. It helps position EmpiriForge and explain why meta-analysis now lives in the companion repository, EvidenceForge.

## Economics and Social Science

- [`hanlulong/econ-writing-skill`](https://github.com/hanlulong/econ-writing-skill): economics writing skill covering introductions, empirical results, replication standards, LaTeX, identification strategies, and review checklists.
- [`brycewang-stanford/Awesome-Agent-Skills-for-Empirical-Research`](https://github.com/brycewang-stanford/Awesome-Agent-Skills-for-Empirical-Research): curated map of empirical research agent skills across social-science disciplines.
- [`Imbad0202/academic-research-skills`](https://github.com/Imbad0202/academic-research-skills): academic research pipeline from research to writing, review, revision, and finalization.

## Life Sciences, Genomics, Omics

- [`GPTomics/bioSkills`](https://github.com/GPTomics/bioSkills): relevant for life science and omics, including sequence I/O, variant calling, single-cell, spatial transcriptomics, metabolomics, metagenomics, methylation, microbiome, proteomics, multi-omics integration, pathway analysis, population genetics, structural biology, systems biology, ecological genomics, and related workflows.
- [`K-Dense-AI/scientific-agent-skills`](https://github.com/K-Dense-AI/scientific-agent-skills): broad scientific skill collection covering bioinformatics, genomics, chemoinformatics, drug discovery, molecular dynamics, protein engineering, multi-omics, systems biology, clinical research, geospatial science, remote sensing, time series, and scientific communication.
- [`InternScience/Awesome-Scientific-Skills`](https://github.com/InternScience/Awesome-Scientific-Skills): curated index of scientific skills with selection criteria around scientific relevance, documentation, open license, security, and maintainability.

## Environment, Ecology, Geospatial

The strongest existing coverage appears through scientific and geospatial stacks rather than a single polished ecology-only skill. Useful entry points:

- `GPTomics/bioSkills`: ecological genomics, metagenomics, microbiome-related workflows.
- `K-Dense-AI/scientific-agent-skills`: geospatial science, remote sensing, satellite imagery, GIS analysis, spatial statistics, terrain analysis, and machine learning for Earth observation.

Potential gap: an environmental evidence-synthesis workflow that combines ecological study design, spatial data, biodiversity indicators, climate covariates, risk of bias, and meta-analysis. That direction belongs in EvidenceForge rather than EmpiriForge.

## Meta-Analysis Boundary

Meta-analysis, umbrella review, second-order meta-analysis, and AI-assisted evidence synthesis are now handled by:

```text
EvidenceForge
https://github.com/Vambrocop/EvidenceForge
```

EmpiriForge should not grow a second copy of `meta-analysis-forge`. Its boundary is original empirical research: identification, econometric design, reproducibility packages, and research writing.

## Positioning Opportunity for EmpiriForge

EmpiriForge can differentiate by combining:

- bilingual Chinese-English empirical research workflow;
- economics and social-science identification discipline;
- reproducibility-first package checks;
- method-source alignment;
- skill creation from papers and research traces;
- a clear bridge to EvidenceForge for systematic review and meta-analysis.
