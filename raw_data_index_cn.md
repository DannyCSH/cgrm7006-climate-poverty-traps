# 原始数据与脚本索引

这份索引用于回答组内核对时最常见的四个问题：主回归到底用了什么数据、单位是不是次国家层面、`Source Data Fig. 1.xlsx` 是不是主数据、以及核心数据是怎样构造出来的。

## 1. 主回归实际使用的数据

- 主分析数据：`raw_data/dataverse_core/spid_for_analysis_v2.dta`
- 数据层级：次国家层面
- 典型空间单位：`geo_code2_new`

这份 `.dta` 是当前版本主回归直接调用的数据文件。

## 2. 不是主回归数据、但容易被误认的文件

- `raw_data/local_source/Source Data Fig. 1.xlsx`

这个文件只是论文中 Figure 1 的 source data，不是我当前主回归使用的数据文件。

## 3. 主分析数据的核心构造来源

- 构造脚本：`raw_data/dataverse_core/setup.do`
- 总控脚本：`raw_data/dataverse_core/master.do`
- SPID 基础来源：`raw_data/dataverse_core/spid_v2/subnational-poverty-inequality-spid-poverty.xlsx`
- 关键气候变量：
  - `raw_data/dataverse_core/temperature.dta`
  - `raw_data/dataverse_core/rainfall.dta`
  - `raw_data/dataverse_core/humidity.dta`
- 关键控制变量：
  - `raw_data/dataverse_core/income_classification.dta`

也就是说，当前项目并不是用 `Source Data Fig. 1.xlsx` 跑出来的，而是用 Dataverse 本地包中的 `spid_for_analysis_v2.dta`，并参考 `setup.do` 对应的数据构造逻辑。

## 4. 当前版本与原论文关系

- 当前主识别：次国家面板固定效应
- 当前辅助展示：部分国家级聚合图表
- 当前没有正式纳入：long-difference、机制中介检验

如果组内需要核对“我到底上传了哪些材料”，优先下载上面第 1 至第 3 部分列出的文件即可。
