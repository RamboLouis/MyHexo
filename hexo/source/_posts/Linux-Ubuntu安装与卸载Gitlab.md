---
title: Linux-Ubuntu安装、卸载和配置Gitlab
date: 2018-06-03 15:10:21
categories:
    - Linux
    - Gitlab
tags:
    - Gitlab
    - Linux
---

### 一、安装Gitlab
#### 1.安装并配置必要的依赖关系

```
sudo apt-get update
sudo apt-get install -y curl openssh-server ca-certificates
```

* 然后，安装Postfix发送通知邮件。如果您想使用其他解决方案发送电子邮件，跳过此步骤并在安装GitLab后配置外部SMTP服务器。
ps: 
配置外部SMTP服务器: https://docs.gitlab.com/omnibus/settings/smtp.html

```
sudo apt-get install -y postfix
```

* 在Postfix安装期间，可能会出现一个配置屏幕。选择 `Internet Site` 并按回车。使用您的服务器的外部DNS作为'邮件名'并按回车。如果出现其他屏幕，请继续按回车键以接受默认值。

#### 2.添加GitLab软件包存储库并安装软件包

* 添加GitLab软件包存储库。

    ps: 
gitlab-ce 是社区版，免费的
gitlab-ee 是企业版，收费的

```
gitlab-ee:
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
gitlab-ce: 
curl -sS http://packages.gitlab.cc/install/gitlab-ce/script.deb.sh | sudo bash
```

* 接下来，安装GitLab软件包。将`http：// gitlab.example.com`更改为您想要访问您的GitLab实例的URL。安装将自动在该URL处配置并启动GitLab。安装后HTTPS需要额外的配置。

    ps:
额外的配置: https://docs.gitlab.com/omnibus/settings/nginx.html#enable-https

    `EXTERNAL_URL`为要配置的URL

```
sudo EXTERNAL_URL="http://gitlab.example.com" apt-get install gitlab-ce
```

* 或者使用清华大学软件镜像站提供的软件源来安装 `gitlab-ce`

https://mirror.tuna.tsinghua.edu.cn/help/gitlab-ce/


* 安装成功

ps: 这里提示 `在/etc/gitlab/gitlab.rb文件中,设置“external_url”为GitLab配置的URL`, 所以接下来需要配置gitlab
 
 ```
 Please configure a URL for your GitLab instance by setting `external_url`
configuration in /etc/gitlab/gitlab.rb file.
```

![](https://raw.githubusercontent.com/RamboLouis/MyHexo/master/hexo-source/images/2018-06-03/gitlab.png)

#### 3.配置gitlab

* 在 `/etc/gitlab/gitlab.rb` 中设置 `external_url`

ps: 如果在上一步安装 `gitlab-ce` 的时候配置了指定的 `EXTERNAL_URL` , 此步可以忽略

配置选项: https://docs.gitlab.com/omnibus/settings/configuration.html#configuring-the-external-url-for-gitlab

```
修改:
external_url 'http://www.xxxxxxxxx.com/gitlab'
```

* 重新配置Gitlab以使更改生效

```
sudo gitlab-ctl reconfigure
```

* 重新启动服务

```
sudo gitlab-ctl restart
```


#### 4.登录gitlab

* 首次登录会让设置密码

    ps: 用户名为`root`

![](https://raw.githubusercontent.com/RamboLouis/MyHexo/master/hexo-source/images/2018-06-03/gitlab-root.png)

![](https://raw.githubusercontent.com/RamboLouis/MyHexo/master/hexo-source/images/2018-06-03/gitlab-root-1.png)

### 二、卸载Gitlab

* 停止gitlab

```
sudo gitlab-ctl stop
```

* 查看进程

```
ps -e | grep gitlab
```

* 删除所有包含gitlab的文件及目录

```
find / -name gitlab | xargs rm -rf
```

* 卸载

```
sudo apt-get remove gitlab-ce
或者
sudo apt-get remove gitlab-ee
```

* 检查还有没有卸载的gitlab相关软件

```
dpkg --get-selections | grep gitlab
```

$ dpkg --get-selections|grep gitlab
gitlab-ee		   			deinstall

再执行

```
sudo apt-get --purge remove gitlab-ee 
```

### 三、汉化Gitlab

* 使用`xhang`提供的汉化

https://gitlab.com/xhang/gitlab

#### 1.查看`gitlab`版本

```
cat /opt/gitlab/embedded/service/gitlab-rails/VERSION
```

![](https://raw.githubusercontent.com/RamboLouis/MyHexo/master/hexo-source/images/2018-06-03/gitlab-version.png)

2.下载汉化包

* wget方式(指定版本)

```
wget https://gitlab.com/xhang/gitlab/-/archive/10-8-stable-zh/gitlab-10-8-stable-zh.tar.bz2
或者
wget https://gitlab.com/xhang/gitlab/repository/10-8-stable-zh/archive.tar.bz2 -O gitlab-10-8-stable-zh.tar.bz2
```

* git clone方式(最新版本)

```
git clone https://gitlab.com/xhang/gitlab.git
```

* 解压并查看

ps:
如果使用git clone方式,则无需再解压

```
tar xf gitlab-10-8-stable-zh.tar.bz2
```

查看版本号

```
cat gitlab-10-8-stable-zh/VERSION 
或者
git clone方式:
cat gitlab/VERSION 
```

* 备份gitlab

```
cp -r /opt/gitlab/embedded/service/gitlab-rails{,.ori}
```

* 覆盖

```
sudo cp -rf gitlab-10-8-stable-zh/* /opt/gitlab/embedded/service/gitlab-rails/
```
![](https://raw.githubusercontent.com/RamboLouis/MyHexo/master/hexo-source/images/2018-06-03/gitlab-error-1.png)

* 重起配置及重启gitlab

```
sudo gitlab-ctl reconfigure
sudo gitlab-ctl restart
```


### 四、配置Gitlab

* 查看gitlab配置

```
sudo vim /etc/gitlab/gitlab.rb
```

* gitlab 备份

```
gitlab-rake gitlab:backup:create
或
sudo /usr/bin/gitlab-rake gitlab:backup:create
```

* 进入`/gitlab.rb`修改备份路径

    通过/etc/gitlab/gitlab.rb配置文件来修改默认存放备份文件的目录

```
gitlab_rails['backup_path'] = "/xxxx/gitlab_backup"
```

修改后再重新配置gitlab应用程序

```
gitlab-ctl reconfigure
```

* 进入`/gitlab.rb`关闭自带nginx

```
nginx['enable'] = false
```

* gitlab的nginx的配置文件

    gitlab的nginx是默认80端口,可以进去`/gitlab-http.conf`配置文件修改端口号,然后再重启

```
/var/opt/gitlab/nginx/conf/gitlab-http.conf
```

* gitlab重启

```
gitlab-ctl restart
```

### 五、修改Gitlab的Root密码

* 进入 gitlab 生产控制台

```
sudo gitlab-rails console production
```

* 进入加载生产环境 (Rails 5.0.7.1)

```
irb(main):001:0> user = User.where(id: 1).first
=> #<User id:1 @root>
```

```
irb(main):005:0> user.password = 'aaaaaaaa111111111'
=> "aaaaaaaa111111111"
```

```
irb(main):006:0> user.password_confirmation = 'aaaaaaaa111111111'
=> "aaaaaaaa111111111"
```

```
irb(main):007:0> user.save!
Enqueued ActionMailer::DeliveryJob (Job ID: 18cbb4be-5215-43b2-9f3d-6b8e8ca5443a) to Sidekiq(mailers) with arguments: "DeviseMailer", "password_change", "deliver_now", #<GlobalID:0x00007f227ce31ef8 @uri=#<URI::GID gid://gitlab/User/1>>
=> true
```

```
irb(main):008:0> quit
```