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

![](https://raw.githubusercontent.com/RamboLouis/MyHexo/master/hexo-source/images/2018-03-27/01.png)

#### iOS设备
* 这个需要依靠第三方插件:[ios-webkit-debug-proxy](https://github.com/google/ios-webkit-debug-proxy)

* 浏览器输入 `chrome://inspect/#devices`

* 在`Discover network targets`里面增加`localhost:9000`

![](https://raw.githubusercontent.com/RamboLouis/MyHexo/master/hexo-source/images/2018-03-27/02.png)

* 运行`remotedebug_ios_webkit_adapter --port=9000`

## Safari 浏览器调试手机web(只能调试iOS设备)

* 开始开发菜单

![](https://raw.githubusercontent.com/RamboLouis/MyHexo/master/hexo-source/images/2018-03-27/03.png)

* 根据对应的设备进行页面选择

![](https://raw.githubusercontent.com/RamboLouis/MyHexo/master/hexo-source/images/2018-03-27/04.png)

