#!/bin/sh

VBR=296k          #полнимаем для лучшего видео
ABR=64k           #поднимаем для лучшего звука
FRAME=15          #25 для MPlayer ;)
VCODEC=libxvid    #или mpeg4
ACODEC=aac        #в некоторых версиях ffmpeg - libfaac
VIDEOSIZE=480x320 #no comments
CONTAINER=mp4     #можно менять на 3gp

SRC=$1
if [ "$2" == "" ]; then
    DST=$SRC.$CONTAINER
else
    DST=$2
fi

ffmpeg -y -i "$SRC" -s $VIDEOSIZE -aspect 4:3 -vcodec $VCODEC -b $VBR -r $FRAME "$DST" -pass 1 -passlogfile passlogfile.log
ffmpeg -y -i "$SRC" -s $VIDEOSIZE -aspect 4:3 -vcodec $VCODEC -b $VBR -r $FRAME -acodec $ACODEC -ac 1 -ab $ABR "$DST" -pass 2 -passlogfile passlogfile.log


