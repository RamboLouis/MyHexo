---
title: 'Android开发-java迁移Kotlin以及Kotlin与Swift对比学习.'
date: 2017-05-18 10:41:19
categories:
    - Android
tags: 
    - Swift
    - Kotlin
---
>前言:北京时间的17日23点,谷歌一年一度的I/O开发者大会召开.就在这第一天,谷歌安卓团队大会上宣布Kotlin成为Android的主力开发语言,其实在之前这个语言就已经支持了安卓平台开发，但是直到今天谷歌开发者大会上才宣布对该语言的全面支持和维护,至此之后代码将更加简洁.
>最近项目上线,CTO说闲暇之余学习下安卓,无奈重新啃java的语法,这是多么痛的领悟,可是一觉醒来,万物复苏.
>作为热衷Swift的iOS开发者,看到Kotlin语法是多么的熟悉.23333.

### 一、Kotlin的迁移.
#### 1、安装一个Kotlin的插件.
Ps:使用Android Studio开发安卓.听说Android Studio 3.0 预览版已支持 Kotlin了,就可以跳过这一步了.

* `Android Studio` -> `Preferences` -> `Plugins`
* 选择`Browse Repositories`

![选择Browse Repositories](https://raw.githubusercontent.com/RamboLouis/MyHexo/master/hexo-source/images/2017-05-18/01.png)

* 搜索`Kotlin`

![搜索Kotlin](https://raw.githubusercontent.com/RamboLouis/MyHexo/master/hexo-source/images/2017-05-18/2.png)

* 根据提示重启Android Studio即可.

#### 2、java文件迁移Kotlin

Kotlin插件提供了迁移入口, jetbrains真是良心卖家啊.

* 打开你的Activity,
* 选择 `code` -> `Convert Java File to Kotlin File`

Ps:和Swift迁移感觉一样,
![Paste_Image.png](https://raw.githubusercontent.com/RamboLouis/MyHexo/master/hexo-source/images/2017-05-18/3.png)

原本java文件的MainActivity:

```
package com.example.rambolu.testkotlin;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}
```

迁移后kt文件的MainActivity:
Ps:迁移后发现眼前的画面似曾相识...

```
package com.barryzhang.kotlinhello

import android.support.v7.app.AppCompatActivity
import android.os.Bundle

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }
}
```

对比swift文件的ViewController:
Ps：真的和Kotlin是孪生姐妹...

```

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
```

* 感觉当你写惯了swift后,在书写方式上稍微熟悉下可以无缝切入Kotlin.至于android的类库还需要再进一步的学习.
* 同时Kotlin和java也可以进行混编(有点类似OC和Swift混编),Kotlin可以调用java的类库,同时java也可以调用Kotlin.



#### 3、配置Kotlin.

* 当你转移后,再次打开Activity,IDE会提醒你`Kotlin not configured`.此时需要点击右面的`configure`.
![Configure](https://raw.githubusercontent.com/RamboLouis/MyHexo/master/hexo-source/images/2017-05-18/4.png)

* 点击后会提醒项目配置Kotlin,是选择选择默认状态(All modules containing Kotlin files: app),以及Kotlin的版本就即可.
![Kotlin version](https://raw.githubusercontent.com/RamboLouis/MyHexo/master/hexo-source/images/2017-05-18/5.png)
Ps: 配置完,其实是在你项目中的`build.gradle`中添加了Kotlin版本和路径(不是app->build.gradle)

![版本和路径](https://raw.githubusercontent.com/RamboLouis/MyHexo/master/hexo-source/images/2017-05-18/6.png)
以及你的`app`->`build.gradle`中添加了Kotlin的依赖

![Kotlin的依赖](https://raw.githubusercontent.com/RamboLouis/MyHexo/master/hexo-source/images/2017-05-18/7.png)

* 配置完,提示需要同步才能正常工作,此时需要点击同步.

![同步](https://raw.githubusercontent.com/RamboLouis/MyHexo/master/hexo-source/images/2017-05-18/8.png)

* 好了,现在可以运行了.

### 二、Kotlin与Swift对比学习.

* 作为官方主推,势必要成为开发的趋势,笔者认为早上车,早体验代码的简洁,同时也提高了开发效率，对于Swift可以更进一步研究FP和POP,而不是还在因为一个property里面的修饰符思考半天.

* 相比Kotlin,目前版本1.1,有如两年前的Swift,对于比Swift开源还早的语言,看来没有大财主也是无济于事啊,之前谷歌与甲骨文的官司,感觉谷歌也是没有办法,也想加紧更换开发Android的语言,这才导致谷歌宣布Swift的孪生姐妹Kotlin成为主力语言.

* 对比学习主要也是更直观的对比2种语言的书写方式,以及书写规范,方便掌握,也加深对语言的认识.

Kotlin的官方文档:
http://kotlinlang.org/docs/reference/basic-syntax.html
民间翻译中文版:
https://huanglizhuo.gitbooks.io/kotlin-in-chinese/Basics/Basic-Types.html
Swift的官方文档:
https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309
以及Kotlin和Swift对比文档
http://nilhcem.com/swift-is-like-kotlin/
以下简单举例语法的相似之处,具体开发中涉及到的类库还要看各家介绍.
* 常量和变量

```
Swift
let :常量  ,var :变量
var a :  Int = 0   
a = 1
let b = 2

```

```
Kotlin 也支持类型推导
val :常量  ,var :变量
var a : Int = 1   
 a = 2
val b = 1 
```

* 打印Holle world

```
Swift
print("Hello, world!")
```

```
Kotlin
print("Hello, world!") println("Hello, world!")   // 和Swift 1.0中使用到的类似
```

* 打印嵌套字符串
区别在于一个是\,一个是$,以及大小括号

```
Swift
let name = "rambolu"
let age = 25
print("我的名字: \(name), 我的年龄 : \(age) ") 
```

```
Kotlin
val name = "rambolu"
val age = 25
println("我的名字: ${name}, 我的年龄 ${age} ") 
```

* 数组 for in循环

```
Swift
let arr = ["a", "b", "c", "d"]
for i in 0..<arr.count {
    print(" \(i) + \(arr[i])")
}
```

```
Kotlin
val arr = arrayOf("a", "b", "c", "d")
val count = arr.count()
for (i in 0..count - 1) {
    println("${i} + ${arr[i]}")
}
```

* 持续补充

### 三、后记

* Kotlin的成长似乎也伴随着Swift成长,从苹果把Swift的开源,以及成为主力开发语言至今,苹果一直在激进般的前行,现在谷歌也把Kotlin成为Android的主力开发语言,瞬间感觉以后的开发都在降低了开发者的学习成本,代码都更加的简洁,方便其他开发者更快捷的开发app应用.
* Kotlin团队也宣称 Kotlin 将在 Android Studio 3.0中直接提供,这也意味着开发Android不再需要安装任何插件和担心兼容性的问题了.

