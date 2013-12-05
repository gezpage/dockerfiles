#!/bin/bash

# Dependencies:
# apt-get install -y ruby1.9.3 vim sudo curl git libyaml-dev libtool \
# openssl libksba-dev libxslt-dev libxml2-dev libsqlite3-dev

# Install RVM
curl -L https://get.rvm.io | bash -s
source /etc/profile.d/rvm.sh

rvm requirements
rvm install 2.0.0
rvm get stable

gem update --system 2.1.9

echo install: --no-rdoc --no-ri > ~/.gemrc
echo update: --no-rdoc --no-ri >> ~/.gemrc

gem install rails --version 4.0.2
