echo "Install oh-my-zsh and agnosterzak prompt for existing installs"

# Install oh-my-zsh if missing
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install agnosterzak theme
if [[ -d "$HOME/.oh-my-zsh/themes" ]]; then
  cp "$ARCHBRIGADE_PATH/default/zsh/agnosterzak.zsh-theme" "$HOME/.oh-my-zsh/themes/agnosterzak.zsh-theme"
fi

# Remove the old migration-appended agnosterzak block (if present) since default/zshrc now includes it
# Only remove the block if it was appended by the old migration (not user-customized)
if grep -q '# oh-my-zsh with agnosterzak (replaces Starship)' "$HOME/.zshrc" 2>/dev/null; then
  sed -i '/# oh-my-zsh with agnosterzak (replaces Starship)/,/preexec_functions=.*starship.*/{
    /# oh-my-zsh with agnosterzak/d
    /export ZSH=/d
    /ZSH_THEME="agnosterzak"/d
    /^plugins=(git)/d
    /source \$ZSH\/oh-my-zsh.sh/d
    /precmd_functions=.*starship.*/d
    /preexec_functions=.*starship.*/d
  }' "$HOME/.zshrc"
fi

echo "oh-my-zsh + agnosterzak ready. Open a new terminal to see the new prompt."
