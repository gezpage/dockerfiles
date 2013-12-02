# PHP Symfony2 dockerfile

FROM ubuntu:12.04

ADD ./files/sources.list /etc/apt/sources.list
ADD ./files/install.sh /root/install.sh

RUN mkdir /var/run/sshd

RUN apt-get update; \
  DEBIAN_FRONTEND=noninteractive apt-get --yes install ssh openssh-server \
    git-core curl postfix unzip make \
    php5-mysql php5-sqlite php5-curl php5-mcrypt php-apc php5-dev php-pear php5-curl \
    php-apc php5-intl php5-gd libapache2-mod-php5 apache2 php5 php5-sqlite php5-memcache \
    libxml2-dev libpcre3-dev yui-compressor libicu-dev \
    python-software-properties vim

ADD ./files/000-default /etc/apache2/sites-enabled/000-default
ADD ./files/cliphp.ini /etc/php5/cli/php.ini
ADD ./files/apachephp.ini /etc/php5/apache2/php.ini

EXPOSE 22
EXPOSE 80

RUN /root/install.sh
