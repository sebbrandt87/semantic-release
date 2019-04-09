[![Docker Repository on Quay](https://quay.io/repository/sebbrandt87/semantic-release/status "Docker Repository on Quay")](https://quay.io/repository/sebbrandt87/semantic-release)

# Description
A container image with a patched version of [![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release).

# Patches implemented
- draft releases possible
- respect gitignore within git ls

# Usage
Please find all configuration options directly at [![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release).

One possible `.releaserc.yaml`

```yaml
---
branch: master
tagFormat: ${version}
dryRun: true
plugins:
- "@semantic-release/commit-analyzer"
- "@semantic-release/release-notes-generator"
- "@semantic-release/git"
- - "@semantic-release/github"
  - draft: true
```

```bash
docker run -e GITHUB_TOKEN=$GITHUB_TOKEN -v $(pwd):/home/node semantic-release
```

# Build
```bash
docker build . -t semantic-release
```
