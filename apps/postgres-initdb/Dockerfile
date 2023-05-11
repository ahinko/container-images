FROM ghcr.io/ahinko/alpine:rolling@sha256:38cee2159d8621e44c20e06449099edc986e245f953837214fb69211b35e7986

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

ENV POSTGRES_SUPER_USER="postgres" \
  POSTGRES_RESET="false" \
  POSTGRES_USER_RESET="false" \
  POSTGRES_RESET_CONFIRM="NO"

#hadolint ignore=DL3018
RUN apk add --no-cache ca-certificates postgresql15-client~"${VERSION}"

USER kah

COPY ./apps/postgres-initdb/entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/postgres/postgres"
