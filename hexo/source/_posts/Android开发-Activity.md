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
* 创建 Activity，必须创建 Activity 的子类。

* **`onCreate()`** 

　　必须实现此方法。系统会在创建您的 Activity 时调用此方法。在这个方法实现内初始化 Activity 的必需组件。 同时必须在此方法内调用 `setContentView()`，以定义 Activity 用户界面的布局。

* **`onPause()`**

　　系统将此方法作为用户离开 Activity 的第一个信号进行调用（但并不总是意味着 Activity 会被销毁）。通常应该在此方法内确认在当前用户会话结束后仍然有效的操作（因为用户可能不会返回）。
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

action 元素指定这是应用的“主”入口点。
category 元素指定此 Activity 应列入系统的应用启动器内。

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
![](https://raw.githubusercontent.com/RamboLouis/MyHexo/master/hexo-source/images/2017-05-28/activity-lifecycle.png)

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


#### Activity 正向传值及反向回调
##### 正向传值
* Activity A 传递一个或多个参数

```
Intent intent = new Intent(MainActivity.this, UserActivity.class);
// 一次传一个
intent.putExtra("name",name);

// 一次传多条数据
Bundle bd = new Bundle();
bd.putCharSequence("name",name);
bd.putCharSequence("sex",sex);
intent.putExtras(bd);

startActivity(intent);
```

* Activity B 接收一个或多个参数

```
Intent getIntent = getIntent();

// 一次取一个
name = getIntent.getStringExtra("name");

// 一次取多个
Bundle bd = getIntent.getExtras();
name = bd.getCharSequence("name").toString();
sex = bd.getCharSequence("sex").toString();
```

##### 反向回调
* Activity A 使用带`Result`的方法 `startActivityForResult()` 来启动 Activity B，而非 `startActivity()` 来启动 Activity B。

```
Intent intent = new Intent(OtherActivity.this,ImageActivity.class);
startActivityForResult(intent,100);
```

* Activity B 则实现 `setResult()`方法来实现回传值。

```
Intent intent = getIntent();
setResult(200,intent);
finish();
```

* 这样 Activity A 就会收到 Activity B 的回调结果，Activity A 再实现 `onActivityResult()` 回调方法进行监听。

requestCode 为 Activity A 中 `startActivityForResult()` 发送的第二个参数: 100
resultCode 为 Activity B 中`setResult()`发送的第一个参数: 200
Intent 为 Activity B 中的Intent

```
 @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        Log.d(TAG, "requestCode----->" + requestCode);
        Log.d(TAG, "resultCode--->" + resultCode);
        
    }
    
```

