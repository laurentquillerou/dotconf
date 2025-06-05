FROM rust:alpine AS build
ARG TOKEI_VER=12.1.2
RUN apk add --no-cache  \
    musl-dev \
    && cargo install --version ${TOKEI_VER} tokei


FROM alpine:3.22.0
WORKDIR /workdir
COPY --from=build /usr/local/cargo/bin/tokei /usr/local/bin/
USER nobody
ENTRYPOINT ["/usr/local/bin/tokei"]
