# Remove packages that conflict with ArchBrigade packages before installing
CONFLICT_PKGS=(quickshell-git)

for pkg in "${CONFLICT_PKGS[@]}"; do
  if pacman -Q "$pkg" &>/dev/null; then
    echo "Removing conflicting package: $pkg"
    sudo pacman -R --noconfirm "$pkg" 2>/dev/null || true
  fi
done
