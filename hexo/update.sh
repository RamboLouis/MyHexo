# !/bin/bash

# 计时
SECONDS=0

echo "\033[36;1m 👻 👀 🚀  开始生成静态界面 👻 👀 🚀  \033[0m"
hexo g
echo "\033[36;1m 👻 👀 🚀 开始生成同步 👻 👀 🚀  \033[0m"
hexo d

# 输出打包总用时
echo "\033[36;1m 👏 👏 👏 同步成功,总用时: $SECONDS 秒 👏 👏 👏 \033[0m"
