# Reproducibility Package Checklist

Use this reference when preparing, auditing, or repairing a replication package. Align the spirit of the review with AEA-style data/code availability, DIME-style project organization, and practical data-publication guidance.

## Minimum Structure

```text
replication-package/
  README.md
  run_all.do / run_all.R / run_all.py / run_all.qmd
  code/
    00_setup/
    01_clean/
    02_analysis/
    03_tables_figures/
  data_raw/
  data_intermediate/
  data_processed/
  output/
  tables/
  figures/
  logs/
  environment/
```

Adapt the folder names to the software ecosystem, but preserve the logic: raw data, derived data, code, outputs, logs, and environment should be separable.

## README Must Explain

- paper title and authors;
- contact information;
- software requirements and versions;
- operating system assumptions;
- hardware or memory requirements if relevant;
- estimated runtime;
- run order and the single entry point if available;
- expected outputs;
- data sources and download dates;
- data licenses and redistribution status;
- restricted or proprietary data instructions;
- random seeds and stochastic steps;
- known deviations from published outputs;
- AI assistance if it materially affected code, documentation, or analysis.

## Code Rules

- Use relative paths.
- Provide one entry point when possible.
- Do not require interactive clicks.
- Fix random seeds.
- Do not overwrite raw data.
- Separate cleaning, analysis, and output generation.
- Log package versions.
- Save intermediate files only when necessary and document them.
- Make table and figure filenames match manuscript references.
- Treat warnings as audit objects, not console noise.

## Data Rules

- Include a data dictionary or codebook.
- Document raw data provenance.
- Explain any restricted, proprietary, confidential, or licensed data.
- Provide instructions for externally hosted public data.
- State whether data can be redistributed.
- Document de-identification or disclosure-risk constraints.
- If data cannot be shared, provide access instructions or a mock-data demonstration only if it is clearly labeled and cannot mislead.

## Verification Gates

1. Fresh clone or clean copy can run.
2. `run_all` completes without manual intervention.
3. Main tables are regenerated.
4. Main figures are regenerated or explicitly excluded.
5. Output filenames match manuscript references.
6. Logs capture warnings and errors.
7. Any mismatch is documented.
8. Restricted-data barriers are explicit rather than hidden.
9. Environment information is sufficient for another researcher to rebuild the run.

## Reproducibility vs Credibility

A replication package can show that:

- the code runs;
- the data are available or access instructions are clear;
- the tables can be regenerated;
- the manuscript numbers match code outputs.

It cannot by itself prove that:

- the identification strategy is valid;
- the data measure the concept well;
- the result is externally valid;
- omitted-variable bias is absent;
- the causal interpretation is correct.

Always keep these separate in audit reports.
