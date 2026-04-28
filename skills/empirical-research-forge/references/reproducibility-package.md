# Reproducibility Package Checklist

Use this reference when preparing, auditing, or repairing a replication package.

## Minimum Structure

```text
replication-package/
├── README.md
├── run_all.do / run_all.R / run_all.py / run_all.qmd
├── code/
├── data_raw/
├── data_processed/
├── output/
├── tables/
├── figures/
└── environment/
```

## README Must Explain

- paper title and authors;
- contact information;
- software requirements;
- operating system assumptions;
- estimated runtime;
- run order;
- expected outputs;
- data sources;
- restricted data instructions;
- random seeds;
- known deviations from published outputs.

## Code Rules

- Use relative paths.
- Provide one entry point when possible.
- Do not require interactive clicks.
- Fix random seeds.
- Do not overwrite raw data.
- Separate cleaning, analysis, and output generation.
- Log package versions.
- Save intermediate files only when necessary and document them.

## Data Rules

- Include a data dictionary.
- Document raw data provenance.
- Explain any restricted or proprietary data.
- Provide instructions for externally hosted public data.
- State whether data can be redistributed.
- If data cannot be shared, provide synthetic or mock data only if it does not mislead.

## Verification Gates

1. Fresh clone or clean copy can run.
2. `run_all` completes without manual intervention.
3. Main tables are regenerated.
4. Main figures are regenerated or explicitly excluded.
5. Output filenames match manuscript references.
6. Logs capture warnings and errors.
7. Any mismatch is documented.

## Reproducibility vs Credibility

A replication package can prove that:

- the code runs;
- the data are available;
- the tables can be regenerated;
- the manuscript numbers match code outputs.

It cannot by itself prove that:

- the identification strategy is valid;
- the data measure the concept well;
- the result is externally valid;
- omitted-variable bias is absent;
- the causal interpretation is correct.

Always keep these separate in audit reports.

