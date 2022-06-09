#!/bin/sh
#
# zvava's dotfile install script
# @zvava@merveilles.town
#

# cd to location of script
cd "${0%/*}"

[ "$(whoami)" = "root" ] || { echo "[install.sh] not running as root" ; exit ; }

printf "%s" "[main] install dotfiles to main account? (y/n) "
read -r confirmmain
if [ "$confirmmain" = y ]; then
	printf "%s" "[main] enter your username: /home/"
	read -r installuser
fi

printf "%s" "[root] install dotfiles to /root/? (y/n) "
read -r confirmroot

printf "%s" "[global] install global dotfiles, eg. xorg, /etc/env, ...? (y/n) "
read -r confirmglobal

# dotfiles for your main account
if [ "$confirmmain" = y ]; then
	echo "[main] installing"

	cp -rp .config .scripts .bash* /home/$installuser/
	# screenshots dir
	mkdir -p /home/$installuser/Pictures/Screenshots
	chown $installuser.$installuser /home/$installuser/Pictures/Screenshots
	# nano configs
	cp -rp .nano .nanorc /home/$installuser/
	mkdir /home/$installuser/.nano.backups
	chown $installuser.$installuser /home/$installuser/.nano.backups
else
	echo "[main] skipping"
fi

# dotfiles that effect the root account
if [ "$confirmroot" = y ]; then
	echo "[root] installing"

	cp -r .config .bash* /root/

	# nano configs
	cp -r .nano .nanorc /root/
	mkdir /root/.nano.backups
else
	echo "[root] skipping"
fi

# dotfiles that affect all users
if [ "$confirmglobal" = y ]; then
	echo "[global] installing"

	# xorg config
	cp -r xorg.conf.d /usr/share/X11/

	# add .scripts to PATH
	[ "$confirmmain" = y ] && { echo "PATH=$PATH:/home/$installuser/.scripts" > /etc/environment ; }
else
	echo "[global] skipping"
fi

echo "[install.sh] done!"
