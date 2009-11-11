#!/bin/bash

SFILES=`git --git-dir /home/renat/.git --work-tree /home/renat status | grep "modified:" | sed 's/^.*modified://g'`
NFILES=`echo "$SFILES" | wc -l`
if [ $NFILES -gt 0 ]; then
	echo "Modified $NFILES files"
	/usr/bin/notify-send -u normal -i gnome-note "There are $NFILES modified files " "$SFILES"
fi
