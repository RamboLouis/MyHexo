---
title: Flutter开发-Flutter的SDK安装与初尝
date: 2018-05-10 17:33:25
tags:
---

> 前言: `Flutter`是Google推出使用Dart语言开发的移动应用开发框架,在昨天的 I/O 大会上谷歌特意提到了`Flutter`,虽然很早就发布,但是一直没有去尝试,今天就提起兴趣来尝试一把.
> Flutter官方: [flutter.io](https://flutter.io)

### 一、获取Flutter SDK
ps: 具体安装官网提示也进行了提供

* 下载并解压以获取Flutter SDK

https://flutter.io/sdk-archive/

* 解压后得到 `flutter` SDK以及执行文件

![](https://upload-images.jianshu.io/upload_images/1666327-30d1bd3bb2273ca8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


### 二、设置Flutter SDK
* 设置文件存放路径, 以当前用户路径`~`为主, 把解压后的文件存放在用户路径`~`下.

![](https://upload-images.jianshu.io/upload_images/1666327-900e3173db6e6d29.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 在 `.bash_profile` 文件中添加SDK路径

```
export PATH=`pwd`/flutter/bin:$PATH
```

ps: 设置完了记得

```
source .bash_profile
```

* 查看 `flutter` 是否安装上

```
flutter
```

![](https://upload-images.jianshu.io/upload_images/1666327-90d7c1d8512cdd09.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 查看 `flutter` 需要的依赖关系

```
flutter doctor
```

![](https://upload-images.jianshu.io/upload_images/1666327-e20952ea871e6ebe.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 开始按照提示分别安装依赖,以及插件把

![](https://upload-images.jianshu.io/upload_images/1666327-5cb1c73da26447b5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 三、创建项目

* 以`Android Studio`为例

![](https://upload-images.jianshu.io/upload_images/1666327-f41aab7ae029ae07.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 值得注意的是这里提供了各个平台使用的原生语言,例如:iOS平台默认使用`OC`,可以选择使用`Swift`, Android平台默认是`Java`,可以选择`Kotlin`.
 
![](https://upload-images.jianshu.io/upload_images/1666327-69663399be66d485.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


* 最终项目结构目录

![](https://upload-images.jianshu.io/upload_images/1666327-78ba8e7a6a1d6180.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

