---
title: ReactNative开发-Xcode 10.2 运行`run-ios`找不到 iPhone 模拟器
date: 2019-03-25 18:32:35
categories:
  - ReactNative
tags: 
  - ReactNative
---

> 更新 Xcode 10.2 后运行 React Native 项目出现 `Could not find iPhone 6 simulator` 找不到 iPhone 模拟器

在项目中的
`~/node_modules/react-native/local-cli/runIOS/findMatchingSimulator.js`的文件里

找到对应的文件将
```
if (!version.startsWith('iOS') && !version.startsWith('tvOS'))
```

修改为

```
if (!version.startsWith('com.apple.CoreSimulator.SimRuntime.iOS') && !version.startsWith('com.apple.CoreSimulator.SimRuntime.tvOS'))
```