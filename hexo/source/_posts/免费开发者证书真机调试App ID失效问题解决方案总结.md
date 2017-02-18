---
title: 免费开发者证书真机调试App ID失效问题:"Unable to add App ID because the '10' App ID limit in '7' days has been exceeded."解决方案总结。
date: 2016-04-29 18:43:55
tags: 随笔
---
# 前言
>今天(4月29日),笔者在做免费开发者证书真机调试的时候.发现如下问题:

## 问题:
### Unable to add App ID because the '10' App ID limit in '7' days has been exceeded.
![Unable to add App ID because the '10' App ID limit in '7' days has been exceeded.](http://upload-images.jianshu.io/upload_images/1666327-2dffb91f2aff0452.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
翻译如下:

![](http://upload-images.jianshu.io/upload_images/1666327-73b4cbda03a89376.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![翻译结果](http://upload-images.jianshu.io/upload_images/1666327-05ca85237d7e1ab3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
## 寻求解决问题过程:
第一次遇到,于是开始百度,发现百度没有这个问题.进行简要搜索时发现:

![Baidu搜索界面](http://upload-images.jianshu.io/upload_images/1666327-7b00acaa5f2f699c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

也是今天发布的寻找答案的,于是只能借助更强大的搜索:

![Google搜索界面](http://upload-images.jianshu.io/upload_images/1666327-156f98324f2ff99a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
在stack overflow中发现也有出现此问题:

![stack overflow](http://upload-images.jianshu.io/upload_images/1666327-873f95aed0d62dbe.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
链接如下:http://stackoverflow.com/questions/36923849/unable-to-add-app-id-because-the-10-app-id-limit-in-7-days-has-been-exceeded
发现这个问题是4月28日晚上18点提交的,具体美国时间比中国晚一天,也就是说也是今天才发现的这个问题,看到解决方案. 
然后再开始跟苹果技术支持邮件联系得出如下答案:
![Apple](http://upload-images.jianshu.io/upload_images/1666327-fcbd3399aa6ec871.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
于是得出结论.

## 问题原因:
这是苹果对`Bundle Identifier`进行了封锁.

推测:苹果于今天修改了规格,限制了开发者使用免证书的真机调试次数.

根据客服回电的答案得出,一个App ID,免证书真机调试只能进行10次,具体时间没有说明.

但是根据字面翻译意思在7天内只能创建10个项目文件(最主要的是`Bundle Identifier`名称),关于7天之外是否还能继续创建项目工程,笔者会持续更新.

---
5月5日测试,还是一直提示这个错误,持续猜想一个Apple ID,免证书真机调试只能进行10次.

---
5月10日测试,测试成功,7日内免证书真机调试10次可行.

---
5月12日测试,免证书真机调试生成描述文件后,`View Details`里面显示生成的`Bundle Identifier`更改成7天后过期,也就是说明一个Apple ID7天内可以只能生成10个`Bundle Identifier`.

这是苹果限制了`Bundle Identifier`的循环问题,减少了`Bundle Identifier`有效期时间,防止大量`Bundle Identifier`的堆积.

这样就可以及时去查看`Bundle Identifier`,等待`Bundle Identifier`到期后进行真机调试.

下图为显示`Bundle Identifier`的有效期(5月13日集中生成):

![最近集中生成的Bundle Identifier](http://upload-images.jianshu.io/upload_images/1666327-e44f5a50b16f8251.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

---
## 解决方案:
 1.更换成开发者账号的App ID.(呵呵,你懂得.)
 2.暂时解决方案,更换`Bundle Identifie`r,把此前真机调试项目工程的`Bundle Identifier`更换成现在的项目工程的`Bundle Identifier`,(亲测可用!!)
 3.重新创建项目工程的时候直接写成以前的真机测试通过的项目名字.(亲测可用!!)
  解决方案会持续更新.....

---
###### 友情提示: 
免费真机调试描述文件(`.mobileprovision`),有效期为90天,也就是说超过时间`Bundle Identifier`就不能用了.
```
5月12日更新 .mobileprovision 有效期为更改7天.
```
###### 解决办法:
1.$99刀的开发者Apple ID.
2.重新申请Apple ID,只申请1个描述文件(`.mobileprovision`),一直使用90天后再进行更换.(更换时间改为7天)

---
## 意外情况:
#### 一 .  更换Bundle Identifier还是没有解决: (亲测可用!!)
当出现更换这里的`Bundle Identifier`还是没有用的时候
![1](http://upload-images.jianshu.io/upload_images/1666327-dbee77d2ab0dadaf.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

请更换项目工程里面的`Bundle Identifier`:

1.右键项目工程文件:显示包内容(`Show Package Contents`)
![显示包内容(Show Package Contents)](http://upload-images.jianshu.io/upload_images/1666327-0797492fcde1c7c8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

2.打开第一个文件: `project.pbxproj`
![project.pbxproj](http://upload-images.jianshu.io/upload_images/1666327-187e8fae9c1114a6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

3.搜索: `PRODUCT_BUNDLE_IDENTIFIER` 进行替换 
![PRODUCT_BUNDLE_IDENTIFIER](http://upload-images.jianshu.io/upload_images/1666327-a161f5ca8a7510b9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
4.发现有2个`PRODUCT_BUNDLE_IDENTIFIER` ,替换后面的 >>".----"<<,更换成以前自己可以真机调试`Bundle Identifier`
![更换后面".----"](http://upload-images.jianshu.io/upload_images/1666327-d741ebcf100bf7d3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
这样也是可以的.
#### 二 .  忘记之前创建的Bundle Identifier
1.可以在偏好设置里面选择证书详情视图查找,`Preferences`->`Accounts`->`View Details`

![选择View Details](http://upload-images.jianshu.io/upload_images/1666327-e924878c202a049b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

2.根据排序,选择最近创建的`Bundle Identifier`
![查看最近的Bundle Identifier](http://upload-images.jianshu.io/upload_images/1666327-216d62c9b1f05ea2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

