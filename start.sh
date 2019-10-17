#!/bin/bash

echo "正在启动..."
docker start alan_php-fpm alan_nginx alan_mysql alan_redis
echo "启动完成."
