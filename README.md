Google / Github authentication proxy
====================================

> Dockerized nodejs authentication proxy supporting google/github auth through the npm doorman-proxy package 

This docker container runs the [doorman-proxy](https://github.com/movableink/doorman) nodejs package as a supervisord process

## Features

- proxy runs as a supervisord process inside the container, so it's restarted automatically if the nginx server dies.
- proxy configuration fully overridable through environment variables, example `.env.example` file provided.
- secure web apps such as kibana, jenkins, phpmyadmin, dashboards without having to set up authentication in each of those apps.

## Configuration

This [configuration file](conf/doorman/conf.js) will be added to the image on build time. See the file for available 
parameters and descriptions. The doorman nodejs proxy listens on port `8085` inside the container.

### Runtime configuration parameters 

Almost all configuration options are settable through environment variables. A reference environment file is provided 
in [.env.example](./.env.example) that can be passed to the docker container at run time. A wrapper script that is automatically
executed at run time takes care of passing the docker container environment variables to the supervisor child process.

## Managing & running containers

### Build

`docker build -t doorman ./`

where -t is the tag name we give the container

### Run example

To run the container, execute

`docker run -d -p 8080:8085 --env-file PATH/TO/.env --name doorman doorman`

