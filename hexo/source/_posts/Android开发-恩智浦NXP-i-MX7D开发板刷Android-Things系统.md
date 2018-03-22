---
title: Android开发-恩智浦NXP i.MX7D开发板刷Android Things系统心得
date: 2018-02-07 14:56:41
categories:
    - Android
---
>前言:前段时间参加谷歌物联网创新沙龙,有幸抽奖得到一套恩智浦NXP i.MX7D的开发套件,和去年12月的GDD上得到的一样,近日有时间了,可以搞一搞了,自己根据官方的文档,下面分享下刷机心得.

## 组装套件
https://developer.android.google.cn/things/hardware/imx7d-kit.html
* 根据官方文档步骤可以进行组装,同时还有树莓派3的操作步骤.
![](http://upload-images.jianshu.io/upload_images/1666327-5fcfb0844d9606b1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 最后的成品就是这个样子,出现NXP的logo.(没有安装相机模块)
![](http://upload-images.jianshu.io/upload_images/1666327-2fe4f767e8e75a83.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 刷机开始
##### 一键式刷机
https://developer.android.com/things/hardware/imx7d.html
* 还是根据官方文档的提示,在最后在步骤二的时候提示从Android Things Console下载Android Things Setup Utility.

![](http://upload-images.jianshu.io/upload_images/1666327-0fe76c03b51e87d0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![](http://upload-images.jianshu.io/upload_images/1666327-00c2f580a2eb6ed6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 下载Android Things Setup Utility.(如果打不开可能被墙了 -.-)
https://partner.android.com/things/console/u/0/#/tools
ps: 没关系,我在github传了一份,可以下载对应系统版本.
https://github.com/RamboLouis/AndroidTestProject/tree/master/AndroidThings/android_things_setup_utility
同时,也可以自己去租VPS.(macOS系统的 -.-)
[Mac环境使用DigitalOcean租用VPS](http://www.rambolu.top/2017/02/21/Mac%E7%8E%AF%E5%A2%83%E4%BD%BF%E7%94%A8DigitalOcean%E7%A7%9F%E7%94%A8VPS%EF%BC%8C%E9%83%A8%E7%BD%B2Docker%E5%AE%B9%E5%99%A8%E6%90%AD%E5%BB%BASS%E5%92%8CVPN%E4%B8%93%E5%B1%9E%E6%A2%AF%E5%AD%90/)
![Setup Utility](http://upload-images.jianshu.io/upload_images/1666327-30caa3d67de1e7d6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 下载完成后,开始选择对应系统的安装文件,通过命令行运行.
![](http://upload-images.jianshu.io/upload_images/1666327-0388143d2110a812.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 命令行运行.
遇到第一个选项:
选择第一个安装Android设备,并可选择设置Wi-Fi.
因为第二个是在现有的系统上设置wifi的.
第二个选项:
根据自己的开发板进行选择.
第三个选项:
根据个人喜好进行选择图形化界面.
直到提示开始开始下载Android Things
![下载Android Things](http://upload-images.jianshu.io/upload_images/1666327-f8783c252e1422dd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 安装结束,确定键继续.
![安装结束,确定键继续](http://upload-images.jianshu.io/upload_images/1666327-3594b0929f1456ad.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 设置并输入自己所在网络wifi名字和密码
![](http://upload-images.jianshu.io/upload_images/1666327-7246e19a774219f8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 点击确定退出安装.
![](http://upload-images.jianshu.io/upload_images/1666327-0b8a2fe8cf65c6a4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### 手动刷机
https://developer.android.google.cn/things/hardware/fastboot.html
![](http://upload-images.jianshu.io/upload_images/1666327-edced73d0550387e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 需要在[Android Things Console](https://partner.android.com/things/console),创建项目并下载.(同样,如果打不开那就是被墙了 -.-)
![](http://upload-images.jianshu.io/upload_images/1666327-9f76d2ba873b8dab.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 按照官方文档说的,执行`flash-all.sh`文件
![flash-all.sh](http://upload-images.jianshu.io/upload_images/1666327-b8ce261d78ab5a83.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 成功 **Successfully flashed your imx7d.**
![](http://upload-images.jianshu.io/upload_images/1666327-2171e9b64fa5068a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 查找并运行
* 输入`adb devices`发现可以找到设备.
![输入adb devices](http://upload-images.jianshu.io/upload_images/1666327-b11bca69e053cf7d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 通过自建项目或者官网下载demo,可以运行设备了.
建议选择26以上的
![](http://upload-images.jianshu.io/upload_images/1666327-82d4d447ef2b32d1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![](http://upload-images.jianshu.io/upload_images/1666327-917aa5236b3871d1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 结束.
* Holle world出现.
![](http://upload-images.jianshu.io/upload_images/1666327-3666fdcc67b501a7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

ps:
开发套件教程:
https://developer.android.com/things/get-started/kits.html
案例:
https://developer.android.com/things/sdk/samples.html
Google社区:
https://plus.google.com/communities/107507328426910012281

