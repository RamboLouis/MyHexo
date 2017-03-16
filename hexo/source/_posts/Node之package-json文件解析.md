---
title: Node之Package.json文件参数解析
date: 2017-02-13 14:12:00
categories:
    - Node
tags:
    - Node
    - JavaScript
---

参考JavaScript 标准参考教程（alpha）http://javascript.ruanyifeng.com/nodejs/packagejson.html#toc0
### 概述
* package.json在Node项目中用于描述项目的一些基本信息，以及依赖库的配置，一般每一个Node项目的根目录下都有一个package.json文件。
* 在项目的根目录中package.json文件可以手工编写，也可以使用npm init命令自动生成，其内容是一个Json对象。

```
npm init
```
基本结构如下：

```
{
  "name": "package",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "dependencies": {
    "babel-cli": "^6.23.0",
    "babel-preset-env": "^1.1.8",
    "hexo": "^3.2.0",
    "immutable": "^3.8.1",
    "iflux": "^1.2.16"
  },
  "devDependencies": {},
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC"
}
```
### scripts字段
参考文献npm scripts 使用指南 By阮一峰
http://www.ruanyifeng.com/blog/2016/10/npm_scripts.html
scripts的每一个属性，对应一段脚本。是指定了运行脚本命令的npm命令行缩写，比如start 属性指定了运行npm run start时，所要执行的命令。

```
npm run start
# 等同于执行
node index.js
```
下面的设置指定了npm run preinstall、npm run postinstall、npm run start、npm run test时，所要执行的命令。

```
"scripts": {
    "preinstall": "echo here it comes!",
    "postinstall": "echo there it goes!",
    "start": "node index.js",
    "test": "tap test/*.js"
}
```


### dependencies字段，devDependencies字段

dependencies字段指定了项目运行所依赖的模块，devDependencies指定项目开发所需要的模块。

它们都指向一个对象。该对象的各个成员，分别由模块名和对应的版本要求组成，表示依赖的模块及其版本范围。

```
{
  "devDependencies": {
    "browserify": "~13.0.0",
    "karma-browserify": "~5.0.1"
  }
}
```
* 指定版本：比如1.2.2，遵循“大版本.次要版本.小版本”的格式规定，安装时只安装指定版本。
* 波浪号（tilde）+指定版本：比如~1.2.2，表示安装1.2.x的最新版本（不低于1.2.2），但是不安装1.3.x，也就是说安装时不改变大版本号和次要版本号。
* 插入号（caret）+指定版本：比如ˆ1.2.2，表示安装1.x.x的最新版本（不低于1.2.2），但是不安装2.x.x，也就是说安装时不改变大版本号。需要注意的是，如果大版本号为0，则插入号的行为与波浪号相同，这是因为此时处于开发阶段，即使是次要版本号变动，也可能带来程序的不兼容。
* latest：安装最新版本。


安装所需要的模块吗，直接使用npm install命令。

```
npm install XXXX
```

如果一个模块不在package.json文件之中，可以单独安装这个模块，并使用相应的参数，将其写入package.json文件之中。

```
npm install express --save

npm install express --save-dev
```
上面代码表示单独安装express模块，
--save     表示将该模块写入dependencies属性，
--save-dev 表示将该模块写入devDependencies属性。

