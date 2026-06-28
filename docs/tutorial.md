# MRI 科研工具包 — 新手上手指南（小白版）

> **只要会复制粘贴，就能用。** 基于 BCI 项目小白教程改写。

## 快速开始（3 分钟）

### 方式 A：纯 Skill 包（已有 Claude Code）
```bash
curl -fsSL https://raw.githubusercontent.com/BMG-SEU/mri-research-toolkit/main/install-claude-skills.sh | bash
```
装完直接在 Claude Code 里说「帮我规划 fMRI 预处理」即可。

### 方式 B：完整部署
1. 下载 ZIP → 解压到桌面
2. 双击 `setup.bat`（Win）或 `bash setup.sh`（Mac）
3. 编辑 `.env` 填入 DeepSeek API key（`DEEPSEEK_API_KEY=sk-xxx`）
4. 输入 `ao web` → 浏览器打开 → 选模板 → 填参数 → 点运行

## 🎯 常用操作

| 我想... | 怎么做 |
|---------|--------|
| 规划 fMRI 预处理 | `ao run workflows/fmri-preprocessing.yaml -i data_dir=@/path/to/bids` |
| 设计 GLM 分析 | `ao run workflows/fmri-glm-analysis.yaml -i design_desc="..." -i contrasts="..."` |
| 静息态连接分析 | `ao run workflows/fmri-resting-fc.yaml -i data_dir=@/path/to/bids` |
| 图论分析 | `ao run workflows/fmri-graph-theory.yaml -i conn_matrix="..."` |
| DTI 分析 | `ao run workflows/fmri-dti-analysis.yaml -i dwi_dir=@/path -i bval=1000` |
| VBM/FreeSurfer | `ao run workflows/fmri-structural.yaml -i t1_dir=@/path` |
| MRI 文献综述 | `ao run workflows/fmri-literature-review.yaml -i topic="..."` |
| 不知道怎么用 | 直接说 `ao compose "我有 BIDS 格式的 fMRI 数据" --run` |

## 💡 费用
DeepSeek ¥2/1M tokens，一次 fMRI 分析 ¥0.01-0.16，充 10 块用几个月。

## 🆘 遇到问题？
- 重装：重新双击 `setup.bat` / `bash setup.sh`
- API 报错：检查 `.env` 里的 `DEEPSEEK_API_KEY`
- 完全不知道怎么办：`ao compose "我第一次用这个工具，能做什么？" --run`
