---
title: Mac学习-系统Automator将显示与隐藏文件功能添加到Finder服务中.
date: 2016-04-13 15:39:08
categories:
    - Mac
tags: 
    - Mac
---
#### 1 .启动`Automator`
![启动`Automator`](http://upload-images.jianshu.io/upload_images/1666327-77cefcc64f7f6d2a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


#### 2.选择新建文稿
![选择新建文稿](http://upload-images.jianshu.io/upload_images/1666327-83066adb002f204d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



#### 3.选择服务
![选择服务](http://upload-images.jianshu.io/upload_images/1666327-e44fd1cab037ed29.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


#### 4.[1] 搜索 `运行` -> 选择 `运行shell脚本` -> [2] 设置 "服务"收到 `没有输入`和 位于`Finder.app`  -> [3] 添加如下命令

```
STATUS=`defaults read com.apple.finder AppleShowAllFiles`
if [ $STATUS == YES ];
then 
    defaults write com.apple.finder AppleShowAllFiles NO
else
    defaults write com.apple.finder AppleShowAllFiles YES
fi
killall Finder

```

![搜索结果](http://upload-images.jianshu.io/upload_images/1666327-56c393dc678a174d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


#### 5.按 Commond + S  保存,并写入名字


![保存](http://upload-images.jianshu.io/upload_images/1666327-39b88c33cec3dcd0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


#### 6.在系统偏好设置中,选择键盘
![选择键盘](http://upload-images.jianshu.io/upload_images/1666327-a95ad203ea8ebda8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


#### 7.设置键盘找到 显示与隐藏文件开关勾选
![显示与隐藏文件开关](http://upload-images.jianshu.io/upload_images/1666327-e0cecc8e1bd66f81.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


#### 8.Finder 的菜单栏中选择 -> 服务
![选择 -> 服务](http://upload-images.jianshu.io/upload_images/1666327-6c0568446a3347e7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

