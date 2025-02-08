FROM aquasec/trivy:0.62.1 AS trivy

FROM ghcr.io/jqlang/jq:1.7.1 AS jq

FROM ghcr.io/getsops/sops:v3.9.4-alpine AS sops

FROM ghcr.io/astral-sh/uv:0.5.29 AS uv

FROM hashicorp/boundary:0.18.2 AS boundary

FROM hashicorp/terraform:1.10.5 AS terraform

FROM hashicorp/vault:1.18.5 AS vault

FROM mikefarah/yq:4.45.1 AS yq

FROM projectdiscovery/nuclei:v3.3.8 AS nuclei

FROM rust:alpine AS tailspin
ARG TSPIN_VERSION="4.0.0"
RUN apk add --no-cache musl-dev \
    && cargo install --version ${TSPIN_VERSION} tailspin

FROM alpine:3.21.3 AS bootstrap
ARG ARCH="amd64"
ARG DUCKDB_VERSION="v1.1.3"
ARG HELM_VERSION="v3.16.4"
ARG KCTL_VERSION="v1.31.3"
ARG TFORMER_VERSION="0.8.24"

COPY --from=boundary /bin/boundary /usr/local/bin/
COPY --from=jq /jq /usr/local/bin/
COPY --from=nuclei /usr/local/bin/nuclei /usr/local/bin/
COPY --from=sops /usr/local/bin/sops /usr/local/bin/
COPY --from=tailspin /usr/local/cargo/bin/tspin /usr/local/bin/
COPY --from=terraform /bin/terraform /usr/local/bin/
COPY --from=trivy /usr/local/bin/trivy /usr/local/bin/
COPY --from=uv /uv /uvx /usr/local/bin/
COPY --from=vault /bin/vault /usr/local/bin/
COPY --from=yq /usr/bin/yq /usr/local/bin/

RUN apk add --no-cache curl \
    && curl -LSfs "https://get.helm.sh/helm-${HELM_VERSION}-$(uname -s | tr '[:upper:]' '[:lower:]')-${ARCH}.tar.gz" | tar zxf - -C /usr/local/bin/ --strip-components 1 "$(uname -s | tr '[:upper:]' '[:lower:]')-${ARCH}/helm" \
    && curl -LSfs "https://dl.k8s.io/release/${KCTL_VERSION}/bin/$(uname -s | tr '[:upper:]' '[:lower:]')/${ARCH}/kubectl" -o /usr/local/bin/kubectl \
    && curl -LSfs "https://github.com/GoogleCloudPlatform/terraformer/releases/download/${TFORMER_VERSION}/terraformer-all-$(uname -s | tr '[:upper:]' '[:lower:]')-${ARCH}" -o /usr/local/bin/terraformer \
    && curl -LOSfs "https://github.com/duckdb/duckdb/releases/download/${DUCKDB_VERSION}/duckdb_cli-$(uname -s | tr '[:upper:]' '[:lower:]')-${ARCH}.zip" \
      && unzip -oqK -d /usr/local/bin/ "duckdb_cli-$(uname -s | tr '[:upper:]' '[:lower:]')-${ARCH}.zip" duckdb \
    && chmod +x /usr/local/bin/*


FROM alpine:3.21.3
WORKDIR /workdir
COPY --from=bootstrap /usr/local/bin/ /usr/local/bin/
RUN apk add --no-cache \
    ansible \
    apk-tools-zsh-completion \
    aria2 \
    black \
    black-zsh-completion \
    curl \
    curl-zsh-completion \
    file \
    git \
    git-zsh-completion \
    gnupg \
    k9s \
    k9s-zsh-completion \
    less \
    mkdocs \
    most \
    oh-my-zsh \
    openssh-client \
    py3-pathspec \
    py3-pip \
    py3-pip-zsh-completion \
    rage \
    rage-zsh-completion \
    ruff \
    ruff-zsh-completion \
    rsync \
    rsync-zsh-completion \
    tmux \
    tmux-zsh-completion \
    tokei \
    uv-zsh-completion \
    vim \
    vimdiff \
    zsh \
    zsh-autosuggestions \
    zsh-completions \
    && ln -s /usr/share/oh-my-zsh/templates/zshrc.zsh-template /.zshrc \
    && mkdir -p /.cache \
    && chown nobody:nogroup /.cache
USER nobody
ENTRYPOINT ["/bin/zsh"]
