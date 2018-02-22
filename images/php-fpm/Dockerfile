FROM php:fpm-alpine
LABEL maintainer="agoes <agoes.aswari@gmail.com>"

ARG CONF_PATH=/usr/local/etc/php/conf.d
ARG XDEBUG_VER=2.6.0

# install extensions
RUN apk add --update --no-cache $PHPIZE_DEPS autoconf g++ make imap-dev openssl-dev libpng-dev && \
    docker-php-ext-install imap && \
    docker-php-ext-install gd && \
    docker-php-ext-install mysqli && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-install opcache && \
    docker-php-ext-configure imap --with-imap-ssl && \
    docker-php-ext-install imap && \
    pecl install redis xdebug-$XDEBUG_VER && \
    docker-php-ext-enable redis xdebug

COPY ./common.ini $CONF_PATH
ADD ./xdebug.ini $CONF_PATH
RUN echo "xdebug.remote_host="`/sbin/ip route|awk '/default/ { print $3 }'` >> $CONF_PATH/xdebug.ini

# cleanup installation files
RUN rm -rf /var/cache/apk/* && \
    rm -rf /tmp/* && \
    docker-php-source delete && \
    apk del autoconf g++ make 

WORKDIR /var/www