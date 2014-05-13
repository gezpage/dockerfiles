#!/bin/bash

# Install script for PHP Symfony2 development
#
# Preconditions:
#
#   The following packages must be installed:
#
#   ssh git-core curl postfix unzip make \
#   php5-mysql php5-sqlite php5-curl php5-mcrypt php-apc php5-dev php-pear php5-curl \
#   php-apc php5-intl php5-gd libapache2-mod-php5 apache2 php5 php5-sqlite \
#   libxml2-dev libpcre3-dev yui-compressor libicu-dev \
#   python-software-properties; \

# Install APC using PECL
printf "\n\n * Installing APC\n\n"
printf "\n" | pecl install apc
echo extension=apc.so > /etc/php5/conf.d/apc.ini

# Install nodejs
printf "\n\n * Installing Nodejs\n\n"
add-apt-repository -y ppa:chris-lea/node.js
apt-get update
apt-get install -y nodejs

# Enable Apache mod rewrite
printf "\n\n * Enabling Apache mod_rewrite\n\n"
a2enmod rewrite
service apache2 reload

# Install Composer globally
printf "\n\n * Installing Composer\n\n"
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Install LessCSS globally
printf "\n\n * Installing Less CSS\n\n"
npm install --global less

# Create www-user
printf "\n\n * Creting www-user\n\n"
useradd -m -g www-data -G sudo -s /bin/bash www-user
echo "www-user:docker" | chpasswd


printf "\n\n * Install complete!\n\n"
