set -v

if [ `uname -n` = 'archlinux' ]; then
	sudo pacman -S --noconfirm net-tools neofetch
	sudo pacman -S --noconfirm gtkmm3
	sudo pacman -S --noconfirm xorg-xinit xorg-server xterm
	sudo pacman -S --noconfirm jq meld
else
	# no operation for now
	:
fi

