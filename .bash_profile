# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

JDK_HOME=/opt/jdk1.6.0_14
JAVA_HOME=$JDK_HOME/jre
EDITOR=vim
AWT_TOOLKIT=MToolkit

export AWT_TOOLKIT
export EDITOR
export JAVA_HOME
export JDK_HOME
export PATH
