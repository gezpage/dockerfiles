#!/bin/bash

apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10

echo 'deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list

apt-get update

apt-get install -y mongodb-10gen

echo "Finished!"
