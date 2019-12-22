##### README #############################################
# this is a .sh file to set up my (@not_ragan on twitter!)
# development environment for ubuntu. it installs my necessary tools
# and a few cool bells and whistles, like some terminal junk

###### OBSERVATIONS ######################################
#! OBS: remember to add these permissions before executing this script
#! chmod +x wsl_setup.sh
# (check that you're already in this folder when executing the above command)

#! OBS: remember to run this to copy your windows ssh keys to this if you're using wsl inside a windows pc that has ssh keys
# cp -r /mnt/c/Users/<your windows user name here>/.ssh ~/.

# ###### SET UP LINKS TO WINDOWS SUPERSYSTEM ###############################################################
# cd
# mkdir /mnt/c/projects
# ln -s /mnt/c/projects


# ######## UPDATE REPOS ####################################################################################

# curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
# echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
# sudo apt update
# sudo apt-get update

# # just to be sure these important tools are installed on the machine
# sudo apt-get install build-essential
# sudo apt-get install wget curl git


######## SHELL STUFF & DOTFILES ###################################################################

# install zsh and oh-my-zsh
. ./scripts/install_oh_my_zsh.sh

# call subscript that sets up dotfiles
# the script takes all dotfiles from ./dotfiles/*, and copies them to root "~/"
cd scripts              # the set_up_dotfiles.sh script only works when ran directly from './scripts'
. ./set_up_dotfiles.sh  # set up dotfiles
cd ..                   # go back to this git's root

######## STUFF MY TOOLS NEED BUT I DONT USE #########################################################

# # set up python? idk if this is working correctly for actual python use
# # some of my tools use python and they didnt complain
# sudo apt-get install software-properties-common -y
# sudo add-apt-repository ppa:deadsnakes/ppa -y
# sudo apt-get install python3.6 -y
# sudo apt install python-minimal -y

# # powerline fonts for "agnoster" oh-my-zsh theme
# sudo apt-get install fonts-powerline -y


######### MY UTILITIES ####################################################################################
. ./scripts/install_utilities.sh

######### MY DEVELOPMENT TOOLS ############################################################################

# # set up nvm and node
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# nvm install node

# # set up yarn
# sudo apt install --no-install-recommends yarn
# # the --no-install-recommends flag skips the node installation

# # rails and rvm
# # this takes a long ass while, strap yourself
# sudo apt install gnupg2
# gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
# cd /tmp
# curl -sSL https://get.rvm.io -o rvm.sh
# cat /tmp/rvm.sh | bash -s stable --rails
# source /home/$USER/.rvm/scripts/rvm
# echo "getting rvm"
# rvm get stable --auto-dotfiles
# rvm install current
# rvm use current
# cd
