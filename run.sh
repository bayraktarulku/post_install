#!/usr/bin/env bash
#apt update
#apt upgrade -y

echo
echo "################################"
echo "# Installing packages with APT #"
echo "################################"
echo

xargs -a package_lists/apt_package_list apt install -y

echo
echo "################################"
echo "# Installing packages with PIP #"
echo "################################"
echo

sudo pip3 install --upgrade pip setuptools
xargs -a package_lists/pip_package_list sudo pip3 install

mkdir -p temp

echo
echo "############################"
echo "# Installing Google Chrome #"
echo "############################"
echo

if [ ! -f "temp/google-chrome-stable_current_amd64.deb" ]; then
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O temp/google-chrome-stable_current_amd64.deb
fi

sudo dpkg -i temp/google-chrome-stable_current_amd64.deb

# wget https://packagecontrol.io/Package%20Control.sublime-package -O ~/.config/sublime-text-3/Installed\ Packages/Package\ Control.sublime-package

echo
echo "######################"
echo "# Installing Cerebro #"
echo "######################"
echo

if [ ! -f "temp/cerebro_0.3.0_amd64.deb" ]; then
    wget "https://github.com/KELiON/cerebro/releases/download/v0.3.0/cerebro_0.3.0_amd64.deb" -O "temp/cerebro_0.3.0_amd64.deb"
fi
sudo dpkg -i temp/cerebro_0.3.0_amd64.deb

echo
echo "########################"
echo "# Installing GitKraken #"
echo "########################"
echo

if [ ! -f "temp/gitkraken-amd64.deb" ]; then
    wget "https://release.gitkraken.com/linux/gitkraken-amd64.deb" -O "temp/gitkraken-amd64.deb"
fi
sudo dpkg -i temp/gitkraken-amd64.deb

echo
echo "########################"
echo "# Installing Flameshot #"
echo "########################"
echo

cd temp
git clone https://github.com/lupoDharkael/flameshot
cd flameshot
sudo apt install -y libqt5dbus5, libqt5network5, libqt5core5a, libqt5widgets5, libqt5gui5
sudo apt install -y g++ build-essential qt5-qmake qt5-default qttools5-dev-tools
qmake && make
make install
cd -

echo
echo "###################"
echo "# Installing FUCK #"
echo "###################"
echo

sudo pip3 install thefuck

echo
echo "###################"
echo "# Installing GBSE #"
echo "###################"
echo

git clone https://github.com/jayphelps/git-blame-someone-else.git
cd "git-blame-someone-else"
sudo make install
cd -

echo
echo "########################"
echo "# Installing Oh-My-ZSH #"
echo "########################"
echo

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo
echo "##############################"
echo "# Installing custom binaries #"
echo "##############################"
echo

mkdir -p "$HOME/bin"

echo "Installing GRV..."
wget -O "$HOME/bin/grv" "https://github.com/rgburke/grv/releases/download/v0.1.2/grv_v0.1.2_linux64"
chmod +x "$HOME/bin/grv"

echo "Installing Genact..."
wget -O "$HOME/bin/genact" "https://github.com/svenstaro/genact/releases/download/0.4.0/genact-linux"
chmod +x "$HOME/bin/genact"

echo "Installing Ngrok..."
wget -O "temp/ngrok.zip" "https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip"
unzip "temp/ngrok.zip" -d "$HOME/bin"
chmod +x "$HOME/bin/ngrok"

wget -O "$HOME/bin/template" "https://gist.githubusercontent.com/nejdetckenobi/2cbac6bb069d7107a0d9684f8e052043/raw/cf0c7be799259840308f54273734d088926d1f27/template.sh"

echo "Installing Gecko Driver..."
wget -O "temp/geckodriver.tar.gz" "https://github.com/mozilla/geckodriver/releases/download/v0.20.0/geckodriver-v0.20.0-linux64.tar.gz"
tar -xzf "temp/geckodriver.tar.gz" -C "$HOME/bin"

echo
echo "##################################"
echo "# Installing custom PPA programs #"
echo "##################################"
echo

echo "Adding Peek"
echo "Adding Neofetch"
sudo add-apt-repository --yes ppa:peek-developers/stable
sudo add-apt-repository --yes ppa:dawidd0811/neofetch
sudo apt update

echo "Installing Peek"
echo "Installing Neofetch"
sudo apt install -y peek
sudo apt install -y neofetch
