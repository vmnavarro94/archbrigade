# Remove old HyprBrigade/HyDE configs that conflict with ArchBrigade
# Only remove known conflicting dirs/files, preserve user-specific ones

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
rm -f ~/.config/hypr/application-style.conf
rm -f ~/.config/hypr/HyprBrigade-v1.0.0
rm -f ~/.config/hypr/workspaces.conf
rm -f ~/.config/hypr/initial-boot.sh
rm -f ~/.config/hypr/.initial_startup_done
