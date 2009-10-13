#!/bin/sh

USESPACE=`df /dev/sda1 | tail -n1 | cut -f 26 -d' ' | sed -e 's/%//'`
echo "Используется $USESPACE%"
if [ $USESPACE -gt 70 ]; then
    echo "Alarm! Alarm! Alarm!"
fi