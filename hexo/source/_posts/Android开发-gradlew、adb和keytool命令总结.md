---
title: Android开发-gradlew、adb和keytool命令总结
date: 2018-04-25 18:38:26
categories:
    - Android
tags:
---

### gradlew

* 查看项目依赖库依赖

`./gradlew app:dependencies`

* 导出项目依赖库依赖至某个文件

`./gradlew app:dependencies > xxxx.txt`

### adb

* 查询设备

`adb devices`

* 卸载程序

`adb uninstall <package>`

* 覆盖安装程序(出现包名相同时使用,否则报错)


`adb install -r <path>`

* 安装指定设备

`adb -s <device>  install -r <path>`

### keytool

* 查询证书指纹 (SHA1) - 输入密码

`keytool -list -keystore <storeFile>`

* 查询证书指纹 (SHA1)

`keytool -list -keystore <storeFile> -storepass <keyPassword>`

* 查询详细证书指纹 (SHA1)

`keytool -list -v -keystore <storeFile> -storepass <keyPassword>`

