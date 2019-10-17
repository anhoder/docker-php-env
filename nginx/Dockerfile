FROM nginx

LABEL maintainer="AlanAlbert" version="1.0" description="nginx"

ENV TZ=Asia/Shanghai

COPY nginx.conf /etc/nginx/
COPY sites/*.conf /etc/nginx/conf.d/

VOLUME /home/www /var/log/nginx

RUN useradd www \
    && chown -R www /home/www

WORKDIR /home/www

CMD ["/usr/sbin/nginx"]

EXPOSE 80 443