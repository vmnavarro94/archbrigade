echo "Update Waybar CSS to dim unused workspaces"

if ! grep -q "#workspaces button\.empty" ~/.config/waybar/style.css; then
  archbrigade-refresh-config waybar/style.css
  archbrigade-restart-waybar
fi
