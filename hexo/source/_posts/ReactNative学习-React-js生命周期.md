---
title: ReactNative学习-React.js生命周期
date: 2017-02-27 11:14:56
categories:
    - ReactNative
tags: 
  - ReactNative
  - React
  - JavaScript
---
### 生命周期

官方文档: https://facebook.github.io/react/docs/react-component.html#shouldcomponentupdate

![](https://raw.githubusercontent.com/RamboLouis/MyHexo/master/hexo-source/images/2017-02-27/react-lifecycle.png)


**当创建组件的实例并将其插入到DOM中时，将调用这些方法：**

  **1、constructor()**  
> React组件的构造函数。在安装React组件的构造函数之前调用它。在实现Component子类的构造函数时，应该在任何其他语句之前调用super（props）。

```
constructor(props) {
  super(props);
}
```

 **2、componentWillMount()** 
> 组件初始化时只调用，以后组件更新不调用，整个生命周期只调用一次，此时可以修改state。

 **3、 render()** 
>  react最重要的步骤，创建虚拟dom，进行diff算法，更新dom树都在此进行。此时就不能更改state了。

 **4、componentDidMount()** 
> 组件渲染之后调用，可以通过this.getDOMNode()获取和操作dom节点，只调用一次。

**更新可能是道具或状态的改变引起的。当重新呈现组件时，将调用这些方法：**

  **6、componentWillReceivePorps(nextProps)**
> 组件初始化时不调用，组件接受新的props时调用。

  **7、shouldComponentUpdate(nextProps, nextState)** 
> react性能优化非常重要的一环。组件接收新的state或者props时调用，默认为true，我们可以设置在此对比前后两个props和state是否相同，如果相同则返回false阻止更新，因为相同的属性状态一定会生成相同的dom树，这样就不需要创造新的dom树和旧的dom树进行diff算法对比，节省大量性能，尤其是在dom结构复杂的时候。对于初始渲染，调用this.forceUpdate（）会跳过此步骤不调用此方法。

  **8、componentWillUpdata(nextProps, nextState)**
> 组件初始化时不调用，只有在组件将要更新时才调用，此时可以修改state
> 如果shouldComponentUpdate（）返回false，则不会调用componentWillUpdate（）


  **9、render()**
> 根据diff算法渲染视图

  **10、componentDidUpdate()**
> 组件初始化时不调用，组件更新完成后调用，此时可以获取dom节点。
> 如果shouldComponentUpdate（）返回false，则不会调用componentDidUpdate（）。

**当从DOM中删除组件时调用此方法：**
  **11、componentWillUnmount()** 
> 组件将要卸载时调用，一些事件监听和定时器需要在此时清除。

