#!/bin/bash
#！！！请在root用户下进行操作，执行前请赋予执行权限！！！

# 更新软件包索引
yum update || dnf update
# 安装Z shell
yum install -y zsh || sudo dnf install -y zsh
# 切换默认shell为zsh
chsh -s $(which zsh)

# 下载Oh My Zsh安装脚本
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
# 检查Oh My Zsh仓库目录是否存在
if [ ! -d "~/.oh-my-zsh" ]; then
  echo "Oh My Zsh仓库克隆失败。"
  # 尝试使用第二个命令克隆Oh My Zsh仓库
  git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
fi

# 复制配置文件到根目录
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

# 修改全局配置，对所有的用户生效
echo "/root/.zshrc" >> /etc/zshrc

# 更改新用户的默认shell
cp /etc/default/useradd /etc/default/useradd.back
sed -i 's/^#SHELL=/SHELL=/' /etc/default/useradd
echo "SHELL=/bin/zsh" >> /etc/default/useradd

# 查看当前目录隐藏文件
ls -als

# 切换到ohmyzsh主题目录
cd ~/.oh-my-zsh/themes

# 克隆Powerlevel10k主题
git clone https://github.com/romkatv/powerlevel10k.git
# 检查Powerlevel10k主题是否存在
if [ ! -d "powerlevel10k" ]; then
  echo "Powerlevel10k主题克隆失败。"
  exit 1
fi

# 查看当前目录隐藏文件
ls -als

# 切换到ohmyzsh插件目录
cd ~/.oh-my-zsh/plugins

# 克隆zsh-autosuggestions插件
git clone https://github.com/zsh-users/zsh-autosuggestions
# 克隆zsh-syntax-highlighting插件
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
# 克隆zsh-completions插件
git clone https://github.com/zsh-users/zsh-completions

# 检查克隆的目录是否存在
if [ ! -d "zsh-autosuggestions" ]; then
  echo "克隆zsh-autosuggestions插件失败。"
  exit 1
fi
if [ ! -d "zsh-syntax-highlighting" ]; then
  echo "克隆zsh-syntax-highlighting插件失败。"
  exit 1
fi
if [ ! -d "zsh-completions" ]; then
  echo "克隆zsh-completions插件失败。"
  exit 1
fi

# 所有插件克隆成功
echo "成功克隆所有插件!"

# 配置.zshrc文件
cp ~/.zshrc ~/.zshrc.back

# 注释原来的内容
sed -i '11i # This is line 11' ~/.zshrc
sed -i '73i # This is line 73' ~/.zshrc

# 添加配置
sed -i '/plugins=/a \
# Powerlevel10k主题配置
ZSH_THEME="powerlevel10k/powerlevel10k"
# 插件配置
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)
# Powerlevel10k配置命令
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi' ~/.zshrc

# 重新加载配置文件
source ~/.zshrc

# 安装完成
echo "Zsh, Oh My Zsh, Powerlevel10k, zsh-autosuggestions, zsh-syntax-highlighting, and zsh-completions have been installed and configured."
