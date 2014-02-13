#!/bin/bash

# Dependencies:
# apt-get install -y ruby1.9.3 vim sudo curl git libyaml-dev libtool \
# openssl libksba-dev libxslt-dev libxml2-dev libsqlite3-dev

# Install RVM
printf "\n\n * Installing RVM\n\n"
curl -L https://get.rvm.io | bash -s
source /etc/profile.d/rvm.sh

rvm requirements
rvm install 2.0.0
rvm get stable

gem update --system 2.1.9

echo install: --no-rdoc --no-ri > ~/.gemrc
echo update: --no-rdoc --no-ri >> ~/.gemrc

# Install Rails
printf "\n\n * Installing Rails\n\n"
gem install rails --version 4.0.2

# Install nodejs
printf "\n\n * Installing Nodejs PPA\n\n"
add-apt-repository -y ppa:chris-lea/node.js
apt-get update
apt-get install -y nodejs

# Install Heroku toolbelt
printf "\n\n * Installing Heroku Toolbelt\n\n"
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
