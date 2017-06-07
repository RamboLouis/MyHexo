---
title: Android开发-Activity.
date: 2017-05-28 11:15:05
categories:
    - Android
---
#### Activity

* Android应用程序四大组件之一,一个 Activity 通常就是一个单独的屏幕,用户可与其提供的屏幕进行交互。每个 Activity 都会获得一个用于绘制其用户界面的窗口。窗口通常会充满屏幕，但也可小于屏幕并浮动在其他窗口之上。类似于iOS中的UIViewController。

* 每次新 Activity 启动时，前一 Activity 便会停止，但系统会在堆栈（“返回栈”）中保留该 Activity。

* Activity之间通过Intent进行通信。

#### 创建 Activity

#### 配置 AndroidManifest

* 更改默认Activity。

```
<manifest ... >
  <application ... >
      <activity android:name=".MainActivity" />
      ...
  </application ... >
  ...
</manifest >
```
 
 * intent-filter

 ```
 <activity android:name=".MainActivity">
   <intent-filter>
      <action android:name="android.intent.action.MAIN" />
      <category android:name="android.intent.category.LAUNCHER" />
    </intent-filter>
 </activity>
```

<action> 元素指定这是应用的“主”入口点。
<category> 元素指定此 Activity 应列入系统的应用启动器内。

#### 启动 Activity

* 可以通过调用 `startActivity()`，并将其传递给描述您想启动的 Activity 的 Intent 来启动另一个 Activity。
* 启动某个已知 Activity。 可以通过使用类名创建一个显式定义您想启动的 Activity 的 Intent 对象来实现此目的。 例如，可以通过以下代码让一个 Activity 启动另一个名为 HomeActivity 的 Activity：

1. 显式启动:通过包名来启动

```
Intent intent = new Intent(XXX.this, HomeActivity.class);
startActivity(intent);
```

2. 隐式启动:通过AndroidManifest中的Intent-filter的Action,Category来实现。

```
 <activity android:name=".OtherActivity">
    <intent-filter>
        <action android:name="other_action" />
        <category android:name="other_category" />
        <category android:name="android.intent.category.DEFAULT" />
    </intent-filter>
</activity>
```

```
Intent otherIntent = new Intent();
otherIntent.setAction("other_action");
otherIntent.addCategory("other_category");
startActivity(otherIntent);
```

* 应用还可以利用 Activity 数据执行某项操作，例如打电话、发短信、发电子邮件等。

```
// 打电话
Uri uri = Uri.parse("tel:10010");
Intent intent = new Intent(Intent.ACTION_DIAL, uri);
startActivity(intent);
// 2. 发短信
Uri uri = Uri.parse("sms:10010");
Intent intent = new Intent(Intent.ACTION_SENDTO, uri);
intent.putExtra("sms_body", "今天天气不错");
startActivity(intent);
// 3. 打开浏览器
Uri uri = Uri.parse("http://www.baidu.com");
Intent intent  = new Intent(Intent.ACTION_VIEW, uri);
startActivity(intent);
```

#### 启动 Activity 以获得回调结果

从启动的 Activity 获得回调结果。在这种情况下，请通过调用 `startActivityForResult()`（而非 startActivity()）来启动 Activity。 要想在随后收到后续 Activity 的结果，请实现 `onActivityResult()` 回调方法。 当后续 Activity 完成时，它会使用 Intent 向 `onActivityResult()` 方法返回结果。

#### 管理 Activity 生命周期

* **onCreate()**: 类似iOS中的viewDidLoad。

首次创建 Activity 时调用。
始终后接 onStart()。

* **onStart()**: 类似iOS中的viewWillAppear。

在 Activity 即将对用户可见之前调用。
如果 Activity 转入前台，则后接 onResume()，如果 Activity 转入隐藏状态，则后接 onStop()。

* **onResume()**: 类似iOS中的viewDidAppear。

在 Activity 即将开始与用户进行交互之前调用。
始终后接 onPause()。


---

* **onRestart()**:

在 Activity 已停止并即将再次启动前调用。
始终后接 onStart()

* **onPause()**:

当系统即将开始继续另一个 Activity 时调用。

* **onStop()**:

在 Activity 对用户不再可见时调用。
如果 Activity 恢复与用户的交互，则后接 onRestart()，如果 Activity 被销毁，则后接 onDestroy()。

* **onDestroy()**:

在 Activity 被销毁前调用。
![](https://developer.android.google.cn/images/activity_lifecycle.png)

* Activity的启动顺序：

onCreate()—>onStart()—>onResume()

---

* 当 Activity A 启动 Activity B 时发生顺序：

1.Activity A 的 onPause() 方法执行。

2.Activity B 的 onCreate()、onStart() 和 onResume() 方法依次执行。

3.因为 Activity A 在屏幕上不再可见，则其 onStop() 方法执行。

---

* 从 Activity B 返回到 Activity A时：

1.Activity B 的 onPause() 方法执行

2.Activity A 的 onRestart()、onStart()、onResume() 方法以此执行。

3.Activity B 的 onStop()、onDestroy()依次执行。

---

* Activity的销毁顺序:

onPause()—>onStop()—>onDestroy()


