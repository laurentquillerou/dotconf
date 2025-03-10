FROM rust:alpine AS build
ARG TOKEI_VERSION=12.1.2
RUN apk add --no-cache  \
    musl-dev \
    && cargo install --version ${TOKEI_VERSION} tokei


FROM alpine:3.21.3
WORKDIR /workdir
COPY --from=build /usr/local/cargo/bin/tokei /usr/local/bin/
USER nobody
ENTRYPOINT ["/usr/local/bin/tokei"]
