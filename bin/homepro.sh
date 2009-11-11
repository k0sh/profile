#!/bin/bash

SFILES=`/usr/bin/git --git-dir /home/renat/.git --work-tree /home/renat status | /bin/grep "modified:" | /bin/sed 's/^.*modified://g'`
[ -z $SFILES ] && exit

NFILES=`echo "$SFILES" | wc -l`
NOTIFY_ENV=`ps -e e | grep "/usr/libexec/notification-daemon"` 
DBUS_SESSION_ENV=`echo "$NOTIFY_ENV" | grep -E -o "DBUS_SESSION_BUS_ADDRESS=unix:abstract=/tmp/dbus-.*guid=[0-9A-Za-z]{32}" | head -n 1`
DBUS_SESSION_BUS_ADDRESS=`echo "$DBUS_SESSION_ENV" | sed "s/^DBUS_SESSION_BUS_ADDRESS=//g"`
export DBUS_SESSION_BUS_ADDRESS

if [ $NFILES -gt 0 ]; then
	/usr/bin/notify-send -u normal -i gnome-note "There are $NFILES modified files " "$SFILES"
fi
