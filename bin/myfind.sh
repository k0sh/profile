#!/bin/sh
find $1 -type f -name "$2" -exec grep -n -H --color=auto "$3" '{}' \;

