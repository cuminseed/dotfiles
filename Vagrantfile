# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "archlinux/archlinux"
  #config.vm.box_version = ""

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL

# shared directory
	config.vm.synced_folder ".", "/home/vagrant/this"
	if Vagrant::Util::Platform.windows?
	config.vm.synced_folder "c:/drop", "/home/vagrant/drop"
	else
	config.vm.synced_folder "../../..", "/home/vagrant/drop"
	end
# machine settings
	config.vm.provider "virtualbox" do |vb|
	vb.gui = true
	vb.memory = "1024"
	vb.customize ['modifyvm', :id, '--cableconnected1', 'on', "--vram", "256", "--cpus", "4", "--ioapic", "on"]
	end
# port forward
	config.ssh.forward_x11 = true

# provision
	config.vm.provision "shell", privileged: false, inline: <<-SHELL

set -v

# timezone and locale
sudo pacman --noconfirm -S vi
timedatectl set-timezone Asia/Tokyo
locale -a
printf "%s\n%s\n%s\n%s\n%s" "f /etc/locale.gen" "r" "g/^#ja/s/^#//g" 'w!' "q" | sudo ex -e
sudo locale-gen

# update
sudo pacman --noconfirm -Syuu

# dotfiles
sudo pacman --noconfirm -S git
cd ~
git clone https://github.com/cuminseed/dotfiles.git -b master

# yay
sudo pacman --noconfirm -S base-devel
cd ~ && git clone https://aur.archlinux.org/yay
cd yay && makepkg -si --noconfirm && cd .. && rm -rf yay
yay -Syu --noconfirm

# make symlinks
ln -s ${HOME}/Dropbox ${HOME}/drop
ln -s ${HOME}/drop/docs ${HOME}/docs
ln -s ${HOME}/docs/work.org ${HOME}/work.org
ln -s ${HOME}/dotfiles/.vim ${HOME}/.vim
ln -s ${HOME}/dotfiles/.vimrc ${HOME}/.vimrc
ln -s ${HOME}/dotfiles/.emacs.d ${HOME}/.emacs.d
ln -s ${HOME}/dotfiles/.zsh ${HOME}/.zsh
ln -s ${HOME}/dotfiles/.zshrc ${HOME}/.zshrc
ln -s ${HOME}/dotfiles/.tmux.conf ${HOME}/.tmux.conf
ln -s ${HOME}/dotfiles/.xinitrc ${HOME}/.xinitrc
ln -s ${HOME}/docs/program ${HOME}/program
ln -s ${HOME}/docs/haishin ${HOME}/haishin

# copy this to that
cd ~
cp -a this that && rm -rf that/.vagrant

# install packages
sudo pacman --noconfirm -S tmux vim emacs
sudo pacman --noconfirm -S wget docker
sudo pacman --noconfirm -S gdb boost gmock global
sudo pacman --noconfirm -S gauche guile
sudo pacman --noconfirm -S net-tools neofetch
sudo pacman --noconfirm -S gtkmm3
sudo pacman --noconfirm -S xorg-xinit xorg-server xterm xorg-xrandr
sudo pacman --noconfirm -S jq meld

# python
python -m pip --version
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
python -m pip install autopep8 opencv-python
python -m pip install pyocr

# install dwm-git
cd ~ && git clone https://aur.archlinux.org/dwm-git.git
cd dwm-git
makepkg --nobuild
#sed -i -e '/^#define MODKEY/s/Mod1/Mod4/g' src/dwm/config.def.h
makepkg --noextract --syncdeps --install --noconfirm
cd ..

# install st-git
cd ~ && git clone https://aur.archlinux.org/st-git.git
cd st-git
makepkg --nobuild
sed -i -e 's/st-256color/xterm-color/g' src/st/config.def.h
sed -i -e 's/Liberation Mono/Myrica M/g' src/st/config.def.h
sed -i -e 's/pixelsize=12/pixelsize=24/g' src/st/config.def.h
makepkg --noextract --syncdeps --install --noconfirm
cd ..

# install japanese font
yay --noconfirm -S ttf-myrica

# install im
sudo pacman --noconfirm -S fcitx-mozc

# config fcitx
fcitx -D &
pkill fcitx
sed -i -e 's/^\\(TriggerKey.*\\)/#\\1/' ~/.config/fcitx/config
sed -i -e 's/^#\\(ActivateKey=\\)/\\1HENKANMODE/' ~/.config/fcitx/config
sed -i -e 's/^#\\(InactivateKey=\\)/\\1MUHENKAN/' ~/.config/fcitx/config
sed -i ~/.config/fcitx/config

# x settings
sed -i -e '1ifcitx &' ~/.xinitrc
sed -i -e '1iexport XMODIFIERS=@im=fcitx' ~/.xinitrc
sed -i -e '1iexport QT_IM_MODULE=fcitx' ~/.xinitrc
sed -i -e '1iexport GTK_IM_MODULE=fcitx' ~/.xinitrc
sed -i -e '1isetxkbmap -layout jp' ~/.xinitrc
sed -i -e "1ixrandr --output VGA-1 --auto" ~/.xinitrc

# install zsh and z
sudo pacman --noconfirm -S zsh z

# install bd
cd ~ && git clone https://aur.archlinux.org/bd-git.git
cd bd-git && makepkg -si --noconfirm && cd .. && rm -rf bd-git

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# chsh
sudo pacman --noconfirm -S expect
cd ~
cat << EOC > changeShell.sh
`which expect` << EOF
spawn chsh $USER -s `which zsh`
expect "Password:"
send "vagrant\\r"
expect "~]"
exit
EOF
EOC
chmod +x changeShell.sh
./changeShell.sh
cd ~ && rm changeShell.sh

SHELL

end
