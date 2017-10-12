---
title: ReactNative开发-iOS自动切换ip
date: 2017-07-04 16:33:59
categories:
  - ReactNative
tags: 
  - ReactNative
---

#### 添加运行脚本

![](http://upload-images.jianshu.io/upload_images/1666327-2b4442eb5515f4fb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![](http://upload-images.jianshu.io/upload_images/1666327-834b2cf62bbc38b6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 添加下面脚本代码

```
INFOPLIST="${TARGET_BUILD_DIR}/${INFOPLIST_PATH}"
echo "writing to $INFOPLIST"
PLISTCMD="Add :SERVER_IP string $(ifconfig | grep inet\ | tail -1 | cut -d " " -f 2)"
echo -n "$INFOPLIST" | xargs -0 /usr/libexec/PlistBuddy -c "$PLISTCMD" || true
PLISTCMD="Set :SERVER_IP $(ifconfig | grep inet\ | tail -1 | cut -d " " -f 2)"
echo -n "$INFOPLIST" | xargs -0 /usr/libexec/PlistBuddy -c "$PLISTCMD" || true
```

#### 编辑AppDelegate.m

* 在iOS的AppDelegate.m中替换为预处理器指令.

```
NSURL *jsCodeLocation;

#if DEBUG
#if TARGET_OS_SIMULATOR
  #warning "DEBUG SIMULATOR"
  jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.ios.bundle?platform=ios&dev=true"];
#else
  #warning "DEBUG DEVICE"
  NSString *serverIP = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"SERVER_IP"];
  NSString *jsCodeUrlString = [NSString stringWithFormat:@"http://%@:8081/index.ios.bundle?platform=ios&dev=true", serverIP];
  NSString *jsBundleUrlString = [jsCodeUrlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
  jsCodeLocation = [NSURL URLWithString:jsBundleUrlString];
#endif
#else
  #warning "PRODUCTION DEVICE"
  jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
```




参考文献:
https://github.com/facebook/react-native/issues/4245
http://moduscreate.com/automated-ip-configuration-for-react-native-development/

