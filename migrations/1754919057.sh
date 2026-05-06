echo "Improve tooltip for ArchBrigade menu icon"

if grep -q "SUPER + ALT + SPACE" ~/.config/waybar/config.jsonc; then
  sed -i 's/SUPER + ALT + SPACE/ArchBrigade Menu\\n\\nSuper + Alt + Space/' ~/.config/waybar/config.jsonc
fi
