#!/bin/bash

pid=`xprop -root _BLACKBOX_PID | awk '{print $3}'`
message="really logout?"
if xmessage -nearmouse -buttons no:1,yes:0 "$message"; then
    kill -TERM $pid
fi