#!/bin/bash

echo "Building all images with gezpage namespace prefix"

docker build -t gezpage/ubuntu ubuntu
docker build -t gezpage/django django
docker build -t gezpage/mongodb mongodb
docker build -t gezpage/mysql mysql
docker build -t gezpage/node node
docker build -t gezpage/rails rails
docker build -t gezpage/redis redis
docker build -t gezpage/symfony2:5.3 symfony2
docker build -t gezpage/symfony2:5.5 symfony2.php55

echo "Cleaning old containers"
docker rm `docker ps -a -q`

docker images

echo "Finished building docker images"
