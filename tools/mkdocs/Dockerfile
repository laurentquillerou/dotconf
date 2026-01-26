FROM alpine:latest
ENV UV_PROJECT_ENVIRONMENT="/uv/.venv"
WORKDIR /workdir
COPY pyproject.toml pyproject.toml
RUN apk add --no-cache  \
    python3 \
    uv \
    && uv sync
USER nobody
ENTRYPOINT ["uv", "run", "mkdocs", "build", "-s"]
