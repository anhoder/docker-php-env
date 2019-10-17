#!/bin/bash

echo "正在卸载..."
echo "正在停止运行容器..."
docker stop alan_redis alan_mysql alan_nginx alan_php-fpm
echo "已停止."
echo "正在删除容器..."
docker rm alan_redis alan_mysql alan_nginx alan_php-fpm
echo "已删除容器."
echo "正在删除镜像..."
docker rmi alan/redis alan/mysql alan/nginx alan/php-fpm
echo "已删除镜像."
echo "正在删除网络..."
docker network rm alan_php_env
echo "已删除网络."
echo "卸载完成."