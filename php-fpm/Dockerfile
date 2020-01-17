FROM php:7.2-fpm

LABEL maintainer="AlanAlbert" version="1.0" description="php-fpm(php 7.2)"

ENV TZ=Asia/Shanghai

COPY php-fpm.conf /usr/local/etc/

# 更新源
RUN  sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
    && apt-get clean \
    && apt-get update -yqq

# 安装intl依赖
RUN apt-get install -y zlib1g-dev libicu-dev g++ \
    && docker-php-ext-configure intl

# 安装gd依赖
RUN apt-get install -y zlib1g-dev libfreetype6 libpng-dev \
    && curl -O http://www.ijg.org/files/jpegsrc.v9c.tar.gz \
    && tar zxf jpegsrc.v9c.tar.gz \
    && cd jpeg-9c \
    && ./configure --prefix=/usr/local/jpeg \
    && make && make install \
    && rm -rf jpeg-9c

# 安装imagick依赖
RUN apt-get install -y libmagickwand-dev libmagickcore-dev imagemagick

RUN docker-php-ext-install pdo_mysql mysqli bcmath intl gd zip \
    && pecl install redis swoole imagick yaf

VOLUME /home/www /var/log/php-fpm /usr/local/etc/php /usr/local/etc/php-fpm.d
RUN useradd www \
    && chown -R www /home/www

WORKDIR /

CMD ["/usr/local/sbin/php-fpm"]

EXPOSE 9000 18306
