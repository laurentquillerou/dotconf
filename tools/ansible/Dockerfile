FROM alpine:3.20.2 AS build

RUN apk --no-cache add curl

ARG SOPS_VERSION=3.9.0
RUN curl -sL "https://github.com/mozilla/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux" -o /usr/local/bin/sops \
    && chmod +x /usr/local/bin/sops


FROM alpine:3.20.2

WORKDIR /workdir/

COPY --from=build /usr/local/bin/sops /usr/local/bin/

RUN apk add --no-cache \
    ansible \
    curl \
    gnupg \
    openssh-client

USER nobody
