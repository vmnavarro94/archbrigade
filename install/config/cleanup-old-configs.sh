# Remove old HyprBrigade/HyDE configs and packages that conflict with ArchBrigade

# Remove HyprBrigade packages if installed
HYPRBRIGADE_PKGS=(rofi nwg-look nwg-displays awww wlogout swww hyprshot waybar-hyprland dunst swaylock hyprpaper wofi thunar thunar-archive-plugin thunar-volman mousepad vim vim-runtime alacritty)
for pkg in "${HYPRBRIGADE_PKGS[@]}"; do
  if pacman -Q "$pkg" &>/dev/null; then
    echo "Removing HyprBrigade package: $pkg"
    sudo pacman -R --noconfirm "$pkg" 2>/dev/null || true
  fi
done

# Waybar - replace entirely with ArchBrigade
rm -rf ~/.config/waybar
mkdir -p ~/.config/waybar
cp ~/.local/share/archbrigade/config/waybar/* ~/.config/waybar/ 2>/dev/null || true

# Hypr - remove old theme config dirs but keep user files
rm -rf ~/.config/hypr/configs
rm -rf ~/.config/hypr/UserConfigs
rm -rf ~/.config/hypr/wallpaper_effects
rm -rf ~/.config/hypr/wallust
rm -rf ~/.config/hypr/animations
rm -rf ~/.config/hypr/Monitor_Profiles
rm -rf ~/.config/hypr/scripts
rm -rf ~/.config/hypr/UserScripts
rm -rf ~/.config/hypr/themes
rm -rf ~/.config/hypr/rofi
rm -f ~/.config/hypr/application-style.conf
rm -f ~/.config/hypr/HyprBrigade-v1.0.0
rm -f ~/.config/hypr/workspaces.conf
rm -f ~/.config/hypr/initial-boot.sh
rm -f ~/.config/hypr/.initial_startup_done

# Remove HyprBrigade rofi config
rm -rf ~/.config/rofi

# Remove old notification daemon configs (using mako)
rm -rf ~/.config/dunst

# Remove old lock screen configs (using hyprlock)
rm -rf ~/.config/swaylock

# Hide leftover .desktop entries from removed/unwanted apps
mkdir -p ~/.local/share/applications
for f in thunar.desktop thunar-bulk-rename.desktop thunar-settings.desktop thunar-volman-settings.desktop \
          org.xfce.mousepad.desktop org.xfce.mousepad-settings.desktop \
          rofi.desktop rofi-theme-selector.desktop vim.desktop nvim.desktop \
          bssh.desktop bvnc.desktop avahi-discover.desktop cmake-gui.desktop \
          electron34.desktop fcitx5-configtool.desktop cups.desktop btop.desktop; do
  echo -e "[Desktop Entry]\nHidden=true\nNoDisplay=true" > ~/.local/share/applications/$f
done
