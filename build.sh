#!/bin/bash

docker build -t alan/php-fpm php-fpm
docker build -t alan/nginx nginx
docker build -t alan/mysql mysql
docker build -t alan/redis redis

docker network create -d bridge alan_php_env

docker create -p 9000:9000 --name alan_php-fpm -it -v `pwd`/www:/home/www -v `pwd`/logs/php-fpm:/var/log/php-fpm --network alan_php_env alan/php-fpm
docker create -p 80:80 --name alan_nginx -it -v `pwd`/www:/home/www -v `pwd`/logs/nginx:/var/log/nginx --network alan_php_env alan/nginx
docker create -p 3306:3306 --name alan_mysql -it -v `pwd`/data:/var/lib/mysql --network alan_php_env alan/mysql
docker create -p 6379:6379 --name alan_redis -it --network alan_php_env alan/redis