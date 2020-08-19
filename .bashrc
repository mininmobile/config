#
# zvava's .bashrc
#
# @zvava@toot.cafe
#

# source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# aliases
if [ -e ~/.bashrc.aliases ] ; then
	source ~/.bashrc.aliases
fi


# if not running interactively, stop
[[ $- != *i* ]] && return

# prompt
PS1='\w \$ '
