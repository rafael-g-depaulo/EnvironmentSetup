#!/bin/bash

##### README #############################################
# this is a .sh file to set up my (@not_ragan on twitter!)
# development environment for ubuntu. it installs my necessary tools
# and a few cool bells and whistles, like some terminal junk

###### OBSERVATIONS ######################################
#! OBS: remember to add these permissions before executing this script
#! chmod +x main.sh
# (check that you're already in this folder when executing the above command)

#! OBS: this script should be executed with
# bash main.sh [args]

#! OBS: remember to run this to copy your windows ssh keys to this if you're using wsl inside a windows pc that has ssh keys
# cp -r /mnt/c/Users/<your windows user name here>/.ssh ~/.

## ADD PERMISSIONS TO ALL SUBSCRIPTS ######################################################################
chmod a+w -R .

####### PARSE ARGUMENTS ####################################################################################
. ./scripts/parse_arguments.sh
echo "1"

# ###### SET UP CONNECTION TO WINDOWS SUPERSYSTEM ##########################################################
. ./scripts/wsl_setup.sh
echo "2"

# ######## UPDATE REPOS ####################################################################################
. ./scripts/update_repos.sh
echo "3"

######## SHELL STUFF & DOTFILES ############################################################################

# install zsh and oh-my-zsh
. ./scripts/install_oh_my_zsh.sh
echo "4"

# call subscript that sets up dotfiles
# the script takes all dotfiles from ./dotfiles/*, and copies them to root "~/"
cd scripts              # the set_up_dotfiles.sh script only works when ran directly from './scripts'
. ./set_up_dotfiles.sh  # set up dotfiles
cd ..                   # go back to this git's root
echo "5"

######### MY UTILITIES ####################################################################################
. ./scripts/install_utilities.sh
echo "6"

######### MY DEVELOPMENT TOOLS ############################################################################
. /scripts/install_dev_tools.sh
echo "7"
