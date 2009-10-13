# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

EDITOR=gvim

# User specific aliases and functions
alias cal="cal -m"
alias ls="ls --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias vless="vim -u /usr/share/vim/vim72/macros/less.vim"
alias dud="du -h --max-depth=1"
alias xterm="xterm -bg black -fg green -fn -xos4-terminus-medium-r-normal-*-*-160-*-*-*-*-iso10646-1 -geometry 140x40 +sb"


