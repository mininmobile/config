#
# zvava's .bashrc
#
# @zvava@toot.cafe
#

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# prompt
PS1='[\u@\h \w]\$ '

# aliases
if [ -e ~/.bashrc.aliases ] ; then
	source ~/.bashrc.aliases
fi

# default applications
BROWSER=/usr/bin/firefox
EDITOR=/usr/bin/code-oss
MONITOR=DisplayPort-0
