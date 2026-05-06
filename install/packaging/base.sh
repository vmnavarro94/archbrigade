# Install all base packages
mapfile -t packages < <(grep -v '^#' "$ARCHBRIGADE_INSTALL/archbrigade-base.packages" | grep -v '^$')
sudo pacman -S --noconfirm --needed "${packages[@]}"
