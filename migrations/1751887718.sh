echo "Install Impala as new wifi selection TUI"

if archbrigade-cmd-missing impala; then
  archbrigade-pkg-add impala
  archbrigade-refresh-waybar
fi
