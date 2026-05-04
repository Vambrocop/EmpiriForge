# Causal Graph Neural Networks

Use this reference when a paper combines graph neural networks with causal language: perturbation prediction, optimal intervention design, causal disentanglement, causal mechanism identification, stable causal subgraphs, LLM-enhanced GNNs, or graph-based fault diagnosis.

## Running Examples

### Therapeutic Perturbation Prediction

Gonzalez et al. (2025), "Combinatorial prediction of therapeutic perturbations using causally inspired neural networks," Nature Biomedical Engineering, introduces PDGrapher.

Core extractable facts:

- DOI: https://doi.org/10.1038/s41551-025-01481-x;
- code: https://github.com/mims-harvard/PDGrapher;
- domain: phenotype-driven therapeutic target discovery;
- graph: PPI networks or gene regulatory networks used as proxy causal graphs;
- node states: gene-expression profiles for diseased, healthy, and treated states;
- task: predict a combinatorial set of therapeutic targets that can shift a diseased cell state toward a treated state;
- model: two GNN modules, one for perturbagen discovery and one for response prediction;
- key architecture: direct inverse prediction of perturbagens rather than exhaustively simulating every candidate perturbation;
- evaluation: random splits and leave-cell-out / unseen-context evaluation across chemical and genetic perturbation datasets;
- guardrail: the paper explicitly treats PPI/GRN as approximations of causal graphs and relies on assumptions such as no unobserved confounders.

### LLM-Enhanced GNN Mechanism Identification

Gao et al. (2025), "LLM Enhancers for GNNs: An Analysis from the Perspective of Causal Mechanism Identification," arXiv:2505.08265, accepted by ICML 2025, studies how LLM feature enhancers affect GNN behavior.

Core extractable facts:

- DOI: https://doi.org/10.48550/arXiv.2505.08265;
- arXiv: https://arxiv.org/abs/2505.08265;
- task: analyze LLM-enhanced node representations for graph representation learning;
- method cue: interchange interventions;
- data strategy: synthetic graph dataset with controllable causal relationships;
- output: analysis plus a plug-and-play optimization module for information transfer between LLM enhancers and GNNs;
- guardrail: LLM-enhanced features may improve representation quality, but the causal mechanism claim depends on intervention-style analysis, not performance alone.

### Industrial Fault Diagnosis With Causal Disentanglement

Liu et al. (2025), "Causal Disentangled Graph Neural Network for Fault Diagnosis of Complex Industrial Process," IEEE Transactions on Industrial Informatics, uses causal disentanglement ideas for complex industrial process fault diagnosis.

Core extractable facts:

- DOI: https://doi.org/10.1109/TII.2024.3452246;
- domain: industrial fault diagnosis and multi-sensor/process systems;
- graph: process variables, sensors, or components and their dependencies;
- task: classify or diagnose faults while separating causal and biased/spurious graph substructures;
- model family: causal disentangled GNN;
- guardrail: a diagnostic subgraph can be robust and interpretable without being a verified intervention effect unless the process design supports causal interpretation.

## What To Extract

For every causal-GNN paper, identify:

- graph object: homogeneous graph, heterogeneous graph, dynamic graph, knowledge graph, PPI, GRN, sensor graph, process graph, or learned graph;
- node meaning and node state;
- edge meaning: causal, regulatory, physical, spatial, correlational, co-expression, attention-derived, or LLM-derived;
- intervention: node perturbation, edge mutilation, treatment, policy, sensor fault, counterfactual edit, or interchange intervention;
- estimand or target: treatment effect, perturbation set, response state, mechanism score, fault class, or stable subgraph;
- validation split: random, leave-node-out, leave-graph-out, leave-cell-line-out, leave-domain-out, time block, or synthetic counterfactual;
- counterfactual evidence: simulated intervention, held-out perturbation, mechanism intervention, ablation, or real experimental validation;
- uncertainty: graph uncertainty, hidden confounding, perturbation noise, feature instability, and domain shift.

## Workflow

1. State whether the model estimates a causal effect, predicts interventions, discovers mechanisms, or performs robust graph prediction.
2. Define the graph and edge semantics before accepting causal language.
3. Separate observed graph structure from learned or LLM-generated graph structure.
4. Identify the intervention operation: node perturbation, edge deletion/mutilation, feature edit, environment shift, or synthetic interchange intervention.
5. Check whether the target is forward prediction, inverse perturbation prediction, CATE/ITE, or diagnosis.
6. Match validation to the claim: unseen perturbagens, unseen cell lines, unseen disease contexts, unseen graphs, unseen fault types, or held-out environments.
7. Require baselines that do not use causal language but solve the same predictive task.
8. Require ablations: no graph, shuffled graph, alternative graph, no LLM enhancer, no causal loss, no disentanglement penalty.
9. Audit whether feature importance, attention, disentangled factors, or selected subgraphs are interpreted as mechanisms too strongly.
10. State the result as causal only if the graph assumptions, intervention design, and validation evidence justify it.

## Interpretation Rules

- A GNN on a graph is not automatically a causal model.
- A proxy causal graph should be named as proxy, not truth.
- Edge direction and edge type matter; undirected PPI and directed GRN support different claims.
- Attention weights, message passing paths, and LLM-enhanced features are explanation surfaces, not causal proof.
- A synthetic graph with known mechanisms can validate the method logic, but it does not prove real-world causal validity.
- Leave-domain-out performance supports robustness, not intervention validity by itself.
- Industrial fault subgraphs should be linked to process knowledge, sensor timing, and physical constraints.
- Therapeutic target predictions need biological or experimental follow-up before being treated as actionable interventions.

## Reusable Prompt Skeleton

```text
Use causal-ml-estimator-selector to audit this causal-GNN paper.

Study:
- graph source:
- node states:
- edge semantics:
- causal or intervention claim:
- model:
- validation split:

Return:
1. graph semantics audit;
2. intervention/estimand audit;
3. validation split and leakage risks;
4. proxy-graph and hidden-confounding risks;
5. ablation checklist;
6. safe manuscript wording.
```
