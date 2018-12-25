#!/bin/bash
set -x
apt update && apt -y upgrade

echo "Start installing custom desktop software"

### Appearance
apt install -y gnome-tweak-tool #(install dash to panel and firefox gnome extension)
apt install -y chrome-gnome-shell #(yes chrome, even if it's for firefox)

### Tools required for installing other software
#apt install -y curl
apt install -y git

### Shell
apt install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

### Text editor
apt install -y neovim
curl -sLf https://spacevim.org/install.sh | bash    #vim .SpaceVim.d/init.toml    java layer, nerdtreee option

apt install fonts-powerline    #then change in gnome-tweaks the font to roboto for powerline

### Other software
apt install -y vlc neofetch entr ddgr googler
apt install rofi # needs shortcut created (rofi -show window)

### Setup development environments
#JAVA
curl -s "https://get.sdkman.io" | bash
sdk install java 11.0.1-open
sdk install java 1.0.0-rc-10-grl
sdk install maven
sdk install micronaut
sdk install springboot

#RUST
curl https://sh.rustup.rs -sSf | sh

#GO
curl -O https://dl.google.com/go/go1.11.4.linux-amd64.tar.gz
tar -xvf go1.11.2.linux-amd64.tar.gz
mv go /usr/local
mkdir ~/go_projects

cat << EOF >> ~/.profile
export GOPATH=$HOME/go_projects
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
EOF

rm go1.11.4.linux-amd64.tar.gz

#DOCKER
apt install docker.io
docker pull oracle/graalvm-ce:1.0.0-rc10


source ~/.profile

echo "Enjoy your new system!"