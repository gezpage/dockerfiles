# MongoDB dockerfile

Ubuntu precise container with MongoDB 2.4.8

## Ports

* SSH   8022
* Mongo 27017

## Build steps

Build the image:

    docker build -t gezpage/mongodb .

Run a process binding a mount point to your local mongodb data:

    docker run -d -name mongodb -p 5022:22 -p 27017:27017 -v /path/to/mongodbdata:/var/lib/mongodb gezpage/mongodb

## Usage

Connect via SSH:

    ssh -p 8022 root@localhost

