#!/bin/bash

# Install oh-my-zsh (unattended — no chsh, no zsh restart)
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install agnosterzak theme
if [[ -d "$HOME/.oh-my-zsh/themes" ]]; then
  cp "$ARCHBRIGADE_PATH/default/zsh/agnosterzak.zsh-theme" "$HOME/.oh-my-zsh/themes/agnosterzak.zsh-theme"
fi
