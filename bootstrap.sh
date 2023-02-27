# Before running this script:
# sudo chrown -R evan /usr/local
# sudo echo '/usr/local/bin/bash' >> /etc/shells

# make in case they aren't already there
mkdir -p "/usr/local/lib"
mkdir -p "/usr/local/bin"

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
  export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
  export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
  export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"
  ruby -c "$(curl -fsSL https://github.com/Homebrew/install/raw/HEAD/install.sh)"
fi

# Update homebrew recipes
brew update

# Install and use latest bash
brew install bash
chsh -s /usr/local/bin/bash

# Install git
# brew install git
# Some git defaults
git config --global color.ui true
git config --global push.default simple

# Install n
echo "Installing n..."
brew install n
# use n to install nodejs lts version 
n lts

# Centralize global npm packages for different node versions
echo "prefix = /usr/local" > ~/.npmrc

# Install common use global Node modules
modules=(
  http-server
  webpack
  pnpm
  yarn
  @quasar/cli
  esno
)

echo "installing global node modules..."
npm install -g ${modules[@]}

# Install Brew Cask
echo "Installing brew cask..."
brew install caskroom/cask/brew-cask

# Apps
apps=(
  google-chrome
  microsoft-edge
  iterm2
  sublime-text3
  sogouinput
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# clone this repo
git clone https://github.com/dongwa/system-preset ~/.dotfiles

# Source dot files
echo '. ~/.dotfiles/bash/.profile' >> ~/.profile
source ~/.profile