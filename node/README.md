# Node dockerfile

These steps will allow you to create a dev environment with NodeJS
installed on Ubuntu Precice. Included is a link to the mysql container
which must be running to work, ssh connectivity, and mounting of a local
path to /var/node/data.

## Ports

* SSH  7000
* HTTP 7001

## Build steps

Build an image

    docker build -t gezpage/node .

Run a process with a bash shell and change the root password:

    docker run -i -name node -t gezpage/node /bin/bash
    passwd root

Now disconnect and commit the changes back to the image and remove the process:

    docker commit node gezpage/node
    docker rm node

Run a process again, this time starting the SSH server and daemonizing it as well as binding a mount point to your local data:

    docker run -d \
        -name node \
        -link mysql:db \
        -p 7000:22 \
        -p 7001:80 \
        -v /path/to/data:/var/node/data \
        gezpage/node \
        /usr/sbin/sshd -D

## Usage

Connect via SSH to the container:

    ssh root@localhost -p 7000

