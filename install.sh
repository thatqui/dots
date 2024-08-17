#!/usr/bin/env bash

DOTDIRS="nvim hypr kitty rofi waybar"

if [ "$1" == "--init" ]; then
	for i in $DOTDIRS; do
		cp -rf ~/.config/${i} .
		echo "${i} copied to $PWD."
	done
else
	read -p "Are you sure to install my dotfiles? It can delete your configs, so take a backup. [y/N]" answer
	if [ "$answer" == "y" ]; then
	for i in $DOTDIRS; do
		cp -rf ./${i} ~/.config/
		echo "${i} copied to ~/.config"
	done
	fi
fi
