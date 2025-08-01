FROM aquasec/trivy:0.64.1 AS trivy

FROM cilium/cilium:v1.17.6 AS cilium

FROM derailed/k9s:v0.50.9 AS k9s

FROM ghcr.io/astral-sh/uv:0.8.3 AS uv

FROM ghcr.io/getsops/sops:v3.10.2-alpine AS sops

FROM ghcr.io/jqlang/jq:1.8.1 AS jq

FROM ghcr.io/mr-karan/doggo:v1.0.5 AS doggo

FROM ghcr.io/xampprocky/tokei:latest AS tokei

FROM mikefarah/yq:4.47.1 AS yq

FROM projectdiscovery/nuclei:v3.4.7 AS nuclei

FROM debian:stable-backports AS bootstrap
ARG ARCH=amd64
ARG DEBIAN_FRONTEND=noninteractive
ARG HELM_VER="v3.16.4"
ARG K8S_VER="v1.32"
ARG KUNAI_VER="v0.5.5"
ARG TSPIN_VER="5.4.3"
COPY --from=cilium /usr/bin/cilium /usr/bin/hubble /usr/local/bin/
COPY --from=doggo /usr/bin/doggo /usr/local/bin/
COPY --from=jq /jq /usr/local/bin/
COPY --from=k9s /bin/k9s /usr/local/bin/
COPY --from=nuclei /usr/local/bin/nuclei /usr/local/bin/
COPY --from=sops /usr/local/bin/sops /usr/local/bin/
COPY --from=tokei /usr/local/bin/tokei /usr/local/bin/
COPY --from=trivy /usr/local/bin/trivy /usr/local/bin/
COPY --from=uv /uv /uvx /usr/local/bin/
COPY --from=yq /usr/bin/yq /usr/local/bin/
RUN apt-get update && apt-get install --no-install-recommends -y \
  ca-certificates \
  curl \
  gnupg \
  && curl -LSfs "https://aquasecurity.github.io/trivy-repo/deb/public.key" | gpg --dearmor -o /etc/apt/keyrings/trivy.gpg \
  && echo "deb [signed-by=/etc/apt/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(sed -n 's/VERSION_CODENAME=//p' /etc/os-release) main" > /etc/apt/sources.list.d/trivy.list \
  && curl -LSfs "https://apt.releases.hashicorp.com/gpg" | gpg --dearmor -o /etc/apt/keyrings/hashicorp-archive-keyring.gpg \
  && echo "deb [signed-by=/etc/apt/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(sed -n 's/VERSION_CODENAME=//p' /etc/os-release) main" > /etc/apt/sources.list.d/hashicorp.list \
  && curl -LSfs "https://pkgs.k8s.io/core:/stable:/${K8S_VER}/deb/Release.key" | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg \
  && echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/${K8S_VER}/deb/ /" > /etc/apt/sources.list.d/kubernetes.list \
  && curl -LSfs "https://get.helm.sh/helm-${HELM_VER}-$(uname -s | tr '[:upper:]' '[:lower:]')-${ARCH}.tar.gz" | tar zxf - -C /usr/local/bin/ --strip-components 1 "$(uname -s | tr '[:upper:]' '[:lower:]')-${ARCH}/helm" \
  && curl -LSfs "https://github.com/bensadeh/tailspin/releases/download/${TSPIN_VER}/tailspin-x86_64-unknown-linux-musl.tar.gz" | tar xzf - -C /usr/local/bin/ \
  && curl -LSfs "https://github.com/kunai-project/kunai/releases/download/${KUNAI_VER}/kunai-${ARCH}" -o /usr/local/bin/kunai \
  && chmod +x /usr/local/bin/*


FROM debian:stable-backports
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /workdir
COPY --from=bootstrap /usr/local/bin/ /usr/local/bin/
COPY --from=bootstrap /etc/ /etc/
RUN apt-get update && apt-get install --no-install-recommends -y \
  boundary \
  ca-certificates \
  curl \
  git \
  gnupg \
  kubectl \
  less \
  openssh-client \
  rsync \
  terraform \
  terraform-ls \
  tmux \
  trivy \
  vim-nox \
  vault \
  zsh \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
USER nobody
ENTRYPOINT ["/usr/bin/zsh"]
