FROM mysql:5.7

LABEL maintainer="AlanAlbert" version="1.0" description="mysql"

ENV MYSQL_ALLOW_EMPTY_PASSWORD=true \
    MYSQL_ROOT_PASSWORD="" \
    TZ=Asia/Shanghai

COPY my.cnf /etc/mysql/

VOLUME /var/lib/mysql

EXPOSE 3306