---
title: Liunx-Ubuntu删除和部署Nginx
date: 2018-05-26 21:06:49
categories:
    - Linux
tags: 
    - Linux
---

### 一、删除Nginx

* 删除`Nginx`及配置文件

```
sudo apt-get --purge remove nginx
```

* 自动移除全部不使用的软件包

```
sudo apt-get autoremove ngix
```

*  查看与`Nginx`相关的软件

```
dpkg --get-selections|grep nginx
```

* 继续删除与`Nginx`有关的软件


```
sudo apt-get --purge remove nginx-common
sudo apt-get --purge remove nginx-core
```

### 二、安装部署Nginx

#### 1、APT源安装(不推荐)
```
sudo apt-get install nginx
```


#### 2、源码安装

* 通过官方提供的下载包进行安装

官方地址: http://nginx.org/en/download.html

```
wget http://nginx.org/download/nginx-1.14.0.tar.gz
```

* 解压

```
tar -zxvf nginx-1.14.0.tar.gz
```

* 进入`nginx-1.14.0`进行配置

```
sudo ./configure 
```

* 安装

```
sudo make && sudo make install
```
### 三、启动、重启、停止Nginx

###### 启动

`Nginx`安装目录地址 -c `Nginx`指定配置文件地址

```
sudo /usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf
```

###### 重启

* 检验`Nginx`配置文件是否正确

```
// 进入sbin 文件
cd /usr/local/nginx/sbin
./nginx -t
```


