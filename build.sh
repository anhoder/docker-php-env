#!/bin/bash
set -e

echo "开始构建..."
echo "正在构建PHP-FPM..."
docker build -t alan/php-fpm php-fpm
docker create -p 9000:9000 --name alan_php-fpm -it -v `pwd`/www:/home/www -v `pwd`/logs/php-fpm:/var/log/php-fpm --network alan_php_env alan/php-fpm
echo "PHP-FPM构建完成."
echo "正在构建Nginx..."
docker build -t alan/nginx nginx
docker create -p 80:80 --name alan_nginx -it -v `pwd`/www:/home/www -v `pwd`/logs/nginx:/var/log/nginx --network alan_php_env alan/nginx
echo "Nginx构建完成."
echo "正在构建MySQL..."
docker build -t alan/mysql mysql
docker create -p 3306:3306 --name alan_mysql -it -v `pwd`/data:/var/lib/mysql --network alan_php_env alan/mysql
echo "MySQL构建完成."
echo "正在构建Redis..."
docker build -t alan/redis redis
docker create -p 6379:6379 --name alan_redis -it --network alan_php_env alan/redis
echo "Redis构建完成."
echo "正在创建网络..."
docker network create -d bridge alan_php_env
echo "网络创建完成."
echo "构建完成."
