echo "Fix JetBrains font setting"

if [[ $(archbrigade-font-current) == JetBrains* ]]; then
  archbrigade-font-set "JetBrainsMono Nerd Font"
fi
