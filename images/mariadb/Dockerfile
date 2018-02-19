FROM alpine:latest
LABEL maintainer="agoes <agoes.aswari@gmail.com>"

RUN apk add --update mysql mysql-client && \
    rm -f /var/cache/apk/*

COPY ./scripts/startup.sh /startup.sh
RUN chmod +x /startup.sh

CMD ["/startup.sh"]
