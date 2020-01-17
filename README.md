# alan-php-env

## Introduction

该项目是使用Docker搭建的PHP开发环境，包括以下几个容器：

* PHP-FPM 7.2 (swoole、redis、pdo_mysql、mysqli)
* Nginx
* MySQL 5.7
* Redis

## Usage（使用docker-compose，推荐）

```sh
# 全部启动
docker-compose up -d 

# 然后打开浏览器，访问http://localhost:8081
# NGINX默认端口为8081，可以再.env中进行修改



# 单独启动某个容器
docker-compose up -d nginx

docker-compose up -d mysql

# ...
```

**docker-compose的配置文件位于.env，可以根据需要进行修改**

## Usage（使用脚本文件）

先构建，后运行

### 构建

1、Clone代码到本地

```sh
git clone https://github.com/AlanAlbert/alan-php-env.git
```

2、进入项目目录，并执行php-env-start.sh文件

```sh
cd docker-php-env && chmod +x *.sh && build.sh
```

### 运行

```shell script
./start.sh
```

打开浏览器，访问[http://localhost](http://localhost)、[http://localhost/phpinfo.php](http://localhost/phpinfo.php)，若能成功访问页面，表示运行成功！

## Other

### 停止

```shell script
./stop.sh
```

### 重启

```shell script
./restart.sh
```

### 卸载

```shell script
./uninstall.sh
```
