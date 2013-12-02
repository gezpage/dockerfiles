# Node JS dockerfile

FROM ubuntu:12.04

ADD ./files/sources.list /etc/apt/sources.list

RUN apt-get update; \
  DEBIAN_FRONTEND=noninteractive apt-get --yes install ssh openssh-server \
    git-core curl python-software-properties vim; \
  add-apt-repository -y ppa:chris-lea/node.js; \
  apt-get update; \
  apt-get install nodejs

RUN mkdir -p /var/node/data

EXPOSE 22
EXPOSE 80
