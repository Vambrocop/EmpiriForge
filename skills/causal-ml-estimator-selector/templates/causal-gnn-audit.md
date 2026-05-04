# Causal GNN Audit

## Study

- Citation / project:
- DOI / URL:
- Domain:
- Main task:
- Code/data:

## Graph Semantics

| Graph component | Meaning | Source | Causal status | Risk |
|---|---|---|---|---|
| Nodes | | | | |
| Edges | | | causal / proxy / correlation / learned | |
| Node features | | | | |
| Edge features | | | | |
| Environments / domains | | | | |

## Causal Or Intervention Claim

- Claim type: causal effect / perturbation prediction / mechanism identification / disentanglement / robust prediction
- Intervention object:
- Estimand or target:
- Counterfactual operation:
- Assumptions:
- Hidden-confounding risk:
- Proxy-graph risk:

## Model Stack

| Layer | Method | Purpose | Needed ablation |
|---|---|---|---|
| Graph encoder | | message passing / representation | no-graph / shuffled graph |
| Causal module | | intervention / disentanglement / invariant learning | no causal loss |
| LLM enhancer, if any | | node or semantic feature enhancement | no enhancer / random text |
| Prediction head | | target prediction | simple baseline |
| Explanation layer | | mechanism or subgraph interpretation | explanation sanity check |

## Validation

Use `graph-causal-validation-schema.csv` for a machine-readable validation ledger.

- Random split:
- Leave-node / leave-edge / leave-perturbation:
- Leave-cell-line / leave-disease / leave-domain:
- Leave-graph / external graph:
- Synthetic mechanism test:
- Experimental or domain validation:
- Leakage risk:

## Interpretation

- What the graph model demonstrates:
- What the causal module adds:
- What should not be called causal:
- Most important ablation:
- Most important follow-up validation:
- Safe wording for manuscript:

## Guardrail Check

- Are graph edges causally meaningful or only useful proxies?
- Does the validation split match the claimed generalization?
- Are post-intervention variables excluded from predictors?
- Are LLM-generated or learned features separated from causal evidence?
- Are attention/subgraph explanations treated cautiously?
- Are biological, industrial, or physical mechanisms externally validated?
