# Example Prompts

## English

```text
Use empirical-research-forge to review my empirical economics paper draft.
Focus on the research question, contribution, estimand, identification strategy,
tables, robustness checks, method-source alignment, and reproducibility package.
```

```text
Use empirical-research-forge to turn this paper and replication folder into an audit report.
Separate code reproducibility from identification credibility.
```

```text
Use empirical-research-forge and econ-identification-skeptic to design a DID workflow for my panel dataset.
I need the main specification, diagnostics, event-study checks, robustness plan, table structure, and a credibility verdict.
```

```text
Use econ-identification-skeptic to audit my IV design.
Tell me whether the first stage, exclusion restriction, monotonicity, and LATE interpretation are all defensible.
```

```text
Use causal-ml-estimator-selector to design a CATE workflow for my observational treatment-effect project.
Compare S-learner, T-learner, X-learner, R-learner, DR-learner, uplift forests, and IV/DRIV options.
Build a design card, feature-leakage checklist, overlap diagnostics, validation plan, and interpretation guardrails.
```

```text
Use stata-econometrics-runner to inspect this Stata replication package.
Find the master do-file, identify dependencies, run it if Stata is available, and summarize errors, warnings, and output mismatches.
```

## 中文

```text
使用 empirical-research-forge 帮我审查这篇实证经济学论文，重点看研究问题、贡献、estimand、识别策略、数据、回归表、稳健性检验、方法来源对齐和复现包。
```

```text
使用 empirical-research-forge 把这篇论文和代码文件夹整理成复现审计报告。请区分“代码是否可复现”和“识别策略是否可信”。
```

```text
使用 empirical-research-forge 和 econ-identification-skeptic 帮我设计一个 DID 论文工作流：主回归、事件研究、pre-trend、安慰剂检验、异质性分析、机制分析、图表安排和可信度 verdict。
```

```text
使用 econ-identification-skeptic 审查我的 IV 设计。请分别判断 first stage、exclusion restriction、monotonicity 和 LATE 解释是否站得住。
```

```text
使用 causal-ml-estimator-selector 帮我设计一个 CATE/ITE 因果机器学习工作流：先判断 estimand、处理变量、结果变量、特征是否为处理前变量、overlap 是否足够，再比较 S/T/X/R/DR learner、uplift forest 和 IV/DRIV，并给出验证计划和不能过度解释的地方。
```

```text
使用 stata-econometrics-runner 检查这个 Stata 复现包。请找到 master do-file，识别依赖包，如果本机 Stata 可运行就执行，并总结 log 错误、警告和输出不匹配。
```

```text
Use stata-econometrics-runner to create a project context file for this Stata paper.
Include data paths, do-file order, required packages, table outputs, clustering rules, and the identification strategy.
```

```text
使用 stata-econometrics-runner 帮我整理一个 Stata 项目上下文文件，记录数据路径、do-file 顺序、依赖包、表格输出、聚类标准误规则和识别策略。
```
