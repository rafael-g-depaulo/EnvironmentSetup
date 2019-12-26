#!/bin/bash/

# in this file is declared a function that installs a tool and its related packages
install_tool() {
  # $1: the name of the tool we're installing
  local TOOL=$1
  shift

  while test $# -gt 0; do
    # the name of the package we're installing
    local PKG=$1
    shift

    # the installation function to use (default to apt-get)
    local INSTALL_FUNCTION=${1:-"apt_get_install"}
    shift
    
    # the aditional (optional) flags that should be passed to apt-get 
    local FLAGS=${1:-""}
    shift

    # check wether or not the package is already installed
    local PKG_OK=$(dpkg -l | awk '/^ii +'"$PKG"' +/' | egrep "^ii" | wc -l)
    printf "  [$TOOL] Checking for $PKG: "
    
    # if package isnt installed, install it
    if [ 0 == $PKG_OK ]; then
      echo "No $PKG. Setting up $PKG."
      $INSTALL_FUNCTION $PKG $FLAGS

    # if its already installed, just move on
    else
      printf "ok\n"
    fi
  done
}

# Usage of install_tool shall be as shown bellow:
# to install tool "node", with packages "yarn" (with flag --no-install-recommends), "nvm" and "node"

# install_tool "node" \
#   "nvm"  "echo pretending to install" "" \
#   "node" "echo pretending to install" "" \
#   "yarn" "echo pretending to install" "--no-install-recommends"