# 总修改说明

这份说明整合了目前已经完成的第一轮和第二轮修改，目的是让组内同学只看这一份就能知道：

- 我们到底改了什么
- 哪些反馈已经落实
- 当前最稳的研究口径是什么
- 还剩哪些工作没有同步到最终展示材料

## 一、目前已经落实的主要修改

### 第一轮已完成

- 把基线结果从 2 个结果变量扩展到 5 个：
  - `poor215`
  - `poor365`
  - `poor685`
  - `gini`
  - `theil`
- 把原先只有 FE 的主方法线升级为：
  - 次国家 `FE`
  - 次国家 `LD`
- 把结果图拆成：
  - 贫困结果图
  - 不平等结果图
- 新增样本构造表，解释为什么不同模型的 `N` 不同
- 新增变量定义表，提升答辩防守性

### 第二轮已完成

- 补出以 `[18,21)` 为基准箱的温度分箱 FE 图
- 恢复原文“高温区效应更强”的非线性主线
- 新增国家级聚合 `FE/LD` 对照结果
- 新增“国家级 vs 次国家”对照图
- 进一步明确：
  - 治理异质性不是主结论
  - `risk score` 只是 `risk-screening tool`

## 二、当前已经验证的核心结果

### 1. 次国家 FE

- `poor215 = 0.629`
- `poor365 = 0.809`
- `poor685 = 0.165`，不显著
- `gini = 0.463`
- `theil = 1.119`

解释：

- 升温会显著提高较低贫困线下的贫困率
- 对最高贫困线 `poor685` 的影响在当前设定下不稳健
- 升温对不平等的正向影响在 `gini` 和 `theil` 上都能看到

### 2. 次国家 LD

- `poor215 = 1.178`
- `poor365 = 0.736`
- `poor685 = -0.125`，不显著
- `gini = 0.684`
- `theil = 1.273`

解释：

- FE 和 LD 的方向基本一致
- 说明主结果不是只靠短期波动撑起来的
- `poor685` 在 FE 和 LD 下都不显著，反而让结果更严谨

### 3. 温度分箱 FE

- 基准箱为 `[18,21)`
- 相对于 `[18,21)`，较冷温度箱的系数整体更低
- 最热温度箱 `33+` 对 `poor215`、`poor365` 和 `theil` 呈现更高系数

解释：

- 温度效应并不是简单线性的
- 极端高温区的风险更值得关注
- 这已经把原文“高温区更显著”的主线补回来了

### 4. 国家级 FE/LD 对照

- 国家级 FE 大多方向仍为正，但显著性和精度明显弱于次国家 FE
- 国家级 LD 同样更弱
- 对贫困结果尤其明显，国家级聚合后更容易变得不显著

解释：

- 国家平均会掩盖次国家内部异质性
- 因此国家级结果适合作为对照，不适合作为主识别

## 三、样本构造的关键数字

- 原始面板观测值：`6727`
- 贫困变量可用样本：`6719`
- 不平等变量可用样本：`5736`
- FE 完整样本：
  - 贫困结果 `6052`
  - 不平等结果 `5143`
- 农业异质性完整样本：
  - 贫困结果 `6042`
  - 不平等结果 `5133`
- LD 完整样本：
  - 贫困结果 `1292`
  - 不平等结果 `1194`

## 四、目前最稳的项目口径

- 主结果：次国家 `FE + LD`
- 主拓展：农业异质性
- 主补强：温度分箱结果
- 对照附录：国家级聚合 `FE/LD`
- appendix：治理异质性

## 五、已经补好的防守性说明

- 不再只讲显著的两个结果变量，而是完整报告 5 个结果变量
- `poor685` 在 FE 和 LD 下都不显著，这一点保留并写清
- 已补样本构造表
- 已补变量定义表
- 已把治理异质性降级，不再建议作为 headline
- 已把 `risk score` 的说法收紧为 `risk-screening`

## 六、当前仍未完全同步的部分

- GitHub 上的主中文 `writeup/manual` 还没有完全重写到最新分析版本
- 海报和 PPT 还没有按这两轮新增图表重新排版
- 治理异质性还没有正式被整理成 appendix 版本的公开文稿

## 七、建议发给同学的总结口径

可以直接说：

“目前我们已经把最关键的反馈基本补齐了。第一轮补上了 5 个结果变量、次国家 FE+LD、样本构造表和变量定义表；第二轮补上了温度分箱，恢复了原文‘高温区效应更强’的主线，同时也补了国家级聚合对照，证明国家平均会弱化和模糊次国家层面的气候贫困风险。现在分析层面已经比较完整，下一步主要是把中文 writeup/manual、海报和 PPT 全部同步到这版结果上。” 

## 八、GitHub 图表与表格链接

下面这些链接都是目前已经修改或新生成、并且已经推送到 GitHub 的图表和结果表。

### 第一轮结果

- 基线 FE 结果表：
  `https://github.com/DannyCSH/cgrm7006-climate-poverty-traps/blob/main/10_baseline_fe_results.csv`
- 次国家 LD 结果表：
  `https://github.com/DannyCSH/cgrm7006-climate-poverty-traps/blob/main/15_long_difference_results.csv`
- 样本构造表：
  `https://github.com/DannyCSH/cgrm7006-climate-poverty-traps/blob/main/sample_construction.csv`
- 变量定义表：
  `https://github.com/DannyCSH/cgrm7006-climate-poverty-traps/blob/main/variable_definition_table.csv`
- 贫困 FE/LD 图：
  `https://github.com/DannyCSH/cgrm7006-climate-poverty-traps/blob/main/assets/figure_1_poverty_fe_ld.png`
- 不平等 FE/LD 图：
  `https://github.com/DannyCSH/cgrm7006-climate-poverty-traps/blob/main/assets/figure_2_inequality_fe_ld.png`

### 第二轮结果

- 国家级 FE/LD 结果表：
  `https://github.com/DannyCSH/cgrm7006-climate-poverty-traps/blob/main/17_national_fe_ld_results.csv`
- 温度分箱结果表：
  `https://github.com/DannyCSH/cgrm7006-climate-poverty-traps/blob/main/temperature_bin_results.csv`
- 温度分箱贫困图：
  `https://github.com/DannyCSH/cgrm7006-climate-poverty-traps/blob/main/assets/figure_6_temperature_bins_poverty.png`
- 温度分箱不平等图：
  `https://github.com/DannyCSH/cgrm7006-climate-poverty-traps/blob/main/assets/figure_7_temperature_bins_inequality.png`
- 国家级 vs 次国家贫困对照图：
  `https://github.com/DannyCSH/cgrm7006-climate-poverty-traps/blob/main/assets/figure_8_scale_comparison_poverty.png`
- 国家级 vs 次国家不平等对照图：
  `https://github.com/DannyCSH/cgrm7006-climate-poverty-traps/blob/main/assets/figure_9_scale_comparison_inequality.png`
