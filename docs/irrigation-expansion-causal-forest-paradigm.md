# Irrigation Expansion Causal-Forest Paradigm

Source status: main article and Supporting Information reviewed locally from user-provided PDFs. Public data/code entry identified in the article reference list: Zenodo https://doi.org/10.5281/zenodo.17478972. Full Zenodo package inspection still pending.

Anchor paper:

- Jillian M. Deines, Sophie Baur, Anthony Kendall, Antonia Hadjimichael, and Robert Hetland, *Irrigation Expansion in the US Corn Belt: Patterns and Yield Impacts*, *Earth's Future*, DOI: https://doi.org/10.1029/2025EF007566.

## Why This Belongs In EmpiriForge

This is a useful empirical-research paradigm because it combines:

- high-resolution remote-sensing treatment assignment;
- crop-yield maps as outcomes;
- environmental and hydrologic covariates;
- adoption/expansion modeling with logistic regression;
- causal forests for `ATE` and heterogeneous yield impacts.

It is not just a prediction paper. The reusable contribution is:

```text
remote sensing treatment map
-> observational sample construction
-> treatment/adoption mechanism model
-> causal forest effect estimation
-> heterogeneity and policy interpretation
```

## Research Ledger

| Field | Extracted structure |
| --- | --- |
| Research question | Where is irrigation expanding in the traditionally rainfed US Corn Belt, and how much does irrigation change corn and soybean yields? |
| Region | Illinois, Indiana, Iowa, Michigan, Minnesota, Ohio, and Wisconsin |
| Unit | Spatial sample locations / pixels; 101,240 locations before crop-year expansion |
| Period | LANID irrigation maps, 1997-2017 |
| Treatment | Irrigation status, especially expansion irrigation versus rainfed comparison |
| Treatment classes | Pre-existing irrigation, expanding irrigation, random rainfed, proximity-paired rainfed |
| Outcomes | Satellite-derived corn and soybean yields from SCYM-style yield maps |
| Covariates | Weather, climate water balance, soils, terrain, groundwater, and other environmental variables |
| Adoption model | Logistic regression for correlates of irrigation expansion |
| Effect model | `grf` causal forest estimating overlap-weighted `ATE` and heterogeneous treatment effects |
| Main empirical claim type | Conditional effect of irrigation on crop yield under observed-confounder adjustment |

## What The Paper Actually Does

The paper is stronger than a generic "AI + agriculture" example because it makes the treatment map, outcome map, sampling design, treatment-propensity logic, and heterogeneity analysis explicit.

Key implementation facts from the article and SI:

- LANID provides annual 30 m irrigation maps for 1997-2017.
- Pixels irrigated at least once in 1997-1999 are treated as pre-existing irrigation.
- Single-year irrigated pixels are removed to reduce spurious classifications.
- Expanding irrigation is defined as connected new-irrigation groups first irrigated in 2000 or later.
- The main expanding-irrigation threshold is more than 75 connected pixels, about 6.75 ha.
- The SI tests 39, 75, and 100 pixel thresholds; maize ATE stays around 1.51-1.54 t/ha.
- The analysis uses 28,120 expanding-irrigation field-like entities, 15,000 pre-existing irrigation pixels, 30,000 random rainfed pixels, and 28,120 proximity-paired rainfed pixels.
- Proximity-paired rainfed controls are 1,000-4,000 m from an expanding-irrigation observation.
- Causal forests are run separately for maize and soybean using R `grf`.
- The causal forest uses 2,000 trees and `grf`'s doubly robust treatment-effect calculation.
- Propensity scores are modeled with `grf::regression_forest` using static covariates.
- Observations with propensity below 0.02 or above 0.98 are removed for overlap.
- Expected-yield submodels are random-forest yield models after MARS variable selection with the R `earth` package.
- Heterogeneity is tested with `grf::test_calibration`.
- The paper reports both t/ha effects and percent yield changes.

Final causal-forest samples after overlap trimming:

| Crop | Irrigated observations | Rainfed observations |
| --- | ---: | ---: |
| Maize | 135,566 | 211,870 |
| Soybean | 78,562 | 176,151 |

Reported average treatment effects:

| Crop | ATE | Percent effect |
| --- | ---: | ---: |
| Maize | 1.53 t/ha, 95% CI [1.49, 1.56] | 12.6% |
| Soybean | 0.29 t/ha, 95% CI [0.28, 0.30] | 7.9% |

Important heterogeneity examples:

- Maize treatment effects are larger on poorer soils and under higher August vapor pressure deficit.
- When August VPD reaches 2-2.5 kPa, reported CATE reaches about 32% for maize and 10% for soybeans, but this condition is rare in the study period.
- Iowa, Illinois, and Indiana have lower state-level effects than several marginal or more water-limited states.

## Data Inventory To Reconstruct

The reproduction package should record exact URLs, versions, and spatial/temporal alignment rules for:

- LANID annual irrigation dataset, 30 m resolution, 1997-2017;
- SCYM crop-yield maps for corn and soybean;
- GRIDMET weather;
- TerraClimate climate variables;
- PRISM climate variables;
- SSURGO soils;
- POLARIS soils;
- topography and elevation variables;
- groundwater depth or groundwater-relevant indicators;
- NASA GRACE root-zone soil moisture;
- MERIT Hydro distance to streams and permanent water;
- state boundaries and crop masks;
- crop calendars and year-specific crop identity.

Minimum table schema:

```text
location_id
year
state
lat
lon
crop
irrigation_class
treatment
yield
weather_covariates...
soil_covariates...
terrain_covariates...
groundwater_covariates...
sample_weight
cluster_id
source_flags
```

## Reproducible Workflow

### 1. Spatial Harmonization

Reproject all raster layers into one CRS and grid. Freeze:

- spatial resolution;
- resampling method;
- crop mask rule;
- pixel inclusion rule;
- missing-data handling;
- whether observations are pixel-year, location-level summaries, or sampled points.

### 2. Treatment Construction

Define irrigation classes mechanically:

```text
existing irrigation: irrigated before the expansion window
expansion irrigation: transitions from rainfed to irrigated during the window
rainfed: never observed as irrigated during the analysis window
```

Record:

- 1997-1999 buffer for pre-existing irrigation;
- removal of one-year-only irrigated pixels;
- more than 75 connected pixels as the main expanding-irrigation field threshold;
- 2000 or later as the first-year-irrigated cutoff for expansion;
- never-irrigated status in LANID for rainfed controls;
- 1,000-4,000 m proximity-pair rule for local rainfed controls;
- whether post-treatment covariates are excluded from the causal model.

### 3. Adoption / Expansion Model

Use logistic regression to model:

```text
Pr(expansion irrigation = 1 | pre-treatment environment)
```

Purpose:

- characterize where irrigation expands;
- diagnose overlap and selection;
- identify whether rainfed comparisons occupy comparable environmental space.

Do not interpret this model as causal unless the paper has an explicit adoption design.

### 4. Causal Forest

Target estimands:

```text
ATE: average yield effect of irrigation
CATE: conditional yield effect by climate, soil, groundwater, terrain, and geography
```

Candidate implementations:

- R: `grf::causal_forest`;
- Python: `econml.dml.CausalForestDML`;
- Python: `causalml` tree/forest family where appropriate.

For reproducing this paper specifically, start with R `grf`, because the article names `grf::regression_forest`, `grf::causal_forest`, and `grf::test_calibration`.

Minimum diagnostics:

- treatment prevalence by state/crop/year;
- propensity or overlap distribution;
- propensity trimming at 0.02 and 0.98;
- balance before and after weighting/forest residualization;
- honest forest or sample-splitting settings;
- spatial cluster robustness;
- spatial block sensitivity;
- separate corn and soybean models;
- threshold sensitivity for expanding-irrigation field size;
- drought-year or water-stress-year heterogeneity;
- placebo outcome or placebo treatment where feasible.

## Reproduction Status

Verdict:

```text
near-rerunnable after Zenodo package inspection
```

What is already clear:

- public source data are named;
- derived data and analysis code are cited as Zenodo `10.5281/zenodo.17478972`;
- software stack includes R, `grf`, `earth`, and base `stats::glm`;
- SI provides the main variable inventory and a threshold sensitivity check.

What still needs inspection:

- actual folder structure in the Zenodo archive;
- whether all derived point samples are included or must be regenerated from public rasters;
- exact R script order and random seeds;
- package versions beyond the named packages;
- whether figures can be reproduced without large raw raster downloads.

## Identification Risks

This design can be powerful, but the causal language needs guardrails.

| Risk | Why it matters | Minimum response |
| --- | --- | --- |
| Hidden selection | Irrigation expansion may target better farmers, capital, aquifers, or soils not fully observed | Rich pre-treatment covariates, overlap checks, sensitivity analysis |
| Post-treatment controls | Some environmental variables may be affected by irrigation | Freeze covariates as pre-treatment or time-invariant |
| Spatial interference | Irrigation can affect local humidity, temperature, or neighbor yields | State this limit; use buffers or spatial sensitivity checks |
| Measurement error | Remote-sensed irrigation and yield products are model outputs | Validate against survey/ground truth if possible |
| Dynamic treatment | First irrigation year, persistent irrigation, and intermittent irrigation differ | Make exposure definition explicit |
| Heterogeneity mining | Causal forests can find unstable subgroups | Report stability and avoid overclaiming small segments |
| Scale mismatch | 30 m LANID/SCYM data are combined with 4 km, 14 km, 90 m, and 250 m covariates | Record native resolution and extraction rule |

## Skill Rule To Reuse

When a paper estimates agricultural adaptation effects with remote sensing and causal forests, require:

```text
1. treatment map provenance;
2. treatment timing and class rules;
3. outcome-map provenance;
4. pre-treatment covariate ledger;
5. overlap diagnostics;
6. causal-forest settings;
7. spatial robustness;
8. heterogeneity stability;
9. resource or policy interpretation limits.
```

## How To Use In Future Papers

Good candidate topics:

- irrigation expansion and crop yield;
- conservation tillage and yield;
- cover crops and soil/yield outcomes;
- biochar adoption and productivity;
- groundwater access and drought adaptation;
- shade, greening, or cooling interventions in urban heat studies.

Use the same design language:

```text
remote-sensing treatment
+ spatial outcome
+ pre-treatment environmental covariates
+ causal forest / doubly robust learner
+ heterogeneity and policy constraint interpretation
```
