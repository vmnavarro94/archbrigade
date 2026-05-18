echo "Fix SUPER+SHIFT+R firing two screen record commands simultaneously"

# The default utilities.conf had SUPER+SHIFT+R bound to the direct recorder.
# bindings.conf also bound the same key to the menu, causing both to fire.
# Fix: add an unbind before the menu binding so only the menu fires.

BINDINGS="$HOME/.config/hypr/bindings.conf"

if [[ -f "$BINDINGS" ]] && grep -q 'archbrigade-cmd-screenrecord-menu' "$BINDINGS" && ! grep -q '^unbind = SUPER SHIFT, R' "$BINDINGS"; then
  sed -i '/^bindd = SUPER SHIFT, R, Screen record (audio menu)/ i\unbind = SUPER SHIFT, R' "$BINDINGS"
fi
