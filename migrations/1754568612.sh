echo "Update Waybar config to fix path issue with update-available icon click"

if grep -q "alacritty --class ArchBrigade --title ArchBrigade -e archbrigade-update" ~/.config/waybar/config.jsonc; then
  sed -i 's|\("on-click": "alacritty --class ArchBrigade --title ArchBrigade -e \)archbrigade-update"|\1archbrigade-update"|' ~/.config/waybar/config.jsonc
  archbrigade-restart-waybar
fi
