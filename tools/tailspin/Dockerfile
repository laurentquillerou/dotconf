#FROM rust:alpine AS build
#ARG ARCH=x86_64
#ARG TSPIN_VER=5.5.0
#RUN apk add --no-cache \
    #    musl-dev
    #    && cargo install --version ${TSPIN_VER} tailspin

FROM alpine:latest
ARG ARCH=x86_64
ARG TSPIN_VER=5.5.0
RUN apk add --no-cache \
    curl \
    && curl -L "https://github.com/bensadeh/tailspin/releases/download/${TSPIN_VER}/tailspin-${ARCH}-unknown-$(uname -s | tr '[:upper:]' '[:lower:]')-musl.tar.gz" | tar zxf - -C /usr/local/bin/


FROM alpine:latest
WORKDIR /workdir
# COPY --from=build /usr/local/cargo/bin/tspin /usr/local/bin/tspin
RUN apk add --no-cache \
    less
USER nobody
ENTRYPOINT ["/usr/local/bin/tspin", "-f"]
