---
title: Android开发-gradlew、adb、keytool、jarsigner和fastboot命令总结
date: 2018-04-25 18:38:26
categories:
    - Android
tags:
---

## gradlew

* 查看项目依赖库依赖

`./gradlew app:dependencies`

* 导出项目依赖库依赖至某个文件

`./gradlew app:dependencies > xxxx.txt`

## adb

* 查询设备

`adb devices`

* 卸载程序

`adb uninstall <package>`

* 覆盖安装程序(出现包名相同时使用,否则报错)


`adb install -r <path>`

* 安装指定设备

`adb -s <device>  install -r <path>`

## keytool

* 查询证书指纹 (SHA1) - 输入密码

`keytool -list -keystore <storeFile>`

* 查询证书指纹 (SHA1)

`keytool -list -keystore <storeFile> -storepass <keyPassword>`

* 查询详细证书指纹 (SHA1)

`keytool -list -v -keystore <storeFile> -storepass <keyPassword>`

* 修改keystore密码：

`keytool -storepasswd -keystore [.keystore或.jks文件]`

* 修改keystore的alias：

`keytool -changealias -keystore [.keystore或.jks文件] -alias [要修改.keystore或.jks文件中别名别名] -destalias [新别名]`

* 修改alias的密码：

`keytool -keypasswd -keystore [.keystore或.jks文件] -alias [.keystore或.jks文件中别名]`

## jarsigner

* 查看apk包签名：

`jarsigner -verify -verbose -certs [.apk包]`

* 给apk包打签名

`jarsigner -verbose -keystore [.keystore或.jks文件绝对路径] -signedjar [签名以后的apk文件绝对路径] [要签名的apk文件绝对路径] [.keystore或.jks文件中的别名]`

## fastboot

* 查看手机进入fastboot模式连接设备

```
fastboot devices
```

* 以小米手机为例, 音量- 加 电源键 fastboot 模式

1. 如果需要擦除全部数据就把线刷包里的flash_all.sh拖进终端窗口

2. 如果需要擦除所有数据并保留SD卡和data分区的把flash_all_except_data_storage.sh拖进终端窗口

3. 如果需要擦除所有数据并保留SD卡数据的把flash_all_except_storage.sh拖进终端窗口



