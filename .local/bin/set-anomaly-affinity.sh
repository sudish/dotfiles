#!/bin/sh

CORES=0-7       # cores to use
WAIT_SECS=45    # wait for Anomaly to set its own cpu mask
MAX_SECS=90     # time before we give up on Anomaly startup

(sleep $MAX_SECS && kill -USR1 $$) &
trap exit USR1

while ! pgrep AnomalyDX11; do
  sleep 1
done

# Wait for Anomaly to set affinity to core #0 on startup
sleep $WAIT_SECS

taskset -cp $CORES $(pgrep AnomalyDX11)
