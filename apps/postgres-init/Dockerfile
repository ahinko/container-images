FROM ghcr.io/ahinko/alpine:rolling@sha256:dd61b05ba4ec1ffbf0ab867b2fa55a6d2897c5f605e5ec5622199aa7c3a4ba07

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

COPY ./apps/postgres-init/entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/postgres/postgres"
