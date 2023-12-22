FROM rust:alpine AS rust-build

ARG TSPIN_VERSION="3.0.2"

FROM hashicorp/terraform:1.10.1 AS terraform

FROM hashicorp/vault:1.18.2 AS vault

FROM mikefarah/yq:4.44.6 AS yq

FROM rust:alpine AS tailspin
ARG TSPIN_VERSION="4.0.0"
RUN apk add --no-cache musl-dev
RUN cargo install --version ${TSPIN_VERSION} tailspin


FROM alpine:3.20.3 AS bootstrap

ARG ARCH="amd64"
ARG DUCKDB_VERSION="v1.1.0"
ARG HELM_VERSION="v3.15.4"
ARG KCTL_VERSION="v1.31.0"
ARG SOPS_VERSION="v3.9.0"
ARG TFORM_VERSION="1.9.5"
ARG TFORMER_VERSION="0.8.24"
ARG TRIVY_VERSIOM="0.55.0"
ARG VAULT_VERSION="1.17.3"
ARG YQ_VERSION="v4.44.3"

RUN apk add --no-cache curl
RUN curl -LSfs "https://get.helm.sh/helm-${HELM_VERSION}-$(uname -s | tr '[:upper:]' '[:lower:]')-${ARCH}.tar.gz" | tar zxf - -C /usr/local/bin/ --strip-components 1 $(uname -s | tr '[:upper:]' '[:lower:]')-${ARCH}/helm
RUN curl -LSfs "https://dl.k8s.io/release/${KCTL_VERSION}/bin/$(uname -s | tr '[:upper:]' '[:lower:]')/${ARCH}/kubectl" -o /usr/local/bin/kubectl
RUN curl -LSfs "https://github.com/mozilla/sops/releases/download/${SOPS_VERSION}/sops-${SOPS_VERSION}.$(uname -s | tr '[:upper:]' '[:lower:]').${ARCH}" -o /usr/local/bin/sops
RUN curl -LSfs "https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_$(uname -s | tr '[:upper:]' '[:lower:]')_${ARCH}.zip" | unzip -oqK -d /usr/local/bin/ - vault
RUN curl -LOSfs "https://releases.hashicorp.com/terraform/${TFORM_VERSION}/terraform_${TFORM_VERSION}_$(uname -s | tr '[:upper:]' '[:lower:]')_${ARCH}.zip" \
    && unzip -oqK -d /usr/local/bin/ terraform_${TFORM_VERSION}_$(uname -s | tr '[:upper:]' '[:lower:]')_${ARCH}.zip terraform
RUN curl -L "https://github.com/GoogleCloudPlatform/terraformer/releases/download/${TFORMER_VERSION}/terraformer-all-$(uname -s | tr '[:upper:]' '[:lower:]')-${ARCH}" -o /usr/local/bin/terraformer
RUN curl -L "https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VERSIOM}/trivy_${TRIVY_VERSIOM}_Linux-64bit.tar.gz" | tar zxf - -C /usr/local/bin/ trivy
RUN curl -L "https://github.com/mikefarah/yq/releases/download/${YQ_VER}/yq_$(uname -s | tr '[:upper:]' '[:lower:]')_${ARCH}" -o /usr/local/bin/yq
RUN curl -LO https://github.com/duckdb/duckdb/releases/download/${DUCKDB_VERSION}/duckdb_cli-$(uname -s | tr '[:upper:]' '[:lower:]')-${ARCH}.zip \
    && unzip -oqK -d /usr/local/bin/ duckdb_cli-$(uname -s | tr '[:upper:]' '[:lower:]')-${ARCH}.zip duckdb

COPY --from=rust-build /usr/local/cargo/bin/tspin /usr/local/bin/tspin

RUN chmod +x /usr/local/bin/*


FROM alpine:3.20.3

WORKDIR /workdir/

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
