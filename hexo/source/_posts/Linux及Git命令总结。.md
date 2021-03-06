---
title: Linux及Git命令总结。
date: 2016-02-17 18:02:51
categories:
    - Linux
    - Git
tags: 
    - Linux
    - Git
    - Mac
---
### 常用Linux命令

#### 一、常用指令

* 显示文件或目录

```
ls
```

* 列出文件详细信息列表(list)

```
ls -l  
```

* 列出当前目录下所有文件及目录，包括隐藏的文件(all)

```
ls -a
```

* 创建目录

```
mkdir         
```

* 创建目录，若无父目录，则创建p(parent)

```
mkdir -p           
```

* 切换目录

```
cd               
```

* 创建空文件

```
touch
```

* 创建带有内容的文件。

```
echo
```

* 查看文件内容

```
cat
```

* 拷贝

```
cp
```

* 移动或重命名

```
mv               
```

* 删除文件

```
rm
```

* 递归删除，可删除子目录及文件

```
rm -r            
```

* 强制删除


```
rm -f         
```

* 在文件系统中搜索某文件

```
find
```

* 统计文本中行数、字数、字符数

```
wc               
```

* 在文本文件中查找某个字符串

```
grep             
```

* 删除空目录

```
rmdir           
```

* 树形结构显示目录，需要安装tree包

```
tree             
```

* 显示当前目录

```
pwd        
```

* 创建软链接

```
      源文件  目标文件
ln -s source dist            
```

* 创建硬链接

```
    源文件  目标文件
ln source dist            
```

* 检查磁盘空间

```
df         
```

* 检查磁盘空间(可读懂类型)

```
df -h
```

* 检查磁盘空间(以M为计算单位)

```
df -m
```

* 检查磁盘空间(以G为计算单位)

```
df -g
```

* MacOS 磁盘管理命令

```
diskutil
```

* 查询DNS解析

```
dig         
```

#### 二、系统管理命令
* 查询进程

```
top
```

* 杀死进程

```
kill
```
```
kill pid号
```
```
kill -9 pid号
```
```
kill -15 pid号
```

* 显示网络状态信息

```
netstat          
```

* 查看网络情况

```
ifconfig
```

* 清屏

```
clear
```



#### 三、Vim编辑器

* 编辑文件

```
vi 文件名
```
 
* 编辑

```
i
```

* 取消编辑

```
esc按键
```

* 退出

```
:q
```

* 保存并退出

```
:wq 
```

* 显示行号

```
:set number     
```

* 隐藏行号

```
:set nonumber 
```
#### 四、Ubuntu提示packages更新
```
sudo apt-get update
sudo apt-get dist-upgrade
```

---


### 常用Git命令

#### 一、新建代码库

* 在当前目录新建一个Git代码库

```
git init
```
* 在当前目录新建并将其初始化为Git代码库

```
git init <project_name>
```

* 克隆代码

```
git clone <url>
```

#### 二、配置

Git的设置文件为 *.gitconfig*，它可以在用户主目录下（全局配置），也可以在项目目录下（项目配置）。

* 显示当前的Git配置

```
git config --list
```

* 编辑Git配置文件

```
git config -e <--global>
```

#### 三、增加/删除文件

* 添加指定文件到暂存区

```
git add <file1> <file2>
```

* 添加指定目录到暂存区，包括子目录

```
git add <dir>
```

* 添加当前目录的所有文件到暂存区

```
git add .
```

* 添加每个变化前，都会要求确认，对于同一个文件的多处变化，可以实现分次提交

```
git add -p
```

* 删除工作区文件，并且将这次删除放入暂存区

```
git rm <file1> <file2>
```

* 停止追踪指定文件，但该文件会保留在工作区

```
git rm --cached <file>
```

* 改名文件，并且将这个改名放入暂存区

```
git mv <file-original> <file-renamed>
```

#### 四、代码提交

* 提交暂存区到仓库区

```
git commit -m 'message'
```

* 提交暂存区的指定文件到仓库区

```
git commit <file1> <file2> -m 'message'
```

* 提交工作区自上次commit之后的变化，直接到仓库区

```
git commit -a
```

* 提交时显示所有diff信息

```
git commit -v
```

* 使用一次新的commit，替代上一次提交
如果代码没有任何新变化，则用来改写上一次commit的提交信息

```
git commit --amend -m 'message'
```

* 重做上一次commit，并包括指定文件的新变化

```
git commit --amend <file1> <file2>
```
#### 五、分支

* 列出所有本地分支

```
git branch
```

* 列出所有远程分支

```
git branch -r
```

* 列出所有本地分支和远程分支

```
git branch -a
```

* 新建一个分支，但依然停留在当前分支

```
git branch <branch_name>
```

* 新建一个分支，并切换到该分支

```
git checkout -b <branch_name>
```

* 新建一个分支，指向指定commit

```
git branch <branch_name> <commit>
```

* 新建一个分支，与指定的远程分支建立追踪关系

```
git branch --track <branch_name> <remote_branch>
```

* 切换到指定分支或标签

```
git checkout <branch_name/tag>
```

* 切换到上一个分支

```
git checkout -
```

* 建立追踪关系，在现有分支与指定的远程分支之间

```
git branch --set-upstream <branch_name> <remote_branch>
```

* 合并指定分支到当前分支

```
git merge <branch_name>
```

* 删除分支

```
git branch -d <branch_name>
```

* 删除远程分支

```
$ git push origin --delete <branch_name>
```
```
$ git branch -dr <remote/branch>
```

#### 六、标签

* 列出所有tag

```
git tag
```

* 新建一个tag在当前commit

```
git tag <tag>
```

* 新建一个tag在指定commit

```
git tag <tag> <commit>
```

* 删除本地tag

```
git tag -d <tag>
```

* 删除远程tag

```
git push origin :refs/tags/<tagName>
```

* 查看tag信息

```
git show <tag>
```

* 提交远程tag

```
git push origin <tag>
```

* 提交到远程所有tag

```
git push origin --tags
```

* 新建一个分支，指向某个tag

```
git checkout -b <branch> <tag>
```

#### 七、查看信息

* 显示有变更的文件

```
git status
```

* 显示当前分支的版本历史

```
git log
```

* 显示commit历史，以及每次commit发生变更的文件

```
git log --stat
```
* 搜索提交历史，根据关键词

```
git log -S <keyword>
```

* 显示某个commit之后的所有变动，每个commit占据一行

```
git log <tag> HEAD --pretty=format:%s
```

* 显示某个commit之后的所有变动，其"提交说明"必须符合搜索条件

```
git log <tag> HEAD --grep feature
```

* 显示某个文件的版本历史，包括文件改名

```
git log --follow <file>
```
```
git whatchanged <file>
```

* 显示指定文件相关的每一次diff

```
git log -p <file>
```

* 显示过去5次提交

```
git log -5 --pretty --oneline
```

* 显示所有提交过的用户，按提交次数排序

```
git shortlog -sn
```

* 显示指定文件是什么人在什么时间修改过

```
git blame <file>
```

* 显示暂存区和工作区的差异

```
git diff
```

* 显示暂存区和上一个commit的差异

```
git diff --cached <file>
```

* 显示工作区与当前分支最新commit之间的差异

```
git diff HEAD
```

* 显示两次提交之间的差异

```
git diff <first-branch>...<second-branch>
```

* 显示今天你写了多少行代码

```
git diff --shortstat "@{0 day ago}"
```

* 显示某次提交的元数据和内容变化

```
git show <commit>
```

* 显示某次提交发生变化的文件

```
git show --name-only <commit>
```

* 显示某次提交时，某个文件的内容

```
git show <commit>:<filename>
```

* 显示当前分支的最近几次提交

```
git reflog
```

#### 八、远程同步

* 下载远程仓库的所有变动

```
git fetch <remote>
```

* 显示所有远程仓库

```
git remote -v
```

* 显示某个远程仓库的信息

```
git remote show <remote>
```

* 增加一个新的远程仓库，并命名

```
git remote add <shortname> <url>
```

* 取回远程仓库的变化，并与本地分支合并

```
git pull <remote> <branch>
```

* 上传本地指定分支到远程仓库

```
git push <remote> <branch>
```

* 强行推送当前分支到远程仓库，即使有冲突

```
git push <remote> --force
或者:
git push -f -u origin master
```

* 推送所有分支到远程仓库

```
git push <remote> --all
```

#### 九、撤销

* 恢复暂存区的指定文件到工作区

```
git checkout <file>
```

* 恢复某个commit的指定文件到暂存区和工作区

```
git checkout <commit> <file>
```

* 恢复暂存区的所有文件到工作区

```
git checkout .
```

* 重置暂存区的指定文件，与上一次commit保持一致，但工作区不变

```
git reset <file>
```

* 重置暂存区与工作区，与上一次commit保持一致

```
git reset --hard
```

* 重置当前分支的指针为指定commit，同时重置暂存区，但工作区不变

```
git reset <commit>
```

* 重置当前分支回滚到某一次历史提交版本

`ps:
回滚完在执行git push -f -u origin master`

```
git reset --hard <commit>
```

* 重置当前HEAD为指定commit，但保持暂存区和工作区不变

```
git reset --keep <commit>
```

* 新建一个commit，用来撤销指定commit后者的所有变化都将被前者抵消，并且应用到当前分支

```
git revert <commit>
```

* 暂时将未提交的变化移除，稍后再移入

```
git stash
```
```
git stash pop
```
#### 十、其他

* 生成一个可供发布的压缩包

```
git archive
```


