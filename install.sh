#!/usr/bin/env bash

DOTDIRS="nvim hypr rofi waybar alacritty zed"
ARCH_APPLIST="neovim hyprland hyprpaper gnome-keyring waybar alacritty thunar hyprshot rofi-wayland polkit-kde-agent swaylock-effects zsh zed nwg-look-bin"
FEDORA_APPLIST="hyprland hyprpaper waybar hyprshot swaylock-effects neovim gnome-keyring alacritty thunar rofi-wayland polkit-kde zsh zed nwg-look"

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
                echo "INFO: Installing Packages"
                paru -S $APPLIST --noconfirm --needed
            elif [ "$ID" == "fedora" ]; then
                sudo dnf install --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' --setopt='terra.gpgkey=https://repos.fyralabs.com/terra$releasever/key.asc' terra-release -y
                sudo dnf copr enable solopasha/hyprland -y
                sudo dnf copr enable eddsalkield/swaylock-effects -y
		sudo dnf copr enable tofik/nwg-shell -y
                sudo dnf install $FEDORA_APPLIST -y
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

