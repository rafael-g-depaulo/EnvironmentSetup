#!/bin/bash

source "$DIR/utils/install_package.sh"

# INSTALL AND SETUP ZSH AND OH-MY-SZH
# set up zsh and oh-my-zsh
install_package_silence zsh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" -y -qq &> /dev/null

# # powerline fonts for "agnoster" oh-my-zsh theme
# sudo apt install -y -qq fonts-powerline
