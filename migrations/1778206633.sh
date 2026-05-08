echo "Fix Discord screen sharing on Wayland"

DESKTOP_FILE="$HOME/.local/share/applications/discord.desktop"

if command -v discord &>/dev/null; then
  cat > "$DESKTOP_FILE" << 'EOF'
[Desktop Entry]
Name=Discord
StartupWMClass=discord
Comment=All-in-one voice and text chat for gamers that's free, secure, and works on both your desktop and phone.
GenericName=Internet Messenger
Exec=env ELECTRON_OZONE_PLATFORM_HINT=wayland /usr/share/discord/Discord --enable-features=WebRTCPipeWireCapturer --ozone-platform=wayland --use-angle=vulkan --ignore-gpu-blocklist --enable-gpu-rasterization
Icon=discord
Type=Application
Categories=Network;InstantMessaging;
Path=/usr/bin
EOF
  update-desktop-database "$HOME/.local/share/applications/"
fi
