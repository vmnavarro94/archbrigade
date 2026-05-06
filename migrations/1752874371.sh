echo "Add Catppuccin Latte light theme"

if [[ ! -L "~/.config/archbrigade/themes/catppuccin-latte" ]]; then
  ln -snf ~/.local/share/archbrigade/themes/catppuccin-latte ~/.config/archbrigade/themes/
fi
