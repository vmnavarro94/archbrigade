echo "Add minimal starship prompt to terminal"

if archbrigade-cmd-missing starship; then
  archbrigade-pkg-add starship
  cp $ARCHBRIGADE_PATH/config/starship.toml ~/.config/starship.toml
fi
