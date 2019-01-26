#!/bin/bash

if [[ $EUID -ne 0 ]];
then
	echo "Need root"
	echo "$EUID"
	[ $PS1 ] && return || exit;
fi

install() {
	sudo apt-get install -qq --yes $*
	echo "Installed " . $*
}

uninstall () {
	sudo apt-get --yes --purge remove $*
	echo "Uninstalled " . $*
}


solarized_terminal () {
	echo "Activating Solarized Dark";
	su - n -c "git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git && ~/gnome-terminal-colors-solarized/set_dark.sh && echo eval \\\`dircolors ~/.dir_colors/dircolors\\\` >> ~/.bashrc";
}

solarized_vim() {
	echo "Installing vim solarized theme";
}

vim_setup() {
	echo "Installing vim dotfiles";
	su - n -c "git clone https://github.com/ryan-endacott/dotfiles && ~/dotfiles/makelinks.sh"
}


setup_python() {
  install python-pip
  install python3-pip
  pip install --upgrade pip setuptools
  pip3 install --upgrade pip setuptools
  pip3 install --upgrade httpie
}

apt-get update
install ack-grep
install autoconf
install binutils
install build-essential
install clang
install cmake
install curl
install libc6:i386 || true
install libc6-dbg:i386 || true
install libc6-dev-i386 || true
install dpkg-dev
install gdb
install gdb-multiarch || true
install git-core
install mercurial
install nasm
install nmap
install ntp
install qemu-system\* || true
install qemu-user
install rar || true
install socat
install ssh
install subversion
install tmux
install vim
install unzip

solarized_terminal
setup_python
