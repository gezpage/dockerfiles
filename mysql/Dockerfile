# MySQL dockerfile

FROM ubuntu:12.04

MAINTAINER gezpage@gmail.com

RUN dpkg-divert --local --rename --add /sbin/initctl; \
  ln -s /bin/true /sbin/initctl; \
  echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list; \
  apt-get update; \
  DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server openssh-server; \
  apt-get clean; \

  mkdir /var/run/sshd

# Expose ports for SSH and MySQL
EXPOSE 22
EXPOSE 3306

