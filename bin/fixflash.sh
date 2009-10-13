#!/bin/sh

if [ $# -lt 1 ]; then
	echo "Usage: $(basename $0) <device>"
	exit -1
fi

echo 64 >/sys/block/$1/device/max_sectors
