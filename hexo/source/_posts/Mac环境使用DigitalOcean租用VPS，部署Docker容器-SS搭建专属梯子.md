---
title: Mac环境使用DigitalOcean租用VPS，部署Docker容器+SS搭建专属梯子
date: 2017-02-21 21:52:55
categories:
    - Mac
tags:
    - Mac
    - 进阶
---
> 技术在于折腾。


一、DigitalOcean官网注册
https://cloud.digitalocean.com/
ps：注册费用$5，现在还送$10，一共$15,如果选用最便宜的服务器，可以使用3个月。
![DigitalOcean官网](http://upload-images.jianshu.io/upload_images/1666327-c528d190dab09ee3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
二、创建虚拟服务器

![创建虚拟服务器](http://upload-images.jianshu.io/upload_images/1666327-e4559747abf846b0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

三、选择服务器
* 系统默认是乌班图，喜欢CoreOS、CentOS可以自行选择
* 价钱是每月的使用费以及设备的配置，如果平时上网话，5刀的足以
* 线路使用纽约、旧金山都可以，建议使用旧金山的
![选择服务器、使用金额及线路](http://upload-images.jianshu.io/upload_images/1666327-ea46899a01e5a007.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
四、选择连接方式，建议使用ssh连接(安全)

![选择设置ssh](http://upload-images.jianshu.io/upload_images/1666327-579a658a82cf16f0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![配置ssh](http://upload-images.jianshu.io/upload_images/1666327-d8cf08dd3ed44f8a.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
ps：关于配置ssh可以在settings里面找到。

* 生成ssh，可以参考github官方生成文档：https://help.github.com/articles/connecting-to-github-with-ssh/

* 查看ssh,可以通过查找文件输入 *~/.ssh*的方式

具体查看公钥

```
cat ~/.ssh/id_rsa.pub 
```

![查看ssh](http://upload-images.jianshu.io/upload_images/1666327-ad7c75321bc57179.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 再把查看的公钥粘贴至对话框

![粘贴ssh](http://upload-images.jianshu.io/upload_images/1666327-faa39f8b0a849441.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

四、连接服务器
![虚拟服务器IP](http://upload-images.jianshu.io/upload_images/1666327-d50805f02617e517.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 连接服务器，生成的IP地址

```
ssh root@xxx.xxx.xxx.xxx
```

![连接服务器](http://upload-images.jianshu.io/upload_images/1666327-804ba850fb461acc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


* 部署docker容器

```
sudo apt-get install docker.io
```
ps：如果出现部署不上，出现如下情况，执行下面命令。

情况一:
![情况一:](http://upload-images.jianshu.io/upload_images/1666327-b84d7476382d8420.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
sudo apt-get update
```

情况二: 找不到docker.io(Ubuntu里，Docker叫docker.io)，那就采用其它安装方式安装最新版本的Docker。
![情况二:](http://upload-images.jianshu.io/upload_images/1666327-22c83aefeb34c193.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
此命令会把Docker官方提供的最新版本的软件仓库替换Ubuntu的相应仓库。有一点要注意，采用这种方式进行安装，Docker的软件包名应该叫lxc-docker。此时，Docker命令的名字还是docker。而采用之前上面的安装方式，Docker命令的名字应该叫docker.io。

```
curl -sSL https://get.docker.com/ | sudo sh
```

再升级Docker

```
sudo apt-get update && sudo apt-get upgrade
```

* 拉取shadowsocks 仓库

```
docker pull oddrationale/docker-shadowsocks
```

* 设置仓库的端口、密码、及加密方式
ps：
xxxxxx 是你要设置的密码
1984 是你的端口号

```
docker run -d -p 1984:1984 oddrationale/docker-shadowsocks -s 0.0.0.0 -p 1984 -k xxxxxx -m aes-256-cfb
```

* 查看docker 列表
ps：如果出现up就表明部署成功

```
docker ps
```

![看到docker容器的列表](http://upload-images.jianshu.io/upload_images/1666327-f5b68806ffe2040d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

五、下载ss客户端（shadowsocks），并添加。
GitHub官方提供下载dmg：
https://github.com/shadowsocks/shadowsocks-iOS/releases

![shadowsocks下载](http://upload-images.jianshu.io/upload_images/1666327-a926bcfd857363fe.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 安装后配置服务器，打开服务器设置，并添加服务器。

![添加服务器](http://upload-images.jianshu.io/upload_images/1666327-d24a0c10167502ac.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 把创建的服务器Ip、端口号及创建的加密方式密码填入即可

ps：
默认端口号填写的*1984*
加密方式选择*aes-256-cfb*
![设定服务器](http://upload-images.jianshu.io/upload_images/1666327-a5d24645b774e6fe.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


