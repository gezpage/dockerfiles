# Ubuntu dockerfile

FROM ubuntu:12.04

MAINTAINER gezpage@gmail.com

RUN dpkg-divert --local --rename --add /sbin/initctl; \
  ln -s /bin/true /sbin/initctl; \

  echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list; \
  apt-get update; \
  apt-get -y upgrade; \
  DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server supervisor; \
  apt-get clean; \

  mkdir -p /var/run/sshd; \
  mkdir -p /var/log/supervisor; \

  echo "root:docker" | chpasswd

ADD files/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 22

CMD ["/usr/bin/supervisord"]
