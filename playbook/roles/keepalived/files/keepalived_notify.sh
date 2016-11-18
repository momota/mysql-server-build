#!/bin/bash

TYPE=$1
NAME=$2
END_STATE=$3

case $END_STATE in
  "MASTER") service keepalived stop
            service mysqld stop
            exit 0
            ;;
  "BACKUP")
            exit 0
            ;;
  "FAULT")
            exit 0
            ;;
  *)        echo "Unknown state ${END_STATE} for VRRP ${TYPE} ${NAME}"
            exit 1
            ;;
esac
