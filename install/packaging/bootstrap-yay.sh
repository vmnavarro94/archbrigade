if command -v yay &>/dev/null; then
  echo "yay already installed, skipping bootstrap"
  exit 0
fi

echo "Bootstrapping yay from AUR..."
cd /tmp
rm -rf yay-bootstrap
git clone https://aur.archlinux.org/yay.git yay-bootstrap
cd yay-bootstrap
makepkg -si --noconfirm
cd /tmp
rm -rf yay-bootstrap
