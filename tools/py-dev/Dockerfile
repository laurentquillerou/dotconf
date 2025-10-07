FROM derailed/k9s:v0.50.15 AS k9s

FROM ghcr.io/astral-sh/uv:0.8.24 AS uv

FROM ghcr.io/astral-sh/ruff:0.13.3 AS ruff

FROM ghcr.io/getsops/sops:v3.10.2-alpine AS sops

FROM ghcr.io/jqlang/jq:1.8.1 AS jq

FROM mikefarah/yq:4.47.2 AS yq


FROM debian:stable-backports AS bootstrap
ARG ARCH=amd64
ARG DEBIAN_FRONTEND=noninteractive
ARG HELM_VER="v3.17.3"
ARG K8S_VER="v1.32"
ARG TSPIN_VER="5.5.0"
COPY --from=jq /jq /usr/local/bin/
COPY --from=k9s /bin/k9s /usr/local/bin/
COPY --from=ruff /ruff /usr/local/bin/
COPY --from=sops /usr/local/bin/sops /usr/local/bin/
COPY --from=uv /uv /uvx /usr/local/bin/
COPY --from=yq /usr/bin/yq /usr/local/bin/
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
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
  && chmod +x /usr/local/bin/*


FROM debian:stable-backports
ARG DEBIAN_FRONTEND=noninteractive
ARG PROJECT=app
WORKDIR /workdir/
COPY --from=bootstrap /usr/local/bin/ /usr/local/bin/
COPY --from=bootstrap /etc/ /etc/
ENV UV_COMPILE_BYTECODE=1
  #UV_INDEX_URL=
RUN apt-get update && apt-get install --no-install-recommends -y \
  ca-certificates \
  curl \
  git \
  gnupg \
  kubectl \
  less \
  openssh-client \
  python3 \
  rsync \
  tmux \
  vim-nox \
  zsh \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && uv init ${PROJECT} --no-description

WORKDIR /workdir/${PROJECT}
RUN uv add --dev behave \
  pytest \
  pytest-django \
  && uv add django-filter \
  django-oidc-provider \
  djangorestframework \
  markdown \
  opentelemetry-api \
  && uv run django-admin startproject ${PROJECT} .

USER nobody
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
