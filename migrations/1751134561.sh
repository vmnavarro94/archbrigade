echo "Add ArchBrigade Package Repository"

archbrigade-refresh-pacman-mirrorlist

if ! grep -q "archbrigade" /etc/pacman.conf; then
  sudo sed -i '/^\[core\]/i [archbrigade]\nSigLevel = Optional TrustAll\nServer = https:\/\/pkgs.omarchy.org\/$arch\n' /etc/pacman.conf
  sudo systemctl restart systemd-timesyncd
  sudo pacman -Syu --noconfirm
fi
