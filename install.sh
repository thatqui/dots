#!/usr/bin/env bash

DOTDIRS="nvim hypr rofi waybar"
APPLIST="nvim Hyprland hyprpaper gnome-keyring rofi waybar konsole thunar hyprshot rofi"

if [ "$1" == "--init" ]; then
	for i in $DOTDIRS; do
		cp -rf ~/.config/${i} .
		echo "${i} copied to $PWD."
	done
else
	read -p "Are you sure to install my dotfiles? It can delete your configs, so take a backup. [y/N] " answer
	if [ "$answer" == "y" ]; then
	for i in $APPLIST; do
		if ! command -v $i >/dev/null; then
			echo "$i is not installed. Please install it and run the script again."
			exit 1
		fi
	done
	for i in $DOTDIRS; do
		cp -rf ./${i} ~/.config/
		if [[ $? -eq 0 ]]; then
                	echo "${i} copied to ~/.config"
            	else
                	echo "${i} did NOT copy to ~/.config"
            	fi
	done
	fi
fi
