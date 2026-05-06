mapfile -t packages < <(grep -v '^#' "$ARCHBRIGADE_INSTALL/archbrigade-aur.packages" | grep -v '^$')
yay -S --noconfirm --needed "${packages[@]}"
