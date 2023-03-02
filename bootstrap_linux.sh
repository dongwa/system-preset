#!/bin/bash

# make in case they aren't already there
mkdir -p "/usr/local/lib"
mkdir -p "/usr/local/bin"

sudo apt-get update -y
# Install npm
echo "Installing git,curl and npm..."
sudo apt-get install git curl npm -y

# brew install git
# Some git defaults
git config --global color.ui true
git config --global push.default simple


# Install common use global Node modules
modules=(
  http-server
  webpack
  pnpm
  yarn
  @quasar/cli
  esno
  n
)

echo "installing global node modules..."
sudo npm install -g ${modules[@]}

# use n to install nodejs lts version 
sudo n lts

# Centralize global npm packages for different node versions
# echo "prefix = /usr/local" > ~/.npmrc

# Apps
apps=(
  microsoft-edge-stable
  fcitx-googlepinyin
  code
  vim
  # xiaomi-miwork-stable #小米办公
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
sudo apt-get install ${apps[@]} -y

# clone this repo
git clone https://github.com/dongwa/system-preset ~/.dotfiles

# Source dot files
echo '. ~/.dotfiles/bash/.profile' >> ~/.bashrc
source ~/.bashrc