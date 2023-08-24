#!/bin/sh -ex

chgrp -R nut /etc/nut /dev/bus/usb || :
chmod -R 755 /etc/nut

/usr/sbin/upsdrvctl start || :
/usr/sbin/upsd
exec /usr/sbin/upsmon -D
