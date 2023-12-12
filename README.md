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
    $ mkcert -cert-file certs/selim-reza-cert.pem -key-file certs/selim-reza-key.pem "selim-reza.test" "*.selim-reza.test"

## Run docker-compose

    Run docker containers
    $ docker-compose up --build

## Urls:
    1. traefik dashboard: http://localhost:8080 
    2. http :: => http://selim-reza.test, http://www.selim-reza.test
    3. https :: => https://selim-reza.test, https://www.selim-reza.test


## Enjoy using SSL in local environment !

