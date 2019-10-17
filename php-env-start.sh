#!/bin/bash

docker build -t alan/php-fpm php-fpm
docker build -t alan/nginx nginx
docker build -t alan/mysql mysql

docker network create -d bridge alan_php_env

docker run -p 9000:9000 --name alan_php-fpm -itd -v `pwd`/www:/home/www -v `pwd`/logs/php-fpm:/var/log/php-fpm --network alan_php_env alan/php-fpm
docker run -p 80:80 --name alan_nginx -itd -v `pwd`/www:/home/www -v `pwd`/logs/nginx:/var/log/nginx --network alan_php_env alan/nginx
docker run -p 3306:3306 --name alan_mysql -itd -v `pwd`/data:/var/lib/mysql --network alan_php_env alan/mysql
