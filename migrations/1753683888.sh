echo "Adding ArchBrigade version info to fastfetch"
if ! grep -q "archbrigade" ~/.config/fastfetch/config.jsonc; then
  cp ~/.local/share/archbrigade/config/fastfetch/config.jsonc ~/.config/fastfetch/
fi

