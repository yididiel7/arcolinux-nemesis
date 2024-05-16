#!/bin/bash
#set -e
##################################################################################################################
# Author    : Erik Dubois
# Website   : https://www.erikdubois.be
# Website   : https://www.alci.online
# Website   : https://www.ariser.eu
# Website   : https://www.arcolinux.info
# Website   : https://www.arcolinux.com
# Website   : https://www.arcolinuxd.com
# Website   : https://www.arcolinuxb.com
# Website   : https://www.arcolinuxiso.com
# Website   : https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

##################################################################################################################

# https://www.youtube.com/watch?v=HMxHUvN6VGo
# https://gitlab.com/stephan-raabe/
cp /etc/skel/.bashrc $HOME/dotfiles/.bashrc-arcolinux

if ! grep -q "~/dotfiles/.bashrc-arcolinux" $HOME/.bashrc; then
	echo "
[[ -f ~/dotfiles/.bashrc-arcolinux ]] && . ~/dotfiles/.bashrc-arcolinux" | tee -a $HOME/dotfiles/.bashrc
	source  ~/.bashrc
fi

if ! grep -q "# Keybindings ArcoLinux" $HOME/dotfiles/hypr/conf/keybindings/default.conf; then

echo "

# Keybindings ArcoLinux
bind = $mainMod SHIFT, Return, exec, ~/dotfiles/.settings/filemanager.sh
bind = $mainMod SHIFT, Q, killactive
bind = $mainMod, X, exec, archlinux-logout
bind = $mainMod SHIFT, X, exec, arcolinux-powermenu
bind = , F12, exec, xfce4-terminal --drop-down
bind = CTRL ALT, T, exec, kitty
bind = CTRL ALT, Return, exec, kitty
bind = $mainMod , D, exec, rofi -show drun -replace -i
bind = $mainMod SHIFT, D, exec, rofi -show drun -replace -i" | tee -a $HOME/dotfiles/hypr/conf/keybindings/default.conf
fi