if command -v yay &>/dev/null; then
  echo "yay already installed, skipping bootstrap"
  exit 0
fi

echo "Bootstrapping yay from AUR..."
TEMP_DIR=$(mktemp -d)
trap "rm -rf '$TEMP_DIR'" EXIT
git clone https://aur.archlinux.org/yay.git "$TEMP_DIR/yay"
cd "$TEMP_DIR/yay"
makepkg -si --noconfirm
