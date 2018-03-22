---
title: Mac环境更改shell自定义终端-oh my zsh安装及配置
date: 2017-02-25 11:00:26
categories:
    - Mac
tags: 
    - Mac
    - 进阶
---

## 安装oh my zsh:
1.克隆这个项目到本地（根路径 ~）

```
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
```

2.创建一个zsh的配置文件

注意:如果你已经有一个~/.zshrc文件的话，建议你先做备份。

* 备份配置文件

```
cp ~/.zshrc ~/.zshrc.orig
```

* 然后开始创建zsh的配置文件

```
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
```
    
3.查看系统内置了几种shell

```
cat /etc/shells
```

4.设置zsh为你的默认的shell
   
```
chsh -s /bin/zsh
```

5.重启终端

## 更改zsh主题:

1.编辑 ~/.zshrc

2.修改主题
Ps：主题文件在 ~/.oh-my-zsh/themes 目录

```
ZSH_THEME="ys"
```

## 终端启动速度慢
检查`~/.bash_profile`或`~/.zshrc`的预加载运行命令
ps: 删除多余命令,重新启动终端


