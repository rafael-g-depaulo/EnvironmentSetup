# this function checks if its supposed to install a tool, and installs it if necessary
check_and_install() {
  # $1: wether we're supposed to install that tool or not
  local SHOULD_I_INSTALL_TOOL=$1
  # $2: function that when called installs the tool
  local INSTALL_FUNCTION=$2
  # $3: string for a query asking wether the tool should be installed or not
  local INSTALL_QUERRY=$3

  if [[ $SHOULD_I_INSTALL_TOOL = "YES" ]]; then
    $INSTALL_FUNCTION
  elif [[ $SHOULD_I_INSTALL_TOOL != "NO" ]]; then
    printf "$INSTALL_QUERRY "
    read SHOULD_I_INSTALL_TOOL1
    if [[ $SHOULD_I_INSTALL_TOOL1 =~ $REGEX_YES ]]; then
      $INSTALL_FUNCTION
    fi
  fi

}

REGEX_YES='[y|yes|Y|YES]'

# set up nvm and node
install_node_nvm() {
  echo "installing node & nvm!"
  # curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
  # export NVM_DIR="$HOME/.nvm"
  # [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  # [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  # nvm install node
}
check_and_install "$INSTALL_NODE" install_node_nvm "should node & nvm be installed?"

# set up yarn
install_yarn() {
  echo "installing yarn!"
  # sudo apt install --no-install-recommends yarn
  # # the --no-install-recommends flag skips the node installation
}
check_and_install "$INSTALL_YARN" install_yarn "should yarn be installed?"

# rails and rvm
install_rvm_rails() {
  echo "installing rvm & rails!"
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
  # rvm use --default current
  # cd
}
check_and_install "$INSTALL_RAILS" install_rvm_rails "should rails & ruby be installed?"

