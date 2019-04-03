FROM php:alpine
LABEL maintainer="agoes <agoes.aswari@gmail.com>"

# install extensions
RUN apk add --update --no-cache git nodejs-npm autoconf g++ make imap-dev openssl-dev libpng-dev libzip-dev zip && \
    docker-php-ext-install imap && \
    docker-php-ext-install gd && \
    docker-php-ext-install mysqli && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-install opcache && \
    docker-php-ext-configure zip --with-libzlib && \
    docker-php-ext-install zip && \
    docker-php-ext-configure imap --with-imap-ssl && \
    docker-php-ext-install imap && \
    pecl install redis && \
    docker-php-ext-enable redis

# cleanup installation files
RUN apk del autoconf g++ make && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/* && \
    docker-php-source delete

# install composer
COPY ./scripts/install-composer.sh /tmp/install-composer.sh
RUN chmod +x /tmp/install-composer.sh && /tmp/install-composer.sh

RUN mkdir /.composer && chmod -R 777 /.composer

WORKDIR /var/www
