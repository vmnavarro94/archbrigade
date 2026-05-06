BROWSERS=(firefox zen zen-browser brave chromium google-chrome-stable librewolf)

for browser in "${BROWSERS[@]}"; do
  if command -v "$browser" &>/dev/null || pacman -Q "$browser" &>/dev/null; then
    echo "Browser already installed ($browser), skipping zen-browser-bin"
    exit 0
  fi
done

echo "No browser found, installing zen-browser-bin..."
yay -S --noconfirm --needed zen-browser-bin
