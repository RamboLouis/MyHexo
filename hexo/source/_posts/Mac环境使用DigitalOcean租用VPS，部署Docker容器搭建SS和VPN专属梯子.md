---
title: Mac环境使用DigitalOcean租用VPS，部署Docker容器搭建SS和VPN专属梯子及Docker命令整理
date: 2017-02-21 21:52:55
categories:
    - Mac
    - Docker
tags:
    - Mac
    - 进阶
    - Docker
---
> 技术在于折腾。


### 一、DigitalOcean官网注册
https://cloud.digitalocean.com/
ps：注册费用$5，现在还送$10，一共$15,如果选用最便宜的服务器，可以使用3个月。当然,你也可以租用别家的VPS,适合自己就好.
![DigitalOcean官网](http://upload-images.jianshu.io/upload_images/1666327-c528d190dab09ee3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
### 二、创建虚拟服务器

![创建虚拟服务器](http://upload-images.jianshu.io/upload_images/1666327-e4559747abf846b0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 三、选择服务器

* 系统默认是乌班图，喜欢CoreOS、CentOS可以自行选择
* 价钱是每月的使用费以及设备的配置，如果平时上网话，5刀的足以
* 线路使用纽约、旧金山都可以，建议使用旧金山的
![选择服务器、使用金额及线路](http://upload-images.jianshu.io/upload_images/1666327-ea46899a01e5a007.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 四、选择连接方式，建议使用ssh连接(安全)

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

### 五、连接服务器及部署docker

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

#### 情况一: 提示需要更新。

![情况一:](http://upload-images.jianshu.io/upload_images/1666327-b84d7476382d8420.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
sudo apt-get update
```

#### 情况二: 找不到docker.io(Ubuntu里，Docker叫docker.io)，那就采用其它安装方式安装最新版本的Docker。

![情况二:](http://upload-images.jianshu.io/upload_images/1666327-22c83aefeb34c193.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
此命令会把Docker官方提供的最新版本的软件仓库替换Ubuntu的相应仓库。有一点要注意，采用这种方式进行安装，Docker的软件包名应该叫lxc-docker。此时，Docker命令的名字还是docker。而采用之前上面的安装方式，Docker命令的名字应该叫docker.io。

```
curl -sSL https://get.docker.com/ | sudo sh
```

再升级Docker

```
sudo apt-get update && sudo apt-get upgrade
```

### 六、部署连接方式仓库

#### 1、通过shadowsocks(ss)连接.

* 通过`DockerHub`搜索`docker-shadowsocks`

![选择docker-shadowsocks](http://upload-images.jianshu.io/upload_images/1666327-09de92b612a990c1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* DockerHub地址: https://hub.docker.com/r/oddrationale/docker-shadowsocks/

![](http://upload-images.jianshu.io/upload_images/1666327-5143e943e6b70624.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 从DockerHub上,拉取shadowsocks容器

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

对于为什么端口的设置，因为在启动镜像时，宿主机映射到docker容器上的端口必须要和shadowsocks上的设置的端口一致，换句话说就是冒号后边的端口号和最后的端口必须要保证一致。因为想要外界能够访问容器内部应用，就需要给从宿主机通过-p参数给宿主机和容器之间的端口形成一对一的映射来访问，而容器内则需要保证shadowsocks的端口和被映射端口一致即可。

* 查看docker 列表

ps：如果出现up就表明部署成功

```
docker ps
```

![看到docker容器的列表](http://upload-images.jianshu.io/upload_images/1666327-f5b68806ffe2040d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 下载ss客户端（shadowsocks），并添加。

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


#### 2、通过IPsec VPN连接.

* 通过`DockerHub`搜索`ipsec`

![](http://upload-images.jianshu.io/upload_images/1666327-19ff3dc0b32e0c8d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* DockerHub地址: https://hub.docker.com/r/hwdsl2/ipsec-vpn-server/

![](http://upload-images.jianshu.io/upload_images/1666327-6d5b4d24f88d9259.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 从DockerHub上,拉取shadowsocks容器

```
docker pull hwdsl2/ipsec-vpn-server
```

* 运行 IPsec VPN 服务器

```
sudo modprobe af_key
```

* 使用本镜像创建一个新的Docker容器 (env文件里面是指定变量的,需要自己单独创建)

Ps: 自己创建env文件并把自己定义的名字写在里面
　　VPN_USER: 用户名
　　VPN_PASSWORD: 用户密码

```
VPN_IPSEC_PSK=your_ipsec_pre_shared_key
VPN_USER=your_vpn_username
VPN_PASSWORD=your_vpn_password
```

Ps: 下面代码需要全部写在终端里面,当然也可以不加 `--env-file ./env \` 这一行,如果不写`VPN_USER` 会默认为 vpnuser，并且 `VPN_IPSEC_PSK` 和 `VPN_PASSWORD` 会被自动随机生成。
　　ipsec-vpn-server: 容器名字
　　./env: 变量名字路径
　　4500: 端口

```
docker run \
    --name ipsec-vpn-server \
    --env-file ./env \
    --restart=always \
    -p 500:500/udp \
    -p 4500:4500/udp \
    -v /lib/modules:/lib/modules:ro \
    -d --privileged \
    hwdsl2/ipsec-vpn-server

```

* 获取 ipsecVpn 登录信息

```
docker logs ipsec-vpn-server
```
```
docker logs xxxx: 容器名字
```
在命令输出中查找这些代码：
Connect to your new VPN with these details:
Server IP: your_vpn_server_ip
IPsec PSK: your_ipsec_pre_shared_key
Username: your_vpn_username
Password: your_vpn_password

![](http://upload-images.jianshu.io/upload_images/1666327-1512f01be6bbfcd3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


* 添加vpn地址

![](http://upload-images.jianshu.io/upload_images/1666327-9786adc38b361586.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![](http://upload-images.jianshu.io/upload_images/1666327-1d5ecc462a185c30.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 共享密钥填写IPsec PSKs

![](http://upload-images.jianshu.io/upload_images/1666327-fbe3204922e161e5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![](http://upload-images.jianshu.io/upload_images/1666327-62bc94a1c7bb8a7d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 七、Docker命令

* 查看安装容器

```
docker ps
```

* 暂停容器

```
docker stop xxx(容器名字)
```

* 删除容器
ps: 删除容器前需要暂停容器

```
docker rm xxx(容器名字)
```

* 启动容器

```
docker start xxx(容器名字)
```

* 拉取安装镜像仓库

```
docker pull xxx(镜像名字)
```

* 查看下载镜像仓库

```
docker images
```

* 删除下载镜像仓库

```
docker rmi xxx(镜像名字)
```



