# dotconf

## Ansible

- Display changes and apply

  ```sh
  docker run -it -u 0 --rm -v $(pwd)/ansible:/workdir -v ${HOME}/.ssh:/root/.ssh -e ANSIBLE_REMOTE_USER=${USER:-$(whoami)} -v ${SSH_AUTH_SOCK}:${SSH_AUTH_SOCK} -e SSH_AUTH_SOCK=${SSH_AUTH_SOCK} ${DTR}/ansible ansible-playbook -i hosts --limit ${DNS} lab.yaml --check --diff
  docker run -it -u 0 --rm -v $(pwd)/ansible:/workdir -v ${HOME}/.ssh:/root/.ssh -e ANSIBLE_REMOTE_USER=${USER:-$(whoami)} -v ${SSH_AUTH_SOCK}:${SSH_AUTH_SOCK} -e SSH_AUTH_SOCK=${SSH_AUTH_SOCK} ${DTR}/ansible ansible-playbook -i hosts lab.yaml
  ```

- Workstation setup (`workstation.yaml`) targets `localhost` via `connection: local` and runs macOS-only
  commands (`hdiutil`, `xattr`, `dscl`/`chsh`), so it must run directly on the Mac rather than in a
  container - run it with [uv](https://github.com/astral-sh/uv) instead of installing Ansible globally:

  ```sh
  cd ansible
  uv tool run --from ansible-core ansible-galaxy collection install -r roles/requirements.yaml
  uv tool run --from ansible-core ansible-playbook workstation.yaml --check --diff
  uv tool run --from ansible-core ansible-playbook workstation.yaml
  ```

## macOS

```sh
ARIA_VER="1.35.0"; curl -L "https://github.com/aria2/aria2/releases/download/release-${ARIA_VER}/aria2-${ARIA_VER}-osx-$(uname -s | tr '[:upper:]' '[:lower:]').tar.bz2" | tar jxf --strip-components 2 aria2-${ARIA_VER}/bin/aria2c
xattr -c aria2c

CILIUM_VER="v0.19.7"; curl -L "https://github.com/cilium/cilium-cli/releases/download/${CILIUM_VER}/cilium-$(uname -s | tr '[:upper:]' '[:lower:]')-$(uname -m).tar.gz" | tar zxf -

DUCKDB_VER="v1.5.5"; curl -LO "https://github.com/duckdb/duckdb/releases/download/${DUCKDB_VER}/duckdb_cli-osx-universal.zip" | unzip -oqK - duckdb

HELM_VER="4.2.4"; curl -L "https://get.helm.sh/helm-v${HELM_VER}-$(uname -s | tr '[:upper:]' '[:lower:]')-$(uname -m).tar.gz" | tar zxf - --strip-components 1 "$(uname -s | tr '[:upper:]' '[:lower:]')-$(uname -m)/helm"

HUBBLE_VER="v1.19.4"; curl -L "https://github.com/cilium/hubble/releases/download/${HUBBLE_VER}/hubble-$(uname -s | tr '[:upper:]' '[:lower:]')-$(uname -m).tar.gz" | tar zxf -

JJ_VER="v0.44.0"; curl -L "https://github.com/jj-vcs/jj/releases/download/${JJ_VER}/jj-${JJ_VER}-aarch64-apple-$(uname -s | tr '[:upper:]' '[:lower:]').tar.gz" | tar zxf - jj

JQ_VER="1.8.2"; curl -L "https://github.com/jqlang/jq/releases/download/jq-${JQ_VER}/jq-macos-$(uname -m)" -o jq
xattr -c jq

K9S_VER="v0.51.0"; curl -L "https://github.com/derailed/k9s/releases/download/${K9S_VER}/k9s_$(uname -s)_$(uname -m).tar.gz" | tar zxf - k9s

KCTL_VER="v1.36.4"; curl -LO "https://dl.k8s.io/release/${KCTL_VER}/bin/$(uname -s | tr '[:upper:]' '[:lower:]')/$(uname -m)/kubectl"

RAGE_VER="v0.12.1"; curl -L "https://github.com/str4d/rage/releases/download/${RAGE_VER}/rage-${RAGE_VER}-$(uname -m)-$(uname -s | tr '[:upper:]' '[:lower:]').tar.gz" | tar zxf - --strip-components 1

RUFF_VER="0.16.4"; curl -L "https://github.com/astral-sh/ruff/releases/download/${RUFF_VER}/ruff-aarch64-apple-$(uname -s | tr '[:upper:]' '[:lower:]').tar.gz" | tar zxf - --strip-components 1 ruff-aarch64-apple-$(uname -s | tr '[:upper:]' '[:lower:]')/ruff

SOPS_VER="v3.13.3"; curl -L "https://github.com/getsops/sops/releases/download/${SOPS_VER}/sops-${SOPS_VER}.$(uname -s | tr '[:upper:]' '[:lower:]').$(uname -m)" -o sops

TART_VER="2.35.0"; curl -L "https://github.com/cirruslabs/tart/releases/download/${TART_VER}/tart.tar.gz" | tar zxf - tart.app
xattr -c tart.app

TFORM_VER="1.15.9"; curl -LOSfs "https://releases.hashicorp.com/terraform/${TFORM_VER}/terraform_${TFORM_VER}_$(uname -s | tr '[:upper:]' '[:lower:]')_$(uname -m).zip" && unzip -oqK terraform_${TFORM_VER}_$(uname -s | tr '[:upper:]' '[:lower:]')_$(uname -m).zip terraform

TFORM_LS_VER="0.39.0"; curl -LOSfs "https://releases.hashicorp.com/terraform-ls/${TFORM_LS_VER}/terraform-ls_${TFORM_LS_VER}_$(uname -s | tr '[:upper:]' '[:lower:]')_$(uname -m).zip" && unzip -oqK terraform-ls_${TFORM_LS_VER}_$(uname -s | tr '[:upper:]' '[:lower:]')_$(uname -m).zip terraform-ls

TRIVY_VER="0.74.0"; curl -L "https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VER}/trivy_${TRIVY_VER}_macOS-ARM64.tar.gz" | tar zxf - trivy

TSPIN_VER="7.0.0"; curl -L "https://github.com/bensadeh/tailspin/releases/download/${TSPIN_VER}/tailspin-aarch64-apple-$(uname -s | tr '[:upper:]' '[:lower:]').tar.gz" | tar zxf -

UV_VER="0.12.5"; curl -L https://github.com/astral-sh/uv/releases/download/${UV_VER}/uv-aarch64-apple-$(uname -s | tr '[:upper:]' '[:lower:]').tar.gz | tar zxf - --strip-components 1 uv-aarch64-apple-$(uname -s | tr '[:upper:]' '[:lower:]')/{uv,uvx}

VAULT_VER="2.0.4"; curl -LO "https://releases.hashicorp.com/vault/${VAULT_VER}/vault_${VAULT_VER}_$(uname -s | tr '[:upper:]' '[:lower:]')_$(uname -m).zip" && unzip -oqK vault_${VAULT_VER}_$(uname -s | tr '[:upper:]' '[:lower:]')_$(uname -m).zip vault

curl -L "https://code.visualstudio.com/sha/download?build=stable&os=darwin-arm64" -o vscode.zip && unzip -oqK vscode.zip "Visual Studio Code.app"
xattr -c "Visual Studio Code.app"

YQ_VER="v4.53.6"; curl -L "https://github.com/mikefarah/yq/releases/download/${YQ_VER}/yq_$(uname -s | tr '[:upper:]' '[:lower:]')_$(uname -m)" -o yq

ZIZMOR_VER="v1.29.0"; curl -L "https://github.com/zizmorcore/zizmor/releases/download/${ZIZMOR_VER}/zizmor-aarch64-apple-$(uname -s | tr '[:upper:]' '[:lower:]').tar.gz" | tar zxf -
```
