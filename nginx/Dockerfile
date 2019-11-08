FROM nginx

LABEL maintainer="AlanAlbert" version="1.0" description="nginx"

ENV TZ=Asia/Shanghai

COPY nginx.conf /etc/nginx/

VOLUME /home/www /var/log/nginx /etc/nginx/conf.d

RUN useradd www \
    && chown -R www /home/www

WORKDIR /home/www

CMD ["/usr/sbin/nginx"]

EXPOSE 80 443