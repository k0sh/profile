#!/bin/sh

if [ -z "$J2RE_HOME" ]; then
    echo ERROR: cannot start jZamok.
    echo J2RE_HOME is not set...
    exit 1
fi

CLASSPATH=$CLASSPATH:/home/renat/projects/Idea/jDMForum/lib/derby.jar
MY_HOME=/home/renat/projects/Idea/jDMForum/classes
$J2RE_HOME/bin/java -cp $CLASSPATH:$MY_HOME -Dswing.aatext=true ru.kedah.renat.jDMForum.AppFrame 2>&1 >/dev/null &