FROM alpine:3.20.3

WORKDIR /project/

RUN apk add --no-cache \
    mkdocs \
    py3-pathspec \
    py3-pip \
    && python3 -m venv /project/venv \
    && . /project/venv/bin/activate \
    && pip3 install --no-cache-dir mkdocs-with-confluence
ENV PATH="/project/venv/bin:${PATH}"

USER nobody
ENTRYPOINT ["mkdocs", "build", "-s"]
