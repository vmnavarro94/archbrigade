echo "Update fastfetch config with new ArchBrigade logo"

archbrigade-refresh-config fastfetch/config.jsonc

mkdir -p ~/.config/archbrigade/branding
cp $ARCHBRIGADE_PATH/icon.txt ~/.config/archbrigade/branding/about.txt
