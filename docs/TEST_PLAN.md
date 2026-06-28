# MRI Research Toolkit — 功能测试计划

> 测试日期：待执行 | 被测版本：v0.3+ | LLM：DeepSeek API | 测试执行：Claude Code 或手动

## 一、测试概览

| 阶段 | 内容 | 测试项 | 费用 |
|------|------|:--:|:--:|
| 第一阶段 | 零费用验证（YAML 校验 + DAG 查看） | 18 | ¥0 |
| 第二阶段 | 功能验收（核心 Workflow 实际运行） | 9 | ~¥0.60 |
| **合计** | | **27** | **~¥0.60** |

---

## 二、第一阶段：零费用验证

### 2.1 YAML 格式校验（9 个 Workflow）

```bash
cd mri-research-toolkit
for f in workflows/*.yaml; do echo "=== $f ===" && ao validate "$f"; done
```

| # | 文件 | 步骤数 | 预期 |
|---|------|:--:|:--:|
| 1 | fmri-preprocessing.yaml | 4 | ✅ valid |
| 2 | fmri-resting-fc.yaml | 4 | ✅ valid |
| 3 | fmri-glm-analysis.yaml | 4 | ✅ valid |
| 4 | fmri-graph-theory.yaml | 4 | ✅ valid |
| 5 | fmri-dti-analysis.yaml | 4 | ✅ valid |
| 6 | fmri-structural.yaml | 3 | ✅ valid |
| 7 | fmri-literature-review.yaml | 4 | ✅ valid |
| 8 | mri-data-analysis-bridge.yaml | 3 | ✅ valid |
| 9 | fmri-nilearn-execution.yaml | 3 | ✅ valid |

### 2.2 执行计划查看（9 个，不调用 API）

```bash
ao plan workflows/fmri-preprocessing.yaml -i data_dir=@test -i scan_type=resting-state
ao plan workflows/fmri-resting-fc.yaml -i data_dir=@test
ao plan workflows/fmri-glm-analysis.yaml -i design_desc="事件相关" -i contrasts="A>B" -i tr=2
ao plan workflows/fmri-graph-theory.yaml -i conn_matrix="全脑parcel"
ao plan workflows/fmri-dti-analysis.yaml -i dwi_dir=@test -i bval=1000
ao plan workflows/fmri-structural.yaml -i t1_dir=@test -i method=VBM
ao plan workflows/fmri-literature-review.yaml -i topic="resting-state ICA reproducibility"
ao plan workflows/mri-data-analysis-bridge.yaml -i file_path=@test.nii.gz
ao plan workflows/fmri-nilearn-execution.yaml -i bold_file=@test.nii.gz
```

**预期**：每个输出完整 DAG 执行计划，无报错。

---

## 三、第二阶段：功能验收（调用 API）

### 3.1 自由对话编排

```bash
ao compose "帮我规划 fMRI 预处理步骤，BIDS 格式，静息态数据" --run
```

**验证点**：✅ 自动拆任务 ✅ 匹配 MRI 角色 ✅ 输出可用方案

### 3.2 核心 Workflow 测试

| # | Workflow | 命令 | 验证点 | 费用 |
|---|----------|------|--------|:--:|
| 1 | 预处理 | `ao run workflows/fmri-preprocessing.yaml -i data_dir=@test -i scan_type=resting-state` | 4步依次执行，产出 fMRIPrep 参数方案 | ¥0.03 |
| 2 | 静息态FC | `ao run workflows/fmri-resting-fc.yaml -i data_dir=@test -i method=seed-based` | 方法选型+去噪+代码生成 | ¥0.10 |
| 3 | GLM | `ao run workflows/fmri-glm-analysis.yaml -i design_desc="组块设计A-B" -i contrasts="A>B" -i tr=2` | 设计矩阵+多重比较+nilearn代码 | ¥0.05 |
| 4 | 图论 | `ao run workflows/fmri-graph-theory.yaml -i conn_matrix="全脑200parcel"` | 阈值策略+度量方案+代码 | ¥0.05 |
| 5 | 文献综述 | `ao run workflows/fmri-literature-review.yaml -i topic="deep learning fMRI preprocessing"` | 检索+分类+质量评估+综述稿 | ¥0.15 |

### 3.3 Web 界面

```bash
ao web
```

**验证点**：✅ 浏览器打开 ✅ 工作流列表可见 ✅ 可参数化运行

### 3.4 自由对话场景

| 场景 | 命令 | 费用 |
|------|------|:--:|
| 润色英文 | `ao compose "帮我润色这段 fMRI Methods 英文" --run` | ¥0.02 |
| 文献搜索 | `ao compose "帮我搜 fMRI 多重比较校正的最新方法" --run` | ¥0.05 |
| BIDS 验证 | `ao compose "检查这个目录是否符合 BIDS 格式" --run` | ¥0.02 |
| 不了解工具 | `ao compose "我第一次用这个工具，能做什么？" --run` | ¥0.02 |

---

## 四、完整验收清单

| # | 测试项 | 状态 | 备注 |
|---|--------|:--:|------|
| 1 | 全部 9 个 YAML 通过 `ao validate` | ⬜ | 免费 |
| 2 | 全部 9 个通过 `ao plan` | ⬜ | 免费 |
| 3 | 自然语言编排 `ao compose --run` | ⬜ | ¥0.02 |
| 4 | 多 Agent 自动协作（角色匹配正确） | ⬜ | 7 个 MRI Agent 正确匹配 |
| 5 | 步间变量传递 | ⬜ | `{{}}` 变量正确解析 |
| 6 | `output_file` 产出文件 | ⬜ | 每个工作流产出对应文件 |
| 7 | Web 界面 | ⬜ | `ao web` 正常启动 |
| 8 | Skills 自动加载 | ⬜ | 27 个 Skills 在工作流中挂载 |
| 9 | BIDS 验证 Skill | ⬜ | bids-validator 被推荐 |
| 10 | 文献支撑引用正确 | ⬜ | 每个 MRI Skill 输出含顶刊引用 |

---

## 五、费用明细（预估）

| 测试项 | tokens | 费用 |
|--------|-------:|----:|
| 9 个 validate + plan | 0 | ¥0 |
| 5 个核心 Workflow | ~120,000 | ¥0.38 |
| 4 个自由对话 | ~30,000 | ¥0.11 |
| **合计** | **~150,000** | **~¥0.49** |

---

## 六、文件结构验证

```bash
# Skills
find skills -name "SKILL.md" | wc -l    # 预期 27

# Agents  
ls agents/*.md | wc -l                   # 预期 7

# Workflows
ls workflows/*.yaml | wc -l             # 预期 9

# Docs
ls docs/*.md | wc -l                     # 预期 ≥3
```

| 组件 | 预期 | 实际 | 状态 |
|------|:--:|:--:|:--:|
| Skills | 27 | ⬜ | |
| Agent | 7 | ⬜ | |
| Workflow | 9 | ⬜ | |
| 文档 | ≥3 | ⬜ | |

---

*测试计划编写日期：2026-06-28*
