---
title: Cocoapods进阶-制作私有Cocoapods仓库。
date: 2017-03-05 15:51:52
categories:
    - Cocoapods
tags: 
    - Cocoapods
    - Mac
---
#### 1.克隆仓库到本地

```
git clone **********
```

#### 2.制作仓库索引文件 *.podspec*

```
pod spec create xxxxxxx
```

#### 3.编辑 podspec 文件

```
Pod::Spec.new do |s|

  s.name         = "LuKit"                                 // 仓库名字
  s.version      = "0.0.1"                                 // 仓库版本
  s.summary      = "A custom framework."                   // 仓库简介，搜索的关键词
  s.homepage     = "https://github.com/RamboLouis/LuKit"   // 主页地址
  s.license      = "MIT"                                   // 许可证
  # s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "RamboLu" => "coderambolu@gmail.com" } // 作者

  # s.platform     = :ios
  s.platform     = :ios, "9.0"                              // 仓库使用平台

  s.source       = { :git => "https://github.com/RamboLouis/LuKit.git", :tag => s.version }   // Git仓库地址
  
  s.source_files  = "Classes/*.swift"                       // 需要包含的源文件

  s.requires_arc = true                                     // 是否要求ARC

  # s.dependency "JSONKit", "~> 1.4"                        // 仓库中只用到的依赖库

  # s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }    // 指定只用swift 3.0版本

end
```

#### 4.打标签和推送版本
Ps: 命令行和SourceTree方式。

* 命令行方式

```
// 推送版本
git add -A && git commit -m "Release 1.0.0."
git push origin master

// 打标签
git tag '1.0.0'
git push --tags
```

* SourceTree方式

Ps: 推送版本。
![推送版本](http://upload-images.jianshu.io/upload_images/1666327-ead36b6f40d446e5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

Ps: 打标签。
![打标签](http://upload-images.jianshu.io/upload_images/1666327-515227195d9b6474.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### 5.验证.podspec
编辑好后最好先验证 .podspec 是否有有效

```
pod spec lint
```
Ps: 验证成功。
![验证通过](http://upload-images.jianshu.io/upload_images/1666327-11e504caa64c8969.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### 6.发布到CocoaPods
CocoaPods 现在使用Trunk 服务来发布自己的pod，所以需要
* 注册 pod账户

```
pod trunk register ******@***.com "****" 
```
* 查询注册信息

```
pod trunk me
```

* 推送到pod仓库

```
pod trunk push ******.podspec
```

Ps: 推送成功。
![推送成功](http://upload-images.jianshu.io/upload_images/1666327-0e8724c433605212.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### PS：出现问题
*  source_files找不到匹配文件

```
- ERROR | [iOS] file patterns: The `source_files` pattern did not match any file.
```

![source_files](http://upload-images.jianshu.io/upload_images/1666327-2c4d091300d8741b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
*建议：更改成Classes为根目录。*
![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1666327-34e0a400917c5f3c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

