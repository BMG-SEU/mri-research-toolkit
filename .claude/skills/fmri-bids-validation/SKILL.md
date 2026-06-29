# BIDS 数据格式验证方法论
> Gorgolewski et al. (2016) *Sci Data*; Gorgolewski et al. (2021) BIDS-Derivatives
### 触发：BIDS/数据格式/目录结构验证

## BIDS 目录结构标准
```
bids_dataset/
├── dataset_description.json    # 必需
├── README
├── CHANGES
├── participants.tsv
├── sub-01/
│   ├── anat/sub-01_T1w.nii.gz
│   └── func/
│       ├── sub-01_task-rest_bold.nii.gz
│       └── sub-01_task-rest_events.tsv
└── sub-02/...
```

## 验证方法
```bash
# bids-validator (推荐)
pip install bids-validator
bids-validator /path/to/bids --verbose

# Python 验证
from bids import BIDSLayout
layout = BIDSLayout('/path/to/bids', validate=True)
```

## 常见 BIDS 错误
| 错误 | 修复 |
|------|------|
| 缺少 dataset_description.json | 创建空 JSON: `{"Name":"...","BIDSVersion":"1.8.0"}` |
| .nii 未压缩 | gzip 压缩为 .nii.gz |
| 文件名不规范 | 用小写/数字/连字符，下划线分隔实体 |
| 缺少 TaskName | 在 func/*.json 中加 `"TaskName": "rest"` |
