#!/bin/bash

WHOAMI="$(id -u)"
if [ "$WHOAMI" == "0" ]; then
	echo "Ya root"
else
	echo "Ya user"
fi	

