---
title: ReactNative学习-MAC集成环境
date: 2016-12-08 23:29:01
categories:
    - ReactNative
tags: 
  - ReactNative
---
>官网有更详细的集成步骤，这里只是根据个人需求写出简单实用的集成步骤。

## 1.配置环境

#### 按照HomeBrew

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

#### 安装Node.js
```
brew install node
```
#### 替换npm仓库镜像源
```
npm config set registry https://registry.npm.taobao.org --global

npm config set disturl https://npm.taobao.org/dist --global
```
#### 安装Watchman
Watchman是由Facebook提供的监视文件系统变更的工具。安装此工具可以提高开发时的性能

```
brew install watchman
```

## 2.安装工具包

#### 安装RN命令行工具包
```
npm install -g yarn react-native-cli
```

遇到**EACCES: permission denied**权限报错，需要修复/usr/local目录的所有权：

```
sudo chown -R `whoami` /usr/local
```


## 3.创建React Native测试项目
主要是需要 **cd** 到对应文件目录，再init， **”testProject“** 名字是自定义的

```
react-native init testProject
```
#### 如果报错, 无法创建. 尝试使用使用下面的命令更新brew及对应的工具
```
brew update

brew upgrade
```

#### 打开项目, 找到iOS文件夹中的工程文件运行即可

