FROM phusion/baseimage:0.11

LABEL maintainer="AlanAlbert" version="1.0" description="php8"

# 初始化

RUN DEBIAN_FRONTEND=noninteractive \
    && locale-gen en_US.UTF-8

ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LC_CTYPE=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV TERM xterm

# 更新镜像源
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
    && apt-get clean \
    && apt-get update -yqq \
    && apt-get -y install gcc pkg-config libxml2-dev libssl-dev libsqlite3-dev libcurl4-openssl-dev \
        libonig-dev libtidy-dev libpng-dev libzip-dev

# 编译PHP
RUN cd root \
    && curl -O https://www.php.net/distributions/php-8.0.0.tar.gz \
    && tar zvxf php-8.0.0.tar.gz \
    && cd php-8.0.0 \
    && ./configure --prefix=/usr/local/php8 --enable-fpm --enable-mysqlnd --enable-opcache --enable-pcntl \
        --enable-mbstring --enable-soap --with-zip --enable-calendar --enable-bcmath --enable-exif --enable-ftp \
        --enable-intl --with-mysqli --with-pdo-mysql --with-openssl --with-curl --enable-gd --with-gettext \
        --with-mhash --with-openssl --with-tidy \
    && make && make install \
    && cd ../ \
    && rm -rf php-8.0.0 php-8.0.0.tar.gz \
    && echo 'export PATH=$PATH:/usr/local/php8/bin/' >> /etc/bash.bashrc

CMD ["/usr/local/php8/bin/php", "-S", "127.0.0.1:8081", "./"]
