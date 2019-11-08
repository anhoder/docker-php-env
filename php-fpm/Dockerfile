FROM php:7.2-fpm

LABEL maintainer="AlanAlbert" version="1.0" description="php-fpm(php 7.2)"

ENV TZ=Asia/Shanghai

COPY php-fpm.conf /usr/local/etc/

RUN docker-php-ext-install pdo_mysql mysqli \
    && pecl install redis swoole \
    && docker-php-ext-enable redis swoole

VOLUME /home/www /var/log/php-fpm /usr/local/etc/php /usr/local/etc/php-fpm.d
RUN useradd www \
    && chown -R www /home/www

WORKDIR /

CMD ["/usr/local/sbin/php-fpm"]

EXPOSE 9000 18306
