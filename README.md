# Linux install OhMyZsh &&Powerlevel10k

![343738310-d4987179-f04b-40c2-8706-43c5fbd0a76c](https://github.com/xxx252525/OhMyZsh/assets/104115333/5974a3bb-b54a-4100-b1e5-a9c38be1c172)
![343738013-af1327f9-62b6-4574-aecc-b8886585e788](https://github.com/xxx252525/OhMyZsh/assets/104115333/79e5fa5c-4e05-44a5-a7b0-fc849a3d119f)


## Linux安装ohmyzsh

由于我们所在地区性问题，即使我们使用国际网，我们也无法从官网的命令下载安装脚本，此时就只有手动安装了。

以下两条命令均只有在国外才能使用，国内使用VPN代理业无法安装：

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

### 手动安装Linuxohmyzsh

#### 克隆存储库

```shell
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
```

#### 备份现有 `~/.zshrc` 文件

```shell
cp ~/.zshrc ~/.zshrc.bak
```

####  创建一个新的 zsh 配置文件

```shell
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
```

#### 更改默认 shell

```shell
chsh -s $(which zsh)
```

#### 初始化新的 zsh 配置

打开新的终端窗口后，使用 Oh My Zsh 的配置加载 zsh。
- 如果切换到 `oh-my-zsh` 后找不到某些命令，则可能需要修改 `PATH` in。
- 如果手动安装或更改了安装位置，请检查 中 `ZSH` `~/.zshrc` 的环境变量。



## 配置Powerlevel10k主题和插件

安装主题字体，下载链接如下（建议使用国际网）：

- [MesloLGS NF Regular.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS NF Regular.ttf)
- [MesloLGS NF Bold.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS NF Bold.ttf)
- [MesloLGS NF Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS NF Italic.ttf)
- [MesloLGS NF Bold Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS NF Bold Italic.ttf)

下载主题和插件

```shell
# 下载Powerlevel10k themes
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes
# zsh-autosuggestions自动提示插件
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins
# zsh-syntax-highlighting语法高亮插件
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins
# 额外补全
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/plugins
```

查看目录内是否含有该主题和插件

```shell
ls -als .oh-my-zsh/themes
ls -als .oh-my-zsh/plugins
```

注意：如果你在下载的过程中没有指明路径或者不知道，那么可以采用以下方式

```shell
# 进入主题目录下载主题
cd .oh-my-zsh/themes
# 下载Powerlevel10k themes
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes

# 进入插件目录下载插件
cd ../plugins
# zsh-autosuggestions自动提示插件
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins
# zsh-syntax-highlighting语法高亮插件
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins
# 额外补全
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/plugins
```



### 离线安装主题和插件

如果你的Linux不会科学上网，那么就只有在Windows上面下载好之后通过FTP上传到Linux的用户目录内，然后再进行上面的操作，唯一的不同点就是需要解压压缩包，可以提前在Windows内解压，然后再上传。

Github下载地址如下：

```http
# ohmyzsh地址
https://github.com/ohmyzsh/
# powerlevel10k主题地址
https://github.com/romkatv/powerlevel10k
# zsh-autosuggestions插件地址
https://github.com/zsh-users/zsh-autosuggestions
# zsh-syntax-highlighting插件地址
https://github.com/zsh-users/zsh-syntax-highlighting
# zsh-completions额外补全插件地址
https://github.com/zsh-users/zsh-completions
```

下载好之后都是压缩包，我们需要解压，然后上传。

首先上传ohmyzsh，上传到用户目录后修改目录名称

```shell
# 用户目录为/home/user[user是你的用户名]
sudo mv ohmyzsh-master .oh-my-zsh
```

切换到主题目录，上传解压好的主题目录，然后重命名

```shell
# 进入主题目录下载主题
cd .oh-my-zsh/themes
# 下载Powerlevel10k themes
sudo mv powerlevel10k-master powerlevel10k
```

切换到插件目录，上传解压好的插件目录，然后重命名

```shell
# 进入插件目录下载插件
cd ../plugins
# zsh-autosuggestions自动提示插件
sudo mv zsh-autosuggestions-master zsh-autosuggestions
# zsh-syntax-highlighting语法高亮插件
sudo mv zsh-syntax-highlighting-master zsh-syntax-highlighting
# 额外补全
sudo mv zsh-completions-master zsh-completions
```

然后再进行修改配置文件。



### 天阁创客official脚本一键安装部署

如果你嫌弃麻烦，我这里有一个脚本可以帮你一键部署，建议使用国际网络，建议使用root权限执行。

```shell
# 国际网 [最新]
git clone https://github.com/xxx252525/OhMyZsh.git
# 中国网络加速 [可能不是最新的]
git clone https://gitclone.com/github.com/xxx252525/OhMyZsh.git
# 香港、日本、新加坡加速
git clone https://kkgithub.com/xxx252525/OhMyZsh.git
```

赋予脚本执行权限

```shell
sudo chmod + OhMyZsh/install_ohmyzsh_deb.sh
```

执行脚本

```
sudo ./OhMyZsh/install_ohmyzsh_deb.sh
```

脚本执行完成之后需要手动修改配置文件。



### 修改配置文件

备份.zshrc文件

```shell
sudo cp .zshrc .zshrc.back
```

注意：如果你是使用切换目录的现在方式安装插件主题，那么你需要回到用户目录下备份该配置文件。

查看是否备份成功：

```shell
ls -als
```

我们需要手动修改配置文件

```shell
# 在.zshrc文件开头里面添加以下内容
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# 在文件末尾添加以下内容
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# 修改文本中主题和插件，改为以下内容：

# 修改主题
ZSH_THEME="powerlevel10k/powerlevel10k"
# 启用插件
plugins=(
  git
  adb
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
)
```

重启配置文件或者重启系统

```shell
# 重载配置文件
source .zshrc
# 重启系统
sudo reboot
```

---

如果有需要可以自行设置以下内容：

```shell
# 修改全局配置，对所有的用户生效
echo "/root/.zshrc" >> /etc/zshrc
# 更改新用户的默认shell
cp /etc/default/useradd /etc/default/useradd.back
sed -i 's/^#SHELL=/SHELL=/' /etc/default/useradd
echo "SHELL=/bin/zsh" >> /etc/default/useradd
```

### 



### 





