echo "Add new matte black theme"

if [[ ! -L "~/.config/archbrigade/themes/matte-black" ]]; then
  ln -snf ~/.local/share/archbrigade/themes/matte-black ~/.config/archbrigade/themes/
fi
