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

2. Using a web browser, navigate to [http://localhost:5601/](http://localhost:5601/)
    
    - Note that the above may need to be tweaked depending on your host configuration.  
      For example, when using docker-machine, you will need to access this via `docker-machine ip default`

3. You should see the Kibana Dashboard with results similar to:

![screenshot](https://www.evernote.com/l/ANPQ6BreX95AJqkSocHO5QpF4Y9zJVlnLgcB/image.png "Kibana Screenshot")
