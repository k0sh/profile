#!/bin/bash

PREFIX="/tmp/lle"

for src in *.cpp; do
	if [ -n "`grep '/usr/lib' $src`" ]; then
		echo "Patch: $src"
		dest="/tmp/$src.tmp"
		sed -e 's!/usr!'$PREFIX'!g' $src >$dest
		mv $dest $src
	fi
done
