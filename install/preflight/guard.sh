abort() {
  echo -e "\e[31mArchBrigade install requires: $1\e[0m"
  echo
  gum confirm "Proceed anyway on your own accord and without assistance?" || exit 1
}

# Must be an Arch distro
[[ -f /etc/arch-release ]] || abort "Vanilla Arch"

# Must not be an Arch derivative distro
for marker in /etc/cachyos-release /etc/eos-release /etc/garuda-release /etc/manjaro-release; do
  [[ -f "$marker" ]] && abort "Vanilla Arch"
done

# Must not be running as root (hard exit - AUR/makepkg cannot run as root)
if [ "$EUID" -eq 0 ]; then
  echo -e "\e[31mError: Do not run ArchBrigade as root.\e[0m"
  echo -e "\e[31mRun as a regular user. AUR packages (yay/makepkg) require a non-root user.\e[0m"
  exit 1
fi

# Must be x86 only to fully work
[ "$(uname -m)" != "x86_64" ] && abort "x86_64 CPU"

# Must not have Gnome or KDE already install
pacman -Qe gnome-shell &>/dev/null && abort "Fresh + Vanilla Arch"
pacman -Qe plasma-desktop &>/dev/null && abort "Fresh + Vanilla Arch"

# Cleared all guards
echo "Guards: OK"
