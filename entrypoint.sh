#!/bin/bash
set -ex

echo "Starting listener for backup requests"
/usr/bin/xtrabackup_nc.sh >> /tmp/xtrabackup_nc.log &
