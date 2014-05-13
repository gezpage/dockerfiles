#!/bin/bash

# Install script for PHP Symfony2 development
#

# Install PHP
printf "\n\n * Installing PHP 5.5 PPA\n\n"
add-apt-repository -y ppa:ondrej/php5
apt-get update
apt-get install -y php5

# Install APC using PECL
printf "\n\n * Installing APC\n\n"
printf "\n" | pecl install apc
echo extension=apc.so > /etc/php5/conf.d/apc.ini

# Install nodejs
printf "\n\n * Installing Nodejs PPA\n\n"
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
