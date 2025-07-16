FROM alpine:3.22.1
ENV PATH="/workdir/venv/bin:${PATH}"
WORKDIR /workdir
RUN apk add --no-cache  \
    mkdocs \
    py3-pathspec \
    py3-pip \
    && python3 -m venv /workdir/venv \
    && pip3 install --no-cache-dir mkdocs-with-confluence
USER nobody
ENTRYPOINT ["mkdocs", "build", "-s"]
