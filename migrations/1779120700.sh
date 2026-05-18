echo "Add missing archbrigade.css to walker theme so it loads without errors"

THEME_DIR="$HOME/.local/share/archbrigade/default/walker/themes"
CSS_FILE="$THEME_DIR/archbrigade.css"

if [[ ! -f "$CSS_FILE" ]]; then
  echo "Walker archbrigade.css not found — this should have been included in the update."
  echo "Please run: archbrigade-update-git and try again."
fi

# Restart walker to apply
archbrigade-restart-walker 2>/dev/null || true
