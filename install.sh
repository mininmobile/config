#!/usr/bin/env bash
#
# zvava's dotfile install script
# @zvava@merveilles.town
#

# TODO: detect termux, make all the scripts have proper bash paths

[ $(whoami) = "root" ] || { echo "[aborting] not running as root" ; exit ; }

printf "%s\n%s" \
	"-> about to install dotfiles from mininmobile/config" \
	"-> enter the username of your main account: "
read -r installuser
printf "%s" \
	"-> is \"$installuser\" correct? (y/n) "
read -r ans
[ "$ans" = y ] || { echo "[aborting]" ; exit ; }

cp -rp .config /home/$installuser/
cp -rp .scripts /home/$installuser/
cp -rp .nano /home/$installuser/
# TODO: do this and update the username
cp environment /etc/environment
# TODO: make this with correct perms
# mkdir /home/$installuser/.nano.backups
