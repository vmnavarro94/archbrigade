mapfile -t packages < <(grep -v '^#' "$ARCHBRIGADE_INSTALL/archbrigade-aur.packages" | grep -v '^$')

# If rust is installed, tell yay to assume rustup is satisfied to avoid conflicts
YAY_FLAGS=(--noconfirm --needed)
if pacman -Q rust &>/dev/null; then
  YAY_FLAGS+=(--assume-installed rustup)
fi

yay -S "${YAY_FLAGS[@]}" "${packages[@]}"
