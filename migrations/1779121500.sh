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

# Remove the old migration-appended agnosterzak block (if present), but ONLY
# when ~/.zshrc also contains the current default/zshrc prompt block ("# Shell
# prompt (oh-my-zsh + agnosterzak powerline theme)"), which fresh installs get
# as a copy of default/zshrc. Existing installs' ~/.zshrc sources
# default/zsh/rc instead, which does NOT include the prompt block — stripping
# the old block there would leave the user with a bare prompt.
if grep -q '# oh-my-zsh with agnosterzak (replaces Starship)' "$HOME/.zshrc" 2>/dev/null &&
  grep -q '# Shell prompt (oh-my-zsh + agnosterzak powerline theme)' "$HOME/.zshrc" 2>/dev/null; then
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
