FROM php:alpine
LABEL maintainer="agoes <agoes.aswari@gmail.com>"

# install extensions
RUN apk add --update --no-cache git nodejs-npm autoconf g++ make imap-dev openssl-dev libpng-dev zlib-dev && \
    docker-php-ext-install imap && \
    docker-php-ext-install gd && \
    docker-php-ext-install mysqli && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-install opcache && \
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
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer

ENV COMPOSER_ALLOW_SUPERUSER=1

WORKDIR /var/www
