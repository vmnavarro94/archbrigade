echo "Update Waybar for new ArchBrigade menu"

if ! grep -q "" ~/.config/waybar/config.jsonc; then
  archbrigade-refresh-waybar
fi
