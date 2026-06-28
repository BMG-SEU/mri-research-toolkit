# MRI Research Toolkit — 常见问题

**Q：和 BCI Toolkit 什么关系？**
A：同一套 AO 引擎，不同的 Agent/Skills/Workflow。18 个论文 Skills 和 89+ 提示词是共用的。

**Q：需要单独装吗？**
A：如果用完整版，需要单独 `bash setup.sh`（和 BCI 项目一样的流程）。如果用纯 Skill 版，一行 curl 命令就行。

**Q：需要 SPM/FSL/FreeSurfer 吗？**
A：本工具包做「分析和规划」，不直接执行（除非用 Claude Code 执行脚本）。生成代码后需要你自己在装有这些工具的机器上跑。

**Q：能直接读取 NIfTI 文件吗？**
A：Claude Code 桥接模式可以（和 BCI 项目的 data-analysis-bridge 一样）。需要本机装了 nibabel。

**Q：费用？**
A：同 BCI 项目，DeepSeek ¥0.01-0.16/次，5 人月费 ~¥60。
