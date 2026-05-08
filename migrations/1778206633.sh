echo "Fix Discord screen sharing on Wayland"

DESKTOP_FILE="$HOME/.local/share/applications/discord.desktop"

if command -v discord &>/dev/null && [[ -x "$HOME/.local/bin/discord" ]]; then
  cat > "$DESKTOP_FILE" << EOF
[Desktop Entry]
Name=Discord
StartupWMClass=discord
Comment=All-in-one voice and text chat for gamers that's free, secure, and works on both your desktop and phone.
GenericName=Internet Messenger
Exec=$HOME/.local/bin/discord
Icon=discord
Type=Application
Categories=Network;InstantMessaging;
Path=/usr/bin
EOF
  update-desktop-database "$HOME/.local/share/applications/"
fi
