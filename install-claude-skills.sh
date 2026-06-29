#!/bin/bash
# MRI Research Toolkit — Claude Code Skills 一键安装
set -e
REPO="https://raw.githubusercontent.com/BMG-SEU/mri-research-toolkit/main"
TARGET="${1:-.}"
mkdir -p "$TARGET/.claude/skills" "$TARGET/workflows" "$TARGET/agents" "$TARGET/prompts"
SKILLS=(mri-research-toolkit fmri-preprocessing fmri-glm-analysis fmri-resting-fc fmri-graph-theory fmri-dti-analysis fmri-structural fmri-bids-validation fmri-nilearn fmri-deep-learning literature-search nature-citation nature-data nature-figure nature-reader nature-response paper-audit paper-build paper-citation paper-humanize paper-intake paper-latex paper-polish paper-research paper-rewrite paper-translate paper-update paper-writing)
for skill in "${SKILLS[@]}"; do mkdir -p "$TARGET/.claude/skills/$skill"; curl -fsSL "$REPO/.claude/skills/$skill/SKILL.md" -o "$TARGET/.claude/skills/$skill/SKILL.md" || true; done
echo "✅ MRI Research Toolkit Skills 安装完成（28 个 Skill + 工作流 + Agent）"
echo "🎯 现在对 Claude Code 说：'帮我规划 fMRI 预处理'"
