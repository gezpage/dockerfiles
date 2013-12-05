# Ruby on Rails dockerfile

This will create a dev environment to run a ROR project with the
following toolset:

* Ruby Version Manager (RVM)
* RubyGems
* Ruby 1.9.3
* Rails 4.0.2
* SSH
* Git
* Vim

## Ports

* SSH  7022
* HTTP 7080

## Build steps

Build the image:

    docker build -t gezpage/rails .

Run a container binding a mount point to your local project data:

    docker run -d -name rorproject -p 7022:22 -p 7080:80 -v /path/to/project:/var/www gezpage/rails

Connect via SSH:

    ssh root@localhost -p 7022

## Usage

You can now enter http://localhost:7080 in your web browser to access
the website, and use the project folder to edit files on your local
machine.
