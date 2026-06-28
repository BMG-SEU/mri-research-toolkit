# MRI/fMRI Research Toolkit — 项目介绍

> 一套为核磁共振与功能磁共振研究打造的 AI 智能体工具包  
> **27 Skills · 7 Agent · 9 Workflow · 89+ 提示词 · 继承自 BCI Research Toolkit**

## 🚀 快速开始

```bash
# 方式 A：纯 Skill 包（仅需 Claude Code，30 秒）
curl -fsSL https://raw.githubusercontent.com/BMG-SEU/mri-research-toolkit/main/install-claude-skills.sh | bash

# 方式 B：完整部署（含 AO + WebUI）
git clone https://github.com/BMG-SEU/mri-research-toolkit.git
cd mri-research-toolkit && bash setup.sh
# 编辑 .env → ao web
```

> 📖 完整教程：[docs/tutorial.md](docs/tutorial.md) · FAQ：[docs/faq.md](docs/faq.md)

---

## 一、这是什么？

**MRI Research Toolkit** 是 BCI Research Toolkit 的姊妹项目。它与 BCI 项目共用同一套多 Agent 编排引擎（agency-orchestrator），但挂载了 MRI/fMRI 领域专属的 Agent、Skills 和 Workflow。

### 与 BCI 项目的关系

```
bci-research-toolkit          mri-research-toolkit
      │                              │
      ├── AO 引擎 ←────共享────→ AO 引擎
      ├── 18 论文 Skills ←─共享──→ 18 论文 Skills
      ├── 89+ 提示词 ←───共享────→ 89+ 提示词
      ├── 13 BCI Skills            ├── 8 MRI Skills
      ├── 7 BCI Agent              ├── 7 MRI Agent
      └── 11 BCI Workflow          └── 9 MRI Workflow
```

---

## 二、解决什么问题？

| 痛点 | 本工具解决方案 |
|------|--------------|
| fMRI 预处理参数不会选 | AI 推荐 fMRIPrep/XCP-D 完整参数方案（含 FD 阈值、FWHM、去噪策略） |
| GLM 设计矩阵不会构建 | AI 根据实验描述自动设计对比矩阵和多重比较校正方案 |
| 静息态连接分析方法太多不知道怎么选 | 种子点/ICA/图论/动态决策树 + nilearn 代码生成 |
| DTI/TBSS 参数不会设 | QSIprep 预处理 + TBSS 分析全流程 |
| VBM/FreeSurfer 不会用 | 结构像分析工具选型 + 命令生成 |
| MRI 文献太散 | 系统化检索 + COBIDAS 质量评估 + 综述生成 |
| Python fMRI 分析工具分散 | nilearn 一站式替代 SPM/FSL |

---

## 三、项目有什么？

| 组件 | 数量 | 说明 |
|------|:--:|------|
| **MRI Skills** | 8 | fMRIPrep预处理 · GLM · 静息态FC · 图论 · DTI · 结构 · nilearn · 深度学习fMRI |
| **论文 Skills** | 18 | 从 BCI 项目复用（写作/润色/翻译/引用/审稿回复/LaTeX等） |
| **MRI Agent** | 7 | 预处理/GLM/连接/DTI/结构/文献/nilearn代码审查 |
| **Workflow** | 9 | 预处理/GLM/静息态FC/图论/DTI/结构/文献综述/数据桥接/nilearn执行 |
| **提示词库** | 89+ | academic-ai-prompt-main v2.1（论文写作/选题/查找/综述） |
| **文献支撑** | 20 篇 | Nature Methods/NeuroImage/PNAS 等顶刊（2020-2026 为主） |

### 8 个 MRI Skills（均含权威文献引用）

| Skill | 核心文献 | 用途 |
|-------|---------|------|
| fmri-preprocessing | Esteban 2019 *Nat Methods*; Mehta 2024 *Nat Methods* | fMRIPrep 11 步标准流程 |
| fmri-glm-analysis | Friston 1995 *HBM*; Eklund 2016 *PNAS* | GLM设计+多重比较校正 |
| fmri-resting-fc | Biswal 1995; Beckmann 2004; Faskowitz 2020 *Nat Neurosci* | 种子点/ICA/动态FC |
| fmri-graph-theory | Rubinov & Sporns 2010 *NeuroImage*; Gu 2023 *Nat Commun* | 脑网络度量 |
| fmri-dti-analysis | Basser 1994; Cieslak 2024 *Nat Methods* | QSIprep+TBSS |
| fmri-structural | Fischl 2012 *NeuroImage*; Billot 2023 | VBM/FreeSurfer/SynthSeg |
| fmri-nilearn | Nilearn team 2024 | Python 替代 SPM/FSL |
| fmri-deep-learning | Thomas 2024 *Nat Biomed Eng*; Jiang 2024 *Nat Mach Intell* | BrainLM/Neuro-VLM |

### 9 个预设 Workflow

| Workflow | 输入 | 产出 |
|----------|------|------|
| fMRI 预处理 | BIDS 路径 | fMRIPrep 参数方案 + 命令 |
| GLM 分析 | 实验设计 + 对比 | GLM方案 + nilearn代码 |
| 静息态 FC | BIDS + ROI | 连接分析方案 + 去噪策略 + nilearn代码 |
| 图论分析 | 连接矩阵 | 度量方案 + bctpy代码 |
| DTI 分析 | DWI + b-value | QSIprep+TBSS方案 |
| 结构分析 | T1 数据 | VBM/FreeSurfer方案 |
| MRI 文献综述 | 研究主题 | 检索策略 + 方法回顾 + 综述稿 |
| 数据桥接读取 | NIfTI 文件 | 元数据诊断 + 质量报告 |
| nilearn 执行 | BOLD + 分析类型 | 实际分析结果 + 统计图 |

---

## 四、架构设计

```
课题组成员 → 自然语言 / ao web
              ↓
      Agency Orchestrator (AO)
     (多Agent编排引擎 · YAML · DAG)
              ↓
   ┌──────────┼───────────┐
   ▼          ▼           ▼
DeepSeek   MRI Skills   MRI Agents   论文Skills
  GLM      8个(文献)   7个(角色)    18个(复用)
```

---

## 五、两种交付方式

| | 纯 Skill 包 | 完整版 |
|------|:---:|:---:|
| 安装 | `curl ... \| bash` | `git clone + bash setup.sh` |
| 需要 AO？ | ❌ | ✅ |
| 多角色并行 | ❌ | ✅ |
| Web 界面 | ❌ | ✅ |
| 28 Skills | ✅ | ✅ |

---

## 六、优势

- 🧠 **MRI 专属**：Skills 和 Workflow 专门为 fMRI/DTI/结构像定制
- 🔄 **继承 BCI**：AO 引擎、18 个论文 Skills、89+ 提示词全部复用
- 💰 **极低成本**：DeepSeek ¥0.01-0.16/次
- 📚 **文献支撑**：每个 Skill 标注 Nature Methods/NeuroImage 等顶刊出处
- 🐍 **nilearn 优先**：Python 原生分析，替代 SPM/FSL
- 🔒 **数据安全**：本机处理，不上传云端

---

*仓库：https://github.com/BMG-SEU/mri-research-toolkit*  
*姊妹项目：https://github.com/BMG-SEU/bci-research-toolkit*
