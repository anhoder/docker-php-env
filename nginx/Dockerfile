FROM nginx

LABEL maintainer="AlanAlbert" version="1.0" description="nginx"

ARG TIMEZONE

COPY nginx.conf /etc/nginx/

VOLUME /home/www /var/log/nginx /etc/nginx/conf.d

RUN useradd www \
    && chown -R www /home/www

RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
    && echo '${TIMEZONE}' >/etc/timezone

WORKDIR /home/www

CMD ["/usr/sbin/nginx"]

EXPOSE 80 443