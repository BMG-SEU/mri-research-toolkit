---
name: mri-research-toolkit
description: "MRI/fMRI 核磁科研工具包 — 当用户提到 fMRI、MRI、DTI、静息态、GLM分析、BOLD、NIfTI、fMRIPrep、nilearn、BIDS、功能连接、VBM、FreeSurfer、脑网络、核磁文献综述等场景时使用。提供 27 个方法论 + 7 个专家角色 + 9 个工作流模板"
---
# MRI Research Toolkit
与本项目姐妹项目 BCI Research Toolkit 共用 AO 引擎和论文 Skills。当用户提出 MRI/fMRI 科研需求时自动激活。

## 快速决策
| 用户想... | 用什么 |
|---------|--------|
| 规划分析（不执行代码） | `ao compose "..." --run` 或 `ao run workflows/xxx.yaml` |
| 写代码 + 跑 Python | Claude Code 直接做 |
| 多角色讨论 | AO `ao run workflows/xxx.yaml` |

## 9 个预设工作流
1. fmri-preprocessing → fMRIPrep参数
2. fmri-glm-analysis → GLM设计+校正
3. fmri-resting-fc → 种子点/ICA/图论
4. fmri-graph-theory → 脑网络度量
5. fmri-dti-analysis → QSIprep+TBSS
6. fmri-structural → VBM/FreeSurfer
7. fmri-literature-review → MRI综述
8. mri-data-analysis-bridge → NIfTI读取
9. fmri-nilearn-execution → nilearn执行

## 27 个 Skills
27 个方法论覆盖 fMRI/DTI/结构/论文写作全流程。详见 `skills/` 目录。

## 费用
DeepSeek ¥2/1M tokens，一次 fMRI 分析 ¥0.02-0.16。
