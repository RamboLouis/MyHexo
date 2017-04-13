---
title: Ruby学习-Ruby版本安装与切换.
date: 2016-09-20 19:26:12
categories:
    - Ruby
tags: 
    - Ruby
    - Mac
---
> Ruby版本管理器（RVM）官网:
> https://rvm.io/
> 
> RVM使用指南:
> https://ruby-china.org/wiki/rvm-guide



#### 一、安装 RVM
RVM: Ruby Version Manager, Ruby的版本管理器，包括Ruby的版本管理和Gem库管理(gemset).
```
curl -L get.rvm.io | bash -s stable
```
#### 二、Ruby源
* 查看当前 Ruby 源

```
gem sources -l 
```

* 删除当前 Ruby 源

```
gem sources --remove ******
```

* 使用指定 Ruby 源

```
gem sources -a ******
```

* 更新全局的 RubyGems

```
sudo gem update --system --no-user-install
```

* Ruby 的镜像存放在**~/.gemrc**里面

#### 三、Ruby 的安装与切换

* 列出已知的 Ruby 版本

```
rvm list known
```

* 查询已经安装的 Ruby 版本

```
rvm list
```

* 切换 Ruby 版本

```
rvm use 2.1.0
```

* 设置默认版本，控制台默认的 Ruby 版本

```
rvm use 2.1.0 --default 
```

* 卸载已安装的版本

```
rvm remove 2.1.0
```


