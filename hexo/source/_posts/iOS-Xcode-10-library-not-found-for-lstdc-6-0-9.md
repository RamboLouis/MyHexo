---
title: iOS-Xcode 10 library not found for -lstdc++.6.0.9
date: 2018-10-11 17:29:22
categories:
    - iOS开发
tags: 
    - iOS开发
    - iOS
---
> 下载最新的Xcode 10后出现以前的项目报错,提示找不到 `-lstdc++.6.0.9`  ,因为 libstdc ++在5年前被弃用了。导致 Apple 最新的Xcode也将它废弃不再支持它。   
[stackoverflow回答](https://stackoverflow.com/questions/50694822/xcode-10-ios-12-does-not-contain-libstdc6-0-9/52757858#52757858)

### 由于Apple在最新的Xcode 10.0中删除了libstdc ++，所以如果你想解决问题，可以尝试将以前Xcode 9 中的依赖库手动将文件复制到对应的lib中。

#### 1. 将Xcode 9中 `iPhoneOS` 和 `iPhoneSimulator` sdk中lib里面的 `libstdc ++.6.0.9.tbd` 和 `libstdc ++.6.tbd` 和`libstdc ++.tbd` 文件复制到Xcode10中：

* iPhoneOS.sdk
/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/lib/

* iPhoneSimulator.sdk
/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/usr/lib/

#### 2. 对于`/usr/lib/libstdc++.6.dylib: mach-o, but not built for iOS simulator`模拟器的问题,也可以将Xcode 9 中 `iOS.simruntime` 模拟器中lib里面的 `libstdc++.6.0.9.dylib` 和 `libstdc++.6.dylib` 和 `libstdc++.dylib` 文件复制到Xcode10中：

* iOS.simruntime 
/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/usr/lib