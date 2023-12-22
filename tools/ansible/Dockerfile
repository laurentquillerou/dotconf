FROM ghcr.io/getsops/sops:v3.12.1-alpine AS sops


FROM alpine:latest
WORKDIR /workdir
COPY --from=sops /usr/local/bin/sops /usr/local/bin/
RUN apk add --no-cache \
    ansible \
    curl \
    gnupg \
    openssh-client \
    rage
USER nobody
