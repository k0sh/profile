#!/bin/sh
# $id: myfind.sh, v 1.0 2009/11/24 13:00:13 $

if [ $# -lt 3 ]; then
	echo usage: $(basename $0) path name text
	exit 1
fi

find $1 -type f -name "$2" -exec grep -n -H --color=auto "$3" '{}' \;

