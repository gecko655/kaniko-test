# kaniko-test

https://zenn.dev/mixi/articles/kaniko-removes-files-in-workspace-directory のデモ用リポジトリ

## 実行例

```bash
❮ gcloud builds submit .      
Creating temporary tarball archive of 7 file(s) totalling 694 bytes before compression.
Uploading tarball of [.] to [gs://[project_id]_cloudbuild/source/1681805778.655241-1a467fc971064060bf73cdb3da068f9e.tgz]

# 以下、長いので標準出力以外は省略します

===1===
/workspace
├── 1.txt
├── Dockerfile
├── cloudbuild.yaml
└── files
    ├── 1.txt
    ├── 2.txt
    ├── 3.txt
    ├── 4.txt
    ├── 5.txt
    └── 6.txt

1 directory, 7 files
===1===

===2===
/workspace
├── 1.txt
├── Dockerfile
├── cloudbuild.yaml
├── files
│   ├── 1.txt
│   ├── 2.txt
│   ├── 3.txt
│   ├── 4.txt
│   ├── 5.txt
│   └── 6.txt
└── nested
    └── 2.txt

2 directories, 8 files
===2===

===3===
/workspace
├── 1.txt
├── Dockerfile
├── cloudbuild.yaml
├── files
│   ├── 1.txt
│   ├── 2.txt
│   ├── 3.txt
│   ├── 4.txt
│   ├── 5.txt
│   └── 6.txt
└── nested
    └── 2.txt

2 directories, 8 files
/app
└── 3.txt

0 directories, 1 file
===3===

===4===
/workspace
├── 1.txt
├── Dockerfile
├── cloudbuild.yaml
├── files
│   ├── 1.txt
│   ├── 2.txt
│   ├── 3.txt
│   ├── 4.txt
│   ├── 5.txt
│   └── 6.txt
└── nested
    └── 2.txt

2 directories, 8 files
/app
├── 3.txt
└── nested
    └── 4.txt

1 directory, 2 files
===4===
```

```
❯ docker run --rm asia.gcr.io/[project_id]/kaniko-test:[image_hash]
/workspace
├── 5.txt
└── nested
    └── 6.txt

1 directory, 2 files
/app
├── 3.txt
└── nested
    └── 4.txt

1 directory, 2 files
```
