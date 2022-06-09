#
# zvava's .bashrc
# @zvava@merveilles.town
#

# source global definitions
if [[ -f /etc/bashrc ]]; then
	. /etc/bashrc
fi

# aliases
if [[ -e ~/.bashrc.aliases ]] ; then
	source ~/.bashrc.aliases
fi

# lang
if [[ $LANG = '' ]]; then
	export LANG=en_US.UTF-8
fi

# include user scripts
if [[ $PATH != *".scripts"* ]];then
	PATH="~/.scripts:$PATH"
fi

# if not running interactively, stop
[[ $- != *i* ]] && return

# prompt
PS1='\w \$ '

unset rc
