# MySQL dockerfile

Build the image:

  docker build -t gezpage/mysql .

Run a process with a bash shell and change the root password:

  docker run -i -name mysql -t gezpage/mysql /bin/bash
  passwd root

Now disconnect and commit the changes back to the image and remove the proces:

  docker commmit mysql gezpage/mysql
  docker rm mysql

Run a process again, this time starting the SSH server and daemonizing it as well as binding a mount point to your local mysql data:

  docker run -d -name mysql -p 5000:22 -p 3306:3306 -v /path/to/mysqldata:/var/lib/mysql gezpage/mysql /usr/sbin/sshd -D

Connect via SSH and start the MySQL process:

  ssh root@127.0.0.1 -p 5000

Fix the file ownership and start the MySQL daemon backgrounded:

  chown -R mysql.mysql /var/lib/mysql
  mysqld_safe &

Now you can connect to MySQL from your host (don't forget to change the password):

  mysql -u root
