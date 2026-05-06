echo "Start screensaver automatically after 1 minute and stop before locking"

if ! grep -q "archbrigade-launch-screensaver" ~/.config/hypr/hypridle.conf; then
  archbrigade-refresh-hypridle
  archbrigade-refresh-hyprlock
fi
