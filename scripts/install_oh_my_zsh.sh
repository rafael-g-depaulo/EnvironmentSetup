#!/bin/bash

source "$DIR/utils/apt_install.sh"

# INSTALL AND SETUP ZSH AND OH-MY-SZH
# set up zsh and oh-my-zsh
apt_install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" -y -qq

# # powerline fonts for "agnoster" oh-my-zsh theme
# sudo apt install -y -qq fonts-powerline
