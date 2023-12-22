# dotconf

## macOS

```sh
ARIA_VER="1.35.0"; curl -L "https://github.com/aria2/aria2/releases/download/release-${ARIA_VER}/aria2-${ARIA_VER}-osx-$(uname -s | tr '[:upper:]' '[:lower:]').tar.bz2" | tar jxf --strip-components 2 aria2-${ARIA_VER}/bin/aria2c
xattr -c aria2c

DUCKDB_VERSION="v1.1.0"; curl -LO "https://github.com/duckdb/duckdb/releases/download/${DUCKDB_VERSION}/duckdb_cli-osx-universal.zip" | unzip -oqK - duckdb

HELM_VER="3.16.1"; curl -L "https://get.helm.sh/helm-v${HELM_VER}-$(uname -s | tr '[:upper:]' '[:lower:]')-$(uname -m).tar.gz" | tar zxf - --strip-components 1 $(uname -s | tr '[:upper:]' '[:lower:]')-$(uname -m)/helm

JQ_VER="1.7.1"; curl -L "https://github.com/jqlang/jq/releases/download/jq-${JQ_VER}/jq-macos-$(uname -m)" -o jq
xattr -c jq

KCTL_VER="v1.31.0"; curl -LO "https://dl.k8s.io/release/${KCTL_VER}/bin/$(uname -s | tr '[:upper:]' '[:lower:]')/$(uname -m)/kubectl"

SOPS_VER="v3.9.0"; curl -L "https://github.com/getsops/sops/releases/download/${SOPS_VER}/sops-${SOPS_VER}.$(uname -s | tr '[:upper:]' '[:lower:]').$(uname -m)" -o sops

TRIVY_VER="0.55.0"; curl -L "https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VER}/trivy_${TRIVY_VER}_macOS-ARM64.tar.gz" | tar zxf - trivy

TSPIN_VER="3.0.2"; curl -L "https://github.com/bensadeh/tailspin/releases/download/${TSPIN_VER}/tailspin-aarch64-apple-$(uname -s | tr '[:upper:]' '[:lower:]').tar.gz" | tar zxf -

TART_VER="2.18.1"; curl -L "https://github.com/cirruslabs/tart/releases/download/${TART_VER}/tart-$(uname -m).tar.gz" | tar zxf - tart.app
xattr -c tart.app

YQ_VER="v4.44.3"; curl -L "https://github.com/mikefarah/yq/releases/download/${YQ_VER}/yq_$(uname -s | tr '[:upper:]' '[:lower:]')_$(uname -m)" -o yq
```
