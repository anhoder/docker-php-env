FROM keinos/php8-jit:latest

LABEL maintainer="AlanAlbert" version="1.0" description="php8"

USER root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk --no-cache --update add \
        bash \
        git \
        autoconf \
        build-base \
        wget \
        zip unzip

CMD ["php", "-S", "127.0.0.1:8080", "./"]