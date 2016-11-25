#!/bin/bash
INTERVAL=3

for TRIES in `seq 1 3`
do
  service mysqld status
  RESULT=$?
  if [ $RESULT = 0 ]; then
    echo "MySQL health check is OK" | logger -i -t keepalived-healthcheck
    exit 0
  fi
  echo "health check failed ${TRIES} times" | logger -i -t keepalived-healthcheck
  sleep $INTERVAL
done

echo "MySQL server down detected. shutdown keepalived." | logger -i -t keepalived-healthcheck
service keepalived stop
exit 1
