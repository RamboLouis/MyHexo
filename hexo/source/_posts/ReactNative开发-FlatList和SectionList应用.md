---
title: ReactNative开发-FlatList和SectionList应用
date: 2017-07-10 18:10:32
categories:
  - ReactNative
tags: 
  - ReactNative
---
>可参看源码具体在`node_modules/react-native/Libraries/Lists`的目录内.
>例如FlatList的源码: ../node_modules/react-native/Libraries/Lists/FlatList.js

![](http://om9s615i9.bkt.clouddn.com/List流程图.png-rambolu)
### 一、什么是FlatList和SectionList

* `FlatList`和`SectionList`通过源码可以看出,都是基于`VirtualizedList`的一种封装实现.
* `FlatList`实现了单组长列表而`SectionList`则实现了分组长列表.
* 同时也具备`ScrollView`的特性,

