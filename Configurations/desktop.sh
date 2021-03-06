#!/bin/bash
#
#   Andrei Lorin's custom Ubuntu desktop setup
#   andreilorin.com
#   github.com/andreilorin
#   twitter.com/andreilorin
#

# Variables
USERNAME=`logname`

# Check for curl
echo "Looking for curl..."
if [[ -z $(which curl) ]]; then
	echo "Curl not found."
	echo ""
	echo "======================================================================================================"
	echo " Please install curl on your system using your favourite package manager."
	echo ""
	echo " Restart after installing curl."
	echo "======================================================================================================"
	echo ""
	exit 0
fi

echo "Start installing custom desktop software"

### Appearance
apt install -y gnome-tweak-tool #(install dash to panel and firefox gnome extension)
apt install -y chrome-gnome-shell #(yes chrome, even if it's for firefox)

### Tools required for installing other software
#apt install -y curl
apt install -y git
apt install build-essential

### Text editor
apt install -y neovim
su -c "curl -sLf https://spacevim.org/install.sh | bash" $USERNAME    #vim .SpaceVim.d/init.toml    java layer, nerdtreee option

apt install fonts-powerline    #then change in gnome-tweaks the font to roboto for powerline

### Other software
apt install -y vlc neofetch entr ddgr googler rofi youtube-dl
apt install rofi
xbindkeys

### Setup development environments
#JAVA
su -c "curl -s https://get.sdkman.io | bash" $USERNAME
#sdk install java 11.0.1-open
#sdk install java 1.0.0-rc-10-grl
#sdk install maven
#sdk install micronaut
#sdk install springboot


#RUST
su -c "curl https://sh.rustup.rs -sSf | bash" $USERNAME ############################################### need to pass 1 to this retest

#GO
curl -O https://dl.google.com/go/go1.11.4.linux-amd64.tar.gz
tar -xvf go1.11.4.linux-amd64.tar.gz
mv go /usr/local
mkdir ~/go_projects

#REDIS
wget
tar
cd
make

cd

cat << EOF >> ~/.profile
export GOPATH=$HOME/go_projects
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
EOF

rm go1.11.4.linux-amd64.tar.gz

#DOCKER
su -c "apt install -y docker.io" root
docker pull oracle/graalvm-ce:1.0.0-rc10

### Shell
apt install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#source ~/.profile

#echo "Enjoy your new system!"