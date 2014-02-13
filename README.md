# Dockerfiles

My own curated scripts for quickly creating development environments.
All containers are based on Ubuntu 12.04 LTS (precise) using the base
docker image.

A `gezpage/ubuntu` images needs to be created before using any other images, this provides SSH and Supervisor and sets the root password to 'docker' for
all images.

## Build

For first run simplicity you can run `build_all.sh` from the project root to build all of the images. Be aware that the script will delete any existing
containers - just edit this out of the script as needed.

## Containers

* Ubuntu
* MySQL
* Node
* Redis
* Symfony2 with PHP 5.3 and Apache 2.2
* Symfony2 with PHP 5.4 and Apache 2.4
* Ruby on Rails
* Mongo DB
* Django

See individual README.md files for setup notes.
