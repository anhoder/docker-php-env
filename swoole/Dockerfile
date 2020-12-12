FROM php:7.2

LABEL maintainer="alan <anhoder@88.com>" version="1.0"

# --build-arg timezone=Asia/Shanghai
ARG TIMEZONE=Asia/Shanghai

# swoole version
ARG SWOOLE_VERSION=4.4.18

ENV WORK_USER=www-data

RUN set -eux \
    && sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
            curl \
            libmemcached-dev \
            libz-dev \
            libpq-dev \
            libjpeg-dev \
            libpng-dev \
            libfreetype6-dev \
            libssl-dev \
            libnghttp2-dev \
            libmcrypt-dev \
            supervisor \
            procps \
            unzip \
            git \
    # cleanup
    && rm -rf /var/lib/apt/lists/*

RUN set -eux \
    && pecl channel-update pecl.php.net \
    # Install the PHP extention
    && docker-php-ext-install mbstring pdo pdo_mysql pdo_pgsql sockets bcmath \
    # Install the PHP gd library
    && docker-php-ext-configure gd \
            --with-jpeg-dir=/usr/lib \
            --with-freetype-dir=/usr/include/freetype2 \
    && docker-php-ext-install gd \
    && php -r 'var_dump(gd_info());'

# Install composer
RUN curl -O https://mirrors.aliyun.com/composer/composer.phar \
    && chmod +x composer.phar \
    && mv composer.phar /usr/local/bin/composer \
    && composer self-update --clean-backups \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
# Install swoole extension
    && curl -o swoole.tar.gz http://pecl.php.net/get/swoole-${SWOOLE_VERSION}.tgz \
    && mkdir -p swoole \
    && tar -xf swoole.tar.gz -C swoole --strip-components=1 \
    && rm swoole.tar.gz \
    && ( \
        cd swoole \
        && phpize \
        && ./configure --enable-mysqlnd --enable-sockets --enable-openssl --enable-http2 \
        && make -j$(nproc) \
        && make install \
    ) \
    && rm -r swoole \
    && docker-php-ext-enable swoole \
# Install redis extension
    && pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  docker-php-ext-enable redis \
# Install mongodb extension
    && pecl install mongodb \
    && docker-php-ext-enable mongodb \
# Clear dev deps
    && apt-get clean \
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
# Timezone
    && cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
    && echo "${TIMEZONE}" > /etc/timezone \
    && echo "[Date]\ndate.timezone=${TIMEZONE}" > /usr/local/etc/php/conf.d/timezone.ini

COPY supervisord.conf /etc/supervisord.conf

EXPOSE 18306 18307 18308 19001

CMD ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisord.conf"]
