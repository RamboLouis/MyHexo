---
title: Go学习-Mac环境配置Golang开发环境及学习项目.
date: 2017-03-25 11:41:58
categories:
    - Go
tags: 
    - Go
    - Mac
---

## 一、下载安装Golang的SDK.
* Go下载官网:
https://golang.org/dl/

## 二、配置环境变量
* 默认安装目录 /usr/local/go 目录
* 编辑环境变量

```
vi ~/.bash_profile
```

* GOPATH是项目目录，根据自己的项目设置.
* GOPATH如果有多个目录，用冒号`: `分割

```
export GOROOT=/usr/local/go
export GOBIN=$GOROOT/bin
export GOARCH=amd64
export GOOS=darwin
export GOPATH=/Users/用户名/Desktop/xxxx1:/Users/用户名/Desktop/xxxx2
```

* 编译生效

```
source ~/.bash_profile
```

* 查看Go环境变量

```
go env
```

## 三、使用Gogland或IDEA安装Go插件
GOPATH下需要建立3个目录： 
bin 存储编译后的可执行文件； 
pkg 存放编译后生成的包文件； 
src 存放项目的源码；

## 四、Golang项目
一个golang电子书介绍如何与golang建立一个网站:
https://github.com/astaxie/build-web-application-with-golang
高性能Web框架:
https://github.com/astaxie/beego


