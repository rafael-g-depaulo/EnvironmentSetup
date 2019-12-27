#!/bin/bash

# installing utilities

# git flow
wget -q  https://raw.githubusercontent.com/petervanderdoes/gitflow-avh/develop/contrib/gitflow-installer.sh && sudo bash gitflow-installer.sh install stable &> /dev/null; rm gitflow-installer.sh
git config --global gitflow.feature.finish.no-ff yes
git config --global --add merge.ff false
