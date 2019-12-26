#!/bin/bash

source "$DIR/utils/check_and_install.sh"
source "$DIR/utils/apt_install.sh"

update_repos() {

  echo "updating repos"

  # adding repos
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

  # updating
  sudo apt update

  # just to be sure these important tools are installed on the machine
  apt_install build-essential
  apt_install wget curl git

}

# do the thing
check_and_install "$UPDATE_REPOS" update_repos "should repos be updated? (say yes unless you know what you're doing)"
