#!/bin/bash

# Install script for PHP Symfony2 development on Ubuntu 12.04

printf "\n [*] Installing required packages\n"
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get --yes install git-core curl postfix unzip make \
    libxml2-dev libpcre3-dev yui-compressor libicu-dev \
    python-software-properties vim

printf "\n [*] Installing PHP 5.5 PPA\n"
add-apt-repository -y ppa:ondrej/php5
apt-get update
apt-get install -y php5

printf "\n [*] Installing APC\n"
printf "\n" | pecl install apc
echo extension=apc.so > /etc/php5/conf.d/apc.ini

printf "\n [*] Installing Nodejs PPA\n"
add-apt-repository -y ppa:chris-lea/node.js
apt-get update
apt-get install -y nodejs

printf "\n [*] Enabling Apache mod_rewrite\n"
a2enmod rewrite
service apache2 reload

printf "\n [*] Installing Composer\n"
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

printf "\n [*] Installing Less CSS\n"
npm install --global less

printf "\n [*] Creating www-user\n"
useradd -m -g www-data -G sudo -s /bin/bash www-user
echo "www-user:docker" | chpasswd

printf "\n [*] Installing more packages\n"
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get --yes install \
    php5-mysql php5-sqlite php5-curl php5-mcrypt php-apc php5-dev php-pear php5-curl \
    php-apc php5-intl php5-gd libapache2-mod-php5 apache2 php5 php5-sqlite php5-memcache

printf "\n [*] Install complete!\n"
