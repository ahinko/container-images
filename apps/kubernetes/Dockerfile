FROM ghcr.io/ahinko/alpine:rolling@sha256:bfc802af66193b4267ff589dd4e78563bd97d8442ffe236a9e271080dffa9aa7

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL
ARG TARGETARCH
ENV TARGETARCH=${TARGETARCH:-amd64}

#hadolint ignore=DL3018
RUN apk add --no-cache ca-certificates openssl
#hadolint ignore=DL3018,DL3059
RUN \
  curl -fsSL -o /usr/local/bin/kubectl "https://dl.k8s.io/release/v${VERSION}/bin/linux/${TARGETARCH}/kubectl" \
  && chmod +x /usr/local/bin/kubectl

USER kah
CMD [ "/usr/local/bin/kubectl" ]

LABEL org.opencontainers.image.source="https://github.com/kubernetes/kubectl"