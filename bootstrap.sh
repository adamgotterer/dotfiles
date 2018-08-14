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
