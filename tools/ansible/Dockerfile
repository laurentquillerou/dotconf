FROM ghcr.io/getsops/sops:v3.10.2-alpine AS sops


FROM alpine:3.22.1
WORKDIR /workdir
COPY --from=sops /usr/local/bin/sops /usr/local/bin/
RUN apk add --no-cache \
    ansible \
    curl \
    gnupg \
    openssh-client \
    rage
USER nobody
