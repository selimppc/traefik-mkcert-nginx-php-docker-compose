FROM php:8.1.3-fpm-alpine3.15
LABEL maintainer="Selim Reza <selimppc@gmail.com>"

RUN apk update && apk add --no-cache \
    shadow \
    curl \
    tini \
    supervisor \
    jpegoptim \
    optipng \
    pngquant \
    gifsicle \
    composer \
    libwebp-tools \
    ghostscript \
    libgcc libstdc++ libx11 glib libxrender libxext libintl \
    ttf-dejavu ttf-droid ttf-freefont ttf-liberation

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
        install-php-extensions pdo_mysql opcache mcrypt redis intl sysvsem zip bcmath gd exif pcntl soap imagick

# On alpine static compiled patched qt headless wkhtmltopdf (46.8 MB).
# Compilation took place in Travis CI with auto push to Docker Hub see
# BUILD_LOG env. Checksum is printed in line 13685.
COPY --from=madnight/docker-alpine-wkhtmltopdf:0.12.5-alpine3.13 \
    /bin/wkhtmltopdf /bin/wkhtmltopdf

#Set www-data owner and group to default uid and gid
RUN adduser -D -h /home/php -u 1000 php && \
    /usr/sbin/usermod -u 1000 php && \
    /usr/sbin/usermod -s /bin/bash php && \
    /usr/sbin/usermod -m -d /home/php php && \
    chown -R php /var/log && \
    chmod -R g+w /var/log
