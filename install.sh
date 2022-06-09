#!/usr/bin/env bash
#
# zvava's dotfile install script
# @zvava@merveilles.town
#

# TODO: detect termux, make all the scripts have proper bash paths

[ $(whoami) = "root" ] || { echo "[aborting] not running as root" ; exit ; }

# cd to location of script
cd "${0%/*}"

printf "%s\n%s" \
	"-> about to install dotfiles from mininmobile/config" \
	"-> enter the username of your main account: "
read -r installuser

printf "%s" \
	"-> is \"$installuser\" correct? (y/n) "
read -r ans
[ "$ans" = y ] || { echo "[aborting]" ; exit ; }

cp -rp .config .scripts .bash* /home/$installuser/

# nano configs
cp -rp .nano .nanorc /home/$installuser/
mkdir /home/$installuser/.nano.backups
chown $installuser.$installuser /home/$installuser/.nano.backups

# add .scripts to PATH
echo "PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/$installuser/.scripts" > /etc/environment
