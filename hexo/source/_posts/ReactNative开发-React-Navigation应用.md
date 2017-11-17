---
title: ReactNative开发-React Navigation应用
date: 2017-06-25 17:14:48
categories:
  - ReactNative
tags: 
  - ReactNative
---

> 前言:
> 目前开始对项目进行重构了,看了一月的安卓重新开始对RN中旧的和所用的框架进行重新梳理.
> 
> 从0.44版本开始,Navigator被从React Native的核心组件库中剥离到了一个名为`react-native-deprecated-custom-components`的单独模块中.如果你需要继续使用Navigator,则需要先`npm i -S react-native-deprecated-custom-components`，然后从这个模块中import，即`import { Navigator } from 'react-native-deprecated-custom-components'`.
> 
> 不过在0.45版本之后官方主推的方案是一个单独的导航库React Navigation.
> 
> 对于导航路由来说:
> 在iOS端有`UINavigationController`控件,其采用的是"栈"的方式管理子控件,对新进来的子控制器进行压栈(push)处理,同时也用来控制界面跳转.
> 而安卓端,由于框架设计思路不同,没有导航控件一说,其跳转界面通过需要通过开启活动(Activity),方可跳转另一界面.
> 但是对于ReactNative来说,新的导航框架(React Navigation),整体设计思路更偏向于iOS,对于局部细节,例如需要事先声明被跳转模块等.也有安卓的影子.
> 
> 官方文档: https://reactnavigation.org/docs/intro/
> 
> 下面就结合React Navigation集成到项目进行练习.


### 一、在项目中安装 React Navigation

```
    npm install --save react-navigation
```
### 二、React Navigation框架里面有什么

* StackNavigator: 可是实现屏幕上方导航栏,类似iOS中的`UINavigationController`.

* TabNavigator: 可是实现屏幕底部多个选项,类似iOS中的`UITabBarController`,但是同时也可以通过修改属性把`TabNavigator`放在顶部.

### 三、什么是Stack Navigation
Stack Navigation是`React Navigation`框架中的一个具有顶部导航功能的子模块,其使用特点类似iOS的`UINavigationController`,采用"栈"的概念来进行导航的,每个新控制器放在堆栈的顶部,返回时从栈顶移除.

* 在项目中创建了一个app.js的类,在`index.android.js`和`index.ios.js`分别调用这个类. 

* 更新: RN 在0.49的以后的版本中取消了`index.android.js`和`index.ios.js`这个两个文件,10月04日之后创建的项目统一成`index.js`.

**0.49的以前: index.android.js和index.ios.js**
**0.49的以后: index.js**

```
import React, { Component } from 'react';
import App from './src/containers/app/app';

import {
  AppRegistry,
} from 'react-native';

export default class TestReactNativeProject extends Component {
  render() {
    return (
       <App />
    );
  }
}

AppRegistry.registerComponent('TestReactNativeProject', () => TestReactNativeProject);

```

**App.js类**

```
import React, { Component } from 'react'
import NavStackNavigator from '../app/StackNavigator'

export default class App extends Component<{}> {
  render () {
    return (
      <NavStackNavigator />
    )
  }
}
```

