#!/bin/sh

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install RCM to manage dotfiles
brew tap thoughtbot/formulae
brew install rcm

# install Xcode Command Line Tools
xcode-select --install

# Install the latest MacOS updates
sudo softwareupdate -i -a

# Install oh-my-zsh
ZSH="${HOME}/.oh-my-zsh"
ZSH_CUSTOM="${ZSH}/custom"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
