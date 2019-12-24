#!/bin/bash

##### README #############################################
# this is a .sh file to set up my (@not_ragan on twitter!)
# development environment for ubuntu. it installs my necessary tools
# and a few cool bells and whistles, like some terminal junk

###### OBSERVATIONS ######################################
#! OBS: remember to add these permissions before executing this script
#! chmod +x wsl_setup.sh
# (check that you're already in this folder when executing the above command)

#! OBS: this script should be executed with
# bash wsl_setup.sh [args]

#! OBS: remember to run this to copy your windows ssh keys to this if you're using wsl inside a windows pc that has ssh keys
# cp -r /mnt/c/Users/<your windows user name here>/.ssh ~/.

####### PARSE ARGUMENTS ####################################################################################
. ./scripts/parse_arguments.sh


# ###### SET UP LINKS TO WINDOWS SUPERSYSTEM ###############################################################
# cd
# mkdir /mnt/c/projects
# ln -s /mnt/c/projects


# ######## UPDATE REPOS ####################################################################################
. ./scripts/update_repos.sh

######## SHELL STUFF & DOTFILES ###################################################################

# install zsh and oh-my-zsh
. ./scripts/install_oh_my_zsh.sh

# call subscript that sets up dotfiles
# the script takes all dotfiles from ./dotfiles/*, and copies them to root "~/"
cd scripts              # the set_up_dotfiles.sh script only works when ran directly from './scripts'
. ./set_up_dotfiles.sh  # set up dotfiles
cd ..                   # go back to this git's root

######### MY UTILITIES ####################################################################################
. ./scripts/install_utilities.sh

######### MY DEVELOPMENT TOOLS ############################################################################
. /scripts/install_dev_tools.sh