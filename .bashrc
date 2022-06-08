#
# zvava's .bashrc
# @zvava@merveilles.town
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


# lang
if [[ $LANG = '' ]]; then
	export LANG=en_US.UTF-8
fi

# prompt
PS1='\w \$ '

unset rc
