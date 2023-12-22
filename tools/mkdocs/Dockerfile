ARG DOCKER_IMG_TAG="3.19.1"
FROM alpine:${DOCKER_IMG_TAG}

WORKDIR /project/

RUN apk add --no-cache \
    mkdocs \
    py3-pathspec \
    py3-pip \
    && python3 -m venv /project/venv \
    && . /project/venv/bin/activate \
    && pip3 install mkdocs-with-confluence

ENV PATH="/project/venv/bin:${PATH}"

USER nobody
ENTRYPOINT ["mkdocs", "build", "-s"]
