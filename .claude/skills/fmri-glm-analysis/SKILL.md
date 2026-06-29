# GLM / 任务态 fMRI 分析方法论

> 参考：Friston et al. (1995) *HBM*; Eklund et al. (2016) *PNAS*; Han & Park (2024) *NeuroImage*

## 触发条件
用户提到「GLM」「SPM」「设计矩阵」「任务态」「contrast」「激活分析」时加载。

## GLM 设计要点
- HRF：spm_hrf / glover HRF / FSL double-gamma
- 时间导数减少 HRF 延迟不匹配
- 运动参数 6+6（刚体+导数）为 nuisance
- 高通滤波 128s (0.008 Hz)
- Pre-whitening AR(1)

## 多重比较校正

| 方法 | 假阳性控制 | 推荐度 |
|------|:--:|:--:|
| FWE (Random Field) | 最严 | ⭐⭐⭐ |
| FDR | 适中 | ⭐⭐ |
| TFCE | 中等 | ⭐⭐⭐ |
| 非参数置换 | 准确 | ⭐⭐⭐ 推荐 |
| 簇水平 PFWE | ⚠️ 假阳性率高 | ⭐ Eklund(2016)后慎用 |

## nilearn GLM 代码
```python
from nilearn.glm.first_level import FirstLevelModel
fmri_glm = FirstLevelModel(t_r=2, hrf_model='spm',
                            drift_model='cosine', high_pass=0.008)
fmri_glm = fmri_glm.fit(fmri_imgs, design_matrices=design_matrices)
z_map = fmri_glm.compute_contrast('condition_A - condition_B', output_type='z_score')
```
