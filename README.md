# traefik-mkcert-nginx-php-docker-compose
traefik-mkcert-nginx-php-docker-compose

# Goal 
    Run application using
    * traefik
    * mkcert
    * nginx
    * php8.1
    * others if needed

## Pre Requisite 

    1. mkcert in local machine 

## Installation

    Step 1: Create cert dir and install cert and key
    $ mkdir -p certs
    $ mkcert -cert-file certs/horloge-nl-cert.pem -key-file certs/horloge-nl-key.pem "horloge-nl.test" "*.horloge-nl.test"

## Run docker-compose

    Run docker containers
    $ docker-compose up --build

## Urls:
    1. traefik dashboard: http://localhost:8080 
    2. http :: => http://horloge-nl.test, http://www.horloge-nl.test
    3. https :: => https://horloge-nl.test, https://www.horloge-nl.test


## Enjoy using SSL in local environment !

