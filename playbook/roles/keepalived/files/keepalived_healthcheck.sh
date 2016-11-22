#!/bin/bash

for TRIES in `seq 1 3`
do
  service mysqld status
  RESULT=$?
  if [ $RESULT = 0 ]; then
    exit 0
  fi
  echo "health check failed ${TRIES} times" | logger -i -t keepalived-healthcheck
  sleep 1
done

echo "MySQL server down detected. shutdown keepalived." | logger -i -t keepalived-healthcheck
service keepalived stop
exit 1
