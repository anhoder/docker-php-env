#!/bin/bash

echo "正在停止..."
docker stop alan_redis alan_mysql alan_nginx alan_php-fpm
echo "已停止."