ARG DOCKER_IMG_TAG="3.19.1"
FROM alpine:${DOCKER_IMG_TAG} AS build

RUN apk --no-cache add curl

ARG SOPS_VERSION=3.8.1
RUN curl -sL "https://github.com/mozilla/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux" -o /usr/local/bin/sops \
    && chmod +x /usr/local/bin/sops

FROM alpine:${DOCKER_IMG_TAG}

WORKDIR /workdir/

COPY --from=build /usr/local/bin/sops /usr/local/bin/

RUN apk add --no-cache \
    ansible \
    curl \
    gnupg \
    openssh-client

USER nobody
