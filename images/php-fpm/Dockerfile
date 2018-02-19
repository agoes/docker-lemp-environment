FROM php:fpm-alpine
LABEL maintainer="agoes <agoes.aswari@gmail.com>"

# install extensions
RUN apk add --update --no-cache autoconf g++ make imap-dev openssl-dev libpng-dev && \
    docker-php-ext-install imap && \
    docker-php-ext-install gd && \
    docker-php-ext-install mysqli && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-install opcache && \
    docker-php-ext-configure imap --with-imap-ssl && \
    docker-php-ext-install imap && \
    pecl install redis && \
    docker-php-ext-enable redis

# cleanup installation files
RUN rm -rf /var/cache/apk/* && \
    rm -rf /tmp/* && \
    docker-php-source delete && \
    apk del autoconf g++ make 

COPY ./common.ini /usr/local/etc/php/conf.d

WORKDIR /var/www