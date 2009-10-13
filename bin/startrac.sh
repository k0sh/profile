#!/bin/sh

PROJPATH=/home/user33/projects/Trac/WiMAX

/usr/sbin/tracd --daemonize --port 8080 --auth WiMAX,$PROJPATH/passwd,trac $PROJPATH
