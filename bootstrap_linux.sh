#!/bin/bash

# use sudo to run this sh

# make in case they aren't already there
mkdir -p "/usr/local/lib"
mkdir -p "/usr/local/bin"

apt-get update   
apt-get install git curl

# brew install git
# Some git defaults
git config --global color.ui true
git config --global push.default simple

# Install npm
echo "Installing npm..."
apt-get install npm

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
npm install -g ${modules[@]}

# use n to install nodejs lts version 
n lts

# Centralize global npm packages for different node versions
# echo "prefix = /usr/local" > ~/.npmrc

# Apps
apps=(
  microsoft-edge-stable
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
apt-get install ${apps[@]}

# clone this repo
git clone https://github.com/dongwa/system-preset ~/.dotfiles

# Source dot files
echo '. ~/.dotfiles/bash/.profile' >> ~/.profile
source ~/.profile