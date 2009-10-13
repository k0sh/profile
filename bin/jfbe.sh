#!/bin/sh

if [ -z "$J2RE_HOME" ]; then
    echo ERROR: cannot start jZamok.
    echo J2RE_HOME is not set...
    exit 1
fi

CLASSPATH=$CLASSPATH:$HOME/opt/javamail-1.4/mail.jar
echo "classpath: $CLASSPATH"
FBE_HOME=$HOME/projects/netbeans/jFBE/classes/production/jFBE
$J2RE_HOME/bin/java -cp $CLASSPATH:$FBE_HOME \
     -Dswing.defaultlaf=sun.swing.plaf.nimbus.NimbusLookAndFeel \
     com.gmail.renatn.jFBE.AppFrame >/dev/null &
#    -Dcom.sun.management.jmxremote.port=1090 \
#    -Dcom.sun.management.jmxremote.ssl=false \
#    -Dcom.sun.management.jmxremote.authenticate=false \
     
