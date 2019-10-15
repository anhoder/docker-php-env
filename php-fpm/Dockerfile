FROM ubuntu

LABEL maintainer="AlanAlbert" version="1.0" description="php-fpm(php 7.2)"

RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list \
    && sed -i 's/security.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list \
    && apt update \
    && apt install php7.2-fpm -y \
    && mkdir -p /run/php/

COPY php.ini php-fpm.conf /etc/php/7.2/fpm/

# Clean
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm /var/log/lastlog /var/log/faillog

CMD [ "/usr/sbin/php-fpm7.2" ]

EXPOSE 9000
