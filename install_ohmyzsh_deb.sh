#!/bin/bash
# 更新软件包索引
apt update
# 安装Z shell
apt install -y zsh
# 下载Oh My Zsh安装脚本
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
# 检查Oh My Zsh仓库目录是否存在
if [ ! -d "~/.oh-my-zsh" ]; then
  echo "Oh My Zsh仓库克隆失败。"
  # 尝试使用第二个命令克隆Oh My Zsh仓库
  git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
fi
# 备份
sudo cp .zshrc .zshrc.bak
# 复制配置文件到根目录
sudo cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
# 切换默认shell为zsh
chsh -s $(which zsh)
# 修改全局配置，对所有的用户生效
echo "/root/.zshrc" >> /etc/zshrc
# 更改新用户的默认shell
cp /etc/default/useradd /etc/default/useradd.back
sed -i '8,11 s/^/# /' /etc/default/useradd
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
# 切换到根目录
cd ~/
# 配置.zshrc文件
sudo cp .zshrc .zshrc.back

# 安装完成
echo "Zsh, Oh My Zsh, Powerlevel10k, zsh-autosuggestions, zsh-syntax-highlighting, and zsh-completions have been installed and configured."
exit 0
