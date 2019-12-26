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

## ADD PERMISSIONS TO ALL SUBSCRIPTS ##############################################################
chmod a+w -R .

## GET CURRENT PATH ###############################################################################
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# copied from https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself

####### PARSE ARGUMENTS ###########################################################################
printf "1: "
. $DIR/scripts/parse_arguments.sh

###### SET UP CONNECTION TO WINDOWS SUPERSYSTEM ###################################################
printf "2: "
. $DIR/scripts/wsl_setup.sh

######## UPDATE REPOS #############################################################################
printf "3: "
. $DIR/scripts/update_repos.sh

######## SHELL STUFF & DOTFILES ###################################################################

# install zsh and oh-my-zsh
printf "4: "
. $DIR/scripts/install_oh_my_zsh.sh

# call subscript that sets up dotfiles
# the script takes all dotfiles from ./dotfiles/*, and copies them to root "~/"
cd scripts              # the set_up_dotfiles.sh script only works when ran directly from './scripts'
. $DIR/set_up_dotfiles.sh  # set up dotfiles
printf "5: "
cd ..                   # go back to this git's root

######### MY UTILITIES ############################################################################
printf "6: "
. $DIR/scripts/install_utilities.sh

######### MY DEVELOPMENT TOOLS ####################################################################
printf "7: "
. $DIR/scripts/install_dev_tools.sh
