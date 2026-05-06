echo "Add new ArchBrigade Menu icon to Waybar"

mkdir -p ~/.local/share/fonts
cp ~/.local/share/archbrigade/config/archbrigade.ttf ~/.local/share/fonts/
fc-cache
