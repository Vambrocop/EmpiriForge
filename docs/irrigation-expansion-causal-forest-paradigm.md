# Irrigation Expansion Causal-Forest Paradigm

Source status: user-provided article summary; full-text and data/code audit pending.

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
| Unit | Spatial sample locations / pixels, reportedly 101,240 locations |
| Period | LANID irrigation maps, 1997-2017 |
| Treatment | Irrigation status, especially expansion irrigation versus rainfed comparison |
| Treatment classes | Existing irrigation, expansion irrigation, rainfed |
| Outcomes | Satellite-derived corn and soybean yields from SCYM-style yield maps |
| Covariates | Weather, climate water balance, soils, terrain, groundwater, and other environmental variables |
| Adoption model | Logistic regression for correlates of irrigation expansion |
| Effect model | Causal forest estimating `ATE` and heterogeneous treatment effects |
| Main empirical claim type | Conditional effect of irrigation on crop yield under observed-confounder adjustment |

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

- minimum years required to call a location rainfed;
- whether temporary irrigation is allowed;
- whether treatment year is first irrigated year or ever-irrigated status;
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

Minimum diagnostics:

- treatment prevalence by state/crop/year;
- propensity or overlap distribution;
- balance before and after weighting/forest residualization;
- honest forest or sample-splitting settings;
- spatial cluster robustness;
- spatial block sensitivity;
- separate corn and soybean models;
- drought-year or water-stress-year heterogeneity;
- placebo outcome or placebo treatment where feasible.

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
