echo "Replace volume control GUI with a TUI"

if archbrigade-cmd-missing wiremix; then
  archbrigade-pkg-add wiremix
  archbrigade-pkg-drop pavucontrol
  archbrigade-refresh-applications
  archbrigade-refresh-waybar
fi
