# fMRI 预处理方法论

> 参考：Esteban et al. (2019) *Nat Methods* (fMRIPrep); Mehta et al. (2024) *Nat Methods* (XCP-D); Power et al. (2012) *NeuroImage*; Pruim et al. (2015) *NeuroImage*

## 触发条件
用户提到「fMRI 预处理」「fMRIPrep」「BIDS 预处理」「功能像处理」时加载。

## fMRIPrep 标准 11 步

```
1. 格式转换（DICOM → NIfTI/BIDS）
2. 颅骨剥离（SynthStrip / BET）
3. 头动校正（MC-FLIRT）
4. 时间层校正（slicetimer）
5. 场图失真校正（TOPUP）
6. 空间标准化（MNI152 / ANTs SyN）
7. 脑脊液/白质/灰质分割
8. ICA-AROMA 自动去噪
9. CompCor 生理噪声回归
10. 高通滤波（0.01 Hz）
11. 空间平滑（FWHM 4-6mm）
```

## 关键参数速查

| 参数 | 推荐值 | 出处 |
|------|--------|------|
| FD 排除阈值 | >0.5mm | Power et al. (2012) |
| 空间平滑 FWHM | 4-6mm | 常规静息态 |
| 高通滤波截止 | 0.01 Hz (100s) | 静息态默认 |
| ICA-AROMA | 自动 | Pruim et al. (2015) |

## 去噪策略决策

| 回归项 | 推荐？ | 理由 |
|--------|:--:|------|
| 6 头动参数 | ✅ | 必备 |
| aCompCor (WM+CSF) | ✅ | Behzadi et al. (2007) |
| GSR | ⚠️ | Murphy et al. (2009) 引入负相关 |
| Scrubbing | ✅ | Power et al. (2012) |
| ICA-AROMA | ✅ | Pruim et al. (2015) |

## fMRIPrep 命令模板

```bash
fmriprep /path/to/bids /path/to/output participant \
  --fs-license-file license.txt \
  --output-spaces MNI152NLin2009cAsym:res-2 \
  --use-syn-sdc \
  --fd-spike-threshold 0.5 \
  --dvars-spike-threshold 1.5
```
