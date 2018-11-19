#!/bin/bash
#
# Script to listen on a backup request and perform XtraBackup
#

set -ex

cd /var/lib/mysql

ncat --listen --keep-open --send-only --max-conns=1 3307 -c \
"xtrabackup --backup --stream=xbstream --user=root --password=not-so-secure"
