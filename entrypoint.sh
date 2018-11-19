#!/bin/bash
set -ex

echo "Starting listener for backup requests"
#/usr/bin/xtrabackup_nc.sh >> /tmp/xtrabackup_nc.log &

ncat --listen --keep-open --send-only --max-conns=1 3307 -c \
"xtrabackup --backup --stream=xbstream --user=root --password=not-so-secure"