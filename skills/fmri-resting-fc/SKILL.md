# 静息态功能连接方法论

> 参考：Biswal et al. (1995) *MRM*; Beckmann & Smith (2004) *IEEE TMI*; Faskowitz et al. (2020) *Nat Neurosci*

## 触发条件
用户提到「功能连接」「resting-state」「静息态」「种子点」「ICA」「RSN」时加载。

## 方法选型决策树
```
已知 ROI？ → 种子点连接（Seed-based FC）
探索 RSNs？ → 空间 ICA + 双回归（FSL MELODIC / nilearn CanICA）
全脑连接？ → 图论
时间动态？ → 滑动窗动态 FC / edge time series
因果方向？ → 谱 DCM (Friston et al. 2021)
```

## 去噪决策（同 fmri-preprocessing）
aCompCor ✅ · ICA-AROMA ✅ · Scrubbing ✅ · GSR ⚠️

## nilearn 代码
```python
from nilearn.connectome import ConnectivityMeasure
correlation = ConnectivityMeasure(kind='correlation')
corr_matrix = correlation.fit_transform([time_series])
```
