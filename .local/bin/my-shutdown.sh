#!/bin/sh
#
# Any app shutdowns needed before system shutdown

exec > >(systemd-cat -t my-shutdown) 2>&1

echo Started: `date`

if pgrep steam; then
  # do not issue this in a loop - it will start steam if it is not running and only then shut it down
  steam -shutdown
  while pgrep steam; do
    sleep 1
  done
fi

echo Ended: `date`
