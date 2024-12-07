FROM rust:alpine AS build
ARG TSPIN_VERSION=4.0.0
RUN apk add musl-dev
RUN cargo install --version ${TSPIN_VERSION} tailspin


FROM alpine:3.21.0
WORKDIR /workdir
COPY --from=build /usr/local/cargo/bin/tspin /usr/local/bin/tspin
RUN apk add --no-cache less
USER nobody
ENTRYPOINT ["/usr/local/bin/tspin", "-f"]
