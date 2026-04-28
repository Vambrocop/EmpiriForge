# 从《Scaling Reproducibility》可提炼的 AI Skills

本文档把论文中的 agent/skill 思想转化为可复用的 skill 设计草案。重点不是复刻原作者系统，而是提炼出可用于经济学、社会科学和跨学科研究的模块化工作流。

## 1. 总体设计原则

一个好 skill 应该像一个小岗位，而不是一段泛泛提示词。

每个 skill 至少要定义：

- 使用场景；
- 输入；
- 输出；
- 工具边界；
- 必须验证的证据；
- 常见失败模式；
- 可自动修复的情况；
- 必须交给人类判断的情况。

论文最重要的设计原则是三种分离：

- 科学判断与计算执行分离；
- LLM 编排与确定性代码分离；
- 代码运行与结果验证分离。

这三条应该成为所有研究型 skills 的底层规范。

## 2. Profiler：论文画像 Skill

**用途**：读取论文 PDF、草稿或 arXiv 页面，抽取研究元数据和经验任务。

**触发**：用户上传论文、要求“帮我看这篇文章”“提取研究设计”“整理数据和模型”。

**输入**：

- 论文 PDF 或文本；
- 论文附件；
- 用户指定的研究领域。

**输出**：

- 标题、作者、年份、期刊；
- 研究问题；
- 数据来源；
- 识别策略；
- 主要模型；
- 变量结构；
- 是否有复现包；
- 可得性声明；
- 潜在复现难点。

**失败模式**：

- PDF 表格抽取混乱；
- 数据链接藏在脚注或 appendix；
- 同一论文有多个版本；
- 研究设计描述与代码不一致。

## 3. Librarian：复现材料检索 Skill

**用途**：寻找、下载、登记论文复现包。

**触发**：用户要求找数据、找 replication package、复现论文、检查可复现性。

**输入**：

- 论文元数据；
- DOI、URL、Dataverse/GitHub/OSF 链接；
- 论文 PDF 中的 data availability statement。

**输出**：

- 本地复现包路径；
- 下载来源；
- 文件清单；
- 数据许可证和访问限制；
- 缺失材料报告。

**关键规则**：

- 优先使用论文 PDF 中出现的链接；
- 再使用 DOI、题名和作者搜索；
- 避免下载题名相似但不是同一论文的数据集。

## 4. Janitor：代码清理 Skill

**用途**：修复复现包中阻碍批量运行的路径、依赖、旧语法和交互命令。

**触发**：代码无法运行、路径错误、依赖缺失、图形命令卡住、Stata/R/Python 环境不一致。

**输入**：

- 原始代码；
- 文件结构；
- 错误日志。

**输出**：

- 清理后的代码副本；
- 修改日志；
- 未能修复的问题清单。

**可自动修复**：

- 绝对路径改相对路径；
- 注释图形输出和交互命令；
- 安装或记录缺失依赖；
- 修复 Stata `#delimit`、旧 merge 语法；
- 处理 R 包退役或输出包失败；
- 转换 `.dta`、`.tab`、`.csv` 等格式。

**不能乱动**：

- 不得改变模型规格；
- 不得改变样本限制；
- 不得改变变量构造；
- 不得为了“跑通”而修改实质性估计。

## 5. Runner：执行与日志 Skill

**用途**：运行 Stata/R/Python 代码，捕获结构化结果。

**触发**：用户要求复现表格、运行回归、生成模型输出。

**输入**：

- 清理后的代码；
- 数据文件；
- 运行配置。

**输出**：

- 执行日志；
- 所有模型的系数、标准误、样本量、聚类信息；
- 成功/失败状态；
- 可复现运行命令。

**验证**：

- 每个脚本是否运行；
- 每个模型是否有结构化输出；
- 输出是否可追溯到源代码位置。

## 6. Extractor：论文表格抽取 Skill

**用途**：从论文回归表中抽取点估计和表格结构。

**触发**：需要把论文报告值与代码结果匹配。

**输入**：

- PDF；
- 渲染后的表格图片；
- OCR 或 VLM 输出。

**输出**：

- 表格编号；
- 行名；
- 列名；
- 系数；
- 小数位数；
- 标准误或置信区间；
- 表格注释。

**难点**：

- 星号显著性；
- 多层表头；
- appendix 和 main table 混杂；
- 系数与标准误交错排版；
- 扫描版 PDF。

## 7. Matcher：论文-代码匹配 Skill

**用途**：比较论文报告的点估计和代码生成的点估计。

**触发**：需要给出 fully/largely/partially/not reproducible verdict。

**输入**：

- `paper_coefficients.json`；
- `code_outputs.json`。

**输出**：

- 每张表的匹配率；
- 全文匹配率；
- unmatched 项目；
- 可能原因；
- 复现 verdict。

**规则**：

- 按论文报告小数位数舍入；
- 做一对一最优匹配；
- 不把“运行成功”等同于“结果复现”；
- 不把标准误作为默认匹配标准，除非用户明确要求。

## 8. Classifier：研究设计分类 Skill

**用途**：识别论文使用的经验设计。

**触发**：用户要求判断 DID、IV、RDD、event study、panel FE、DML 等方法。

**输入**：

- 论文方法部分；
- 回归方程；
- 代码命令；
- 变量说明。

**输出**：

- 设计类型；
- 处理变量；
- 结果变量；
- 工具变量或断点；
- 固定效应；
- 聚类层级；
- 诊断模板建议。

**经济学扩展**：

- DID / staggered DID；
- IV / Bartik / shift-share；
- RDD / fuzzy RDD；
- synthetic control；
- event study；
- panel fixed effects；
- matching / PSM；
- double machine learning；
- mediation / mechanism tests。

## 9. Skeptic：识别与稳健性诊断 Skill

**用途**：像严厉审稿人一样检查识别策略和稳健性。

**触发**：用户说“帮我审识别策略”“这个 DID/IV 可信吗”“还需要什么稳健性检验”。

**输入**：

- 研究设计分类；
- 模型输出；
- 数据结构；
- 论文主张。

**输出**：

- 识别假设清单；
- 可检验诊断；
- 不可检验但必须讨论的威胁；
- 推荐稳健性检验；
- 审稿人可能攻击点。

**IV 诊断**：

- 第一阶段 F；
- Anderson-Rubin；
- weak-IV robust inference；
- bootstrap；
- jackknife；
- OLS vs 2SLS。

**DID 诊断**：

- pre-trend；
- treatment timing；
- negative weights；
- cohort-specific effects；
- event-study window；
- placebo。

## 10. Journalist：报告生成 Skill

**用途**：把复现、诊断和写作建议汇总成标准化报告。

**触发**：用户要求“生成报告”“写复现总结”“输出审稿前检查”。

**输入**：

- 运行日志；
- 匹配报告；
- 诊断结果；
- 图表；
- 研究问题。

**输出**：

- executive summary；
- 复现 verdict；
- 表格级结果；
- 设计诊断；
- 风险清单；
- 下一步行动。

**风格**：

- 数字先行；
- verdict 明确；
- 不夸大；
- 区分“代码可复现”和“识别可信”。

## 11. Replication Packager：复现包整理 Skill

**用途**：帮作者投稿前整理 replication package。

**触发**：用户准备投稿、上传代码数据、要求整理 README 或 AEA/JDE 规范。

**输入**：

- 数据；
- 代码；
- 表格；
- 论文草稿；
- 运行环境。

**输出**：

- `README.md`；
- `run_all` 脚本；
- 数据字典；
- 文件清单；
- 环境说明；
- 受限数据说明；
- AI disclosure 草稿。

**检查清单**：

- 一键运行；
- 相对路径；
- 原始数据和处理数据分离；
- 输出表格可追溯；
- 随机种子固定；
- 依赖版本记录；
- 受限数据替代说明。

## 12. 可做成 GitHub 项目的 MVP

最小可行版本不要一开始做十几个 skill。建议先做一个主 skill：

```text
empirical-research-forge
```

它负责总编排，内部按阶段路由：

```text
idea → literature → identification → data → estimation → diagnostics → writing → replication package → review
```

配套三个 reference 文件：

- `economics-workflow.md`：经济学论文全流程；
- `identification-checklist.md`：DID/IV/RDD/event study 检查表；
- `reproducibility-package.md`：复现包规范。

以后再拆成独立 skills：

- `econ-identification-skeptic`
- `replication-package-janitor`
- `causal-diagnostics-runner`
- `paper-journalist`
- `meta-analysis-forge`
- `omics-workflow-forge`

## 13. 与原文的关系

这套 skills 的灵感来自原文，但目标不同：

- 原文面向政治学论文复现；
- EmpiriForge 面向经济学与跨学科实证研究生产；
- 原文重在验证已有论文；
- EmpiriForge 同时服务写作、审查、复现和投稿前打包。

最该继承的是方法论：把隐性经验变成可执行、可验证、可版本化的工作流。

## 14. 已加入 EmpiriForge 的两个具体 Skill

在第一版通用 skill 之外，EmpiriForge 已加入两个更容易被别人理解和试用的具体入口。

### econ-identification-skeptic

这是面向应用经济学论文的“识别策略审稿人”。它的任务不是帮用户把论文说得更漂亮，而是找出 DID、IV、RDD、event study、panel FE、synthetic control、matching、causal ML 中最容易被审稿人攻击的地方。

它适合这些场景：

- 投稿前自查；
- 写 identification section；
- 设计稳健性检验；
- 模拟 referee report；
- 判断一篇论文的因果识别是否站得住。

它的核心输出包括：

- estimand；
- identifying variation；
- identifying assumptions；
- testable diagnostics；
- non-testable threats；
- robustness plan；
- reviewer-style findings。

### meta-analysis-forge

这是面向系统综述、meta 分析、二阶 meta 分析、umbrella review 和 meta + ML 的 evidence synthesis skill。

它适合这些场景：

- 写 PRISMA-style protocol；
- 设计检索式和筛选流程；
- 制作 effect-size coding sheet；
- 处理多个 effect sizes 的依赖；
- 设计 random-effects / multilevel / meta-regression；
- 做 publication bias 和 small-study effects 检查；
- 做 umbrella review 或 second-order meta-analysis；
- 用 ML 辅助筛选、提取、分类、异质性探索。

它特别强调一个边界：机器学习可以辅助检索、筛选、提取和探索异质性，但不能替代 eligibility criteria、人工复核、效应量验证和统计解释。

## 15. 二阶 Meta 和 Meta + ML 应该怎么放进工作流

二阶 meta 分析不应该只是“把别人的 meta 分析再平均一次”。它的核心问题是：多个 review/meta-analysis 往往重复使用同一批 primary studies。若不处理 overlap，就会把同一证据重复计数。

因此 `meta-analysis-forge` 把二阶 meta 拆成这些步骤：

1. 明确定义 umbrella review 还是 second-order meta-analysis；
2. 搜索已有 systematic reviews 和 meta-analyses；
3. 提取 review-level pooled effects；
4. 建立 primary-study overlap matrix；
5. 评估 review quality 和检索日期；
6. 判断是否适合统计合并；
7. 如果 overlap 太高，优先做 narrative umbrella synthesis；
8. 如果要统计合并，使用多层模型或稳健方差等方式处理依赖；
9. 把证据重复、异质性和质量等级放在结论前面。

Meta + ML 则拆成四种角色：

- **screening ML**：文献筛选优先级排序；
- **extraction ML**：辅助抽取样本、结果、效应量和协变量；
- **classification ML**：给研究设计、干预类型、结局类别打标签；
- **moderator discovery ML**：探索异质性和潜在调节变量。

但它必须遵守三条规则：

- ML 发现的 moderator 默认是 exploratory，不是 confirmatory；
- ML 抽取的数字必须有人工或脚本验证；
- ML 减少人工负担，不减少透明度要求。

这个设计让 EmpiriForge 不只是经济学写作项目，而可以自然扩展到医学、环境、生态、生命科学、组学和政策评估中的证据综合。
