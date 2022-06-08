#!/usr/bin/env bash
[ $(whoami) = "root" ] || { echo "[aborting] not running as root" ; exit ; }

printf "%s\n%s" \
	"-> about to install dotfiles from mininmobile/config" \
	"-> enter the username of your main account: "
read -r installuser
printf "%s" \
	"-> is \"$installuser\" correct? (y/n) "
read -r ans
[ "$ans" = y ] || { echo "[aborting]" ; exit ; }

echo "TODO: copy files and make them owned by \$installuser"
#cp -rv .config /home/$installuser/.config
#cp -rv .scripts /home/$installuser/.scripts
#cp -rv .nano /home/$installuser/.nano
