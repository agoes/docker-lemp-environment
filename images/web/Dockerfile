FROM nginx:1.15-alpine

LABEL maintainer="agoes <agoes.aswari@gmail.com>"

RUN sed -ie 's/include\ \/etc\/nginx\/conf.d\/\*.conf;/include\ \/etc\/nginx\/conf.d\/\*.conf;\n\ \ \ \ include\ \/etc\/nginx\/sites-enabled\/\*.conf;/g' /etc/nginx/nginx.conf && \
    mkdir /etc/nginx/sites-enabled

WORKDIR /var/www
