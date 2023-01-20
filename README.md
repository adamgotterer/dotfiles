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

### Configure ZSH
`bash scripts/ohmyzsh.sh`

### Install brew apps
```
cd path/to/dotfiles/brew/base
brew bundle

### Improve the quality of the MacOS spellchecker
sh scripts/spelling.sh
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

### cheat
Manage command line cheat cheats
[https://github.com/chrisallenlane/cheat](https://github.com/chrisallenlane/cheat)

### fd
Search alternative to `find`
[https://github.com/sharkdp/fd/](https://github.com/sharkdp/fd/)

### fpp
[https://facebook.github.io/PathPicker/](https://facebook.github.io/PathPicker/)
PathPicker from things like git, grep, searches, really anything

### NCDU
[https://dev.yorhel.nl/ncdu](https://dev.yorhel.nl/ncdu)
Alternative to `du` for recursively analyzing disk usage

### tldr
[https://tldr.sh](https://tldr.sh)
Simplified and community-driven man pages
