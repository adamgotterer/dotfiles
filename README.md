# Install

## Bootstrap

Sets up the minimum requirements to install everything else in this repo

`sh bootstrap.sh`

## Install

### Sync to home directory
```
cd path/to/dotfiles
rcup -d $(pwd)/dots
```

### Install brew apps
```
cd path/to/dotfiles/brew/base
brew bundle
```

# Configure

## Git
For local configuration settings create ~/.gitconfig.local

```
[user]
    email = 
    signingkey =
```

## SSH

`sh configure/ssh.sh`

# Tools
Some tools that are installed

### fuck
[https://github.com/nvbn/thefuck](https://github.com/nvbn/thefuck)
Automatically correct command line typos

### fpp
[https://facebook.github.io/PathPicker/](https://facebook.github.io/PathPicker/)

PathPicker from things like git, grep, searches, really anything

### hub
[https://github.com/github/hub](https://github.com/github/hub)

Command line tool that wraps git in order to extend it with extra features and commands that make
working with GitHub easier

Note: See configuration section

### cheat
Manage command line cheat cheats
[https://github.com/chrisallenlane/cheat](https://github.com/chrisallenlane/cheat)
