# Ubuntu dockerfile

Ubuntu precise container with SSH access.

## Ports

* SSH   4022

## Build steps

Build the image:

    docker build -t gezpage/ubuntu .

Run the container daemonized:

    docker run -d -name ubuntu -p 4022:22 gezpage/ubuntu

## Usage

Connect via SSH:

    ssh -p 4022 root@localhost

(Password is defaulted to 'docker')
