FROM ubuntu

RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list \
    && sed -i 's/security.ubuntu.com/mirrors.aliyun.com/' /etc/apt/sources.list \
    && apt update \
    && apt install nginx -y

COPY nginx.conf /etc/nginx/
COPY sites/* /etc/nginx/sites-enabled/

# Clean
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm /var/log/lastlog /var/log/faillog

CMD [ "/usr/sbin/nginx" ]

EXPOSE 80 443