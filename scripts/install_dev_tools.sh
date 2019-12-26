#!/bin/bash

source "$DIR/utils/check_and_install.sh"
source "$DIR/utils/apt_install.sh"

# set up nvm and node
install_node_nvm() {
  echo "installing node & nvm!"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  nvm install node
}
check_and_install "$INSTALL_NODE" install_node_nvm "should node & nvm be installed?"

# set up yarn
install_yarn() {
  echo "installing yarn!"
  sudo apt install -y -qq --no-install-recommends yarn
  # the --no-install-recommends flag skips the node installation
}
check_and_install "$INSTALL_YARN" install_yarn "should yarn be installed?"

# rails and rvm
install_rvm_rails() {
  echo "installing rvm & rails!"
  # # this takes a long ass while, strap yourself
  # sudo apt install -y -qq gnupg2
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

  # # install postgres
  apt_install postgresql
  apt_install postgresql-contrib
  apt_install libpq-dev
  apt_install libpq-dev

  # log as postgres and add current user as superuser (if the user already exists, it isnt created, but it still gains superuser)
  sudo service postgresql start
  sudo -u postgres psql -c "
  DO
  \$do$
    BEGIN
      IF NOT EXISTS (
          SELECT                       -- SELECT list can stay empty for this
          FROM   pg_catalog.pg_roles
          WHERE  rolname = '$USER') THEN
          CREATE USER $USER WITH PASSWORD '$PASSWORD';
      END IF;

      ALTER USER $USER WITH SUPERUSER;  
    END
  \$do$;
  "
  # psql code adapted from https://stackoverflow.com/questions/8092086/create-postgresql-role-user-if-it-doesnt-exist
}
check_and_install "$INSTALL_RAILS" install_rvm_rails "should rails & ruby be installed?"

