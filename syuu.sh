set -v

# パッケージ更新
sudo pacman -Syuu --noconfirm

# ifconfig eth0
# base-devel は yay の makepkg で必要
# vim は /etc/pacman.d/mirrorlist の modify に使う
# git は yay の clone で必要
sudo pacman -S --noconfirm base-devel vim git

# mirrorlist で Japan を先頭に持ってくる
sudo vim -e /etc/pacman.d/mirrorlist -c 'g/Japan/;+1m0' -c 'wq!'

# yay のインストール
git clone https://aur.archlinux.org/yay
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# パッケージの更新
yay -Syu --noconfirm

