# Symfony2 dockerfile

This will create a dev environment to run a Symfony2 project with the
following toolset:

* PHP 5.3
* Apache 2
* Nodejs (PPA)
* APC (PECL)
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

Run a container binding a mount point to your Symfony2 project data:

    docker run -d -name symfony2 -link mysql:db -p 6022:22 -p 6080:80 -v /path/to/symfony2project:/var/www gezpage/symfony2:5.3

Connect via SSH:

    ssh root@localhost -p 6022

## Usage

You can now enter http://localhost:6080 in your web browser to access
the website, and use the project folder to edit files on your local
machine.
