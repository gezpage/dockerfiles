# Symfony2 dockerfile

This will create a dev environment to run a Symfony2 project with the
following toolset:

* PHP 5.3
* Apache 2
* Nodejs
* APC
* SSH
* Git
* Curl
* Postfix
* Vim

Included is a link to an already running mysql container, and a mounted
folder where the project files are located.

## Ports

* SSH  6022
* HTTP 6080

## Build steps

Build the image:

    docker build -t gezpage/symfony2 .

Run a container with a bash shell:

    docker run -i -t -name symfony2 gezpage/symfony2 /bin/bash

Change the root password:

    passwd root

## Commit container changes to the image

Now disconnect and commit the changes back to the image and delete the
container:

    docker commit symfony2 gezpage/symfony2
    docker rm symfony2

Run a process again, this time starting the SSH server and daemonizing it as well as binding a mount point to your Symfony2 project data:

    docker run -d -name symfony2 -link mysql:db -p 6022:22 -p 6080:80 -v /path/to/symfony2project:/var/www gezpage/symfony2 /usr/sbin/sshd -D

Connect via SSH:

    ssh root@localhost -p 6022

Finally, start the apache2 service:

    service apache2 start

You can now enter http://localhost:6080 in your web browser to access
the website, and use the project folder to edit files on your local
machine.
