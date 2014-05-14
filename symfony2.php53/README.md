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

The run command will mount a local folder with your web project so you
will keep it on your local machine. A www-user will be created in the
www-data group with a umask of 0002, this works around many issues with
editing web files as the default group will be www-data and default
permissions will allow read and write on the group.

## Ports

* SSH  6022
* HTTP 6080

## Build steps

Build the image:

    docker build -t gezpage/symfony2:php5.3 .

Run a container binding a mount point to your Symfony2 project data:

    docker run -d -name symfony2 -p 6022:22 -p 6080:80 -v /path/to/symfony2project:/var/www gezpage/symfony2:php5.3

Connect via SSH:

    ssh www-user@localhost -p 6022

Password is 'docker'.

## Usage

You can now enter http://localhost:6080 in your web browser to access
the website, and use the project folder to edit files on your local
machine.
