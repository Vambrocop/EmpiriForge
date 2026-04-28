# Stata Replication Checklist

Use this reference when auditing Stata replication packages.

## Project Map

Record:

- entry point;
- required Stata edition/version;
- user-written packages;
- raw data location;
- intermediate data location;
- final output location;
- log location;
- manuscript table/figure mapping.

## Stata Code Checks

Check for:

- absolute paths that will fail on another machine;
- globals that hide important settings;
- missing `version` statements;
- missing seeds for random processes;
- `capture` masking important errors;
- `preserve`/`restore` misuse;
- merges without `_merge` checks;
- silent dropping of observations;
- generated files overwriting raw data;
- package dependencies such as `reghdfe`, `ivreghdfe`, `estout`, `outreg2`, `coefplot`, or `boottest`.

## Log Checks

Scan logs for:

- `r(` errors;
- `file not found`;
- `command ... unrecognized`;
- `insufficient observations`;
- convergence failures;
- dropped singleton observations;
- collinearity drops;
- merge mismatches;
- changes in sample size;
- warnings around standard errors or clustering.

Do not summarize a log only by the final line. The important error may appear earlier.

## Output Match

For each manuscript table or figure:

- identify the producing `.do` file;
- identify the output file;
- check whether filenames match the manuscript;
- check whether the run regenerated it;
- compare sample size, coefficient, standard error, and notes when expected values are available.

## Econometric Handoff

If the Stata package runs but the result is questionable, mark the issue as identification or interpretation, not reproducibility.

Examples:

- `reghdfe` ran successfully, but clustering is at the wrong level.
- `ivreghdfe` ran successfully, but exclusion restriction is not defended.
- Event-study coefficients were produced, but the design has staggered-treatment concerns.
- `psmatch2` produced matches, but overlap remains poor.
