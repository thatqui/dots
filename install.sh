#!/usr/bin/env bash

DOTDIRS="nvim hypr rofi waybar"
APPLIST="neovim hyprland hyprpaper gnome-keyring waybar konsole thunar hyprshot rofi-wayland polkit-kde-agent swaylock-effects"

if [ "$1" == "--init" ]; then
    for i in $DOTDIRS; do
        cp -rf ~/.config/${i} .
        echo "${i} copied to $PWD."
    done
else
    read -p "Are you sure you want to install my dotfiles? It can delete your configs, so take a backup. [y/N] " answer

    if [ "$answer" == "y" ]; then
        if [ "$1" != "--nocheck" ]; then
            source /etc/os-release
            if [ "$ID" == "arch" ]; then
                paru -S $APPLIST --noconfirm --needed
            else
                echo "This script only supports Arch Linux. If you aren't using Arch, you should install dependencies yourself and run this script with --nocheck parameter."
                exit 1
            fi
        fi

        for i in $DOTDIRS; do
            cp -rf ./${i} ~/.config/
            if [[ $? -eq 0 ]]; then
                echo "${i} copied to ~/.config"
            else
                echo "${i} did NOT copy to ~/.config"
            fi
        done
    else
        echo "Aborted by user."
        exit 0
    fi
fi

