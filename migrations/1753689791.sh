echo "Add the new ristretto theme as an option"

if [[ ! -L ~/.config/archbrigade/themes/ristretto ]]; then
  ln -nfs ~/.local/share/archbrigade/themes/ristretto ~/.config/archbrigade/themes/
fi
