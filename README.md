# alan-php-env

## Introduction

该项目是使用Docker搭建的PHP开发环境，包括以下几个容器：

* PHP-FPM 7.2 (swoole、redis、pdo_mysql、mysqli)
* Nginx
* MySQL 5.7
* Redis

## Usage

先构建，后运行

### 构建

1、Clone代码到本地

```shell script
git clone https://github.com/AlanAlbert/alan-php-env.git
```

2、进入项目目录，并执行php-env-start.sh文件

```shell script
cd alan-php-env && chmod +x *.sh && build.sh
```

### 运行

```shell script
./start.sh
```

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