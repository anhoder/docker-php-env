FROM mysql:5.7

LABEL maintainer="AlanAlbert" version="1.0" description="mysql"

ARG TIMEZONE
RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone

ENV MYSQL_ALLOW_EMPTY_PASSWORD=true \
    MYSQL_ROOT_PASSWORD="" \
    TZ=${TIMEZONE}

VOLUME /var/lib/mysql /etc/mysql

EXPOSE 3306