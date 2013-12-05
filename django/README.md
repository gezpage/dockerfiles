# Django dockerfile

Ubuntu precise container with Django

## Ports

* SSH   8022

## Build steps

Build the image:

    docker build -t gezpage/django .

Run a process binding a mount point to your local django data:

    docker run -d -name django -p 5022:22 -p 27017:27017 -v /path/to/djangodata:/var/lib/django gezpage/django

## Usage

Connect via SSH:

    ssh -p 8022 root@localhost

