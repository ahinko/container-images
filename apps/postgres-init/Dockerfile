FROM ghcr.io/ahinko/alpine:rolling@sha256:be779a3c9866288dc774404df4f2a12b57976051ec958c1121cc556148ba1e37

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
