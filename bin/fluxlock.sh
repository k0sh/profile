#!/bin/sh

PID=`/sbin/pidof gnome-screensaver`

if [ "x$PID" == "x" ]; then
    gnome-screensaver &
    sleep 2

fi

gnome-screensaver-command --lock


