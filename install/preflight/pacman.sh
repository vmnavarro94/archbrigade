if [[ -n ${ARCHBRIGADE_ONLINE_INSTALL:-} ]]; then
  # Install build tools and UI dependencies needed before packaging step
  sudo pacman -S --needed --noconfirm base-devel gum git

  # Configure pacman
  sudo cp -f ~/.local/share/archbrigade/default/pacman/pacman.conf /etc/pacman.conf
  sudo cp -f ~/.local/share/archbrigade/default/pacman/mirrorlist /etc/pacman.d/mirrorlist

  # Refresh all repos
  sudo pacman -Syu --noconfirm
fi
