#!/bin/sh
#
# zvava's dotfile install script
# @zvava@merveilles.town
#

# cd to location of script
cd "${0%/*}"

if command -v termux-fix-shebang &> /dev/null; then
	echo "[install.sh] termux detected, i'll do my best =]"

	cp -r .config .scripts .bash* "$HOME/"
	chmod +x "$HOME/.scripts/*"
	# fix script paths
	termux-fix-shebang "$HOME/.scripts/*"
	# remove gui configs
	cd "$HOME/.config"
	rm -rf gtk-2.0 gtk-3.0 protonvpn redshift xfce4
else
	[ "$(whoami)" = "root" ] || { echo "[install.sh] not running as root" ; exit ; }

	read -rp "install dotfiles to main account? (y/n) " confirmmain
	if [ "$confirmmain" = y ]; then
		read -rp "[main] enter your username: /home/" installuser
	fi
	read -rp "install dotfiles to /root/? (y/n) " confirmroot
	read -rp "install global dotfiles, eg. xorg, /etc/env, ...? (y/n) " confirmglobal

	# dotfiles for your main account
	if [ "$confirmmain" = y ]; then
		echo "[main] installing"

		cp -rp .config .scripts .bash* "/home/$installuser/"
		chmod +x "/home/$installuser/.scripts/*"
		# screenshots dir
		mkdir -p "/home/$installuser/Pictures/Screenshots"
		chown $installuser.$installuser "/home/$installuser/Pictures/Screenshots"
		# nano configs
		cp -rp .nano .nanorc "/home/$installuser/"
		mkdir "/home/$installuser/.nano.backups"
		chown $installuser.$installuser "/home/$installuser/.nano.backups"
	else
		echo "[main] skipping"
	fi

	# dotfiles that effect the root account
	if [ "$confirmroot" = y ]; then
		echo "[root] installing"

		cp -r .config .bash* /root/
		chmod +x /root/.scripts/*
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
fi

echo "[install.sh] done!"
