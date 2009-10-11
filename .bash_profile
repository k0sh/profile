# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
JAVA_HOME=/opt/jdk1.6.0_16
JDK_HOME=$JAVA_HOME
J2RE_HOME=$JAVA_HOME/jre
EDITOR=vim

PATH=$PATH:$HOME/bin

export JDK_HOME
export J2RE_HOME
export JAVA_HOME
export PATH
export EDITOR


