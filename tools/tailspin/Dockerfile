FROM rust:alpine AS build
ARG TSPIN_VER=5.3.0
RUN apk add --no-cache  \
    musl-dev \
    && cargo install --version ${TSPIN_VER} tailspin


FROM alpine:3.22.0
WORKDIR /workdir
COPY --from=build /usr/local/cargo/bin/tspin /usr/local/bin/tspin
RUN apk add --no-cache \
    less
USER nobody
ENTRYPOINT ["/usr/local/bin/tspin", "-f"]
