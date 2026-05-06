mapfile -t packages < <(grep -v '^#' "$ARCHBRIGADE_INSTALL/archbrigade-aur.packages" | grep -v '^$')
archbrigade-pkg-aur-add "${packages[@]}"
