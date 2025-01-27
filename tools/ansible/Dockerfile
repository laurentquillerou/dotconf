FROM ghcr.io/getsops/sops:v3.9.4-alpine AS sops


FROM alpine:3.21.2
WORKDIR /workdir
COPY --from=sops /usr/local/bin/sops /usr/local/bin/
RUN apk add --no-cache \
    ansible \
    curl \
    gnupg \
    openssh-client \
    rage
USER nobody
