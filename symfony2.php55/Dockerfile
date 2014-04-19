# PHP Symfony2 dockerfile

FROM gezpage/ubuntu

MAINTAINER gezpage@gmail.com

RUN echo "deb http://archive.ubuntu.com/ubuntu precise-updates main restricted" >> /etc/apt/sources.list; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get --yes install git-core curl postfix unzip make \
    libxml2-dev libpcre3-dev yui-compressor libicu-dev \
    python-software-properties vim

ADD files/000-default /etc/apache2/sites-enabled/000-default.conf
ADD files/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 22 80

ADD ./files/install.sh /root/install.sh
RUN /root/install.sh

RUN apt-get update; \
  DEBIAN_FRONTEND=noninteractive apt-get --yes install \
    php5-mysql php5-sqlite php5-curl php5-mcrypt php-apc php5-dev php-pear php5-curl \
    php-apc php5-intl php5-gd libapache2-mod-php5 apache2 php5 php5-sqlite php5-memcache

CMD ["/usr/bin/supervisord"]
