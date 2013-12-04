# MySQL dockerfile

Ubuntu precise container with MySQL 5.5.

Note: MySQL will use the default configuration which does not allow
access from an external host, this renders it pretty useless unless you
use SSH tunneling. If you wish to allow access, comment the line:

    bind-address           = 127.0.0.1

in /etc/mysql/my.cnf and restart mysqld_safe. Also don't forget to
create a new user for external access as the default root user only
allows local access. Use this SQL:

    CREATE USER root@'%' IDENTIFIED BY 'password';
    GRANT ALL ON *.* TO root@'%';

Job's a good'un!

## Ports

* SSH   5022
* MYSQL 3306

## Build steps

If you wish to retain the mysql data files on your local filesystem,
extract the contents of var_lib_mysql.tgz somewhere and reference this
when starting the process (replace /path/to/mysqldata below).

Build the image:

    docker build -t gezpage/mysql .

Run a process binding a mount point to your local mysql data:

    docker run -d -name mysql -p 5022:22 -p 3306:3306 -v /path/to/mysqldata:/var/lib/mysql gezpage/mysql

## Usage

Connect via SSH and start the MySQL process:

    ssh -p 5022 root@localhost

Fix the file ownership:

    chown -R mysql.mysql /var/lib/mysql

Restart MySQL:

    killall mysqld
    mysqld_safe &

Now you can connect to MySQL from your host (don't forget to change the password):

    mysql -u root
