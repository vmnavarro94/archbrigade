echo "Update ArchBrigade logo: fix A in BRIGADE to have pointy top matching ARCH"

archbrigade-refresh-config fastfetch/config.jsonc 2>/dev/null || true

mkdir -p ~/.config/archbrigade/branding
cp "$ARCHBRIGADE_PATH/logo.txt" ~/.config/archbrigade/branding/screensaver.txt
cp "$ARCHBRIGADE_PATH/icon.txt" ~/.config/archbrigade/branding/about.txt
