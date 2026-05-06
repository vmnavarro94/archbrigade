mapfile -t packages < <(grep -v '^#' "$OMARCHY_INSTALL/omarchy-aur.packages" | grep -v '^$')
omarchy-pkg-aur-add "${packages[@]}"
