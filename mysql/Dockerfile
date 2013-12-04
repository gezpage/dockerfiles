# MySQL dockerfile

FROM gezpage/ubuntu

MAINTAINER gezpage@gmail.com

RUN apt-get update; \
  DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server \
  apt-get clean; \
  mkdir /var/run/sshd

ADD files/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose ports for SSH and MySQL
EXPOSE 22 3306

CMD ["/usr/bin/supervisord"]
