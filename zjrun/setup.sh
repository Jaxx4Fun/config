#!/bin/sh
# mock_dir = "~/test_setup/"
# 常用软件列表
install_arr=(
    "alacritty"
    "anaconda"
    "fcitx"
    "fcitx-configtool"
    "fcitx-googlepinyin"
    "fcitx-qt5"
    "firefox"
    "fish"
    "google-chrome"
    "neovim"
    "papirus-icon-theme"
    "visual-studio-code-bin"
    "yay"
    "ipython"
    "variety"
    "archlinuxcn-keyring"
    "netease-cloud-music"
    "nodejs"
    "npm"
    "typora"
    "ranger"
    "nerd-font-complete"
    "tmux"
)

# 设置镜像源
sudo cp -rf pacman.d/* /etc/pacman.d/
if [ $(grep /etc/pacman.conf)];
then
    echo -e "[archlinuxcn]\nInclude = /etc/pacman.d/archlinuxcn"
fi

set -x
# 安装
sudo pacman -S ${install_arr[*]}

# home下的中文路径改为英文
LANG=en_US;xdg-user-dirs-update


# 安装fish和omf
chsh -s /usr/bin/fish
cd ~
git clone  https://github.com/Johnny4Fun/.config.git config
git clone https://gitee.com/zhangdasuan4fun/oh-my-fish.git
(cd oh-my-fish;bin/install  --offline)
cp -r config/* .config/

# 安装字体
sudo pacman -S noto-fonts-cjk adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts
sudo pacman -S ttf-roboto noto-fonts ttf-dejavu
sudo pacman -S wqy-bitmapfont wqy-microhei wqy-microhei-lite wqy-zenhei
sudo pacman -S wqy-microhei

#tmux plugin management
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp ./.tmux.conf ~/
