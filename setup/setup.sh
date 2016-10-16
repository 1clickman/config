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

uninstall_default() {
	uninstall aisleriot
	uninstall gnome-mahjongg
	uninstall gnome-mines
	uninstall gnome-soduku
	uninstall gnomine
	uninstall libreoffice-*
	uninstall firefox
	unisntall firefox-locale-en
	uninstall unity-scope-firefoxbookmarks
	uninstall xul-ext-webaccounts
	uninstall update-notifier
	uninstall update-notifier-common
	unisntall update-manager
	uninstall update-manager-core
	uninstall python3-update-manager
	uninstall unity-webapps-common
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

install_chrome() {
	wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" -P ~/Downloads
	dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb
	apt-get install -f
}

disable_unity_search_online() {
	gsettings set com.canonical.Unity.Lenses remote-content-search 'none'
}


setup_python() {
  install python-pip
  install python3-pip
  pip install --upgrade pip setuptools
  pip3 install --upgrade pip setuptools
  pip3 install --upgrade httpie
}

# Uninstall some default ubuntu packages
uninstall_default

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
install libbz2-dev
install libc6-dev
install libexpat1-dev
install libgdbm-dev
install libglib2.0-dev # unicorn
install libgmp-dev
install liblzma-dev # binwalk
install libncurses5-dev
install libpcap0.8{,-dev}
install libpng-dev
install libpq-dev
install libpython2.7:i386 || true # IDA python
install libreadline6-dev
install libsqlite3-dev
install libssl-dev
install libssl0.9.8:i386 || true # IDA python
install libssl1.0.0:i386 || true # IDA python
install libtool
install libxml2
install libxml2-dev
install libxslt1-dev
install "linux-headers-$(uname -r)"
install llvm
install mercurial
install nasm
install nmap
install nodejs
install npm
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
install_chrome
disable_unity_search_online
setup_python
