echo "Update and restart Walker to resolve stuck ArchBrigade menu"

sudo pacman -Syu --noconfirm walker-bin
archbrigade-restart-walker
