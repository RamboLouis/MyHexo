---
title: WKWebView替换UIWebView
date: 2016-07-01 18:42:07
categories:
    - iOS
tags: iOS

---
##  前言
>目前,WKWebView只在iOS8后才能用,但是大多数App需要支持iOS7以上的版本，所以兼容性方案就是,iOS7下用UIWebView，iOS8后WKWebView.

## 一、介绍

#### 使用到的类
* WKBackForwardList: 

之前访问过的 web 页面的列表，可以通过后退和前进动作来访问到。

* WKBackForwardListItem: 

WKWebView中后退列表里的某一个网页。

* WKFrameInfo:

包含一个网页的布局信息。

* WKNavigation:

包含一个网页的加载进度信息。

* WKNavigationAction:

包含可能让网页导航变化的信息，用于判断是否做出导航变化。

* WKNavigationResponse: 

包含可能让网页导航变化的返回内容信息，用于判断是否做出导航变化。

* WKPreferences:

WKWebView的偏好设置。

* WKProcessPool: 

WKWebView内容加载缓存池。

* WKUserContentController: 

提供使用 JavaScript post 信息和注射 script 的方法。

* WKScriptMessage: 

包含网页发出的信息。

* WKUserScript:

网页接受的用户脚本。

* WKWebViewConfiguration: 

初始化WKWebView的设置。

* WKWindowFeatures:

指定加载新网页时的窗口属性。

#### 提供的协议

* WKNavigationDelegate: 

提供了追踪主窗口网页加载过程和判断主窗口和子窗口是否进行页面加载新页面的相关方法。

* WKUIDelegate: 

提供用原生控件显示网页的方法回调。

* WKScriptMessageHandler: 

提供从网页中收消息的回调方法。

