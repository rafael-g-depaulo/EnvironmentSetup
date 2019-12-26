#!/bin/bash/

# in this file is declared a function that installs a package, if it isnt already installed.
# if the package is already installed, it does nothing
apt_install() {
  # $1: the name of the package we're installing
  local PKG=$1

  # check wether or not the package is already installed
  local PKG_OK=$(dpkg -l | awk '/^ii +'"$PKG"' +/' | egrep "^ii" | wc -l)
  printf "Checking for $PKG: "
  
  # if package isnt installed, install it
  if [ 0 == $PKG_OK ]; then
    echo "No $PKG. Setting up $PKG."
    sudo apt-get install -y -qq $PKG  -qq > /dev/null

  # if its already installed, just move on
  else
    printf "ok\n"
  fi
}