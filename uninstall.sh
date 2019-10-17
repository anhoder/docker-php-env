#!/bin/bash

docker stop alan_redis alan_mysql alan_nginx alan_php-fpm
docker rm alan_redis alan_mysql alan_nginx alan_php-fpm
docker rmi alan/redis alan/mysql alan/nginx alan/php-fpm
docker network rm alan_php_env