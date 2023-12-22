ARG DOCKER_IMG_TAG="3.19.1"

FROM rust:alpine AS build

RUN apk add musl-dev \
    && cargo install tailspin

FROM alpine:${DOCKER_IMG_TAG}

WORKDIR /workdir

COPY --from=build /usr/local/cargo/bin/tspin /usr/local/bin/tspin

RUN apk add --no-cache less

USER nobody
ENTRYPOINT ["/usr/local/bin/tspin", "-f"]
