echo "Switch shell prompt to agnosterzak (oh-my-zsh powerline theme)"

# Install agnosterzak theme
if [[ -d "$HOME/.oh-my-zsh/themes" ]]; then
  cp "$ARCHBRIGADE_PATH/default/zsh/agnosterzak.zsh-theme" "$HOME/.oh-my-zsh/themes/agnosterzak.zsh-theme"
fi

# Add oh-my-zsh block to ~/.zshrc if not already present
if ! grep -q "agnosterzak" "$HOME/.zshrc"; then
  cat >> "$HOME/.zshrc" << 'EOF'

# oh-my-zsh with agnosterzak (replaces Starship)
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnosterzak"
plugins=(git)
source $ZSH/oh-my-zsh.sh
precmd_functions=(${precmd_functions:#*starship*})
preexec_functions=(${preexec_functions:#*starship*})
EOF
fi
