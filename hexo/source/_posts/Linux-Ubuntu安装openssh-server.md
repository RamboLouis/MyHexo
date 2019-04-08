---
title: Linux-Ubuntu安装openssh-server
date: 2018-04-08 14:41:17
categories:
  - Linux
tags: 
  - Linux
---

1.安装 openssh server

```
sudo apt-get install openssh-server
```

2.检查当前服务状态

```
sudo service ssh status

ps -s | grep ssh
ps -e | grep ssh
```