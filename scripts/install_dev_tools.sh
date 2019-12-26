#!/bin/bash

source '../utils/check_and_install.sh'

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
  
  # postgres (i use postgresdb with rails, technically)

  # Read Password
  echo -n "Please insert your password (use your actual password for this linux user): "
  read -s PASSWORD
  echo

  sudo apt-get install postgresql postgresql-contrib libpq-dev -y
  sudo apt-get install libpq-dev -y
  # log as postgres
  sudo -i -u postgres
  # startup psql terminal
  psql
  # create a superuser with the same name and password as the current linux user
  CREATE USER $USER WITH PASSWORD $PASSWORD;
  ALTER USER $USER WITH SUPERUSER;
  # exit psql
  \q
  # log off as postgres
  exit
}
check_and_install "$INSTALL_RAILS" install_rvm_rails "should rails & ruby be installed?"

