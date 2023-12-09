FROM ghcr.io/ahinko/alpine:rolling@sha256:e1f804e0cc138eda9569c099326d3b898a0c1c3f82321746c103b7a50e9b1783

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
