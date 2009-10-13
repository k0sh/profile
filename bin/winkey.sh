#!/bin/sh

xmodmap -e "clear mod4"
xmodmap -e "keycode 115 = Super_L"
xmodmap -e "keycode 116 = Super_R"
xmodmap -e "add mod4 = Super_R Super_L"

