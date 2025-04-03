FROM derailed/k9s:v0.40.11 AS k9s

FROM ghcr.io/astral-sh/uv:0.6.11 AS uv

FROM ghcr.io/astral-sh/ruff:0.11.3 AS ruff

FROM ghcr.io/getsops/sops:v3.10.1-alpine AS sops

FROM ghcr.io/jqlang/jq:1.7.1 AS jq

FROM mikefarah/yq:4.45.1 AS yq


FROM debian:stable-backports
ARG DEBIAN_FRONTEND=noninteractive
ARG PROJECT=app
WORKDIR /workdir
COPY --from=jq /jq /usr/local/bin/
COPY --from=k9s /bin/k9s /usr/local/bin/
COPY --from=ruff /ruff /usr/local/bin/
COPY --from=sops /usr/local/bin/sops /usr/local/bin/
COPY --from=uv /uv /uvx /usr/local/bin/
COPY --from=yq /usr/bin/yq /usr/local/bin/
COPY requirements.txt /tmp/
RUN apt-get update && apt-get install --no-install-recommends -y \
  ca-certificates \
  curl \
  git \
  gnupg \
  less \
  openssh-client \
  python3 \
  rsync \
  tmux \
  vim-nox \
  zsh \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENV PATH="/workdir/${PROJECT}/bin:${PATH}"
#ENV UV_INDEX_URL=
RUN uv venv ${PROJECT} \
  && uv pip install -r /tmp/requirements.txt
USER nobody
ENTRYPOINT ["/usr/bin/zsh"]
