#!/usr/bin/env bash

set -e

source "$(pwd)/scripts/util.sh"

ZSH="${HOME}/.oh-my-zsh"
ZSH_CUSTOM="${ZSH}/custom"

do_install() {
    if [[ -d "${ZSH}" ]]; then
        info "[ohmyzsh] Already installed"
        return
    fi

    info "[ohmyzsh] Install"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
}

do_configure() {
    info "[ohmyzsh] Configure"
    info "[ohmyzsh][configure] Download plugins"
    declare -A plugins=(
        ["plugins/fast-syntax-highlighting"]="https://github.com/zdharma/fast-syntax-highlighting"
        ["plugins/zsh-autosuggestions"]="https://github.com/zsh-users/zsh-autosuggestions"
        ["plugins/fzf-tab"]="https://github.com/Aloxaf/fzf-tab"
        ["plugins/zsh-completions"]="https://github.com/zsh-users/zsh-completions"
        ["themes/powerlevel10k"]="https://github.com/romkatv/powerlevel10k"
    )
    for path in "${!plugins[@]}"; do
        if [[ ! -d "${ZSH_CUSTOM}/$path" ]]; then
            git clone "${plugins[$path]}" "${ZSH_CUSTOM}/$path"
        fi
    done
}

do_install
do_configure
