mapfile -t packages < <(grep -v '^#' "$ARCHBRIGADE_INSTALL/archbrigade-aur.packages" | grep -v '^$')

# If rust is installed, tell yay to assume rustup is satisfied to avoid conflicts
YAY_FLAGS=(--noconfirm --needed)
if pacman -Q rust &>/dev/null; then
  YAY_FLAGS+=(--assume-installed rustup)
fi

# Keep sudo alive during long AUR builds (some packages take minutes to compile)
sudo -v
(while true; do sudo -v; sleep 60; done) &
SUDO_KEEPALIVE_PID=$!
trap "kill $SUDO_KEEPALIVE_PID 2>/dev/null" EXIT

yay -S "${YAY_FLAGS[@]}" "${packages[@]}"
