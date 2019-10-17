#!/bin/bash

echo "正在重启..."
docker restart alan_redis alan_mysql alan_nginx alan_php-fpm
echo "重启完成."