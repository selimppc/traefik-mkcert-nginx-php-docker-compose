# Traefik mkcert nginx php on docker-compose


# Goal 
    Run application using
    * traefik
    * mkcert
    * nginx
    * php8.1


## Pre Requisite 

    1. mkcert in local machine 
    ( Installation process are given here -> https://github.com/FiloSottile/mkcert )

## Installation

    Step 1: Create cert dir and install cert and key
    $ mkdir -p certs
    $ mkcert -cert-file certs/selim-reza-cert.pem -key-file certs/selim-reza-key.pem "selim-reza.test" "*.selim-reza.test"

## Set your local domain name in /ect/hosts

    127.0.0.1 selim-reza.test
    127.0.0.1 www.selim-reza.test


## Run docker-compose

    Run docker containers
    $ docker-compose up --build

## Urls:
    1. traefik dashboard: http://localhost:8080 
    2. http :: => http://selim-reza.test, http://www.selim-reza.test
    3. https :: => https://selim-reza.test, https://www.selim-reza.test


## Enjoy using SSL in local environment !


### Reference:
    1. https://doc.traefik.io/traefik/providers/docker/
    2. https://github.com/FiloSottile/mkcert