# dotconf

## macOS

```sh
ARIA_VER="1.35.0"; curl -L "https://github.com/aria2/aria2/releases/download/release-${ARIA_VER}/aria2-${ARIA_VER}-osx-$(uname -s | tr '[:upper:]' '[:lower:]').tar.bz2" | tar jxf --strip-components 2 aria2-${ARIA_VER}/bin/aria2c
xattr -c aria2c

CILIUM_VER="v0.16.24"; curl -L https://github.com/cilium/cilium-cli/releases/download/${CILIUM_VER}/cilium-$(uname -s | tr '[:upper:]' '[:lower:]')-amd64.tar.gz | tar zxf -

DUCKDB_VER="v1.1.3"; curl -LO "https://github.com/duckdb/duckdb/releases/download/${DUCKDB_VER}/duckdb_cli-osx-universal.zip" | unzip -oqK - duckdb

HELM_VER="3.17.1"; curl -L "https://get.helm.sh/helm-v${HELM_VER}-$(uname -s | tr '[:upper:]' '[:lower:]')-$(uname -m).tar.gz" | tar zxf - --strip-components 1 "$(uname -s | tr '[:upper:]' '[:lower:]')-$(uname -m)/helm"

HUBBLE_VER="v1.17.1"; curl -L https://github.com/cilium/hubble/releases/download/${HUBBLE_VER}/hubble-$(uname -s | tr '[:upper:]' '[:lower:]')-$(uname -m).tar.gz | tar zxf -

JJ_VER="v0.26.0"; curl -L "https://github.com/jj-vcs/jj/releases/download/${JJ_VER}/jj-${JJ_VER}-aarch64-apple-$(uname -s | tr '[:upper:]' '[:lower:]').tar.gz" | tar zxf - jj

JQ_VER="1.7.1"; curl -L "https://github.com/jqlang/jq/releases/download/jq-${JQ_VER}/jq-macos-$(uname -m)" -o jq
xattr -c jq

K9S_VER="v0.40.1"; curl -L https://github.com/derailed/k9s/releases/download/${K9S_VER}/k9s_$(uname -s)_$(uname -m).tar.gz | tar zxf - k9s

KCTL_VER="v1.32.2"; curl -LO "https://dl.k8s.io/release/${KCTL_VER}/bin/$(uname -s | tr '[:upper:]' '[:lower:]')/$(uname -m)/kubectl"

RAGE_VER="v0.11.1"; curl -L "https://github.com/str4d/rage/releases/download/${RAGE_VER}/rage-${RAGE_VER}-$(uname -m)-$(uname -s | tr '[:upper:]' '[:lower:]').tar.gz" | tar zxf - --strip-components 1

SOPS_VER="v3.9.4"; curl -L "https://github.com/getsops/sops/releases/download/${SOPS_VER}/sops-${SOPS_VER}.$(uname -s | tr '[:upper:]' '[:lower:]').$(uname -m)" -o sops

TART_VER="2.24.1"; curl -L "https://github.com/cirruslabs/tart/releases/download/${TART_VER}/tart-$(uname -m).tar.gz" | tar zxf - tart.app
xattr -c tart.app

TFORM_VER="1.10.5"; curl -LOSfs "https://releases.hashicorp.com/terraform/${TFORM_VERSION}/terraform_${TFORM_VERSION}_$(uname -s | tr '[:upper:]' '[:lower:]')_$(uname -m).zip" && unzip -oqK -d /usr/local/bin/ terraform_${TFORM_VERSION}_$(uname -s | tr '[:upper:]' '[:lower:]')_$(uname -m).zip terraform

TRIVY_VER="0.59.1"; curl -L "https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VER}/trivy_${TRIVY_VER}_macOS-ARM64.tar.gz" | tar zxf - trivy

TSPIN_VER="4.0.0"; curl -L "https://github.com/bensadeh/tailspin/releases/download/${TSPIN_VER}/tailspin-aarch64-apple-$(uname -s | tr '[:upper:]' '[:lower:]').tar.gz" | tar zxf -

VAULT_VER="1.18.4"; curl -LSfs "https://releases.hashicorp.com/vault/${VAULT_VER}/vault_${VAULT_VER}_$(uname -s | tr '[:upper:]' '[:lower:]')_$(uname -m).zip" | unzip -oqK -d /usr/local/bin/ - vault

YQ_VER="v4.45.1"; curl -L "https://github.com/mikefarah/yq/releases/download/${YQ_VER}/yq_$(uname -s | tr '[:upper:]' '[:lower:]')_$(uname -m)" -o yq
```
