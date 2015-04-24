# Jury Summons

## local development with docker

### Install

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [boot2docker](http://boot2docker.io)
* [docker-compose](https://docs.docker.com/compose/)

### Setup

Create boot2docker VM:

```
$ boot2docker init
```

Start VM:

```
$ boot2docker start
```

Set up environment variables:

```
$ $(boot2docker shellinit)
```

Build the Docker images with docker-compose:

```
$ docker-compose build
```

### Start

All the bower/npm/django commands should be run in docker.
You can do that by using `docker compose run <service (e.g. django)> command`

* set up npm: `docker-compose run django npm install`
* set up bower: `docker-compose run django bower install --allow-root`
* set up django: `docker-compose run django python manage.py migrate`

Start it up:

```
$ docker-compose up
```

The app will be available on the boot2docker address (probably http://192.168.59.103:8000/), get it with `boot2docker ip`.
