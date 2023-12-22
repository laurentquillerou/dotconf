FROM ghcr.io/astral-sh/uv:0.12.5 AS uv

FROM alpine:latest
ENV UV_TOOL_DIR="/workdir/tools" \
    UV_TOOL_BIN_DIR="/workdir/bin" \
    PATH="/workdir/bin:${PATH}"
WORKDIR /workdir
COPY --from=uv /uv /uvx /usr/local/bin/
RUN apk add --no-cache \
    python3 \
    && uv tool install mkdocs --with mkdocs-with-confluence
USER nobody
ENTRYPOINT ["mkdocs", "build", "-s"]
