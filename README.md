# dotconf

## macOS

```sh
HELM_VER="3.15.4"; curl -L https://get.helm.sh/helm-v${HELM_VER}-$(uname -s | tr A-Z a-z)-$(uname -m).tar.gz | tar zxf - --strip-components 1 $(uname -s | tr A-Z a-z)-$(uname -m)/helm

KCTL_VER="v1.31.0"; curl -LO "https://dl.k8s.io/release/${KCTL_VER}/bin/$(uname -s | tr A-Z a-z)/$(uname -m)/kubectl"

SOPS_VER="v3.9.0"; curl -L "https://github.com/getsops/sops/releases/download/${SOPS_VER}/sops-${SOPS_VER}.$(uname -s | tr A-Z a-z).$(uname -m)" -o sops

TSPIN_VER="3.0.2"; curl -L "https://github.com/bensadeh/tailspin/releases/download/${TSPIN_VER}/tailspin-aarch64-apple-$(uname -s | tr A-Z a-z).tar.gz" | tar zxf -

TART_VER="2.18.0"; curl -L "https://github.com/cirruslabs/tart/releases/download/${TART_VER}/tart-$(uname -m).tar.gz" | tar zxf - tart.app
xattr -c tart.app

YQ_VER="v4.44.3"; curl -L "https://github.com/mikefarah/yq/releases/download/${YQ_VER}/yq_$(uname -s | tr A-Z a-z)_$(uname -m)" -o yq
```
