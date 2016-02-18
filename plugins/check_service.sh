#!/bin/bash

service=`service $1 status 2>&1`

case $service in
    *start/running*)
        echo "OK - $service"
        exit 0
    ;;
    *stop/waiting*)
        echo "CRITICAL - $service."
        exit 2
    ;;
    *)
        echo "UNKNOWN - $service"
        exit 3
    ;;
esac