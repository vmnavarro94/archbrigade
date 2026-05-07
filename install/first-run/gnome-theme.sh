gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
gsettings set org.gnome.desktop.interface icon-theme "Yaru-blue"

# Write GTK3 settings file explicitly (some apps don't read gsettings)
mkdir -p ~/.config/gtk-3.0
cat > ~/.config/gtk-3.0/settings.ini << 'GTKEOF'
[Settings]
gtk-theme-name=Adwaita-dark
gtk-application-prefer-dark-theme=1
gtk-icon-theme-name=Yaru-blue
gtk-cursor-theme-name=Adwaita
gtk-cursor-theme-size=24
GTKEOF

# GTK4
mkdir -p ~/.config/gtk-4.0
cat > ~/.config/gtk-4.0/settings.ini << 'GTKEOF'
[Settings]
gtk-application-prefer-dark-theme=1
gtk-theme-name=Adwaita-dark
GTKEOF

sudo gtk-update-icon-cache /usr/share/icons/Yaru 2>/dev/null || true
