# Preserve user's monitor layout if it exists: monitors.conf is auto-generated
# by nwg-displays, monitors.lua is what Hyprland's Lua config actually loads
# (regenerated from monitors.conf by archbrigade-sync-monitors)
MONITORS_CONF_BAK=""
MONITORS_LUA_BAK=""
if [[ -f ~/.config/hypr/monitors.conf ]]; then
  MONITORS_CONF_BAK=$(cat ~/.config/hypr/monitors.conf)
fi
if [[ -f ~/.config/hypr/monitors.lua ]]; then
  MONITORS_LUA_BAK=$(cat ~/.config/hypr/monitors.lua)
fi

# Copy over ArchBrigade configs
mkdir -p ~/.config
cp -R ~/.local/share/archbrigade/config/* ~/.config/

# Restore monitor layout — never overwrite user's monitor configuration
if [[ -n "$MONITORS_CONF_BAK" ]]; then
  echo "$MONITORS_CONF_BAK" > ~/.config/hypr/monitors.conf
fi
if [[ -n "$MONITORS_LUA_BAK" ]]; then
  echo "$MONITORS_LUA_BAK" > ~/.config/hypr/monitors.lua
fi

# Quickshell overview config
mkdir -p ~/.config/quickshell
cp -R ~/.local/share/archbrigade/config/quickshell/* ~/.config/quickshell/

# Walker config needs actual home path (doesn't expand ~ or $HOME)
sed -i "s|\$HOME|$HOME|g" ~/.config/walker/config.toml

# Use default bashrc from ArchBrigade
cp ~/.local/share/archbrigade/default/bashrc ~/.bashrc

# Use default zshrc from ArchBrigade and set zsh as default shell
if [[ -f ~/.zshrc ]]; then
  ZSHRC_BAK=~/.zshrc.pre-archbrigade-$(date +%Y%m%d-%H%M%S)
  cp ~/.zshrc "$ZSHRC_BAK"
  echo ""
  echo "╔══════════════════════════════════════════════════════╗"
  echo "║  Your existing .zshrc has been backed up to:        ║"
  echo "║  $ZSHRC_BAK"
  echo "║  Your aliases, exports and customizations are safe. ║"
  echo "╚══════════════════════════════════════════════════════╝"
  echo ""
fi
cp ~/.local/share/archbrigade/default/zshrc ~/.zshrc
sudo usermod -s /bin/zsh "$USER"
