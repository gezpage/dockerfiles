# Redis dockerfile

Ubuntu precise container with Redis 2.2.12

## Ports

* SSH   3022
* Redis 6379

## Build steps

Build the image:

    docker build -t gezpage/redis .

Run a process binding a mount point to your local redis data:

    docker run -d -name redis -p 3022:22 -p 6379:6379 -v /path/to/redisdata:/var/lib/redis gezpage/redis

## Usage

Connect via SSH and start the Redis process:

    ssh -p 3022 root@localhost

Fix the file ownership:

    chown -R redis.redis /var/lib/redis

Restart Redis:

    killall redis-server
    /usr/bin/redis-server /etc/redis/redis.conf

