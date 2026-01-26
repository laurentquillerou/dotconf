FROM alpine:latest
ENV UV_PROJECT_ENVIRONMENT="/uv/.venv"
WORKDIR /workdir
RUN apk add --no-cache  \
    python3 \
    uv \
    && uv sync
USER nobody
ENTRYPOINT ["uv", "run", "mkdocs", "build", "-s"]
