#!/bin/sh
# $Id: remind.sh, v 1.0 2007/10/04 13:00:13 $

if [ $# -lt 2 ]; then
	echo Usage: $(basename $0) time message
	exit 1
fi

JOB="/usr/bin/notify-send -u normal -i gnome-note 'Remind at $1' '$2'"

echo $JOB | at $1

