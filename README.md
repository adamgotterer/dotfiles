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

### Iterm Key Bindings
Go to`Preference -> Profile -> Default -> Keys`

Click "Import" on the Presets dropdown

Import `path/to/dotfiles/configure/iterm_keyboard.itermkeymap`

# Configure

## Git
For local configuration settings create ~/.gitconfig.local

```
[user]
    email = 
    signingkey =
```

## Coding Agent github Machine Account
Setup this alias to provide Claude Code (or any CLI coding tool) it's own GH account

Create `~/.zsh_local`
Set GH_TOKEN to a Github [Personal Access Token](https://github.com/settings/personal-access-tokens)

```
alias claude-analect='GIT_AUTHOR_NAME="Bot Name" \
GIT_AUTHOR_EMAIL="bot@example.com" \
GIT_COMMITTER_NAME="Bot Name" \
GIT_COMMITTER_EMAIL="bot@example.com" \
GIT_SSH_COMMAND="ssh -i ~/.ssh/id_ed25519_bot -o IdentitiesOnly=yes" \
GH_TOKEN="..." \
claude'
```


## SSH

`sh configure/ssh.sh`

## Iterm2 Preferences
Go to preferences -> general -> Preferences
Check "Load preferences from a custom folder or URL"
Change the folder to Dotfiles/iterm

## QuickLook
Open /Applications/syntax-highlight.app one time to add it to the QuickLook extension.
Open Settings -> Login Items & Extensions -> QuickLook  -- then enable Syntax0highlight

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
