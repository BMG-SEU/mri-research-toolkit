# MRI 科研工具包 — 新手上手指南（小白版）

> **只要会复制粘贴，就能用。** 跟着步骤走，5 分钟搞定。不需要懂命令行。

---

## 第 0 步：你需要准备什么

| 你需要 | 去哪弄 | 花多少钱 |
|--------|--------|:--:|
| 一台电脑 | 你的 | — |
| 一个 DeepSeek 账号 | https://platform.deepseek.com | 充 10 块 |
| 一个 GitHub 账号（可选） | https://github.com | 免费 |

> **充 10 块钱够用几个月。** DeepSeek 很便宜，一次 fMRI 分析 ¥0.02-0.16。

---

## 第 1 步：检查有没有 Node.js

### Windows：按键盘 `Win + R`，输入 `cmd`，回车。输入 `node -v`，回车。
### Mac：按 `Cmd + 空格`，输入 `Terminal`，回车。输入 `node -v`，回车。

- **看到 `v20.x.x`** → 已有，跳到第 2 步
- **看到 `'node' 不是内部或外部命令`** → 去 https://nodejs.org 点左边绿色 **LTS** 下载，一路「下一步」安装

---

## 第 2 步：获取 DeepSeek API key

1. 打开 https://platform.deepseek.com → 注册/登录
2. 点左边「API Keys」→ 「创建 API Key」→ 复制 `sk-` 开头的那串字符
3. 去「充值」充 10 块钱

> 这把 key 是你自己的，**不要发给别人**。

---

## 第 3 步：下载工具包

### 方式 A：下载 ZIP（最简单）→ 解压到桌面
### 方式 B：Git clone
```
git clone git@github.com:BMG-SEU/mri-research-toolkit.git
```
### 方式 C：纯 Skill 版（已有 Claude Code）
```bash
curl -fsSL https://raw.githubusercontent.com/BMG-SEU/mri-research-toolkit/main/install-claude-skills.sh | bash
```

---

## 第 4 步：一键安装

**Windows**：双击 `setup.bat`  
**Mac**：打开 Terminal，`cd` 进入文件夹，输入 `bash setup.sh`

等 2 分钟，看到「✅ 部署完成」说明 OK。

---

## 第 5 步：填入 API key

1. 在文件夹里找到 `.env.example`，复制一份改名为 `.env`
2. 用记事本打开，找到 `DEEPSEEK_API_KEY=sk-your-deepseek-key-here`
3. 替换成你自己的 key，保存

---

## 第 6 步：启动！（推荐图形界面）

打开 cmd（Win）或 Terminal（Mac），进入文件夹，输入：
```
ao web
```
浏览器自动打开 → 下拉选工作流模板 → 填参数 → 点运行。

---

## 🎯 9 个预设工作流速查

| 我想... | 图形界面操作 | 命令行操作 |
|---------|------------|-----------|
| 规划 fMRI 预处理 | 选「fMRI 预处理」→ 填 BIDS 路径 | `ao run workflows/fmri-preprocessing.yaml -i data_dir=@/path/to/bids` |
| 设计 GLM 分析 | 选「GLM 分析」→ 填实验设计+对比条件 | `ao run workflows/fmri-glm-analysis.yaml -i design_desc="事件相关" -i contrasts="A>B" -i tr=2` |
| 静息态连接分析 | 选「静息态FC」→ 填 BIDS 路径 | `ao run workflows/fmri-resting-fc.yaml -i data_dir=@/path/to/bids` |
| 图论脑网络分析 | 选「图论分析」→ 填连接矩阵信息 | `ao run workflows/fmri-graph-theory.yaml -i conn_matrix="全脑200parcel"` |
| DTI 扩散分析 | 选「DTI 分析」→ 填 DWI 路径+b值 | `ao run workflows/fmri-dti-analysis.yaml -i dwi_dir=@/path -i bval=1000` |
| VBM/FreeSurfer | 选「结构分析」→ 填 T1 路径+方法 | `ao run workflows/fmri-structural.yaml -i t1_dir=@/path -i method=VBM` |
| MRI 文献综述 | 选「MRI文献综述」→ 填研究方向 | `ao run workflows/fmri-literature-review.yaml -i topic="resting-state ICA"` |
| 读真实 .nii 文件 | 选「数据读取桥接」→ 填文件路径 | `ao run workflows/mri-data-analysis-bridge.yaml -i file_path=@rest.nii.gz` |
| 实际跑 nilearn | 选「nilearn执行」→ 填 BOLD 路径 | `ao run workflows/fmri-nilearn-execution.yaml -i bold_file=@rest.nii.gz` |

---

## 🔧 自由对话场景（想到啥说啥）

```
ao compose "帮我规划 fMRI 预处理" --run
ao compose "帮我设计一个 GLM 分析方案" --run
ao compose "帮我润色这段 fMRI Methods 英文" --run
ao compose "搜 fMRI 多重比较校正的最新文献" --run
ao compose "这个 BIDS 数据集怎么验证格式" --run
ao compose "我第一次用，能做什么？" --run
```

---

## 💡 小贴士

- **别怕犯错**——你是跟 AI 聊天，问什么都不会坏
- **越具体越好**——「帮我处理 fMRI」不如「我有 BIDS 格式的静息态 fMRI，TR=2s，想分析 DMN」
- **不满意就说**——「太简单了，给我更详细的预处理参数」
- **花钱很少**——一次分析 ¥0.02-0.16，充 10 块钱能用几个月
- **数据在本地**——不上传云端，API 只传你的文字指令

---

## 🆘 常见问题

| 问题 | 解决 |
|------|------|
| `ao` 命令找不到 | 重新双击 `setup.bat` / `bash setup.sh` |
| 运行报错「API key」 | 检查 `.env` 文件里的 key 填对了 |
| 需要 SPM/FSL 吗 | 本工具只做规划和代码生成，实际跑代码需要你在有工具的机器上执行 |
| 能直接读取 NIfTI 吗 | 用「数据读取桥接」Workflow，Claude Code 帮你读元数据 |
| 想退出 | 关掉浏览器，cmd/Terminal 里按 `Ctrl+C` |
| 完全不知道怎么办 | `ao compose "我第一次用，能做什么？" --run` |

---

*完整文档：https://github.com/BMG-SEU/mri-research-toolkit*  
*姊妹项目：https://github.com/BMG-SEU/bci-research-toolkit*
