#!/bin/bash/

# in this file is declared a function that installs a tool and its related packages
install_tool() {
  # $1: the name of the tool we're installing
  local TOOL=$1
  shift

while test $# -gt 0; do
  # $1: the name of the package we're installing
  local PKG=$1
  shift
  
  # $2: the aditional flags that should be passed to apt-get 
  local FLAGS=${1:-""}
  shift

  # check wether or not the package is already installed
  local PKG_OK=$(dpkg -l | awk '/^ii +'"$PKG"' +/' | egrep "^ii" | wc -l)
  printf "  [$TOOL] Checking for $PKG: "
  
  # if package isnt installed, install it
  if [ 0 == $PKG_OK ]; then
    echo "No $PKG. Setting up $PKG."
    sudo apt-get install -y -qq $FLAGS $PKG  -qq > /dev/null

  # if its already installed, just move on
  else
    printf "ok\n"
  fi
done
}