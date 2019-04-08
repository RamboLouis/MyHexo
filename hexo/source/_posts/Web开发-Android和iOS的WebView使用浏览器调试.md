---
title: Web开发-Android和iOS浏览器调试手机web
date: 2018-03-27 18:19:10
categories:
  - Web
tags: 
  - Web
---

## Chrome 浏览器调试手机web
#### Android设备
*  浏览器输入 `chrome://inspect/#devices`.

*  然后手机设置成USB调试即可.

![](https://upload-images.jianshu.io/upload_images/1666327-8d4747a78e5b7a0e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### iOS设备
* 这个需要依靠第三方插件:[ios-webkit-debug-proxy](https://github.com/google/ios-webkit-debug-proxy)

* 浏览器输入 `chrome://inspect/#devices`

* 在`Discover network targets`里面增加`localhost:9000`

![](https://upload-images.jianshu.io/upload_images/1666327-29face9afcae2f54.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 运行`remotedebug_ios_webkit_adapter --port=9000`

## Safari 浏览器调试手机web(只能调试iOS设备)

* 开始开发菜单

![](https://upload-images.jianshu.io/upload_images/1666327-56e0bec271cfe717.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 根据对应的设备进行页面选择

![](https://upload-images.jianshu.io/upload_images/1666327-12997f69cfce6665.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

