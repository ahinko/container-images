FROM ghcr.io/ahinko/alpine:rolling@sha256:b1583f332ae65f1eee88f1b8548f10b4bf5a50daec961e104b39401b9d9cd550

ARG VERSION
ARG TARGETPLATFORM
ARG TARGETARCH
ARG TARGETOS

LABEL dev.ahinko.image.target_platform=$TARGETPLATFORM
LABEL dev.ahinko.image.target_architecture=$TARGETARCH
LABEL dev.ahinko.image.target_os=$TARGETOS
LABEL org.opencontainers.image.source="https://github.com/networkupstools/nut"

RUN set -ex; \
  # run dependencies
  apk add --no-cache \
  openssh-client \
  libusb-compat \
  ; \
  # build dependencies
  apk add --no-cache --virtual .build-deps \
  libusb-compat-dev \
  build-base \
  ; \
  # download and extract
  cd /tmp; \
  wget https://github.com/networkupstools/nut/releases/download/v$VERSION/nut-$VERSION.tar.gz; \
  tar xfz nut-$VERSION.tar.gz; \
  cd nut-$VERSION \
  ; \
  # build
  ./configure \
  --prefix=/usr \
  --sysconfdir=/etc/nut \
  --disable-dependency-tracking \
  --enable-strip \
  --disable-static \
  --with-all=no \
  --with-usb=yes \
  --datadir=/usr/share/nut \
  --with-drvpath=/usr/share/nut \
  --with-statepath=/var/run/nut \
  --with-user=nut \
  --with-group=nut \
  ; \
  # install
  make install \
  ; \
  # create nut user
  adduser -D -h /var/run/nut nut; \
  chgrp -R nut /etc/nut; \
  chmod -R o-rwx /etc/nut; \
  install -d -m 750 -o nut -g nut /var/run/nut \
  ; \
  # cleanup
  rm -rf /tmp/nut-$VERSION.tar.gz /tmp/nut-$VERSION; \
  apk del .build-deps

COPY ./apps/nut-upsd/config/* /etc/nut/

COPY ./apps/nut-upsd/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

WORKDIR /var/run/nut

EXPOSE 3493