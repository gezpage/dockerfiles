# Node dockerfile

These steps will allow you to create a dev environment with NodeJS
installed on Ubuntu Precice. Included is a link to the mysql container
which must be running to work, ssh connectivity, and mounting of a local
path to /var/node/data.

## Ports

* SSH  7022
* HTTP 7080

## Build steps

Build an image

    docker build -t gezpage/node .

Run a process binding a mount point to your local data:

    docker run -d \
        -name node \
        -link mysql:db \
        -p 7022:22 \
        -p 7080:80 \
        -v /path/to/data:/var/node/data \
        gezpage/node

## Usage

Connect via SSH to the container:

    ssh root@localhost -p 7022

