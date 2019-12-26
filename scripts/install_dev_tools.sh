#!/bin/bash

source "$DIR/utils/check_and_install.sh"
source "$DIR/utils/install_package.sh"
source "$DIR/utils/curl_install.sh"

# set up nvm and node
install_node_nvm() {
  echo "installing node & nvm!"
  curl_install "-o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh"

  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  nvm install node
}
check_and_install "$INSTALL_NODE" install_node_nvm "should node & nvm be installed?"

# set up yarn
install_yarn() {
  echo "installing yarn!"
  install_package yarn --no-install-recommends
  # the --no-install-recommends flag skips the node installation
}
check_and_install "$INSTALL_YARN" install_yarn "should yarn be installed?"

# rails and rvm
install_rvm_rails() {
  echo "installing rvm & rails!"
  # # this takes a long ass while, strap yourself
  install_package gnupg2
  
  
  if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
    source "$HOME/.rvm/scripts/rvm"
  elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then
    source "/usr/local/rvm/scripts/rvm"
  else
    printf "ERROR: An RVM installation was not found.\n"

    echo "this is gonna take a fucking while, strap in buckaroo"
    # gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    curl_install "-sSL https://get.rvm.io" "-s stable --rails"
    source /home/$USER/.rvm/scripts/rvm
    echo "getting rvm"
  fi

  export PATH=/home/$USER/.rvm/gems/ruby-2.6.3/bin:$PATH
  rvm get stable --auto-dotfiles
  rvm install current
  rvm use --default current
  
  # postgres (i use postgresdb with rails, technically)

  # # install postgres
  install_package postgresql
  install_package postgresql-contrib
  install_package libpq-dev
  install_package libpq-dev

  # log as postgres and add current user as superuser (if the user already exists, it isnt created, but it still gains superuser)
  sudo service postgresql start

  local PASSWORD=""
  
  if sudo -u postgres psql -t -c '\du' | cut -d \| -f 1 | grep -qw $USER; then
    # user exists
    # $? is 0
    echo "Postgres user already setup."
  else  
    # Read Password
    printf "Postgres user not set up. Creating new psql superuser...\n"
    printf "Please insert your password (use your actual password for this linux user): "
    read -s PASSWORD
    echo
    
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
  fi
  # get password from user, and create psql user
  # psql code adapted from https://stackoverflow.com/questions/8092086/create-postgresql-role-user-if-it-doesnt-exist
}
check_and_install "$INSTALL_RAILS" install_rvm_rails "should rails & ruby be installed?"

