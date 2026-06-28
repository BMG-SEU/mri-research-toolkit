# nilearn Python 原生 fMRI 分析方法论
> Nilearn team (2024); Abraham et al. (2014) *Front Neuroinform*
### 触发：nilearn/Python fMRI/替代 SPM

nilearn 0.10+ 可替代 SPM/FSL 做全流程分析：
```python
from nilearn.maskers import NiftiMasker
from nilearn.connectome import ConnectivityMeasure
from nilearn.decomposition import CanICA
from nilearn.glm.first_level import FirstLevelModel
```
优势：Python 原生、可复现、BIDS 兼容、免费开源
