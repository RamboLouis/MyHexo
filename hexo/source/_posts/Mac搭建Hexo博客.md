---
title: Mac搭建Hexo博客
date: 2016-03-18 21:23:31
categories:
    - Hexo
tags: 
    - Hexo
    - Mac
---
##  前言
>终于把Hexo给弄好了.期间遇到了一些问题,网上也有教程,整理了一下思路决定再写一篇.**最新官方的教程**可以去[Hexo官网](https://hexo.io/zh-cn/docs/index.html)查看.

##  一、准备

###  安装Xcode

Xcode会一并安装git等依赖.

###  安装node.js

Hexo是基于node.js的,要去[官网](https://nodejs.org/)上下载下来安装.

###  注册Github账户

在本地搭建好Hexo后需要将内容同步到github上,才可以在网上浏览,可以去[Github官网](https://github.com/)上去注册.

##  二、安装

因为安装包中有些内容在墙外,所以可以换[淘宝源](http://npm.taobao.org/),或者用

```
npm install -g hexo-cli --no-optional
```

cd进入你要安装的目录,如: hexo
如果没有那就新建一个文件夹

```
cd ~/hexo
```

然后初始化

```
hexo init
```

初始化好之后,执行安装

```
npm install
```

这样就已经安装完毕.

##  三、生成

###  生成静态页面

cd 到的目录,执行如下命令,生成静态页面至`hexo\public\`目录.

```
hexo g (hexo generate简写)
```

###  本地启动

执行好上面的命令之后,开始启动本地服务.再执行下面的命令：

```
hexo server
```

看到 *INFO Hexo is running at [http://0.0.0.0:4000/](http://0.0.0.0:4000/). Press Ctrl+C to stop.*
之后,就可以在浏览器中打开页面[http://localhost:4000](http://localhost:4000)来看了.

###  写文章

还是在你cd到的目录,执行new命令后,生成指定名称的文章至`hexo\source\ _posts\ blogName.md`.

```
hexo new "blogName"
```

blogName就是文章名.

接下来,就可以用Markdown编辑器写你的文章了.

```
格式:
title: postName #文章页面上的显示名称,可以任意修改,不会出现在URL中
date: 2013-12-02 15:30:16 #文章生成时间,一般不改,当然也可以任意修改
categories: #文章分类目录,可以为空,注意:后面有个空格
tags: #文章标签,可空,多标签请用格式[tag1,tag2,tag3],注意:后面有个空格
---
这里开始使用markdown格式输入你的正文.
```

##  四、上传至Github

###  创建仓库并安装上传git插件

在安装之前,首先我们要确认在你的Github帐号的Repository(仓库)中有 **用户名.github.io** 的项目.在确认之后,就可以执行命令

```
npm install hexo-deployer-git --save
```

###  配置账号

####  配置 _config.yml 文件

在Hexo安装的目录,如 *~/Document/hexo* 中找到 **_config.yml** 文件.打开.翻到最后,找到 **deploy** 字样,改成如下格式：

```
deploy:
    type: git 
    repo: https://github.com/用户名/用户名.github.io.git 
    branch: master
```

需要**注意**的是：冒号后面有一个空格；使用github可以不用写branch那一行.如果要使用多个 deployer,可改成如下样式：

```
deploy:
- type: git 
  repo:
- type: hexoku 
  repo:
```
###  同步

```
hexo d (hexo deploy简写)
```

执行,以后每次执行就可以依次输入下面三行命令：

```
hexo clean
hexo g (hexo generate简写)
hexo d (hexo deploy简写)
```
大功告成,可以输入你的`用户名.github.io`在浏览器中查看了.
##  五、插件

### 搜索服务
*  本地搜索

1. 安装 `hexo-generator-searchdb`，在站点的根目录下执行以下命令：

    ```
    npm install hexo-generator- searchdb --save
    ```

2. 编辑 `站点配置文件`，新增以下内容到任意位置：

    ```
    search:
      path: search.xml
      field: post
      format: html
      limit: 10000
    ```
    
3. 编辑 `主题配置文件`，启用本地搜索功能：
    
    ```
    # Local search
    local_search:
      enable: true
    ```

###  站点地图

```
npm install hexo-generator-sitemap --save
```

生成的sitemap.xml可以给搜索引擎收录使用.
如果要生成百度的sitemap,使用以下命令：

```
npm install hexo-generator-baidu-sitemap --save
```

###  RSS订阅

```
npm install hexo-generator-feed@1.0.3 --save
```


##  六、主题更改

[Hexo](http://hexo.io/)提供了官网的主题, 初始化hexo时也会自动生成一个主题, Hexo还支持个性定制主题, 可以根据自己的喜好对主题进行修改, [更多主题](https://github.com/hexojs/hexo/wiki/Themes)可以在官网中找到

个性化博客的设置在博客的根目录下对喜爱的主题进行主题进行克隆

```
git clone git@github.com:yunlzheng/hexo-themes.git themes/writing
#在./_config.yml,修改主题为writingtheme: writing
#查看本地效果
hexo g (hexo generate简写)
hexo s (hexo server简写)
```

###  安装主题的方法就是一句git命令：

```
git clone https://github.com/xx/hexo-theme-xxxx.git themes/xxxx
```

目录是否是什么无所谓,只要与`_config.yml`文件一致即可.

安装完成后,打开`hexo\_config.yml`,修改主题为指定的主题名

```
theme: xxxx
```

打开`hexo\themes\xxxx`目录,编辑主题配置文件`_config.yml`：

```
menu: #配置页头显示哪些菜单
#  Home: /
  Archives: /archives
  Reading: /reading
  About: /about
#  Guestbook: /about

excerpt_link: Read More #摘要链接文字
archive_yearly: false #按年存档

widgets: #配置页脚显示哪些小挂件
  - category
#  - tag
  - tagcloud
  - recent_posts
#  - blogroll

blogrolls: #友情链接
  - bruce sha's duapp wordpress: http://ibruce.duapp.com
  - bruce sha's javaeye: http://buru.iteye.com
  - bruce sha's oschina blog: http://my.oschina.net/buru
  - bruce sha's baidu space: http://hi.baidu.com/iburu

fancybox: true #是否开启fancybox效果

duoshuo_shortname: buru #多说账号

google_analytics:
rss:

```

## 七、后续

###  更新hexo

```
npm update -g hexo
```

###  更新主题

```
cd themes/modernist
git pull
```

###  更新插件：

```
npm update
```


## 遇到的问题

```
fatal: unable to access 'https://github.com/xxx/xxx.git/': Could not resolve host: github.com
FATAL Something's wrong. Maybe you can find the solution here: http://hexo.io/docs/troubleshooting.html
Error: fatal: unable to access 'https://github.com/xxx/xxx.git/': Could not resolve host: github.com

    at ChildProcess.<anonymous> (/Users/xxxx/hexo/node_modules/hexo-util/lib/spawn.js:37:17)
    at ChildProcess.emit (events.js:159:13)
    at maybeClose (internal/child_process.js:943:16)
    at Process.ChildProcess._handle.onexit (internal/child_process.js:220:5)
```

![](https://upload-images.jianshu.io/upload_images/1666327-dc9324430df0d458.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 解决方案:

在当前用户路径`~`输入

```
ssh -v git@github.com
```

或者你的`hexo`路径输入

```
ssh git@github.com
```
输入Github密码即可

