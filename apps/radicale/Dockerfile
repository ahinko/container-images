FROM ghcr.io/ahinko/alpine:rolling@sha256:bfc802af66193b4267ff589dd4e78563bd97d8442ffe236a9e271080dffa9aa7

ARG VERSION
ARG TARGETPLATFORM
ARG TARGETARCH
ARG TARGETOS

ENV \
  PYTHONDONTWRITEBYTECODE=1 \
  PYTHONUNBUFFERED=1 \
  PIP_ROOT_USER_ACTION=ignore \
  PIP_NO_CACHE_DIR=1 \
  PIP_DISABLE_PIP_VERSION_CHECK=1 \
  CRYPTOGRAPHY_DONT_BUILD_RUST=1

ENV \
  RADICALE_CONFIG_FILE=/config/config

LABEL dev.ahinko.image.target_platform=$TARGETPLATFORM
LABEL dev.ahinko.image.target_architecture=$TARGETARCH
LABEL dev.ahinko.image.target_os=$TARGETOS
LABEL org.opencontainers.image.source="https://github.com/Kozea/Radicale"

COPY ./apps/radicale/config /app/config.default

#hadolint ignore=DL3018,DL3013
RUN \
  apk add --no-cache --virtual=build-dependencies \
  gcc \
  musl-dev \
  libffi-dev \
  python3-dev \
  && apk add --no-cache \
  ca-certificates \
  python3 \
  py3-pip \
  py3-tz \
  tzdata \
  && python3 -m pip install --upgrade pip \
  && python3 -m pip install radicale==$VERSION passlib[bcrypt] --break-system-packages \
  && chown -R 568:568 /app \
  && chmod -R 755 /app \
  && mkdir -p /data \
  && chown -R kah:kah /data \
  && chmod -R 775 /data \
  && apk del --purge build-dependencies \
  && rm -rf \
  /root/.cache \
  /root/.cargo \
  /tmp/*

USER kah
COPY ./apps/radicale/entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]