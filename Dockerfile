FROM php:8.1.3-fpm-alpine3.15
LABEL maintainer="Selim Reza <selimppc@gmail.com>"

RUN apk update && apk add --no-cache \
    shadow \
    curl \
    composer \
    libwebp-tools \
    ghostscript \
    libgcc libstdc++ libx11 glib libxrender libxext libintl

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
        install-php-extensions intl sysvsem zip bcmath gd exif pcntl soap imagick

# Set www-data owner and group to default uid and gid
RUN adduser -D -h /home/php -u 1000 php && \
    /usr/sbin/usermod -u 1000 php && \
    /usr/sbin/usermod -s /bin/bash php && \
    /usr/sbin/usermod -m -d /home/php php && \
    chown -R php /var/log && \
    chmod -R g+w /var/log
