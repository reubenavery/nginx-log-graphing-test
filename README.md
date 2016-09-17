# Reuben Avery's Nginx Log Grapher

[![Build Status](https://travis-ci.org/reubenavery/nginx-log-graphing-test.svg?branch=master)](https://travis-ci.org/reubenavery/nginx-log-graphing-test)

## Pre-requisites

To run locally, you will need to have either:
 - [docker](https://docs.docker.com/engine/installation/) and [docker-compose](https://docs.docker.com/compose/install/) or
 - [vagrant](http://vagrantup.com) along with the [docker-compose plugin](https://github.com/leighmcculloch/vagrant-docker-compose)

## Running locally:

1. Within this directory, either:

    - `docker-compose up` if running Docker or
    - `vagrant up` with Vagrant

2. Using a web browser, navigate to [http://localhost:8080/](http://localhost:8080/)
    
    - Note that the above may need to be tweaked depending on your host configuration.  
      For example, when using docker-machine, `docker-machine ip default`

```
    curl -v "http://`docker-machine ip default`:8080/index.php"
```
